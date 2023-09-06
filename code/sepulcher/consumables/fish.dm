/obj/item/consumable/food/fish //goby
	name = "prole-fish"
	desc = "Common, edible."
	icon_state = "fish"
	feed_points = 10
	toxicity_points = 10
	flavour_text = "The offal within is sour."
	var/gutted_flavour_text = "It tastes as fish should."
	var/gutted = FALSE
	var/gutting_text = "You gut the fish."

/obj/item/consumable/food/fish/proc/gut_fish(mob/user, gutting_time, toxmod)
	var/mob/living/carbon/human/H = user
	var/toxic_modification = (toxicity_points * toxmod)
	if(do_after(H, gutting_time, target = src))
		to_chat(H, "[gutting_text]")
		toxicity_points = toxic_modification
		gutted = TRUE
		flavour_text = gutted_flavour_text

/obj/item/consumable/food/fish/examine(mob/user)
	..()
	if(gutted)
		to_chat(user, "<span class='red'>Gutted. Requires cooking to purge remaining gralloch.</span>")
	else
		to_chat(user, "<span class='red'>Requires gutting, to rend out the filthy organs within.</span>")

/obj/item/consumable/food/fish/attackby(obj/item/O, mob/user, params)
	if(/obj/item/melee/knife) //preferably make this more ambiguous
		gut_fish(user, 20, 0)

/obj/item/consumable/food/fish/sturgeon
	name = "spine fish"
	desc = "Known for their eggs, a delicacy."
	icon_state = "broken"
	feed_points = 20
	toxicity_points = 20

/obj/item/consumable/food/fish/crab // Time for crab
	name = "bottom feeder"
	desc = "Eats those whom fall into the water."
	icon_state = "crab"
	feed_points = 3
	toxicity_points = 5

/obj/item/consumable/food/fish/lamprey
	name = "evil worm"
	desc = "Feeds upon blood. Parasites of a dead god."
	icon_state = "lamprey"
	feed_points = 3
	toxicity_points = 10

//sewer
/obj/item/consumable/food/fish/axlotl
	name = "shit swimmer"
	desc = "Mewing, small. Beady eyes of a bioslave."
	icon_state = "broken"
	feed_points = 3
	toxicity_points = 5

/obj/item/consumable/food/fish/burrower
	name = "strand burrower"
	desc = "Lives in sediment and hunt with black venom tendrils."
	icon_state = "burrower"
	feed_points = 3
	toxicity_points = 5
