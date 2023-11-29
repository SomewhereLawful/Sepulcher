/obj/structure/laundry_bin
	name = "laundry bin"
	desc = "Full of old rags and shoes. Cover your shame."
	density = TRUE
	anchored = TRUE
	icon_state = "laundrybin"
		
	var/list/hats = list(
					/obj/item/clothing/head/flatcap = 100)

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

	var/list/shoes = list(
					/obj/item/clothing/shoes/brown = 50,
					/obj/item/clothing/shoes/black = 50)

/obj/structure/laundry_bin/attack_hand(mob/user)
	var/choice = input(user, "Choose an article to search for", "Digging for clothes") as null|anything in list("Hats","Masks","Shirts","Coats","Gloves","Shoes",)
	if(do_after(user, 14.4, target = src))
		switch(choice)
			if("Hats")
				grabClothing(user, pickweight(hats), "/obj/item/clothing/head/flatcap", "a hat")
			if("Masks")
				grabClothing(user, pickweight(masks), "/obj/item/clothing/mask/M", "a mask")
			if("Shirts")
				grabClothing(user, pickweight(shirts), "/obj/item/clothing/under/S", "an article of clothing")
			if("Coats")
				grabClothing(user, pickweight(coats), "/obj/item/clothing/suit/C", "a coat")
			if("Gloves")
				grabClothing(user, pickweight(gloves), "/obj/item/clothing/gloves/G", "a pair of gloves")
			if("Shoes")
				grabClothing(user, pickweight(shoes), "/obj/item/clothing/shoes/F", "a pair of shoes")
	
	playsound(src, 'sound/effects/cloth_rustle1.ogg', 50, 0)
	..()

/obj/structure/laundry_bin/attackby(obj/item/O, mob/user, params) // Instead of burning the excess, just put it back
	if(istype(O, /obj/item/clothing/))
		to_chat(user, "You throw the article into the bin.")
		playsound(src, 'sound/effects/cloth_rustle1.ogg', 50, 0)
		qdel(O)

/obj/structure/laundry_bin/proc/grabClothing(mob/user, clothingType, itemType, message)
    var/obj/item/clothing/C = new clothingType
    user.put_in_active_hand(C)
    to_chat(user, "You pull out [message] from the bin.")