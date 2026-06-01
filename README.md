# Dotfiles

These are some dotfiles I use and have made.
The ones where you type ls and forgot you need to add -a/-A to list hidden files :P.
These helped with the DWM setup that I did use, but are not necessarily directly tied into the DWM config.
There is stuff for quality of life like .bashrc or starship, and dmenu apps like exit-session.
For now, I've actually swapped back into using cinnamon since my workflow has changed, and the whole key binding and tinkering of DWM got annoying.
Hence, why there are two .xprofiles.
However, the .xprofile can act a bit strange with cinnamon's startup, so a .desktop is provided which has a slightly better startup.
Notably, the random background can be strange if you already have it set to randomize a background through the settings.
If you still want to use the .xprofile you can either create a link to one of the .xprofiles\_\[dwm, cinnamon\], or copy and paste into newly created .xprofile.

```
#link
ln -s ./.xprofile_cinnamon .xprofile
OR
ln -s ./.xprofile_dwm .xprofile

#created file
cp .xprofile_cinnamon .xprofile
OR
cp .xprofile_dwm .xprofile
```
