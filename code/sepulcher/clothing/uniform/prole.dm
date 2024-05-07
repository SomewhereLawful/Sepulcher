// Proletariat Uniforms //

/obj/item/clothing/under/boiler
	name = "boiler suit"
	icon_state = "navy"
	item_state = "bl_suit"
	item_color = "navy"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	equip_sound = 'sound/items/equip/jumpsuit_equip.ogg'

/obj/item/clothing/under/coveralls
	name = "coveralls"
	icon_state = "coveralls"
	item_state = "coveralls"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/nightwear
	name = "nightwear"
	icon_state = "nightwear"
	item_state = "nightwear"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/bum
	name = "bum clothes"
	desc = "Embarrass the dirt you stupor on."
	icon_state = "bum"
	item_state = "bum"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	can_adjust = FALSE

/obj/item/clothing/under/slacks
	name = "slacks"
	desc = "Soft and thin nightwear. Stained."
	icon_state = "pants_brown"
	item_state = "pants_brown"
	body_parts_covered = GROIN|LEGS
	can_adjust = FALSE
	dir = 2

// This code block is my method of randomizing sprites for the dropped item
// Maybe something cool can be expanded upon it
/obj/item/clothing/under/slacks/equipped(mob/user, slot)
	..()
	dir = user.dir

/obj/item/clothing/under/slacks/dropped(mob/user)
	..()
	if(dir != 8)
		dir = rand(1,7)