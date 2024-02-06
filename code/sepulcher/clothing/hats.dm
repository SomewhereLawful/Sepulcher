/obj/item/clothing/head/cleanser
	name = "cleanser safehood"
	icon_state = "cleanser"
	item_state = "cleanser"
	desc = "If only screams were filtered."
	permeability_coefficient = 0.01
	clothing_flags = THICKMATERIAL | BLOCK_GAS_SMOKE_EFFECT
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 100, "rad" = 80, "fire" = 30, "acid" = 100)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	resistance_flags = ACID_PROOF
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/cleanser/sealed
	desc = "If only screams were filtered. You are sealed in."
	item_flags = NODROP // sealed in

/obj/item/clothing/head/safekeeper
	name = "enforcer budenovka"
	icon_state = "beater"
	item_state = "kommandant"
	desc = "If only screams were filtered."
	flags_inv = HIDEEARS|HIDEHAIR
