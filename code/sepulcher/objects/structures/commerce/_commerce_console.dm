/obj/structure/commerce/commerce_console
	name = "commerce console"
	desc = "Device used by Bourgeoisie to divine imports and exports, amoungst other functions."
	icon = 'icons/obj/commerce_console.dmi'
	icon_state = "commerce"
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 2

	/// Shared with keys and doors - gives it to the stored key on initalize
	var/lock_id = "null"
	/// Key tied to console and the store's door. Set by Bourgies in the console.
	var/obj/item/key/linked_key
	/// Key that's currently in the slot, doesn't have to be the linked_key
	var/obj/item/key/occupying_key

	//Console Data
	var/points = 0

	var/console_samosbor_warning = "MACHINATION AFFECTING CONSOLE. NO COMMANDS CAN BE ENTERED."

//======================KEY STUFF============================
/obj/structure/commerce/commerce_console/examine(mob/user)
	..()
	if(linked_key)
		to_chat(usr, "<span class='magenta'>There is a key in the console's keyhole.</span>")

/obj/structure/commerce/commerce_console/AltClick()
	..()
	if(linked_key)
		remove_key()

/obj/structure/commerce/commerce_console/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/key))
		if(occupying_key)
			to_chat(user, "<span class='magenta'>There is already \a [occupying_key] in \the [src]!</span>")
		else
			if(!user.transferItemToLoc(I, src))
				return
			to_chat(user, "<span class='magenta'>You slide \the [I] into \the [src].</span>")
			occupying_key = I

/obj/structure/commerce/commerce_console/proc/remove_key()
	if(occupying_key)
		usr.put_in_hands(occupying_key)
		to_chat(usr, "<span class='magenta'>You remove the key from the console's keyhole.</span>")
		occupying_key = null
	else
		to_chat(usr, "<span class='magenta'>The console doesn't have a key.</span>")

//======================UI STUFF==========================
/obj/structure/commerce/commerce_console/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = FALSE, \
											datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "commerce_console", name, 1000, 800, master_ui, state)
		ui.open()

/obj/structure/commerce/commerce_console/ui_data()
	var/list/data = list()
	data["points"] = points