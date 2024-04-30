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
	var/selection_index = 1

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

/obj/item/key_ring/proc/keyRemove(mob/user)
	var/obj/item/key/K = keys_in_keyring[selection_index]
	user.put_in_hands(K)
	keys_in_keyring -= active_key
	--key_amt
	keyCycle()

/obj/item/key_ring/proc/keyCycle(mob/user)
	active_key = keys_in_keyring[selection_index]
	active_lock_id = active_key.lock_id

	// Check if we've reached the end of the key list, reset to position 1 or add for next position
	if(selection_index == keys_in_keyring.len)
		selection_index = 1
		return
	selection_index = CLAMP((selection_index + 1), 0, keys_in_keyring.len)

/obj/item/key_ring/attackby(obj/item/key/I, mob/living/user, params)
	if(!I.key_ringable)
		to_chat(user,"The key refuses the key ring.")
		return
	else
		key_amt = CLAMP((key_amt + 1), 0, key_amt_max)
		keys_in_keyring += I
		qdel(I)
		to_chat(user,"You add the [active_key.name] to the key ring.")
		update_icon()

/obj/item/key_ring/AltClick(mob/user)
	if(!keys_in_keyring)
		to_chat(user,"The key ring is empty.")
		return
	keyRemove()
	to_chat(user,"You remove the [active_key.name].")
	update_icon()

/obj/item/key_ring/attack_self(mob/user)
	if(!keys_in_keyring || keys_in_keyring.len == 0)
		to_chat(user,"The key ring is empty.")
		return
	keyCycle()
	to_chat(user,"You cycle to the [active_key.name].")
	update_icon()
