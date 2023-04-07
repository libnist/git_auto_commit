# git_auto_commit
Make one commit per day. (only on Linux)

## Usage
1) Open the terminal: Ctl + Alt + t

2) clone the repository:

```Shell
git clone https://github.com/libnist/git_auto_commit.git
```

3) Go to the git_auto_commit directory:

```Shell
cd git_auto_commit
```

4) make your own repo on GitHub.


5) Run gac.sh on terminal:

```Shell
./gac.sh -u {https://github.com/<username>/<repository>.git} -d directory/to/save/local/files
```

* By default -d uses where you have cloned the repo
* Make sure `git push ...` is not asking for credentials every time
