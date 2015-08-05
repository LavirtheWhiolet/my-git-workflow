My Git workflow
===============

[Git](http://git-scm.com) is too much general-purpose, so everyone makes her own workflow based on it. I have made my own one, too.

How to install
--------------

Run “install.sh” and follow the instructions. You may run it with `BIN=dir sh install.sh` if you want to install executables into another directory (default is “bin” in your home directory).

How to use
----------

You may get help on any executable from “bin”, just run it with `-h` or `--help` key. In “git_aliases” and “shell_aliases” you may see aliases introduced by this piece of software, and in “git_config” you may see how your Git is now configured.

### I still don't get it…

Let me demonstrate it to you. Let's clone some repo and do some contributions.

    $ git clone my-cool-startup.git/
    Cloning into 'my-cool-startup'...
    done.
    $ cd my-cool-startup

Suppose we have a task to write a Desktop UI. Let's start it.

    $ git open desktop-ui
    Switched to a new branch 'desktop-ui'

Let's write some code!
    
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

Aren't you tired of that `git add -A :/ …` stuff? Use aliases!

    $ vim main.c
    $ ga 'Fix "hekko" to "hello".'
    [desktop-ui f3874fa] Fix "hekko" to "hello".
     1 file changed, 1 insertion(+), 1 deletion(-)
    $ vim main.c
    $ ga.
    [desktop-ui cb98038] ...
     1 file changed, 1 insertion(+)

Now we have a subtask “Add a button” in the task “Desktop UI”. Let's start it.

    $ git open that-tricky-button
    Switched to a new branch 'desktop-ui.d/that-tricky-button'

Write some code…

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

    $ git close
    Switched to branch 'desktop-ui'
    Merge made by the 'recursive' strategy.
     button.c | 6 ++++++
     1 file changed, 6 insertions(+)
     create mode 100644 button.c
    Deleted branch desktop-ui.d/that-tricky-button (was 43a0bb0).

In short, the branch `desktop-ui.d/that-tricky-button` is merged into `desktop-ui` and then deleted. Let's reassure that.

    $ gst
    On branch desktop-ui
    nothing to commit, working directory clean
    
    Branches:
    * desktop-ui
      master

OK, it's time to go home. Let's synchronize our work with the main repo.

    $ git sync
    ---- branch "desktop-ui" ----
    Counting objects: 23, done.
    Compressing objects: 100% (16/16), done.
    Writing objects: 100% (23/23), 1.86 KiB | 0 bytes/s, done.
    Total 23 (delta 7), reused 0 (delta 0)
    To /home/user/my-cool-starup.git/
     * [new branch]      desktop-ui -> desktop-ui
    Branch desktop-ui set up to track remote branch desktop-ui from origin.
    ---- branch "master" ----
    Switched to branch 'master'
    Your branch is up-to-date with 'origin/master'.
    Successfully rebased and updated refs/heads/master.
    Everything up-to-date
    ------------------------
    Switched to branch 'desktop-ui'
    Your branch is up-to-date with 'origin/desktop-ui'.
    OK

At home we have got some idea. Let's check it!

    $ git open cool-idea
    Switched to a new branch 'desktop-ui.d/cool-idea'

Make some commits…

    $ vim main.c
    $ ga.
    …

Nah, I don't like it. Let's reject that subtask.

    $ git reject 
    HEAD is now at e547d12 ...
    Switched to branch 'desktop-ui'
    Your branch is up-to-date with 'origin/desktop-ui'.
    Deleted branch desktop-ui.d/cool-idea (was e547d12).

OK, we have written Desktop UI. Let's merge our work and close the task.

    $ git close
    Switched to branch 'master'
    Your branch is up-to-date with 'origin/master'.
    Merge made by the 'recursive' strategy.
     Makefile | 3 +++
     button.c | 6 ++++++
     main.c   | 6 ++++++
     3 files changed, 15 insertions(+)
     create mode 100644 Makefile
     create mode 100644 button.c
     create mode 100644 main.c
    To /home/user/my-cool-starup.git/
     - [deleted]         desktop-ui
    Deleted branch desktop-ui (was e547d12).

Look, the branch is deleted both locally and remotely!

Now, let's publish our work.

    $ git sync
    ---- branch "master" ----
    Already on 'master'
    Your branch is ahead of 'origin/master' by 8 commits.
      (use "git push" to publish your local commits)
    Successfully rebased and updated refs/heads/master.
    Counting objects: 22, done.
    Compressing objects: 100% (16/16), done.
    Writing objects: 100% (21/21), 1.73 KiB | 0 bytes/s, done.
    Total 21 (delta 9), reused 0 (delta 0)
    To /home/user/my-cool-starup.git/
      ed74c26..e8272cc  master -> master
    ------------------------
    Already on 'master'
    Your branch is up-to-date with 'origin/master'.
    OK

Some guy asked to help him with his branch. But he has odd branch naming conventions.

    $ git checkout some_odd_name-i-even-dont_know

Let's rename that branch.

    $ git branch -m new-button

Let's do some commits and sync our work.

    $ git sync
    ---- branch "master" ----
    Switched to branch 'master'
    Your branch is up-to-date with 'origin/master'.
    Successfully rebased and updated refs/heads/master.
    Everything up-to-date
    ---- branch "new-button" ----
    Switched to branch 'new-button'
    Your branch is ahead of 'origin/some_odd_name-i-even-dont_know' by 1 commit.
      (use "git push" to publish your local commits)
    Successfully rebased and updated refs/heads/new-button.
    Counting objects: 4, done.
    Compressing objects: 100% (2/2), done.
    Writing objects: 100% (3/3), 255 bytes | 0 bytes/s, done.
    Total 3 (delta 1), reused 0 (delta 0)
    To /home/user/my-cool-starup.git/
       e8272cc..a657eb7  new-button -> some_odd_name-i-even-dont_know
    ------------------------
    Already on 'new-button'
    Your branch is up-to-date with 'origin/some_odd_name-i-even-dont_know'.
    OK

Look, branch “new-button” is correctly pushed into “some_odd_name-i-even-dont_know”! `git sync` uses `git push`, and this package configures Git so that `git push` pushes to upstream branch.
