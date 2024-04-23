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
	desc = "Moldy natural fibre. Dignified."
	icon_state = "safekeeper"
	item_state = "safekeeper"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/worker_helmet
	name = "hardhat"
	desc = "Couldn't stop a bullet."
	icon_state = "worker_helmet"
	item_state = "worker_helmet"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/straw_hat
	name = "straw hat"
	icon_state = "gambler"
	item_state = "dethat"
	flags_inv = HIDEHAIR