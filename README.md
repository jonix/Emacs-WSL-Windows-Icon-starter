# Emacs in WSL2 with VcXsrv (graphical mode)

## Goal
- Launch Emacs in graphical mode from WSL2 (Ubuntu) without using built-in WSLg X11 server
- Avoid the black terminal window when starting Emacs from a Windows icon
- Have a clickable icon in the Windows Taskbar

## Steps to reach the goal
- Install an external open-source X11 server recommended VcXsrv
- Create a `.vbs` file to hide the Windows terminal window that normally appears when launching Emacs from a `.bat` file
- Create a `.bat` file that the `.vbs` file calls to start Emacs cleanly
- Windows does not allow pinning `.vbs` files directly to the Taskbar or Start menu
    - Create a shortcut to `wscript.exe` that runs your `.vbs` file:
      - Right-click on desktop => New => Shortcut
      - Use this as the target:
        `wscript.exe "C:\Scripts\start-emacs-x11.vbs"`

## Verification that Emacs is using VcXsrv (X11)
- In Emacs: `M-:` and evaluate:
    `(getenv "DISPLAY")`
  If it returns an IP address (e.g., `192.168.x.x:0`), it's likely using VcXsrv

- Also check:
    `(getenv "WAYLAND_DISPLAY")`
  If it returns `nil`, Emacs is not using WSLg's built-in Wayland/X server

- To ensure WSLg is disabled, add this to your `.bashrc`:
    `unset WAYLAND_DISPLAY`


