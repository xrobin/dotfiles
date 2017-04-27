# xrobin does dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine.

I was a little tired of having long alias files and everything strewn about
(which is extremely common on other dotfiles projects, too). That led to this
project being much more topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

If you're interested in the philosophy behind why projects like these are
awesome, you might want to [read holman's post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

## install

Run this:

```sh
git clone https://github.com/xrobin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## personalize


A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you.
[Fork it](https://github.com/xrobin/dotfiles/fork), remove what you don't
use, and build on what you do use.

### .bashrc vs .bash\_profile vs .bash\_login vs .profile

This is really all handled here, and you should never have to care about `.bash_profile` or `.bash_login`. Put all your environment variables in `.profile`. Put anything for interactive use or that is bash-specific in `.bashrc`

### prompt 

You'll want to change PS1 in `~/.bashrc` (you can edit either `~/.bashrc` or `~/bashrc.symlink`). Try to set `DATE_PROMPT=true` for instance.


## components

There's a few special files in the hierarchy.

- **bin/*.bin**: Any `*.bin` file in `bin/` will get symlinked to ~/bin/, which is added to your `$PATH` and be made available everywhere.
- **system/**: Files that are usually useful to have around on new system installs. Nothing is done automatically, typically those would be installed manually as root.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **script/**: Scripts to install the dotfiles. Use `script/bootstrap` upon first use, and again every time a new file gets added. You can run `script/bootstrap` as many times as you want, that shouldn't have any adverse effect: just hit `S` to skip everything that is already set.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as *my* dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

I use them on a variety of MacOS X, Debian/Ubuntu and SuSE Linux systems, where they should install and run pretty smoothly. Everything else is pretty much untested.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/xrobin/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Holman's dotfiles](https://github.com/holman/dotfiles), then pretty much everything except from `script/bootstrap` was changed. I'm not using zsh myself. 
