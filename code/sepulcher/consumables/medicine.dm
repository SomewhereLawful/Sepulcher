// Sepulcher medicines //
/obj/item/consumable/medicine
	name = "medical consumable"
	icon = 'icons/obj/medicine.dmi'
	icon_state = "broken"
	usage_time = 10

// Pills
/obj/item/consumable/medicine/pill
	consume_type = MOUTH_CONSUME
	use_sound = 'sound/items/medicine_tablet.ogg'

/obj/item/consumable/medicine/pill/citalopram
	name = "citalopram pill"
	desc = "Like fingers of warm light in a bleak mind."
	icon_state = "citalopram"
	will_points = -15

/obj/item/consumable/medicine/pill/potassium_iodide
	name = "iodide pill"
	desc = "Toxicity Purgative. Effective, yet bitter."
	icon_state = "iodide"
	toxicity_points = -15
	will_points = 5

// Salves and gauze
/obj/item/consumable/medicine/bruise_salve
	name = "bruise salve"
	desc = "Painkiller and balm for bruises. Stings."
	icon_state = "bruise_salve"
	consume_type = SKIN_CONSUME
	brute_heal = 10
	uses_verb = "applies"
	use_verb = "apply"
	usage_time = 10

/obj/item/consumable/medicine/gauze
	name = "sterile gauze"
	desc = "Staunches bleeding."
	consume_type = SKIN_CONSUME
	icon_state = "bruise_salve"
	bleed_suppression = 300 // Slightly arbitrary, should staunch all bleeds
	uses_verb = "applies"
	use_verb = "apply"
	usage_time = 15
