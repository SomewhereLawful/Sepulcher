
// Spawns when shitheaps have sufficient fertilizer
/obj/structure/farm_plant
	name = "busted plant"
	desc = "Someone fucked up the generation."
	icon = 'icons/obj/grown_plants.dmi'
	icon_state = "done_goofed"
	anchored = TRUE
	layer = 4
	var/plant_product

/obj/structure/farm_plant/Initialize()
	. = ..()
	pixel_x = rand(-24,16)
	pixel_y = rand(2,17)

/obj/structure/farm_plant/attack_hand(mob/user)
	var/obj/item/consumable/food/F = new plant_product
	user.put_in_active_hand(F)
	qdel(src)

// exalted product
/obj/structure/farm_plant/common_mushroom
	name = "mushroom"
	icon_state = "common"
	plant_product = /obj/item/consumable/food/common_mushroom

/obj/structure/farm_plant/crawler_cap
	name = "crawler cap"
	icon_state = "crawler"
	plant_product = /obj/item/consumable/food/crawler_cap

/obj/structure/farm_plant/steelhead
	name = "steelhead"
	icon_state = "steelhead"
	plant_product = /obj/item/consumable/food/steelhead

/obj/structure/farm_plant/thinhelmet
	name = "thin helmet"
	icon_state = "thinhelmet"
	plant_product = /obj/item/consumable/food/thinhelmet

/obj/structure/farm_plant/sinew
	name = "sinew strand"
	icon_state = "sinew"
	plant_product = /obj/item/consumable/food/sinew
