// Shitheaps //
// Cart shit to heap -> Add to heap -> Add water -> collect mushrooms //

/obj/item/food/dung // How to get parasites 101 - eat poop
	name = "shit gobbet"
	desc = "A filthy mass of waste. It piles nicely, so wet and repugnant."
	icon_state = "poop"
	feed_points = 10

/obj/item/water_adder
	name = "water adding item"
	desc = "For adding water to shitheaps, alert if found outside of testing."
	icon = 'icons/obj/food.dmi'

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
	var/rating = 1
	var/obj/structure/farm_plant/plant = null

	/// Explicitly for sewer
	var/self_sustaining = FALSE //If the tray generates nutrients and water on its own


/obj/structure/shitheap/attackby(obj/item/I, mob/user, params)
	if(/obj/item/food/dung)
		to_chat(user, "You add some dung to the heap.")
		playsound(src, 'sound/effects/blobattack.ogg', 50, 0)
		qdel(I)
		adjustFertilizer(1)
	else if(/obj/item/water_adder)
		to_chat(user, "You add some water to the heap.")
		playsound(src, 'sound/effects/blobattack.ogg', 50, 0)
		qdel(I)
		adjustWater(10)
	return ..()

/obj/structure/shitheap/process()

	if(self_sustaining)
		adjustFertilizer(1)
		adjustWater(rand(3,5))

	if(world.time > (lastcycle + cycledelay))
		lastcycle = world.time
		if(fertilizerlevel > 0 && waterlevel > 0)
			generatePlant()

		// Nutrients deplete slowly
		if(prob(50))
			adjustFertilizer(-1 / rating)
			// Drink random amount of water
			adjustWater(-rand(1,6) / rating)

	return ..()

/obj/structure/shitheap/proc/adjustFertilizer(adjustamt)
	fertilizerlevel = CLAMP(fertilizerlevel + adjustamt, 0, maxfertilizer)

/obj/structure/shitheap/proc/adjustWater(adjustamt)
	waterlevel = CLAMP(waterlevel + adjustamt, 0, maxwater)

/obj/structure/shitheap/proc/generatePlant()
	var/randPlant = pickweight(SHITHEAP_PRODUCTS_NORMAL)
	plant = new randPlant(get_turf(src))
	. = TRUE

/obj/structure/shitheap/examine(user)
	..()
	if(!self_sustaining)
		if(fertilizerlevel > maxfertilizer*0.75)
			to_chat(user, "<span class='info'>The stench tells of ample fertilization.</span>")
		else if(fertilizerlevel > maxfertilizer*0.5)
			to_chat(user, "<span class='info'>The heap is sufficiently fertilized.</span>")
		else if(fertilizerlevel > maxfertilizer*0.25)
			to_chat(user, "<span class='info'>The soil is yearning for new dung.</span>")
		else if(fertilizerlevel == 0)
			to_chat(user, "<span class='info'>The pile is starved. It needs more shit to grow more.</span>")
		if(waterlevel > maxwater*0.75)
			to_chat(user, "<span class='info'>It is rich in dampness.</span>")
		else if(waterlevel > maxwater*0.5)
			to_chat(user, "<span class='info'>The nightsoil is beginning to dry.</span>")
		else if(waterlevel > maxwater*0.25)
			to_chat(user, "<span class='info'>The heap is only ever so moisturized.</span>")
		else if(waterlevel == 0)
			to_chat(user, "<span class='info'>The shit is dry. Arid. Screaming for water.</span>")
	else
		to_chat(user, "<span class='info'>It does not require water or fertilizer.</span>")

// Spawns when shitheaps have sufficient 
/obj/structure/farm_plant
	name = "busted plant"
	desc = "Someone fucked up the generation."
	icon = 'icons/obj/grown_plants.dmi'
	icon_state = "done_goofed"

/obj/structure/farm_plant/Initialize()
	. = ..()
	pixel_x = rand(3,16)
	pixel_y = rand(2,17)
	START_PROCESSING(SSobj, src)