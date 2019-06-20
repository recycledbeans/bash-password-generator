# Password Generator for Command Line Interfaces

The project is a prototype password generator for bash shells that will provide a password for a given keyword or phrase. This is mostly a "just-for-fun" idea that will provide a reproducable password for the given keyword (like a URL).

`I'm aware that if someone gains access to your computer, they would be able to re-generate your passwords (similar to how someone might be able to steal SSH or PGP keys if they gained access to your computer). I'm sure there are many a security researcher that would confirm this is a bad idea. So, use this script at your own risk. :)`

After saying that, if you would still like to try it out...

### Installation

Clone this repo, navigate to the newly-created directory in terminal, and run the following command:

```bash

cp generatepassword.sh /usr/local/bin/generatepassword && chmod +x /usr/local/bin/generatepassword

```

You can also install this to another location besides the one mentioned above or run the command from the current directory.

The script will create a `.generate-password-salt` file in your home directory with a (somewhat) random string in order to add variability generated passwords. Alternatively, you can export an environment variable called `SALT_FOR_PASSWORD`. You can do this by adding the following line to your `.profile` or `.bash_profile` within your home directory. If your system has this variable set, it will be used instead of the contents of this file.

```bash

export SALT_FOR_PASSWORD='really unique string to act as a salt (your own)'

```

### Generating Passwords

```bash

$ generatepassword [keyword]

```

For instance, running the command like so:

```bash

$ generatepassword github.com

```

...will give you output like so. If you have pbcopy or xclip installed, the script should copy the new password to your default clipboard.

```bash

Copied to your default clipboard with pbcopy!
a6eab68d7004b6ce9592e9003c5d3930

```