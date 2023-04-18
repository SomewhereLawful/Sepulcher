//////////////////////////
//////////Flags//////////
/////////////////////////

/obj/item/flag
	name = "empty flag"
	desc = "you could put some leather there."
	density = 1
	anchored = 1
	w_class = 4

	layer = 4.1
	icon = 'icons/obj/flags.dmi'
	icon_state = "emptyflag"
	item_state = "emptyflag"
	var/faction = null

/obj/item/flag/ncr
	name = "NCR flag"
	desc = "A flag with a two headed bear, the symbol of the New California Republic."
	icon_state = "ncrflag"
	item_state = "ncrflag"
	faction = "NCR"

/obj/item/flag/legion
	name = "Legion flag"
	desc = " A flag with a golden bull, the symbol of Ceasar's Legion."
	icon_state = "legionflag"
	item_state = "legionflag"
	faction = "Legion"

/obj/item/flag/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/sheet/leather) && item_state == "emptyflag")
		visible_message("<span class='notice'>[user] begins to make a flag.</span>")
		if(do_after(user, 60, target = src))
			var/obj/item/stack/sheet/leather/H = I
			if(H.use(1))
				var/flag = alert(user, "Please choose which faction flag you wish to create.", "Flag type", "NCR", "Legion")
				switch(flag)
					if("NCR")
						name = "NCR flag"
						desc = "A flag with a two headed bear, the symbol of the New California Republic."
						icon_state = "ncrflag"
						item_state = "ncrflag"
						faction = "NCR"
					if("Legion")
						name = "Legion flag"
						desc = " A flag with a golden bull, the symbol of Ceasar's Legion."
						icon_state = "legionflag"
						item_state = "legionflag"
						faction = "Legion"
				update_icon()
	else
		attack_hand(user)

/obj/item/flag/attack_hand(mob/user)
	if(item_state != "emptyflag")
		visible_message("<span class='notice'>[user] begins to remove a flag.</span>")
		if(do_after(user, 30, target = src))
			new /obj/item/stack/sheet/leather(loc)
			name = "empty flag"
			icon_state = "emptyflag"
			item_state = "emptyflag"
			faction = null
			update_icon()
	else
		anchored = 0
		..()

/obj/item/flag/dropped(mob/user)
	..()
	anchored = 1

/obj/item/flag/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first)
	dropped(thrower)
////////Viper stuff////// subject to change, but this way was simple
/obj/item/viper_venom
	name = "Viper venom"
	desc = "A container of special Mojave viper venom, prepared by a skilled Viper shaman." //only used for viper spear recipe
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle7"
	throwforce = 2
	throw_speed = 2
	throw_range = 3
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("bashed")
