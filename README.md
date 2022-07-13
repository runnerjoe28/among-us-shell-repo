# Joseph's Dotfiles (Jotfiles)

Insert a picture here eventually (lol)

## Installation
**Warning:** Many aspects of this repository may not be beneficial to your specific system. Please carefully review the files before you give them a try. You can do this by forking the repository or by combing through the files you want. You can also install this manually by downloading the zip folder.

### Manual Zip File Download
If you want to just install a zip folder containing the repository files, feel free. Once you extract the folder, you can copy the bash related files to ~/ with the following. Note this will override any old dotfiles you have.
```bash
source copy.sh
```

### Using Git and the Copy Script
You can clone this repository anywhere you want. I personally keep it in ~/Documents/dotfiles. The provided copying script will automatically move all bash related files into your ~/ directory, overriding the old versions of those files. You can clone the repository into any folder you choose. The following will do just that:
```bash
git clone https://github.com/runnerjoe28/dotfiles.git && cd dotfiles && source copy.sh
```

### Making Changes
I would reccomend making all changes within whatever directory you clone/downloaded the files to (outside of ~/). Then, when you are ready to make changes, `cd` into your `dotfiles` directory and execute the following:
```bash
source copy.sh
```
Personally this is much easier than editing it in the ~/ directory as there are many files floating around there, although you are more than welcomed to do that.

## Features and Usage
The features of this repo extend beyond just making the prompt nicer. There is are computer set up features and many helpful bash features than you may find helpful.

### Beautified Prompt
Upon running `source copy.sh` your terminal will be updated with a beautified look. There is added capabilities for git tracking, easy aliases, and some fun commands to play around with.

### System Setup (Personal Configurations)
As someone who has probably installed an Ubuntu VM ten times, it can be infuriating to re-configure many the virtual machine every time. Within `/computer_setup`, there are scripts to automatically set up my machine (designed for Ubuntu). Namely, installation of some key programming tools that I find very helpful.

## Acknowledgements
Specific awknowledgements should be given within appropriate files (I tried my best). Special thanks to:
- [Mathias Bynens](https://github.com/mathiasbynens) for his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
- [Andres Gongora](https://github.com/andresgongora) for his [synth-shell-prompt](https://github.com/andresgongora/synth-shell-prompt) 
- Everyone who contributed to these fantastic projects

Other help:
- Marie, my younger sister for helping me with the color schemes