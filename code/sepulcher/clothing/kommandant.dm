/obj/item/clothing/head/kommandant
	name = "faded furazhka"
	desc = "Authority avatar, set upon your head and secured with steel thread."
	icon_state = "kommandant"
	item_state = "kommandant"
	armor = list(melee = 10, bullet = 16, laser = 0, energy = 0, bomb = 25, bio = 0, rad = 0)
	dynamic_hair_suffix = ""
	item_flags = NODROP

/obj/item/clothing/mask/gas/kommandant
	name = "steel-stitched respirator"
	desc = "Mask that conceals the raw flesh, a rubber second-skin."
	icon_state = "gas_komm"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS
	item_flags = NODROP
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACIALHAIR
	w_class = WEIGHT_CLASS_NORMAL
	item_state = "gas_komm"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = NONE

/obj/item/clothing/under/kommandant
	name = "relic telnyashka"
	desc = "If bones could retain memory, perhaps they'd remind you where this shirt has come from."
	icon_state = "kommandant"
	item_color = "kommandant"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 0, rad = 0, fire = 0, acid = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE
	resistance_flags = NONE
	has_sensor = NO_SENSORS
	item_flags = NODROP

/obj/item/clothing/suit/armor/kommandant
	name = "leather trenchcoat"
	desc = "Heavy and durable."
	icon_state = "leathercoat-sec"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/gloves/kommandant
	name = "leather gloves"
	desc = "Second skin."
	icon_state = "legion"
	item_state = "legion"
	item_color = null	//So they don't wash.
	transfer_prints = TRUE
	strip_delay = 40
	equip_delay_other = 20
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	item_flags = NODROP

/obj/item/clothing/shoes/kommandant
	name = "sapogi"
	desc = "Pair of long worn marching boots."
	icon_state = "jackboots"
	item_state = "jackboots"
	lefthand_file = 'icons/mob/inhands/equipment/security_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/security_righthand.dmi'
	item_color = "hosred"
	strip_delay = 50
	equip_delay_other = 50
	resistance_flags = NONE
	permeability_coefficient = 0.05 //Thick soles, and covers the ankle
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes
	item_flags = NODROP
