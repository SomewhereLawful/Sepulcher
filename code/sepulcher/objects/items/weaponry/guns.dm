// Standard guns //

/obj/item/gun/ballistic/revolver/nagant
	name = "revolver"
	desc = "Single-action, seven shot revolver. Popular choice of the proletariat."
	icon = 'icons/obj/weapons/guns.dmi'
	icon_state = "nagant"
	can_suppress = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev762
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/ballistic/automatic/pistol/tt_38
	name = "pistol"
	desc = "Semi-automatic, eight rounds. Not very powerful, yet cheap to produce."
	icon = 'icons/obj/weapons/guns.dmi'
	icon_state = "tt_38"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m10mm
	can_suppress = FALSE
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	slot_flags = ITEM_SLOT_BELT

/obj/item/gun/ballistic/shotgun/boltaction/nagant
	name = "long rifle"
	desc = "Bolt action, five shot rifle. Effective at long range, it accepts a bayonet."
	icon_state = "moistnugget"
	item_state = "moistnugget"

/obj/item/gun/ballistic/shotgun/ks_23
	name = "boomstick"
	desc = "Pump action, five shot shotgun. Beast of a weapon, fires special-made shells."
	icon_state = "moistnugget"
	item_state = "moistnugget"