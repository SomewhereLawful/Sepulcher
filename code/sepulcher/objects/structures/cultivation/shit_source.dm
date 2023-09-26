// A place shit is collected
// Also a good way to catch parasites
/obj/item/consumable/food/dung
	name = "shit gobbet"
	desc = "A filthy mass of waste. It piles nicely, so wet and repugnant."
	icon_state = "poop"
	feed_points = 10
	toxicity_points = 20
	will_points = 10
	flavour_text = "Moist with solid kernels within. Tastes bitter."

/obj/structure/shit_source
	name = "shit-ladden pipe"
	desc = "Collection of dung awaiting reuse."
	icon = 'icons/obj/shit_source.dmi'
	icon_state = "pipe1"
	var/dung_amount = 1
	var/output_dir = SOUTH

/obj/structure/shit_source/proc/shit_collection(mob/user, collect_time, parasite_chance)
	var/turf/T = get_step(src,output_dir) // So ingots spawn south of the box
	//var/mob/living/carbon/human/H = user
	if(do_after(user, collect_time, target = src))
		new /obj/item/consumable/food/dung(T)
		if(dung_amount == 0)
			icon_state = "[icon_state]-empty"
			desc = "Empty, only stench and grime remains."
			return
	else
		to_chat(user, "<span class='warning'>You stop pulling at the heap.</span>")

/obj/structure/shit_source/New()
	..()
	dung_amount = rand(3,5)
	output_dir = dir

/obj/structure/shit_source/attack_hand(mob/user)
	if(dung_amount == 0)
		to_chat(user, "<span class='red'>There is no amount of nightsoil worth collecting.</span>")
		return
	else
		shit_collection(user,20,33)
	..()

/obj/structure/shit_source/attackby(obj/item/O, mob/user, params)
	if(/obj/item/melee/shovel)
		shit_collection(user,10,15)
	else
		to_chat(user, "<span class='red'>This article lacks utility in this task.</span>")