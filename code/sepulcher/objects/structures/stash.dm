// Standing storage datum objects
// SHOULD function like normal storage items, but they're structures that don't move.
// Alot copied verbaitim from storage.dm for items

/obj/structure/stash
	name = "stash object"
	desc = "spooky stash object that has gone horribly awry."
	icon = 'icons/sepulcher/decor.dmi'
	layer = OBJ_LAYER
	var/component_type = /datum/component/storage/concrete

/obj/structure/stash/Initialize()
	. = ..()
	PopulateContents()

/obj/structure/stash/ComponentInitialize()
	AddComponent(component_type)

/obj/structure/stash/contents_explosion(severity, target)
	for(var/atom/A in contents)
		A.ex_act(severity, target)
		CHECK_TICK

/obj/structure/stash/proc/PopulateContents()

/obj/structure/stash/drain
	name = "street drain"
	desc = "Repugnant port to the sewer. A small void."
	icon_state = "drain1"
	layer = TURF_DECAL_LAYER

/obj/structure/stash/drain/Initialize()
	. = ..()
	icon_state = "drain[rand(1,2)]"

/obj/structure/stash/drain/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 3
	STR.max_w_class = WEIGHT_CLASS_SMALL