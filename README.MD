# Bazufix TextUI

**Bazufix TextUI** is a lightweight text UI system for FiveM. It allows you to show, update, and hide text on the screen, with optional position control.

---

## Features

- Show text (`ShowText`)
- Update text (`UpdateText`)
- Hide text (`HideText`)
- Key press notification (`PressedKey`)
- Supported positions: `"left-center"`, `"center"`, `"right-center"`

---

## Installation

1. Place the resource in your `resources` folder.
2. Add it to your `server.cfg` or `resources.cfg`:

```plaintext
ensure bazufix-textui

Exports

You can call the functions externally via exports:

-- Show text
exports['bazufix-textui']:ShowText("Hello World", "left-center")

-- Update text
exports['bazufix-textui']:UpdateText("New Message", "center")

-- Hide text
exports['bazufix-textui']:HideText()

-- Notify key press
exports['bazufix-textui']:PressedKey()

Note: The pos parameter is optional. Default is "left-center" if not provided.

Example Usage
-- Show text in the center
exports['bazufix-textui']:ShowText("Hello World", "center")

-- Update text after 2 seconds
Citizen.SetTimeout(2000, function()
    exports['bazufix-textui']:UpdateText("Updated Message", "right-center")
end)

-- Hide text after 5 seconds
Citizen.SetTimeout(5000, function()
    exports['bazufix-textui']:HideText()
end)
