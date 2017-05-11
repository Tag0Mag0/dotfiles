### Using Git and the bootstrap script
```bash git clone https://github.com/Tag0Mag0/dotfiles.git && cd dotfiles && source bootstrap.sh ```

To update, `cd` into your local `dotfiles` repository and then:

```bash source bootstrap.sh ```

Alternatively, to update while avoiding the confirmation prompt:

```bash set -- -f; source bootstrap.sh```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any
feature testing (such as [detecting which version of `ls` is being
used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26))
takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash export PATH="/usr/local/bin:$PATH"```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use
this to add a few custom commands without the need to fork this entire
repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```
bash # Git credentials # Not in the repository, to prevent people from
accidentally committing under my name GIT_AUTHOR_NAME="Mathias Bynens"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME" git config --global user.name
"$GIT_AUTHOR_NAME" GIT_AUTHOR_EMAIL="mathias@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL" git config --global user.email
"$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from
my dotfiles repository. It’s probably better to [fork this
repository](https://github.com/mathiasbynens/dotfiles/fork) instead, though.

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common
[Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash ./brew.sh ```

Some of the functionality of these dotfiles depends on formulae installed by
`brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through
the script and manually install any particularly important ones. A good example
is Bash/Git completion: the dotfiles use a special version from Homebrew.

# Forked from
|
[![twitter/mathias](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias
"Follow @mathias on Twitter") | |---| | [Mathias
Bynens](https://mathiasbynens.be/) |
