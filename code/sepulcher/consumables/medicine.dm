// Sepulcher medicines //

/obj/item/consumable/medicine
	name = "health orb"
	desc = "healing embrace of a machination"
	icon = 'icons/obj/medicine.dmi'
	icon_state = "broken"
	ingest_consumption = FALSE
	health_points = -100
	eat_sound = 'sound/items/medicine_tablet.ogg'

/obj/item/consumable/medicine/citalopram
	name = "citalopram pill"
	desc = "Like fingers of warm light in a bleak mind."
	icon_state = "citalopram"
	ingest_consumption = TRUE
	will_points = -15

/obj/item/consumable/medicine/potassium_iodide
	name = "iodide pill"
	desc = "Toxicity Purgative. Effective, yet bitter."
	icon_state = "iodide"
	ingest_consumption = TRUE
	toxicity_points = -15
	will_points = 5

/obj/item/consumable/medicine/bruise_salve
	name = "bruise salve"
	desc = "Painkiller and balm for bruises. Stings."
	icon_state = "bruise_salve"
	health_points = -10
