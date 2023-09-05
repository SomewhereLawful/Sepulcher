// Shitheaps //
// Cart shit to heap -> Add to heap -> Add water -> collect mushrooms //

/obj/item/consumable/food/dung
	name = "shit gobbet"
	desc = "A filthy mass of waste. It piles nicely, so wet and repugnant."
	icon_state = "poop"
	feed_points = 10
	toxicity_points = 20
	will_points = 10
	flavour_text = "Moist with solid kernels within. Tastes bitter."

// Rundown for readability (cause I suck at code)
// Uses a system reminicent of (or horridly copy and pasted from) hydroponics on SS13
// However, instead of tending a crop on a plot
// A single plot grows from a picklist so long as there's fertilizer(poop)

// Picklist for each type of shitheap - NORMAL is for church yard, CONSTRUCTED is for illegal harvest, SEWER is sewer (go figure)
#define SHITHEAP_PRODUCTS_NORMAL list(/obj/structure/farm_plant = 100)
#define SHITHEAP_PRODUCTS_CONSTRUCTED list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)
#define SHITHEAP_PRODUCTS_SEWER list(/obj/structure/farm_plant = 100)

/obj/structure/shitheap
	name = "exalted shitheap"
	desc = "The city's cultivation plots. Located upon hallowed ground."
	icon = 'icons/obj/shitpiles.dmi'
	icon_state = "sanctified"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	density = TRUE
	anchored = TRUE
	pixel_x = -16

	/// How much fertilizer
	var/fertilizerlevel = 10
	/// Maximum amount of fertilizer
	var/maxfertilizer = 10

	var/lastcycle = 0
	var/cycledelay = 20	//About 10 seconds / cycle

	/// What grows there
	var/product_list = SHITHEAP_PRODUCTS_NORMAL
	var/self_sustaining

/obj/structure/shitheap/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/shitheap/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/shitheap/process()
	if(world.time > (lastcycle + rand(cycledelay * 0.8, cycledelay * 2)))
		lastcycle = world.time

		// Nutrients deplete slowly as cultivars are produced
		var/chosen_plant = pickweight(product_list)
		if(prob(10))
			if(!self_sustaining)
				adjustFertilizer((-1))
		new chosen_plant(get_turf(src))

/obj/structure/shitheap/attackby(obj/item/I, mob/user, params)
	if(/obj/item/consumable/food/dung)
		to_chat(user, "You add some dung to the heap.")
		playsound(src, 'sound/effects/blobattack.ogg', 50, 0)
		qdel(I)
		adjustFertilizer(1)
	return ..()

/obj/structure/shitheap/proc/adjustFertilizer(adjustamt)
	fertilizerlevel = CLAMP((fertilizerlevel + (adjustamt)), 0, maxfertilizer)
	return adjustamt

/obj/structure/shitheap/examine(user)
	..()
	if(!self_sustaining)
		if(fertilizerlevel > maxfertilizer*0.75)
			to_chat(user, "<span class='magenta'>The stench tells of ample fertilization.</span>")
		else if(fertilizerlevel > maxfertilizer*0.5)
			to_chat(user, "<span class='magenta'>The heap is sufficiently fertilized.</span>")
		else if(fertilizerlevel > maxfertilizer*0.25)
			to_chat(user, "<span class='magenta'>The soil is yearning for new dung.</span>")
		else if(fertilizerlevel == 0)
			to_chat(user, "<span class='magenta'>The pile is starved. It needs more shit.</span>")
	else
		to_chat(user, "<span class='magenta'>It does not require fertilizer.</span>")


// Spawns when shitheaps have sufficient 
/obj/structure/farm_plant
	name = "busted plant"
	desc = "Someone fucked up the generation."
	icon = 'icons/obj/grown_plants.dmi'
	icon_state = "done_goofed"
	anchored = TRUE
	layer = 4

/obj/structure/farm_plant/Initialize()
	. = ..()
	pixel_x = rand(-24,16)
	pixel_y = rand(2,17)


/obj/structure/shitheap/sewer
	name = "repugnant cessheap"
	desc = "Heap of shit, not sanctified. It grows dangerous product."
	self_sustaining = TRUE
	product_list = SHITHEAP_PRODUCTS_SEWER