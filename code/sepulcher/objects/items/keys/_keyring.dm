/obj/item/key_ring
	name = "key ring"
	icon = 'icons/obj/key.dmi'
	icon_state = "key_ring"
	slot_flags = ITEM_SLOT_POCKET|ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	var/list/keys_in_keyring = list()
	var/obj/item/key/active_key
	var/active_lock_id
	var/key_amt
	var/key_amt_max = 5

/obj/item/key_ring/update_icon()
	cut_overlays()
	if(key_amt)
		if(active_key)
			var/key_amt_w_active = (key_amt - 1)
			add_overlay("key_ring-active")
			add_overlay("key_ring-key-[key_amt_w_active]")
		else
			add_overlay("key_ring-key-[key_amt]")
	else
		return

/obj/item/key_ring/examine(mob/user)
	..()
	to_chat(user, "<span class='magenta'>Alt-Click with an empty inactive hand to remove a key.</span>")
	if(active_key)
		to_chat(user, "<span class='magenta'>You currently are holding the [active_key.name].</span>")

/obj/item/key_ring/proc/keyCycle(mob/user)
	if(!keys_in_keyring || keys_in_keyring.len == 0)
		to_chat(user,"The keyring is empty.")
		return

	var/selection_index
	// we can do this better
	// 1 - iterate list 2 - move down list with selection 3 - set selection to actives
	active_key = keys_in_keyring[1] 
	active_lock_id = active_key.lock_id
	keys_in_keyring = list(keys_in_keyring, active_key) // Append the key back to the end

// Interactions
/obj/item/key_ring/attackby(obj/item/key/I, mob/living/user, params)
	if(!I.key_ringable)
		to_chat(user,"The key refuses the key ring.")
		return
	else
		key_amt = CLAMP((key_amt + 1), 0, key_amt_max)
		keys_in_keyring += I
		qdel(I)
		update_icon()

/obj/item/key_ring/AltClick(mob/user)
	if(!keys_in_keyring)
		to_chat(user,"The keyring is empty.")
		return
	var/index = _list_find(keys_in_keyring, active_key, 1, key_amt_max)
	if(index)
		to_chat(user,"You remove the [active_key.name].")
		keys_in_keyring -= index
		user.put_in_inactive_hand(new active_key)
		--key_amt

/obj/item/key_ring/attack_self(mob/user)
	keyCycle()
	to_chat(user,"You cycle to the [active_key.name].")
	update_icon()
