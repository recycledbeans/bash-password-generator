# Password Generator for Command Line Interfaces

The project is a prototype password generator for bash-compliant terminals that will provide a password for a given keyword or phrase. This is mostly a just-for-fun idea that will provide a reproducable password for the given keyword (like a URL).

`I'm aware that if someone gains access to your computer, they can generate your password for a given keyword if it is typed the exact same way. I'm sure there are many a security research that would confirm this is a bad idea. So, use this script at your own risk. :)`

After saying that, if you would still like to try it out...

### Installation

Clone this repo, navigate to the newly-created directory in terminal, and run the following command:

```bash

cp generatepassword.sh /usr/local/bin/generatepassword && chmod +x /usr/local/bin/generatepassword

```

You can also install this to another location besides the one mentioned above or run the command from the current directory.

In addition to installing the script, you will need to export an environment variable called `SALT_FOR_PASSWORD`. You can do this by adding the following line to your `.profile` or `.bash_profile` within your home directory. Without this environment variable, the script will stop and tell you about it.

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