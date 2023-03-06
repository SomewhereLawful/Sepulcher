/obj/structure/laundry_bin
	name = "laundry bin"
	desc = "Full of old rags and shoes. Cover your shame."
	density = TRUE
	anchored = TRUE
	icon_state = "laundrybin"
	
	//M.put_in_active_hand(holy_weapon)

/obj/structure/laundry_bin/attack_hand(mob/user)
	to_chat(user, "You dig through for something of passable quality.")
	var/choice = input(user, "Choose an article to search for", "Digging for clothes") as null|anything in list("Hats","Masks","Shirts","Coats","Gloves","Shoes",)
	playsound(src, 'sound/effects/cloth_rustle1.ogg', 50, 0)
	if(do_after(user, 14.4, target = src))
		switch(choice) // Note to self: Make items received appear in hands and make them randomized via pickweight list
			if("Hats")
				new /obj/item/clothing/head/flatcap(get_turf(user))
				to_chat(user, "You grab some headwear from the bin.")
			if("Masks")
				var/masks = pick(/obj/item/clothing/mask/ph_mask,
								/obj/item/clothing/mask/hypo_mask)
				user.put_in_active_hand(masks)
				to_chat(user, "You pull a mask from the bin.")
			if("Shirts")
				var/shirts = pick(/obj/item/clothing/under/boiler,
								/obj/item/clothing/under/vest_slacks)
				new shirts(get_turf(user))
				to_chat(user, "You pull out an article of clothing.")
			if("Coats")
				var/coats = pick(/obj/item/clothing/suit/hooded/bandit_coat,
								/obj/item/clothing/suit/hooded/bandit_coat/brown)
				new coats(get_turf(user))
				to_chat(user, "You pull out an article of clothing.")
			if("Gloves")
				new /obj/item/food/scrap(get_turf(user))
				to_chat(user, "You pull out an article of clothing.")
			if("Shoes")
				new /obj/item/clothing/shoes/brown(get_turf(user))
				to_chat(user, "You pull out an article of clothing.")
	
	playsound(src, 'sound/effects/cloth_rustle1.ogg', 50, 0)
	..()

/obj/structure/laundry_bin/attackby(obj/item/O, mob/user, params) // Instead of burning the excess, just put it back
	if(istype(O, /obj/item/clothing/))
		to_chat(user, "You throw the article into the bin.")
		playsound(src, 'sound/effects/cloth_rustle1.ogg', 50, 0)
		qdel(O)
