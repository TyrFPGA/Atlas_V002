# VIC20 DeMiSTified - Atlas CYC1000 port

27/11/21 CYC1000 port by Somhic from original Demistified MiST VIC20 core https://github.com/robinsonb5/VIC20_MiST  by Alastair M. Robinson.

Special thanks to Alastair M. Robinson creator of [DeMiSTify](https://github.com/robinsonb5/DeMiSTify) for helping me. 

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

**Features:**

* HDMI video output 
* VGA 222 video output is available through an HDMI to VGA adapter
* ~~HDMI audio output~~ 
* Sigma-Delta audio
* Joystick (tested with a Megadrive gamepad)

**Additional hardware required**:

- PS/2 Keyboard 

##### Versions:

- v0.1 Initial release HDMI output not working
- v0.2 VGA output & EAR enabled in fpga (not tested)
- v0.4 HDMI video working
- v0.5 changed to fork from @robinsonb5. Added megacart feature

### STATUS

* HDMI video outputs special resolution so will not work on all monitors. 
* Current HDMI wrapper does not support audio. Wrapper version with audio output is not clean.



### Instructions to compile the project for a specific board:

(Note that sof/rbf files are already included in /atlas_cyc/output_files/)

```sh
git clone https://github.com/DECAfpga/VIC20
cd VIC20
#Do a first make (will finish in error) but it will download missing submodules 
make
#Checkout to the DeMiSTify branch with the latest updates
cd DeMiSTify
git checkout somhic
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q19)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc). If not specified it will compile for all targets.
cd ..
make BOARD=atlas_cyc
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /atlas_cyc/VIC20_atlas_cyc.qpf

**Others:**

* User Button is a reset button

### OSD Controls

* F12 show/hide OSD 
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.
