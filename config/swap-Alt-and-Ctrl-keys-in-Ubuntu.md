# Swap Alt and Ctrl keys in Ubuntu

Theese commands has been tested only with Ubuntu 18.04 on my Xiaomi Notebook Pro laptop. I have a DURGOD Taurus K320 Mechanical keyboard at work and swapped Alt and Ctrl keys are so convenient for me. It brings to mind a work with Macbook Pro which I had it earlier... 

I have a plan to test commands in other Linux distributives and laptops.

## Swap manually

1. Edit the file `/usr/share/X11/xkb/symbols/ctrl` to add the following lines to swap Right Alt with Right Ctrl key:
	
	`$ vim /usr/share/X11/xkb/symbols/ctrl`

	```bash
	// Swap the functions of the right Alt key and the right Ctrl key.
	partial modifier_keys
	xkb_symbols "swap_ralt_rctl" {
	    replace key <RALT> { [ Control_R, Control_R ] };
	    replace key <RCTL> { [ Alt_R, Meta_R ] };
	};
	```
   Similarly you can add lines to swap Left Alt with Left Ctrl.

2. Edit the file `/usr/share/X11/xkb/rules/evdev.lst` to dd the following line in the ! option section:
	
	`$ vim /usr/share/X11/xkb/rules/evdev.lst`

	```bash
	ctrl:swap_ralt_rctl Swap Right Alt key with Right Ctrl key
	```

3. Edit the file `/usr/share/X11/xkb/rules/evdev` to add the following line in the !option = symbols section:
	
	`$ vim /usr/share/X11/xkb/rules/evdev`

	```bash
	ctrl:swap_ralt_rctl = +ctrl(swap_ralt_rctl)
	```

4. Use **dconf** (if necessary install it with `sudo apt install dconf-tools`) in two ways:

	- Open dconf _editor from dashboard_ and navigate to the key /org/gnome/desktop/input-sources/xkb-options and set its value to:

		```bash
		['ctrl:swap_lalt_lctl','ctrl:swap_ralt_rctl']
		```

	- Use dconf _from terminal_:

		```bash
		dconf write "/org/gnome/desktop/input-sources/xkb-options" "['ctrl:swap_lalt_lctl','ctrl:swap_ralt_rctl']"
		```

## Swap semi-automatically

In two ways:

- make function with code which switches keys and create an alias to call this function
- make simple file with code in the user's /home directory, do `chmod a+x _file_` and just type `./_file_`.

```bash
value=`dconf read "/org/gnome/desktop/input-sources/xkb-options"`

if [[ $value == *"swap"* ]];
    then
      echo "Notebook mode: Alt and Ctrl at normal places."
      dconf write "/org/gnome/desktop/input-sources/xkb-options" "['grp:alt_shift_toggle', 'grp_led:scr
oll']"
    else
      echo "DURGOD mode: Alt and Ctrl keys are swapped."
      dconf write "/org/gnome/desktop/input-sources/xkb-options" "['grp:alt_shift_toggle', 'grp_led:scr
oll', 'ctrl:swap_lalt_lctl', 'ctrl:swap_ralt_rctl']"
fi
```
