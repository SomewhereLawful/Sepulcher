/obj/item/key_ring
	name = "key ring"
	icon = 'icons/obj/key.dmi'
	icon_state = "key_ring"
	slot_flags = ITEM_SLOT_POCKET|ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	var/list/keys_in_keyring = list()
	var/obj/item/key/active_key
	var/active_lock_id
	var/selection_index = 1
	var/max_keys = 5

/obj/item/key_ring/update_icon()
	cut_overlays()
	if(keys_in_keyring && !active_key)
		add_overlay("key_ring-key-[keys_in_keyring.len]")
	else if(keys_in_keyring && active_key)
		var/key_amt_w_active = (keys_in_keyring.len - 1)
		add_overlay("key_ring-active")
		add_overlay("key_ring-key-[key_amt_w_active]")
	else
		return

/obj/item/key_ring/examine(mob/user)
	..()
	to_chat(user, "<span class='magenta'>Alt-Click to cycle the key, click the [name] to remove a key.</span>")
	if(active_key)
		to_chat(user, "<span class='magenta'>You currently are holding the [active_key.name].</span>")
	if(keys_in_keyring)
		if(keys_in_keyring.len == 1)
			to_chat(user, "<span class='magenta'>There is only one key on the [name].</span>")
		else
			to_chat(user, "<span class='magenta'>There are [keys_in_keyring.len] keys on the [name].</span>")
	else
		to_chat(user, "<span class='magenta'>There are no keys on the [name].</span>")

/obj/item/key_ring/proc/keyCycle(mob/user)
	if(!keys_in_keyring || keys_in_keyring.len == 0)
		to_chat(user,"The [name] is empty.")
		return

	active_key = keys_in_keyring[selection_index]
	active_lock_id = active_key.lock_id

	if(selection_index == keys_in_keyring.len)// Check if we've reached the end of the key list, reset to position 1 or add for next position
		selection_index = 1
		return
	selection_index = CLAMP((selection_index + 1), 0, keys_in_keyring.len)
	to_chat(user,"You cycle to the [active_key.name].")

/obj/item/key_ring/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/key))
		var/obj/item/key/K = I
		if(K.key_ringable)
			keys_in_keyring += K
			qdel(K)
			to_chat(user,"You add the [active_key.name] to the [name].")
			update_icon()
			selection_index = 1
		else
			to_chat(user,"The [K.name] refuses the [name].")
			return
	update_icon()

/obj/item/key_ring/AltClick(mob/user)
	if(!keys_in_keyring || keys_in_keyring.len == 0)
		to_chat(user,"The [name] is empty.")
		return
	usr.put_in_inactive_hand(active_key)
	keys_in_keyring -= active_key
	to_chat(user,"You remove the [active_key.name].")
	keyCycle()

/obj/item/key_ring/attack_self(mob/user)
	if(keys_in_keyring.len == 1)
		to_chat(user,"There's only the [active_key.name] on the [name].")
		return
	keyCycle()
	update_icon()
