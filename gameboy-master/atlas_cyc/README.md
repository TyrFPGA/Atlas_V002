# Gameboy DeMiSTified - Atlas CYC1000 port

27/11/21 Atlas CYC1000 port DeMiSTified by somhic from original MiST gameboy https://github.com/mist-devel/gameboy and Alastair's M. Robinson port https://github.com/robinsonb5/gameboy 

Special thanks to Alastair M. Robinson creator of [DeMiSTify](https://github.com/robinsonb5/DeMiSTify) for helping me. 

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

Original module sound errors and signed/unsigned troubles have been arranged thanks to @rampa069.

**Features:**

* HDMI video output
* VGA 222 video output is available through HDMI to VGA adapter
* HDMI audio output
* Sigma-Delta audio
* Joystick (tested with a Megadrive gamepad)

**Additional hardware required**:

- PS/2 Keyboard 

##### Versions:

v0.6 Changes in Mist core to adapt DeMiSTify to both Deca and new board Atlas_cyc

### STATUS

* SDRAM controller still needs to be fully adapted from 32 to 8 MB.
* GBC games require 32 MB SDRAM due to how SDRAM is configured (BIOS is copied to second 16 MB block)
* BIOS file gbc_bios.bin (not supplied) has to be placed at the root folder of SD card
* HDMI video outputs special resolution so will not work on all monitors. 



### Instructions to compile the project for a specific board:

(Note that sof/rbf files are already included in /atlas_cyc/output_files/)

```sh
git clone https://github.com/DECAfpga/gameboy
cd gameboy
#Do a first make (will finish in error). It will download missing submodules 
make
#when asked just accept default settings with Enter key
#Create file site.mk in DeMiSTify folder 
cd DeMiSTify
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q19)
gedit site.mk
#Checkout to the branch with latest updates
git checkout somhic
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=atlas_cyc
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /atlas_cyc/gameboy_atlas_cyc.qpf

**Others:**

* User Button is a reset button

### OSD Controls

* F12 show/hide OSD 
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

### Follows original readme.md content:

Source code for Gameboy for MIST
================================

This is source code of a gameboy implementation for the MIST. 

It's based on the [t80](http://opencores.org/project,t80) CPU core. A minor
fix was needed for the "LD ($FF00+C)" instruction.

The audio implementation has been taken from the PACE framework. The
original file is available in the [pacedev svn](https://svn.pacedev.net/repos/pace/sw/src/component/sound/gb/gbc_snd.vhd).

Binaries are available at https://github.com/mist-devel/mist-binaries/tree/master/cores/gameboy.
