/****************************************************
				   BLOOD SYSTEM
	   Rewritten by Fajetti - May god have mercy
****************************************************/

// Takes care blood loss and regeneration
/mob/living/carbon/human/handle_blood()
	if(NOBLOOD in dna.species.species_traits)
		bleed_rate = 0
		return

		//Blood regeneration if there is some space
		if(blood_volume < BLOOD_NORMAL && !has_trait(TRAIT_NOHUNGER))
			var/nutrition_ratio = 0
			switch(hunger)
				if(0 to 249)
					nutrition_ratio = 0.2
				if(250 to 499)
					nutrition_ratio = 0.4
				if(500 to 749)
					nutrition_ratio = 0.6
				if(750 to INFINITY)
					nutrition_ratio = 0.8
				else
					nutrition_ratio = 1
			if(satiety > 80)
				nutrition_ratio *= 1.25
			hunger = max(0, hunger - nutrition_ratio * HUNGER_FACTOR)
			blood_volume = min(BLOOD_NORMAL, blood_volume + 0.5 * nutrition_ratio)

		//Effects of bloodloss
		var/absence_word = pick("dizzy","woozy","faint")
		switch(blood_volume)
			if(BLOOD_EXCESS_LOW to BLOOD_EXCESS_HIGH)
				if(prob(15))
					to_chat(src, "<span class='red'>Ugh.... Your heart screams, your head splits...</span>")
				adjustBruteLoss(5)
			if(BLOOD_NORMAL to BLOOD_EXCESS_LOW)
				if(prob(15))
					to_chat(src, "<span class='red'>Your body feels swollen, your extremities hurt...</span>")
				adjustBruteLoss(round((BLOOD_NORMAL + blood_volume) * 0.01, 1))
			if(BLOOD_UNSAFE to BLOOD_NORMAL)
				if(prob(5))
					to_chat(src, "<span class='red'>You feel [absence_word].</span>")
			if(BLOOD_CRITCAL to BLOOD_UNSAFE)
				if(prob(5))
					blur_eyes(6)
					to_chat(src, "<span class='red'>You feel very [absence_word].</span>")
			if(BLOOD_DEATH_THRESHOLD to BLOOD_CRITCAL)
				if(prob(15))
					Unconscious(rand(20,60))
					to_chat(src, "<span class='red'>You feel extremely [absence_word].</span>")
			if(-INFINITY to BLOOD_DEATH_THRESHOLD)
				if(!has_trait(TRAIT_NODEATH))
					death()

		var/temp_bleed = 0
		//Bleeding out
		for(var/X in bodyparts)// //
			var/obj/item/bodypart/BP = X
			var/brutedamage = BP.brute_dam

			//We want an accurate reading of .len
			listclearnulls(BP.embedded_objects) // Innate bleed from the amt of embedded objects
			temp_bleed += 0.5*BP.embedded_objects.len

			if(brutedamage >= 20)
				temp_bleed += (brutedamage * 0.013)

		bleed_rate = max(bleed_rate - 0.5, temp_bleed)//if no wounds, other bleed effects (heparin) naturally decreases

		if(bleed_rate && !bleedsuppress && !(has_trait(TRAIT_FAKEDEATH)))
			bleed(bleed_rate)

//Makes a blood drop, leaking amt units of blood from the mob
/mob/living/carbon/proc/bleed(amt)
	if(blood_volume)
		blood_volume = max(blood_volume - amt, 0)
		if(isturf(src.loc)) //Blood loss still happens in locker, floor stays clean
			if(amt >= 10)
				add_splatter_floor(src.loc)
			else
				add_splatter_floor(src.loc, 1)

/mob/living/carbon/human/bleed(amt)
	amt *= physiology.bleed_mod
	if(!(NOBLOOD in dna.species.species_traits))
		..()

/mob/living/proc/restore_blood()
	blood_volume = initial(blood_volume)

/mob/living/carbon/human/restore_blood()
	blood_volume = BLOOD_NORMAL
	bleed_rate = 0

// This is has more potential uses, and is probably faster than the old proc.
/proc/get_safe_blood(bloodtype)
	. = list()
	if(!bloodtype)
		return

	var/static/list/bloodtypes_safe = list(
		"A-" = list("A-", "O-"),
		"A+" = list("A-", "A+", "O-", "O+"),
		"B-" = list("B-", "O-"),
		"B+" = list("B-", "B+", "O-", "O+"),
		"AB-" = list("A-", "B-", "O-", "AB-"),
		"AB+" = list("A-", "A+", "B-", "B+", "O-", "O+", "AB-", "AB+"),
		"O-" = list("O-"),
		"O+" = list("O-", "O+"),
		"L" = list("L"),
		"U" = list("A-", "A+", "B-", "B+", "O-", "O+", "AB-", "AB+", "L", "U")
	)

	var/safe = bloodtypes_safe[bloodtype]
	if(safe)
		. = safe

