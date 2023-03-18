// Cooks things via burning them
// Obtuse, weird, mildly shit? Hell yeah.
/obj/structure/grill
	name = "grill"
	desc = "Immoliate food and parasites."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "gasstove1"
	climbable = TRUE
	climb_time = 10
	climb_stun = 5
	density = TRUE
	anchored = TRUE

/obj/structure/grill/Entered(atom/movable/AM)
	if(burn_stuff(AM))
		START_PROCESSING(SSobj, src)

/obj/structure/grill/hitby(atom/movable/AM)
	if(burn_stuff(AM))
		START_PROCESSING(SSobj, src)

/obj/structure/grill/process()
	if(!burn_stuff())
		STOP_PROCESSING(SSobj, src)

/obj/structure/grill/proc/burn_stuff(AM)
	. = 0

	var/thing_to_check = src
	if (AM)
		thing_to_check = list(AM)
	for(var/thing in thing_to_check)
		if(isobj(thing))
			var/obj/O = thing
			if((O.resistance_flags & (LAVA_PROOF|INDESTRUCTIBLE)) || O.throwing)
				continue
			. = 1
			if((O.resistance_flags & (ON_FIRE)))
				continue
			if(!(O.resistance_flags & FLAMMABLE))
				O.resistance_flags |= FLAMMABLE //Even fireproof things burn up in lava
			if(O.resistance_flags & FIRE_PROOF)
				O.resistance_flags &= ~FIRE_PROOF
			if(O.armor.fire > 50) //obj with 100% fire armor still get slowly burned away.
				O.armor = O.armor.setRating(fire = 50)
			O.fire_act(10000, 1000)

		else if (isliving(thing))
			. = 1
			var/mob/living/L = thing
			if(L.movement_type & FLYING)
				continue	//YOU'RE FLYING OVER IT
			if("lava" in L.weather_immunities)
				continue
			var/buckle_check = L.buckling
			if(!buckle_check)
				buckle_check = L.buckled
			if(isobj(buckle_check))
				var/obj/O = buckle_check
				if(O.resistance_flags & LAVA_PROOF)
					continue
			else if(isliving(buckle_check))
				var/mob/living/live = buckle_check
				if("lava" in live.weather_immunities)
					continue
			if(iscarbon(L))
				var/mob/living/carbon/C = L
				var/obj/item/clothing/S = C.get_item_by_slot(SLOT_WEAR_SUIT)
				var/obj/item/clothing/H = C.get_item_by_slot(SLOT_HEAD)

				if(S && H && S.clothing_flags & LAVAPROTECT && H.clothing_flags & LAVAPROTECT)
					return

			L.adjustFireLoss(20)
			if(L) //mobs turning into object corpses could get deleted here.
				L.adjust_fire_stacks(20)
				L.IgniteMob()
