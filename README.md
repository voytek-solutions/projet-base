# Project Basic Setup

Set of common helper scripts used across most of the repositories.




## Check And Apply Updates

Add this repo as one of the remotes

```bash
git remote add project-base git@github.com:voytek-solutions/projet-base.git
git fetch project-base
```

Check for differences

```bash
git diff HEAD..project-base/master -- .git-local
```

Apply latest changes

```bash
git checkout project-base/master -- .git-local
```




## Git Config

When applied your local git will be configured to:

* Validate commit message format.
* Prepare commit message.
* Run `make lint` before push.


### Commit Message Format

Each commit needs to meet these requirements:

* First line (subject) starts with uppercase.
* Subject is no longer then 60 characters.
* Subject does not end with '.'.
* Additional commit message needs to be separated from subject with single empty line.
* Each body line is no longer then 72 characters.


### Commit Template

If your branch name matches JIRA-like tasks ID, it will be automatically added
to your commit message.

After running `git commit` you will see:

```
[ABC-123] # If applied, this commit will...

# Explain why this change is being made...

# Provide links to any relevant tickets, articles or other resources
```
