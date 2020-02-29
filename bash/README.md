## Bash scripts
**afs.sh** - after setting up the [UoE AFS](https://computing.help.inf.ed.ac.uk/afs-debian-ubuntu), afs.sh will take care of the necessary commands (authenticating to Kerberos and the AFS)

**dicerdp.sh** - establish rdp connection to DICE without having to remember or look up the whole command. *Requirements: xfreerdp.*

#### Setup:
Option 1: Put the files into `/usr/local/bin` and make them executable using `chmod +x filename.sh`

Option 2: Store the scripts where you please, make them executable, and set an alias in your `.bashrc` (or equivalent) for the script.
