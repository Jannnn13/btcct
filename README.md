# BTCCT
BTCCT (Better Terminal for CC: Tweaked) is an enhanced terminal emulator program for [CC: Tweaked](https://github.com/cc-tweaked/cc-tweaked), a popular Minecraft mod that enables computer-based automation.

## Features
- Customizable prompt (`written`, `written_top`)
- Support for auto-completion
- Customizable colors (`term_color`, `term_secondary_color`)
- Display of the current directory in the prompt
- Configurable start directory
- Multishell support with customizable title
- Display of version information

## Installation
1. Ensure [CC: Tweaked](https://modrinth.com/mod/cc-tweaked) is installed.
2. Download the `btcct.lua` file and save it in the desired directory on your ComputerCraft computer.
3. (Optional) Create a configuration file `.btcct.rc.lua` in the root directory with your custom settings.

## Configuration
BTCCT supports a configuration file `.btcct.rc.lua` with the following options:

| Option                | Description                                      | Default Value         |
|-----------------------|--------------------------------------------------|-----------------------|
| `written`             | Prompt text                                      | `"> "`               |
| `written_top`         | Text above the prompt                            | `nil`                |
| `show_dir`            | Displays the current directory in the prompt     | `true`               |
| `term_color`          | Prompt text color                                | `colors.white`       |
| `term_secondary_color`| Secondary text color                             | `colors.blue`        |
| `multishell_title`    | Multishell window title                          | `nil`                |
| `about_text`          | Text displayed on startup                        | `os.version()`       |
| `start_dir`           | Start directory                                 | `nil`                |
| `auto_completion`     | Enables auto-completion                          | `true`               |
| `path_in_writtentop`  | Displays the path in `written_top`               | `false`              |

## Usage
1. Run the program using `btcct`.
2. Enter commands to execute programs or interact with the computer.
3. Exit the program using the `exit` command.

## Author
Created by [Jannnn13](https://github.com/Jannnn13), on 4.22.2025.

## License
This project is licensed under the [MIT License](LICENSE).