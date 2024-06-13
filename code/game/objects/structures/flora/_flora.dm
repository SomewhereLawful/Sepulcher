/obj/structure/flora
	icon = 'icons/obj/flora/_flora.dmi'
	resistance_flags = FLAMMABLE
	//max_integrity = 150
	anchored = TRUE

	// Harvest Variables
	var/base_icon
	var/harvestable = FALSE
	var/harvest_needs_sharp_tool = TRUE
	var/harvested = FALSE
	var/harvest_time = 20
	var/harvested_msg = "It's been harvested."
	var/harvest_item = /obj/item/consumable/food/plant/common_mushroom
	// Harvest regrowth vars
	var/regrowth_time_low = 3 MINUTES
	var/regrowth_time_high = 5 MINUTES

/obj/structure/flora/Initialize()
	. = ..()
	if(harvestable)
		base_icon = icon_state

/obj/structure/flora/examine(mob/user)
	. = ..()
	if(harvested)
		to_chat(user, "<span class='purple'>[harvested_msg]</span>")

/obj/structure/flora/proc/plantHarvest(user)
	if(!harvested)
		if(user)
			new harvest_item(get_turf(src))
			icon_state = "[base_icon]_harvest"
			harvested = TRUE
			addtimer(CALLBACK(src, .proc/plantRegrow), rand(regrowth_time_low, regrowth_time_high))
			return 1
		else return 0
	else
		to_chat(user, "<span class='magenta'>There is nothing to harvest.</span>")
		return 0

/obj/structure/flora/proc/plantRegrow()
	name = initial(name)
	desc = initial(desc)
	icon_state = base_icon
	harvested = FALSE

/obj/structure/flora/attackby(obj/item/W, mob/user, params)
	if(harvestable && harvest_needs_sharp_tool && W.sharpness)
		user.visible_message("<span class='notice'>[user] starts to harvest from [src] with [W].</span>",
								"<span class='notice'>You begin to harvest from [src] with [W].</span>")
		if(do_after(user, harvest_time, target = src))
			plantHarvest(user)
	else
		return ..()

/obj/structure/flora/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(harvestable && !harvest_needs_sharp_tool)
		user.visible_message("<span class='notice'>[user] starts to harvest from [src].</span>",
								"<span class='notice'>You begin to harvest from [src].</span>")
		if(do_after(user, harvest_time, target = src))
			plantHarvest(user)

// NOTE - I don't know why this here either, it's fucking stupid
// ----
//a rock is flora according to where the icon file is
//and now these defines
/obj/structure/flora/rock
	icon_state = "basalt"
	desc = "A volcanic rock. Pioneers used to ride these babies for miles."
	icon = 'icons/obj/flora/rocks.dmi'
	resistance_flags = FIRE_PROOF
	density = TRUE

/obj/structure/flora/rock/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1,3)]"

/obj/structure/flora/rock/pile
	icon_state = "lavarocks"
	desc = "A pile of rocks."

/obj/structure/flora/rock/pile/Initialize()
	. = ..()
	icon_state = "[icon_state][rand(1,3)]"

//Jungle rocks

/obj/structure/flora/rock/jungle
	icon_state = "pile of rocks"
	desc = "A pile of rocks."
	icon_state = "rock"
	icon = 'icons/obj/flora/jungleflora.dmi'
	density = FALSE

/obj/structure/flora/rock/jungle/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,5)]"


//Jungle bushes

/obj/structure/flora/junglebush
	name = "bush"
	desc = "A wild plant that is found in jungles."
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha"

/obj/structure/flora/junglebush/Initialize()
	icon_state = "[icon_state][rand(1, 3)]"
	. = ..()

/obj/structure/flora/junglebush/b
	icon_state = "bushb"

/obj/structure/flora/junglebush/c
	icon_state = "bushc"

/obj/structure/flora/junglebush/large
	icon_state = "bush"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	pixel_x = -16
	pixel_y = -12
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/flora/rock/pile/largejungle
	name = "rocks"
	icon_state = "rocks"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	density = FALSE
	pixel_x = -16
	pixel_y = -16

/obj/structure/flora/rock/pile/largejungle/Initialize()
	. = ..()
	icon_state = "[initial(icon_state)][rand(1,3)]"
