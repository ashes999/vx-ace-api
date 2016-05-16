# VX Ace API

A nice, usability- and extensibility-focused API wrapper for RPG Maker VX Ace. It includes several bug-fixes, auto-word-wrap, and other nice utilities (like being able to trap arbitrary keyboard input).

# Usage

- `mkdir Scripts`
- `git submodule add https://github.com/ashes999/vx-ace-api.git Scripts/vx-ace-api`
- Create a file called `Scripts/main.rb` and add this content to it:
```
API_ROOT = 'Scripts/vx-ace-api'
require 'Scripts/vx-ace-api/vx_ace_api'
```
- Include `main.rb` from your VX Ace project. The easiest way is to add a script in the Script Editor with `require 'Scripts/main'`.
