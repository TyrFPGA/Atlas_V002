# MiSTery DeMiSTified - Atlas CYC1000 port

10/04/22  Atlas CYC1000  port by Somhic from previous Demistifyied MiST core https://github.com/mist-devel/mist-board/wiki by @robinsonb5 and @Rampa069.   

[Read this guide if you want to know how I DeMiSTified this core](https://github.com/DECAfpga/DECA_board/tree/main/Tutorials/DeMiSTify).

**Included version is for AT1 board (purple), VGA output and USB keyboard.**

**Features:**

* ~~HDMI video output~~
* VGA 222 video output is available through an HDMI to VGA adapter
* Sigma-Delta audio
* Mouse
* Audio (Midi output, I2S output) (MIDI mixing not working yet)

**Additional hardware required**:

- USB Keyboard 

##### Versions:

--

### STATUS

* VGA version only at the moment.



### Instructions to compile the project for a specific board:

(Note that sof/rbf files are already included in /atlas_cyc/output_files/)

```sh
git clone https://github.com/AtlasFPGA/MiSTery
cd MiSTery
#Do a first make (will finish in error) but it will download missing submodules 
make
cd DeMiSTify
#Create file site.mk in DeMiSTify folder 
cp site.template site.mk
#Edit site.mk and add your own PATHs to Quartus (Q18)
gedit site.mk
#Go back to root folder and do a make with board target (deca, neptuno, uareloaded, atlas_cyc, ...). If not specified it will compile for all targets.
cd ..
make BOARD=atlas_cyc
#when asked just accept default settings with Enter key
```

After that you can:

* Flash bitstream directly from [command line](https://github.com/DECAfpga/DECA_binaries#flash-bitstream-to-fgpa-with-quartus)
* Load project in Quartus from /atlas_cyc/MiSTery_atlas_cyc.qpf

**Others:**

* User Button is a reset button

### OSD Controls

* F12 show/hide OSD 
* Long F12 toggles VGA/RGB mode
* The reset button KEY0 resets the controller (so re-initialises the SD card if it's been changed, reloads any autoboot ROM.) The OSD Reset menu item resets the core itself.

