// Shitheaps //
// Cart shit to heap -> Add to heap -> Add water -> collect mushrooms //

// A single plot grows from a picklist so long as there's fertilizer
// Picklist for each type of shitheap - NORMAL is for church yard, CONSTRUCTED is for illegal harvest, SEWER is sewer (go figure)
#define SHITHEAP_PRODUCTS_NORMAL list(/obj/structure/farm_plant/common_mushroom = 30, /obj/structure/farm_plant/crawler_cap = 20, /obj/structure/farm_plant/steelhead = 10, /obj/structure/farm_plant/thinhelmet = 20, /obj/structure/farm_plant/sinew = 20)
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

	var/fertilizerlevel = 0 // How much is currently in the heap
	var/maxfertilizer = 10

	// both in deciseconds
	var/lastcycle = 0
	var/cycledelay = 300

	var/product_list = SHITHEAP_PRODUCTS_NORMAL
	var/self_sustaining

/obj/structure/shitheap/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	fertilizerlevel = rand(0,4)

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
	var/message = ""
	if(!self_sustaining)
		var/percentage = fertilizerlevel / maxfertilizer
		if(percentage > 0.75)
			message = "The stench tells of ample fertilization."
		else if(percentage > 0.5)
			message = "The heap is sufficiently fertilized."
		else if(percentage > 0.25)
			message = "The soil is yearning for new dung."
		else if(fertilizerlevel == 0)
			message = "The pile is starved. It needs more shit."
	else
		message = "It does not require fertilizer."

	if(message)
		to_chat(user, "<span class='magenta'>[message]</span>")

/obj/structure/shitheap/sewer
	name = "repugnant cessheap"
	desc = "Heap of shit, not sanctified. It grows dangerous product."
	self_sustaining = TRUE
	product_list = SHITHEAP_PRODUCTS_SEWER