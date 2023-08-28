// Storage dumpfile
/obj/item/storage/fancy/cigarettes/cigarette_tin
	name = "nail tin"
	desc = "Coffin for coffin nails."
	icon_state = "cigtin"
	spawn_type = /obj/item/clothing/mask/cigarette

/obj/item/storage/fancy/cigarettes/cigarette_tin/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 8
	STR.can_hold = typecacheof(list(/obj/item/clothing/mask/cigarette))


/obj/item/storage/fancy/cigarettes/cigarette_ration
	name = "nail ration"
	desc = "Four coffin nails each."
	icon_state = "cigtin"
	spawn_type = /obj/item/clothing/mask/cigarette

/obj/item/storage/fancy/cigarettes/cigarette_ration/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 4
	STR.can_hold = typecacheof(list(/obj/item/clothing/mask/cigarette))
