#define COVEN_GOD_RELATION_ANGRY -2
#define COVEN_GOD_RELATION_DISLIKE -1
#define COVEN_GOD_RELATION_NEUTRAL 0
#define COVEN_GOD_RELATION_LIKE 1
#define COVEN_GOD_RELATION_HAPPY 2

// Coven items staple code
/obj/item/coven_item
	name = "coven item"
	var/coven_favor_lvl = COVEN_GOD_RELATION_NEUTRAL
	icon = 'icons/obj/coven.dmi'

// Svarhogg cult (foundry)
/obj/item/coven_item/svarhogg_ear
	name = "wire ear"
	icon_state = "hogg-ear"
	coven_favor_lvl = COVEN_GOD_RELATION_NEUTRAL

// Yoni Tehom cult (fishing)
/obj/item/coven_item/tehom_yoni
	name = "bauble"
	icon_state = "yoni-womb"
	coven_favor_lvl = COVEN_GOD_RELATION_NEUTRAL