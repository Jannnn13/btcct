--[[
    BTCCT - A better Terminal for CC: Tweaked
    github.com/Jannnn13/btcct

    Author: Jannnn13 (github.com/Jannnn13)
    License: MIT License
]]

local msid = multishell.getCurrent()
multishell.setTitle(msid, "BTCCT")

-- Define rc as an empty table by default
local rc = {}

-- Load rc file if it exists
if fs.exists("/.btcct/rc.lua") then
    local rcFile = dofile("/.btcct/rc.lua")
    if type(rcFile) == "table" then
        rc = rcFile
    end
end

-- Configuration with defaults
local cfg = {
    prompt = rc.prompt or "#DIR#> ", -- The text for the prompt
    term_color = rc.term_color or colors.white, -- The terminal color
    term_secondary_color = rc.term_secondary_color or colors.blue, -- The secondary terminal color
    multishell_title = rc.multishell_title or nil, -- The Multishell title of this program
    about_text = rc.about_text or os.version(), -- The about text when this program is started, if nil it doesnt show
    start_dir = rc.start_dir or nil, -- The starting directory, if nil it will be the default
}

-- Set the Multishell default title
if cfg.multishell_title then multishell.setTitle(msid, cfg.multishell_title) end

-- Prints the about_text
term.setTextColor(cfg.term_secondary_color)
if cfg.about_text then print(cfg.about_text) end

-- Sets the start_dir, if set
if cfg.start_dir then shell.setDir(cfg.start_dir) end

-- The main loop
while true do
    term.setTextColor(cfg.term_secondary_color)
    
    -- Runs b4-prompt
    if fs.exists("/.btcct/b4-prompt.lua") then shell.run("/.btcct/b4-prompt.lua") end

    -- Replace %DIR% with the directory
    local wr_text = cfg.prompt:gsub("#DIR#", shell.dir())
    
    -- Prints the text without starting a new line
    write(wr_text)

    -- Reads the input
    term.setTextColor(cfg.term_color)
    local input = read(nil, nil, shell.complete)


    -- Checks if the user wants to exit
    if input == "exit" then break end

    -- Runs the program
    shell.run(input)
end

-- Runs on-exit.lua
if fs.exists("/.btcct/on-exit.lua") then shell.run("/.btcct/on-exit.lua") end