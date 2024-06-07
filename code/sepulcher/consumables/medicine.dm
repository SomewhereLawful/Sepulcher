// Sepulcher medicines //
/obj/item/consumable/medicine
	name = "medical consumable"
	icon = 'icons/obj/medicine.dmi'
	icon_state = "broken"
	usage_time = 5

// Pills
/obj/item/consumable/medicine/pill
	consume_type = MOUTH_CONSUME
	use_sound = 'sound/items/medicine_tablet.ogg'
	usage_time = 1

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

/obj/item/consumable/medicine/pill/necrosleep
	name = "necrosleep"
	desc = "Mysterious pill. Looks transparent in the light..."
	icon_state = "necrosleep"
	toxicity_points = -15
	will_points = 5

// Salves
/obj/item/consumable/medicine/salve
	consume_type = SKIN_CONSUME
	uses_verb = "applies"
	use_verb = "apply"

/obj/item/consumable/medicine/salve/bruise
	name = "bruise salve"
	desc = "Painkiller and balm for bruises. Stings."
	icon_state = "bruise_salve"
	brute_heal = 10
	usage_time = 5

// Gauze
/obj/item/consumable/medicine/bandage
	consume_type = SKIN_CONSUME
	uses_verb = "applies"
	use_verb = "apply"

/obj/item/consumable/medicine/bandage/makeshift
	name = "makeshift bandage"
	desc = "Staunches bleeding."
	icon_state = "bruise_salve"
	bleed_suppression = 125
	slash_heal = -10
	usage_time = 5

/obj/item/consumable/medicine/bandage/standard
	name = "sterile gauze"
	desc = "Staunches bleeding."
	icon_state = "standard_bandage"
	bleed_suppression = 300
	slash_heal = -20
	usage_time = 3
