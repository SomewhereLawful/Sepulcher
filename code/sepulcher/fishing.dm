/obj/item/fishing_rod
	name = "fishing rod"
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_rod"

	var/in_use = FALSE

/obj/item/fishing_rod/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(!proximity_flag)
		return
	if(in_use)
		to_chat(user, "<span class='warning'>You are already fishing.</span>")
		return
	in_use = TRUE
	if(istype(target, /obj/structure/fishing_spot))
		if(!do_after(user, rand(10,30) SECONDS, target = target))
			in_use = FALSE
			return
		var/obj/structure/fishing_spot/W = target
		var/chosen_fish = pickweight(W.fish_list)
		new chosen_fish(get_turf(user))
		to_chat(user, "<span class='warning'>You have caught something.</span>")
		in_use = FALSE
		return
	in_use = FALSE

/obj/structure/fishing_spot
	name = "fishing spot"
	desc = "The red water bubbles, creatures of the deep swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_spot" // this sprite gives me cancer
	anchored = TRUE
	var/list/fish_list = list(
			/obj/item/food/fish = 25,
			/obj/item/food/fish/sturgeon = 25,
			/obj/item/food/fish/crab = 25,
			/obj/item/food/fish/lamprey = 25)


/obj/structure/fishing_spot/sewer
	name = "fishing spot"
	desc = "The slurry bubbles, the dung-borne swirl nearby."
	icon = 'icons/obj/fishing.dmi'
	icon_state = "fishing_spot" // this sprite gives me cancer
	fish_list = list(
		/obj/item/food/fish/crab = 50,
		/obj/item/food/fish/axlotl = 40,
		/obj/item/food/fish/burrower = 10)