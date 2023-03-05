// Shitheaps //
// Cart shit to heap -> Add to heap -> Add water -> collect mushrooms //

/obj/item/food/dung // How to get parasites 101 - eat poop
	name = "shit gobbet"
	desc = "A filthy mass of waste. It piles nicely, so wet and repugnant."
	icon_state = "poop"
	feed_points = 10

// Rundown for readability (cause I suck at code)
// Uses a system reminicent of hydroponics on SS13
// However, instead of tending a crop on a plot
// A single plot grows from a picklist so long as there's fertilizer(poop)

// Picklist for each type of shitheap - NORMAL is for church yard, CONSTRUCTED is for illegal harvest, SEWER is sewer (go figure)
#define SHITHEAP_PRODUCTS_NORMAL list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)
#define SHITHEAP_PRODUCTS_CONSTRUCTED list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)
#define SHITHEAP_PRODUCTS_SEWER list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)

/obj/structure/shitheap
	name = "shitheap"
	desc = "The base of the city's cultivation. Add dung and fluid to grow mushrooms."
	icon = 'icons/obj/shitpiles.dmi'
	icon_state = "sanctified"
	density = TRUE
	anchored = TRUE
	pixel_x = -16
	/// Amount of water in the heap
	var/waterlevel = 100
	/// Maximum amount of water in the heap
	var/maxwater = 100
	/// How much fertilizer is in the heap
	var/fertilizerlevel = 10
	/// Maximum amount of fertilizer in the heap
	var/maxfertilizer = 10
	var/lastcycle = 0		//Used for timing of cycles.
	var/cycledelay = 200	//About 10 seconds / cycle

	/// Explicitly for sewer
	var/self_sustaining = FALSE //If the tray generates nutrients and water on its own


/obj/structure/shitheap/attackby(obj/item/I, mob/user, params)
	if(/obj/item/food/dung)
		to_chat(user, "You add some dung to the heap.")
		playsound(src, 'sound/effects/blobattack.ogg', 50, 0)
		qdel(I)
		fertilizerlevel + 1
	return ..()

/obj/structure/shitheap/process()

	if(self_sustaining)
		adjustFertilizer(1)
		adjustWater(rand(3,5))

	if(world.time > (lastcycle + cycledelay))
		lastcycle = world.time
		generatePlant()

//Nutrients//////////////////////////////////////////////////////////////
			// Nutrients deplete slowly
			if(prob(50))
				adjustFertilizer(-1 / rating)

//Water//////////////////////////////////////////////////////////////////
			// Drink random amount of water
			adjustWater(-rand(1,6) / rating)

		if (needs_update)
			update_icon()
	return

/obj/structure/shitheap/proc/adjustFertilizer(adjustamt)
	fertilizerlevel = CLAMP(fertilizerlevel + adjustamt, 0, maxfertilizer)

/obj/structure/shitheap/proc/adjustWater(adjustamt)
	waterlevel = CLAMP(waterlevel + adjustamt, 0, maxwater)

/obj/structure/shitheap/proc/generatePlant()
	var/randPlant = null
	if(fertilizerlevel > 0 && waterlevel > 0)
		randPlant = pickweight(SHITHEAP_PRODUCTS_NORMAL)