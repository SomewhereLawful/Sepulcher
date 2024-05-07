//trees
/obj/structure/flora/tree
	name = "tree"
	desc = "A large tree."
	density = TRUE
	pixel_x = -16
	layer = FLY_LAYER
	var/log_amount = 5

/obj/structure/flora/tree/obj_destruction(damage_flag) // You're gonna have to trust me on this
	var/obj/structure/flora/stump/S = new(loc)
	S.name = "[name] stump"
	playsound(get_turf(src), 'sound/effects/tree_fall.ogg', 100 , 0, 0)
	if(log_amount)
		for(var/i=1 to log_amount)
			new /obj/item/grown/log/tree(get_turf(src))
	qdel(src)

/obj/structure/flora/tree/attackby(obj/item/W, mob/user, params)
	if(W.sharpness && W.force > 0 && W.tool_behaviour != TOOL_SHOVEL) // For the tree-cutting sound effect
		playsound(get_turf(src), 'sound/effects/wood_cutting.ogg', 100, 0, 0)
		..()
	else
		return ..()

/obj/structure/flora/stump
	name = "stump"
	desc = "This represents our promise to the people of Wasteland, and the planet itself, to cut down as many trees as possible." //running naked through the trees
	icon = 'icons/fallout/flora/trees.dmi'
	icon_state = "tree_stump"
	density = FALSE
	pixel_x = -16

/obj/structure/flora/stump/attacked_by(obj/item/I, mob/living/user)
	if(I.tool_behaviour == TOOL_SHOVEL)
		to_chat(user, "<span class='notice'>You start digging up [src].</span>")
		if(I.use_tool(src, user, 40, volume=50))
			to_chat(user, "<span class='notice'>You dig up [src].</span>")
			new /obj/item/grown/log/tree(get_turf(src))
			qdel(src)
	else
		return ..()

/obj/structure/flora/tree/tall
	name = "dead tree"
	desc = "A rather tall tree that has been dead for a long time.<br>Interestingly it is still standing, as a reminder of its green past."
	icon = 'icons/fallout/flora/talltrees.dmi'
	icon_state = "tree_1"
	log_amount = 6
	obj_integrity = 350
	max_integrity = 350

/obj/structure/flora/tree/tall/New()
	icon_state = "tree_[rand(1,3)]"
	..()

/obj/structure/flora/tree/pine
	name = "pine tree"
	desc = "A coniferous pine tree."
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"
	var/list/icon_states = list("pine_1", "pine_2", "pine_3")

/obj/structure/flora/tree/pine/Initialize()
	. = ..()

	if(islist(icon_states && icon_states.len))
		icon_state = pick(icon_states)

/obj/structure/flora/tree/pine/xmas
	name = "xmas tree"
	desc = "A wondrous decorated Christmas tree."
	icon_state = "pine_c"
	icon_states = null

/obj/structure/flora/tree/pine/xmas/presents
	icon_state = "pinepresents"
	desc = "A wondrous decorated Christmas tree. It has presents!"
	var/gift_type = /obj/item/a_gift/anything
	var/list/ckeys_that_took = list()

/obj/structure/flora/tree/pine/xmas/presents/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!user.ckey)
		return

	if(ckeys_that_took[user.ckey])
		to_chat(user, "<span class='warning'>There are no presents with your name on.</span>")
		return
	to_chat(user, "<span class='warning'>After a bit of rummaging, you locate a gift with your name on it!</span>")
	ckeys_that_took[user.ckey] = TRUE
	var/obj/item/G = new gift_type(src)
	user.put_in_hands(G)

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	desc = "A dead tree. How it died, you know not."
	icon_state = "tree_1"

/obj/structure/flora/tree/joshua
	name = "joshua tree"
	desc = "A tree named by mormons, who said it's branches mimiced the biblical Joshua, raising his hands in prayer."
	icon = 'icons/obj/flora/deadtrees.dmi'
	log_amount = 3
	icon_state = "joshua_1"

/obj/structure/flora/tree/joshua/Initialize()
	. = ..()
	icon_state = "joshua_[rand(1,4)]"

/obj/structure/flora/tree/cactus
	name = "cactus"
	desc = "It's a giant cowboy hat! It's waving hello! It wants you to hug it!"
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "cactus"
	log_amount = 2

/obj/structure/flora/tree/tall
	name = "dead tree"
	desc = "Blackened spire, reaching like desperate hands to the firmament."
	icon = 'icons/fallout/flora/talltrees.dmi'
	icon_state = "tree_1"
	log_amount = 6
	obj_integrity = 350
	max_integrity = 350

/obj/structure/flora/tree/tall/New()
	icon_state = "tree_[rand(1,3)]"
	..()

/obj/structure/flora/tree/palm
	icon = 'icons/misc/beach2.dmi'
	desc = "A tree straight from the tropics."
	icon_state = "palm1"

/obj/structure/flora/tree/palm/Initialize()
	. = ..()
	icon_state = pick("palm1","palm2")
	pixel_x = 0

/obj/structure/festivus
	name = "festivus pole"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "festivus_pole"
	desc = "During last year's Feats of Strength the Research Director was able to suplex this passing immobile rod into a planter."

/obj/structure/flora/tree/dead/Initialize()
	icon_state = "tree_[rand(1, 6)]"
	. = ..()

/obj/structure/flora/tree/jungle
	name = "tree"
	icon_state = "tree"
	desc = "It's seriously hampering your view of the jungle."
	icon = 'icons/obj/flora/jungletrees.dmi'
	pixel_x = -48
	pixel_y = -20

/obj/structure/flora/tree/jungle/Initialize()
	icon_state = "[icon_state][rand(1, 6)]"
	. = ..()

/obj/structure/flora/tree/jungle/small
	pixel_y = 0
	pixel_x = -32
	icon = 'icons/obj/flora/jungletreesmall.dmi'

// Fallout code
/obj/structure/flora/tree/wasteland
	name = "dead tree"
	desc = "It's a tree. Useful for combustion and/or construction."
	icon = 'icons/fallout/flora/trees.dmi'
	icon_state = "deadtree_1"
	log_amount = 4
	obj_integrity = 100
	max_integrity = 100

/obj/structure/flora/tree/wasteland/New()
	icon_state = "deadtree_[rand(1,6)]"
	..()
