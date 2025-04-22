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
if fs.exists("/.btcct.rc.lua") then
    rc = require("/.btcct.rc.lua")
end

-- Configuration with defaults
local cfg = {
    written = rc.written or "> ",
    written_top = rc.written_top or nil,
    show_path = rc.show_dir or true,
    term_color = rc.term_color or colors.white,
    term_secondary_color = rc.term_secondary_color or colors.blue,
    multishell_title = rc.multishell_title or nil,
    about_text = rc.about_text or os.version(),
    start_dir = rc.start_dir or nil,
    auto_completion = rc.auto_completion or true,
    path_in_writtentop = rc.path_in_writtentop or false,
}

term.setTextColor(cfg.term_secondary_color)
if cfg.about_text then print(cfg.about_text) end

if cfg.start_dir then shell.setDir(cfg.start_dir) end

while true do
    term.setTextColor(cfg.term_color)
    if cfg.written_top then print(cfg.written_top) end

    term.setTextColor(cfg.term_secondary_color)
    
    if shell.dir() == "/" or not cfg.show_path then
        write(cfg.written)
    else
        write(shell.dir() .. cfg.written)
    end
    
    term.setTextColor(cfg.term_color)

    -- Use read() with autocomplete
    if cfg.auto_completion then
        input = read(nil, nil, shell.complete)
    else
        input = read()
    end

    -- Checks if the user wants to exit
    if input == "exit" then break end

    -- Runs the program
    shell.run(input)
end