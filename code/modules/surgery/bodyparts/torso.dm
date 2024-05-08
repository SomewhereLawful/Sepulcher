
/obj/item/bodypart/chest
	name = BODY_ZONE_CHEST
	icon_state = "default_human_chest"
	max_damage = 100
	body_zone = BODY_ZONE_CHEST
	body_part = CHEST
	px_x = 0
	px_y = 0
	var/obj/item/cavity_item

/obj/item/bodypart/chest/Destroy()
	if(cavity_item)
		qdel(cavity_item)
	return ..()

/obj/item/bodypart/chest/drop_organs(mob/user)
	if(cavity_item)
		cavity_item.forceMove(user.loc)
		cavity_item = null
	..()

/obj/item/bodypart/chest/monkey
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "default_monkey_chest"
	animal_origin = MONKEY_BODYPART

/obj/item/bodypart/chest/alien
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "alien_chest"
	dismemberable = 0
	max_damage = 500
	animal_origin = ALIEN_BODYPART

/obj/item/bodypart/chest/devil
	dismemberable = 0
	max_damage = 5000
	animal_origin = DEVIL_BODYPART

/obj/item/bodypart/chest/larva
	icon = 'icons/mob/animal_parts.dmi'
	icon_state = "larva_chest"
	dismemberable = 0
	max_damage = 50
	animal_origin = LARVA_BODYPART
