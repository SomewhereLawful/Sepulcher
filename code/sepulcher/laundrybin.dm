/obj/structure/laundry_bin
	name = "laundry bin"
	desc = "Full of old rags and shoes. Cover your shame."
	density = TRUE
	anchored = TRUE
	icon_state = "laundrybin"
	
	var/list/masks = list(
					/obj/item/clothing/mask/ph_mask = 50,
					/obj/item/clothing/mask/hypo_mask = 50)

	var/list/shirts = list(
					/obj/item/clothing/under/boiler = 50,
					/obj/item/clothing/under/vest_slacks = 50)

	var/list/coats = list(
					/obj/item/clothing/suit/hooded/bandit_coat = 50,
					/obj/item/clothing/suit/hooded/bandit_coat/brown = 50)

	var/list/gloves = list(
					/obj/item/clothing/gloves/worker = 50,
					/obj/item/clothing/gloves/fingerless = 50)

/obj/structure/laundry_bin/attack_hand(mob/user)
	to_chat(user, "You dig through for something of passable quality.")
	var/choice = input(user, "Choose an article to search for", "Digging for clothes") as null|anything in list("Hats","Masks","Shirts","Coats","Gloves","Shoes",)
	playsound(src, 'sound/effects/cloth_rustle1.ogg', 50, 0)
	if(do_after(user, 14.4, target = src))
		switch(choice)
			if("Hats")
				new /obj/item/clothing/head/flatcap(get_turf(user))
				to_chat(user, "You grab some headwear from the bin.")
			if("Masks")
				var/mask_choice = pickweight(masks)
				var/obj/item/clothing/mask/M = new mask_choice
				user.put_in_active_hand(M)
				to_chat(user, "You pull a mask from the bin.")
			if("Shirts")
				var/shirt_choice = pickweight(shirts)
				var/obj/item/clothing/under/S = new shirt_choice
				user.put_in_active_hand(S)
				to_chat(user, "You pull out an article of clothing.")
			if("Coats")
				var/coat_choice = pickweight(coats)
				var/obj/item/clothing/suit/C = new coat_choice
				user.put_in_active_hand(C)
				to_chat(user, "You pull out an article of clothing.")
			if("Gloves")
				var/glove_choice = pickweight(gloves)
				var/obj/item/clothing/gloves/G = new glove_choice
				user.put_in_active_hand(G)
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
