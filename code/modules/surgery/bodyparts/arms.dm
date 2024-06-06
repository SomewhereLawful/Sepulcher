
/obj/item/bodypart/l_arm
	name = "left arm"
	icon_state = "default_human_l_arm"
	attack_verb = list("slapped", "punched")
	max_damage = 100
	body_zone =BODY_ZONE_L_ARM
	body_part = ARM_LEFT
	aux_zone = BODY_ZONE_PRECISE_L_HAND
	aux_layer = HANDS_PART_LAYER
	body_damage_coeff = 0.75
	held_index = 1
	px_x = -6
	px_y = 0

/obj/item/bodypart/l_arm/set_disabled(new_disabled = TRUE)
	..()
	if(disabled)
		to_chat(owner, "<span class='userdanger'>Your [name] is too damaged to function!</span>")
		owner.emote("scream")
		if(held_index)
			owner.dropItemToGround(owner.get_item_for_held_index(held_index))
	if(owner.hud_used)
		var/obj/screen/inventory/hand/L = owner.hud_used.hand_slots["[held_index]"]
		if(L)
			L.update_icon()

/obj/item/bodypart/l_arm/monkey
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "default_monkey_l_arm"
	animal_origin = MONKEY_BODYPART
	px_x = -5
	px_y = -3

/obj/item/bodypart/l_arm/alien
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "alien_l_arm"
	px_x = 0
	px_y = 0
	dismemberable = 0
	max_damage = 100
	animal_origin = ALIEN_BODYPART

/obj/item/bodypart/l_arm/devil
	dismemberable = 0
	max_damage = 5000
	animal_origin = DEVIL_BODYPART

/obj/item/bodypart/r_arm
	name = "right arm"
	icon_state = "default_human_r_arm"
	attack_verb = list("slapped", "punched")
	max_damage = 100
	body_zone = BODY_ZONE_R_ARM
	body_part = ARM_RIGHT
	aux_zone = BODY_ZONE_PRECISE_R_HAND
	aux_layer = HANDS_PART_LAYER
	body_damage_coeff = 0.75
	held_index = 2
	px_x = 6
	px_y = 0

/obj/item/bodypart/r_arm/set_disabled(new_disabled = TRUE)
	..()
	if(disabled)
		to_chat(owner, "<span class='userdanger'>Your [name] is too damaged to function!</span>")
		owner.emote("scream")
		if(held_index)
			owner.dropItemToGround(owner.get_item_for_held_index(held_index))
	if(owner.hud_used)
		var/obj/screen/inventory/hand/R = owner.hud_used.hand_slots["[held_index]"]
		if(R)
			R.update_icon()

/obj/item/bodypart/r_arm/monkey
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "default_monkey_r_arm"
	animal_origin = MONKEY_BODYPART
	px_x = 5
	px_y = -3

/obj/item/bodypart/r_arm/alien
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "alien_r_arm"
	px_x = 0
	px_y = 0
	dismemberable = 0
	max_damage = 100
	animal_origin = ALIEN_BODYPART

/obj/item/bodypart/r_arm/devil
	dismemberable = 0
	max_damage = 5000
	animal_origin = DEVIL_BODYPART
