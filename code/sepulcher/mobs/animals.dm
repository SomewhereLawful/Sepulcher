// I have the body of a pig
/mob/living/simple_animal/pig
	name = "boar"
	desc = "Folded hide, weeping eyes, callous skin that ever grows. Source of flesh."

/mob/living/simple_animal/rat
	name = "rodent"
	desc = "Meat on little paws. Tastes like where it has been."
	icon_state = "mouse_gray"
	icon_living = "mouse_gray"
	icon_dead = "mouse_gray_dead"
	speak_emote = list("squeeks")
	emote_hear = list("squeeks.")

/mob/living/simple_animal/cityfowl //chicken
	name = "cityfowl"
	desc = "Flightless bird native to the city."
	gender = FEMALE
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	icon_state = "chicken_brown"
	icon_living = "chicken_brown"
	icon_dead = "chicken_brown_dead"
	speak_emote = list("clucks","croons")
	emote_hear = list("clucks.")
	emote_see = list("pecks at the ground.","flaps its wings viciously.")
	density = FALSE

/mob/living/simple_animal/shorthorn //cow
	name = "shorthorn"
	desc = "Emaciated creature native to the wastes."
	icon_state = "brahmin"
	icon_living = "brahmin"
	icon_dead = "brahmin_dead"
	icon_gib = "brahmin_gib"
	emote_hear = list("brays.")
	var/obj/item/inventory_back
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 6,
							/obj/item/stack/sheet/animalhide/brahmin = 3)
