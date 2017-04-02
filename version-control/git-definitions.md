# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
** Version control is the practice of implementing a change in a master program in test phases.  When a programmer or programmers wish to update a master system, they branch off a version of that master program which allows them to experiment with it along side of the master program.  This allows the programmers to experiment with the new type of program while at teh same time the master program is safe. If the branch has features that are good and clean, then they can be approved to be merged into the master branch to work in the actual program.

* What is a branch and why would you use one?
** A branch is a copy of another branch that is used to experiment on new code and/or features.  Programmers would use this to protect the already existing code from crashing or implementing something too early to the general public.

* What is a commit? What makes a good commit message?
**  A commit is basically declaring that the code that has been worked on is ready to be saved and is one step closer to being merged via a pull request to a parent branch (usually a master or equivalent).
** A good commit message is short but descriptive of the commit that is being logged.

* What is a merge conflict?
** A merge conflict is when there are two or more merges where the same file or lines of code have been edited, added, or deleted by more than one branch.  This can happen if there are two or more programmers working on the same section of code or even the same file.