/obj/item/key
	name = "key"
	icon = 'icons/obj/key.dmi'
	w_class = WEIGHT_CLASS_TINY
	/// Can it be put in a key_ring?
	var/key_ringable = TRUE
	var/lock_id = "null"
	// lock_data is for depreciated padlock system
	var/lock_data = ""

/obj/item/key/skeleton_key
	name = "skeleton key"
	desc = "Debug item, unlocks all doors."
	icon_state = "skeleton"
	key_ringable = FALSE