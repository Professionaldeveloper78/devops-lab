Lab 02 — Bash Automation and Make
DevOps Principles and Practices (2+1)

WHAT IS IN HERE

  src/               Three small .txt files. These are the inputs your
                     pipeline processes. Having more than one input is what
                     makes an incremental build worth doing at all.

  Makefile.starter   Task 4 — the skeleton for your ASSESSED Makefile. It has
                     the structure in place and seven TODO comments. You write
                     every rule yourself.

  build.v1.sh        Lab 01's build.sh, as a fallback ONLY. Use your own copy
                     from last week if you still have it.

The scripts in Tasks 1, 2 and 3 (funcs.sh, pipeline.sh, and the small
Makefiles you experiment with) are NOT provided. You type those yourself from
the manual — they are short, and typing them is the point of those tasks.

HOW TO USE THESE FILES

  1. Copy them into your Linux home directory. From your Ubuntu terminal,
     replacing WINUSER with your Windows username:

        mkdir -p ~/devops/lab02
        cp -r /mnt/c/Users/WINUSER/Downloads/scripts/*  ~/devops/lab02/
        cd ~/devops/lab02

  2. Repair the line endings. Files that travel through Windows, WhatsApp or
     Teams often arrive with Windows line endings, which stop them running.
     This is harmless if they are already correct, so always run it:

        sed -i 's/\r$//' *.sh Makefile.starter src/*.txt

  3. Make the scripts executable:

        chmod +x *.sh

  4. Read every file before you run it.

THE ONE THING THAT WILL COST YOU TWENTY MINUTES

  Recipe lines in a Makefile MUST begin with a real TAB character, never
  spaces. If you copy a Makefile out of the PDF you will get spaces, and make
  will refuse to run with:

        Makefile:2: *** missing separator.  Stop.

  Check what you actually typed with:

        cat -A Makefile          # a real tab appears as ^I

  In nano, tabs are preserved. In VS Code, click the indentation setting in
  the status bar and choose "Tab" BEFORE you start typing.

IMPORTANT
  Do NOT open these files in Notepad, WordPad or Word. Saving from a Windows
  text editor corrupts them, and Word will helpfully convert your tabs.

  Follow the lab manual (Lab02_Bash_Automation_and_Make.pdf).
