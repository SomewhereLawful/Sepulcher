/obj/item/clothing/suit/hooded/bandit_coat
	name = "long coat"
	desc = "Untrustworthy, riddled with wear."
	icon_state = "banditcoat"
	item_state = "banditcoat"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	hoodtype = /obj/item/clothing/head/hooded/bandit_hood

/obj/item/clothing/head/hooded/bandit_hood
	name = "coat hood"
	desc = "Hides the face."
	icon_state = "banditcoat" // invisible icon
	item_state = "banditcoat"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS

/obj/item/clothing/suit/hooded/bandit_coat/brown
	icon_state = "banditcoatbrown"
	item_state = "banditcoatbrown"
	hoodtype = /obj/item/clothing/head/hooded/bandit_hood/brown

/obj/item/clothing/head/hooded/bandit_hood/brown
	icon_state = "banditcoatbrown" // invisible icon
	item_state = "banditcoatbrown"

/obj/item/clothing/suit/cleansercoat
	name = "cleanser cleancoat"
	desc = "A rather grisly selection of cured hides and skin, sewn together to form a ragged mantle."
	icon_state = "mantle_liz"
	item_state = "det_suit"