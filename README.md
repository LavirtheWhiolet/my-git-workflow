My Git workflow
===============

[Git](http://git-scm.com) is too much general-purpose, so everyone makes her own workflow based on it. I have made my own one, too.

How to install
--------------

Run “install.sh” and follow the instructions. You may run it with `BIN=dir sh install.sh` if you want to install executables into another directory (default is “bin” in your home directory).

How to use
----------

Let me demonstrate you.

    $ git clone my-cool-startup.git/
    Cloning into 'my-cool-startup'...
    done.
    $ cd my-cool-startup

Suppose we have a task to write a Desktop UI. Let's start it.

    $ git open desktop-ui
    Switched to a new branch 'desktop-ui'
    $ vim main.c
    $ vim Makefile
    $ git add -A :/ && git commit -am 'First code.'
    [desktop-ui e52b41f] First code.
     2 files changed, 7 insertions(+)
     create mode 100644 Makefile
     create mode 100644 main.c
    $ vim main.c
    $ git add -A :/ && git commit -am 'More code.'
    ...
    $ vim main.c
    $ git add -A :/ && git commit -am 'Yet more code.'
    ...

Hey, we have aliases (you may see them in `git_aliases` and `shell_aliases`)!

    $ vim main.c
    $ ga 'Fix "hekko" to "hello".'
    [desktop-ui f3874fa] Fix "hekko" to "hello".
     1 file changed, 1 insertion(+), 1 deletion(-)
    $ vim main.c
    $ ga.
    [desktop-ui cb98038] ...
     1 file changed, 1 insertion(+)

Now we have a subtask “Add a button” in this “Desktop UI” task. Let's start it.

    $ git open that-tricky-button
    Switched to a new branch 'desktop-ui.d/that-tricky-button'
    $ vim button.c
    $ ga.
    [desktop-ui.d/that-tricky-button 4b84113] ...
     1 file changed, 4 insertions(+)
     create mode 100644 button.c
    $ vim button.c
    $ ga.
    [desktop-ui.d/that-tricky-button 43a0bb0] ...
     1 file changed, 2 insertions(+)

OK, we have finished the subtask. It's time to merge our changes and close it.

    $ git close -m 'Add a tricky button.'
    Switched to branch 'desktop-ui'
    Merge made by the 'recursive' strategy.
     button.c | 6 ++++++
     1 file changed, 6 insertions(+)
     create mode 100644 button.c
    Deleted branch desktop-ui.d/that-tricky-button (was 43a0bb0).

What just happened? Where are we?

