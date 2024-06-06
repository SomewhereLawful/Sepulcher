
/obj/item/bodypart/l_leg
	name = "left leg"
	icon_state = "default_human_l_leg"
	attack_verb = list("kicked", "stomped")
	max_damage = 100
	body_zone = BODY_ZONE_L_LEG
	body_part = LEG_LEFT
	body_damage_coeff = 0.75
	px_x = -2
	px_y = 12

/obj/item/bodypart/l_leg/set_disabled(new_disabled = TRUE)
	..()
	if(disabled)
		to_chat(owner, "<span class='userdanger'>Your [name] is too damaged to function!</span>")
		owner.emote("scream")

/obj/item/bodypart/l_leg/digitigrade
	name = "left digitigrade leg"
	use_digitigrade = FULL_DIGITIGRADE

/obj/item/bodypart/l_leg/monkey
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "default_monkey_l_leg"
	animal_origin = MONKEY_BODYPART
	px_y = 4

/obj/item/bodypart/l_leg/alien
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "alien_l_leg"
	px_x = 0
	px_y = 0
	dismemberable = 0
	max_damage = 100
	animal_origin = ALIEN_BODYPART

/obj/item/bodypart/l_leg/devil
	dismemberable = 0
	max_damage = 5000
	animal_origin = DEVIL_BODYPART

/obj/item/bodypart/r_leg
	name = "right leg"
	icon_state = "default_human_r_leg"
	attack_verb = list("kicked", "stomped")
	max_damage = 50
	body_zone = BODY_ZONE_R_LEG
	body_part = LEG_RIGHT
	body_damage_coeff = 0.75
	px_x = 2
	px_y = 12

/obj/item/bodypart/r_leg/set_disabled(new_disabled = TRUE)
	..()
	if(disabled)
		to_chat(owner, "<span class='userdanger'>Your [name] is too damaged to function!</span>")
		owner.emote("scream")

/obj/item/bodypart/r_leg/digitigrade
	name = "right digitigrade leg"
	use_digitigrade = FULL_DIGITIGRADE

/obj/item/bodypart/r_leg/monkey
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "default_monkey_r_leg"
	animal_origin = MONKEY_BODYPART
	px_y = 4

/obj/item/bodypart/r_leg/alien
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "alien_r_leg"
	px_x = 0
	px_y = 0
	dismemberable = 0
	max_damage = 100
	animal_origin = ALIEN_BODYPART

/obj/item/bodypart/r_leg/devil
	dismemberable = 0
	max_damage = 5000
	animal_origin = DEVIL_BODYPART
