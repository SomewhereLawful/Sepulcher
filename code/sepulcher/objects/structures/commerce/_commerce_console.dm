/obj/structure/commerce/commerce_console
	name = "commerce console"
	desc = "Device used by Bourgeoisie to divine imports and exports, amoungst other functions."
	icon = 'icons/obj/commerce_console.dmi'
	icon_state = "commerce"

	// Shared with keys and doors - gives it to the stored key on initalize
	var/lock_id = "null"
	// Key tied to console and the store's door.
	var/obj/item/key/linked_key

/obj/structure/commerce/commerce_console/examine(mob/user)
	..()
	if(linked_key)
		to_chat(usr, "<span class='notice'>There is a key in the console's keyhole.</span>")

/obj/structure/commerce/commerce_console/AltClick()
	..()
	if(linked_key)
		remove_key()

/obj/structure/commerce/commerce_console/proc/remove_key()
	if(linked_key)
		usr.put_in_hands(linked_key)
		to_chat(usr, "<span class='notice'>You remove the key from the console's keyhole.</span>")
		linked_key = null
	else
		to_chat(usr, "<span class='warning'>The console doesn't have a key.</span>")
