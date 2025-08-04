# radar-to-shot

This is a repository to help with developing robots for the 1991 Mac game "Robot Warriors", all in a browser window.

It uses GitHub actions to generate a barebones System 7.0.1 disk image for use with [Infinite Mac](https://infinitemac.org/).

## Getting started

You don't have to install anything on your computer; everything can be done from the browser.

You can put as much or as little effort into developing robots as you like. Take one of the examples and just modify the attributes if you like, or perhaps feed the manual and examples straight into an LLM of your choosing and vibe code the whole thing (I would be interested to see how this turns out).

### Working on your copy of the repository

You'll need a GitHub account for this.

* Create a new repository using this one as a template (select `Use this template` -> `Create a new repository` from the right-hand side of the title bar). You can make the new repository private if you want to keep your robots away from prying eyes until they're ready for competition.
* Navigate to your version of the repository (e.g. `github.com/<yourname>/radar-to-shot`) and then press the `.` key to open the online code editor.
* Create a new directory inside the `robots` directory to put your robots in, e.g. `robots/<yourname>`.
* Copy one of the example robots from `robots/examples` to get started.

### Building a disk image containing your robots

* When you want to try your robot out, make a new commit with your changes (click on the third option down in the editor sidebar) and push it to the repository (the default branch is fine since it's your repository).
* Navigate back to the main page for your repository and click the `Actions` tab in the title bar. Click the `Build Robot Warriors Disk Image` action on the left sidebar.
* You should now see an entry corresponding to the commit you pushed. Click on it, and then you'll see a zip archive containing your disk images in the `Artifacts` section, and a set of instructions for how to boot it in the `Build Summary` section.

I'm working on an improved workflow which avoids the need to download anything at all, but this is what we have for now.

### Running Robot Warriors in the VM

Once your disk image has booted in the Infinite Mac VM, open the `Robot Warriors` folder on the desktop, and then open the `Robot Warriors 1.0.1` application. From the menu bar, use the `File -> Open` option and then select your robot, which will open in the built-in text editor.

To set up a battle against other robots, open the other robots (up to a total of five) using the same `File -> Open` option. Then, select `Start Battle...` from the `Battle` menu, and put checkmarks next to the robots which will participate and select the number of battles. You can also enable debugging for one of the robots from this menu, which will show a debugging trace in the right-hand panel next to the battle arena.

You'll probably find it easier to work on your robot from with the built-in text editor since it has debugging facilities and allows you to quickly set up a battle with other robots.

If you've made changes to your robot within the VM and then want to commit those changes to your repository, drag your robot file on to the `The Outside World` icon on the desktop. Your browser will then download a zip archive containing your robot text file which you can paste into the copy in your repository and commit the changes.

## Documentation

The original Robot Warriors manual (as PDF) can be found [here](docs). Also, have a look at the included robots [here](robots/examples) for practical examples.

## Contributing

Once you're ready for competition (refer to dates and rules on the Discord server), just make a public clone of this repository ([https://github.com/radar-to-shot/radar-to-shot/]), commit your robots to a branch and then submit a pull request to the competition branch.

Also, PRs for improvements to documentation, workflow and so on are welcome.
