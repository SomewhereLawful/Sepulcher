/datum/job/city/safekeeper
	title = "Safekeeper"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	description = "You are rebuilt flesh of saints. Your duty is to the people; ascention and guidance are in your hands. Your word is law, your will manifest."
	forbids = "Your position is one of unique and singular importance. Ineptitude, indecision, and indulgence is unbecoming of your rank. Do not squander your duty and the people's trust."
	req_admin_notify = 1

	outfit = /datum/outfit/city/safekeeper

/datum/outfit/city/safekeeper
	name = "Safekeeper Standard"

	equip_race = /datum/species/safekeeper
	head = /obj/item/clothing/head/safekeeper
	//ears = /obj/item/radio/headset/heads/cmo - Will add headset/earpiece - will have direct comms with Kommandant
	uniform = /obj/item/clothing/under/safekeeper
	gloves = /obj/item/clothing/gloves/safekeeper
	shoes = /obj/item/clothing/shoes/black