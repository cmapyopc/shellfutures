# shellfutures
poor men's  asynchronous shell

Motivation
----------

fire a launcher. write `x <command>`. when the command completes, receive
the output as notification.

In a few more words: Assuming you run a window manager (dwm recommended)
and love to work on a shell but hate to fire a terminal-emulator just to
type a command, view the output and close again. It is too much key
strokes, it is annoying to go away from the window you are currently
working on (e.g. browser) and it's annoying to be blocked waiting until
the command returns (while you could go on editing.

Here comes `shellfutures`. Think of it as a subscription to the output
of a command. I invoke it as `x` from `dmenu` which is bound to `alt-p`
in my `dwm`. It `eval`s what I provide as command + arguments and when
done presents me stdout/stderr in a notification (`dunst` on my end).
Another good think -- you can close the notification or it just takes
care of itself and expires, unlike a terminal; or it adheres to whatever
notification policy you have. 

You might even want a keybinding in dwm to something like  `x
$(alias|cut -d= -f1|dmenu)` to save a keystroke of typing `x`. I don't
:o)

Too much words for effectively 10 LOC.

Take a look, adjust to your environment and likings and enjoy.


Usage
-----

1. fire a launcher (e.g. alt-p in dwm)
2. write 'x' (or the name of the SHELLFUTURES executable if changed)
        followed by the shell command, e.g. 
        `x ll` or `x lynx -dump -nolinks -nonumbers reddit.com` 
3. if the command takes longer to execute, you can continue
   undisturbed your workflow
4. after the command is completed, its output is shown in a
        notification window


Dependencies
------------

- notify-send; you may want to use `dzen2` or similar instead
- traditional UNIX userland

