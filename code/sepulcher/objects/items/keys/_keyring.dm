/obj/item/key_ring
	name = "key ring"
	icon = 'icons/obj/key.dmi'
	icon_state = "key_ring"
	var/keys_in_keyring = list()
	var/obj/item/key/active_key
	var/active_lock_id
	var/key_amt
	var/key_amt_max = 5

/obj/item/key_ring/update_icon()
	cut_overlays()
	if(active_key)
		add_overlay("key_ring-active")

/obj/item/key_ring/examine(mob/user)
	..()
	to_chat(user, "<span class='magenta'>Alt-Click with an empty inactive hand to remove a key.</span>")
	if(active_key)
		to_chat(user, "<span class='magenta'>You currently are holding the [active_key.name].</span>")

/obj/item/key_ring/proc/keyCycle(mob/user, list/keys_in_keyring)
	if(!keys_in_keyring || keys_in_keyring.len == 0)
		to_chat(user,"The keyring is empty.")
		return
	active_key = keys_in_keyring[1]	// Get the first key in the list
	keys_in_keyring -= 1				// Remove the first key from the list
	keys_in_keyring += active_key		// Move the key to the end of the list (cycling)
	active_lock_id = active_key.lock_id
	key_amt = length(keys_in_keyring)
	to_chat(user,"You cycle to the [active_key.name].")

// Interactions
/obj/item/key_ring/attackby(obj/item/key/I, mob/living/user, params)
	if(!I.key_ringable)
		to_chat(user,"The key refuses the key ring.")
		return
	else
		keys_in_keyring += I
		qdel(I)

/obj/item/key_ring/AltClick(mob/user)
	if(!keys_in_keyring)
		to_chat(user,"The keyring is empty.")
		return
	var/index = _list_find(keys_in_keyring, active_key)
	if(index)
		keys_in_keyring -= index
		user.put_in_inactive_hand(new active_key)
		to_chat(user,"You remove the [active_key.name].")


/obj/item/key_ring/attack_self(mob/user)
	keyCycle()