//to add a splatter of blood or other mob liquid.
/mob/living/proc/add_splatter_floor(turf/T, small_drip)
	if(get_blood_id() != "blood")
		return
	if(!T)
		T = get_turf(src)

	var/list/temp_blood_DNA
	if(small_drip)
		// Only a certain number of drips (or one large splatter) can be on a given turf.
		var/obj/effect/decal/cleanable/blood/drip/drop = locate() in T
		if(drop)
			if(drop.drips < 3)
				drop.drips++
				drop.add_overlay(pick(drop.random_icon_states))
				drop.transfer_mob_blood_dna(src)
				return
			else
				temp_blood_DNA = drop.return_blood_DNA() //we transfer the dna from the drip to the splatter
				qdel(drop)//the drip is replaced by a bigger splatter
		else
			drop = new(T, get_static_viruses())
			drop.transfer_mob_blood_dna(src)
			return

	// Find a blood decal or create a new one.
	var/obj/effect/decal/cleanable/blood/B = locate() in T
	if(!B)
		B = new /obj/effect/decal/cleanable/blood/splatter(T, get_static_viruses())
	B.transfer_mob_blood_dna(src) //give blood info to the blood decal.
	if(temp_blood_DNA)
		B.add_blood_DNA(temp_blood_DNA)

/mob/living/carbon/human/add_splatter_floor(turf/T, small_drip)
	if(!(NOBLOOD in dna.species.species_traits))
		..()

// LEGACY REAGENT / BLOOD_ID SHIT TO STOP ERRORS
//get the id of the substance this mob use as blood.
/mob/living/proc/transfer_blood_to(atom/movable/AM, amount, forced)
	if(!blood_volume || !AM.reagents)
		return 0
	if(blood_volume < BLOOD_VOLUME_BAD && !forced)
		return 0

	if(blood_volume < amount)
		amount = blood_volume

	var/blood_id = get_blood_id()
	if(!blood_id)
		return 0

	blood_volume -= amount

	var/list/blood_data = get_blood_data(blood_id)

	if(iscarbon(AM))
		var/mob/living/carbon/C = AM
		if(blood_id == C.get_blood_id())//both mobs have the same blood substance
			if(blood_id == "blood") //normal blood
				if(blood_data["viruses"])
					for(var/thing in blood_data["viruses"])
						var/datum/disease/D = thing
						if((D.spread_flags & DISEASE_SPREAD_SPECIAL) || (D.spread_flags & DISEASE_SPREAD_NON_CONTAGIOUS))
							continue
						C.ForceContractDisease(D)
				if(!(blood_data["blood_type"] in get_safe_blood(C.dna.blood_type)))
					C.reagents.add_reagent("toxin", amount * 0.5)
					return 1

			C.blood_volume = min(C.blood_volume + round(amount, 0.1), BLOOD_VOLUME_MAXIMUM)
			return 1

	AM.reagents.add_reagent(blood_id, amount, blood_data, bodytemperature)
	return 1

/mob/living/proc/get_blood_data(blood_id)
	return

/mob/living/carbon/get_blood_data(blood_id)
	if(blood_id == "blood") //actual blood reagent
		var/blood_data = list()
		//set the blood data
		blood_data["donor"] = src
		blood_data["viruses"] = list()

		for(var/thing in diseases)
			var/datum/disease/D = thing
			blood_data["viruses"] += D.Copy()

		blood_data["blood_DNA"] = copytext(dna.unique_enzymes,1,0)
		if(disease_resistances && disease_resistances.len)
			blood_data["resistances"] = disease_resistances.Copy()
		var/list/temp_chem = list()
		for(var/datum/reagent/R in reagents.reagent_list)
			temp_chem[R.id] = R.volume
		blood_data["trace_chem"] = list2params(temp_chem)
		if(mind)
			blood_data["mind"] = mind
		else if(last_mind)
			blood_data["mind"] = last_mind
		if(ckey)
			blood_data["ckey"] = ckey
		else if(last_mind)
			blood_data["ckey"] = ckey(last_mind.key)

		if(!suiciding)
			blood_data["cloneable"] = 1
		blood_data["blood_type"] = copytext(dna.blood_type,1,0)
		blood_data["gender"] = gender
		blood_data["real_name"] = real_name
		blood_data["features"] = dna.features
		blood_data["factions"] = faction
		blood_data["quirks"] = list()
		for(var/V in roundstart_quirks)
			var/datum/quirk/T = V
			blood_data["quirks"] += T.type
		return blood_data

//get the id of the substance this mob use as blood.
/mob/proc/get_blood_id()
	return

/mob/living/simple_animal/get_blood_id()
	if(blood_volume)
		return "blood"

/mob/living/carbon/monkey/get_blood_id()
	if(!(has_trait(TRAIT_NOCLONE)))
		return "blood"

/mob/living/carbon/human/get_blood_id()
	if(dna.species.exotic_blood)
		return dna.species.exotic_blood
	else if((NOBLOOD in dna.species.species_traits) || (has_trait(TRAIT_NOCLONE)))
		return
	return "blood"
