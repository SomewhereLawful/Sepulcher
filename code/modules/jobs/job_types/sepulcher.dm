// City Jobs //

/datum/job/city
	department_flag = VAULT
	forbids = "The city is a machine, you are a cog. Deserting your duties, commiting thoughtcrime, wanton violence, and anti-societal behavior shall be punished. Gravely."

/datum/job/city/kommandant
	title = "Kommandant"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	description = "You are rebuilt flesh of saints. Your duty is to the people; ascention and guidance are in your hands. Your word is law, your will manifest."
	forbids = "Your position is one of unique and singular importance. Ineptitude, indecision, and indulgence is unbecoming of your rank. Do not squander your duty and the people's trust."
	req_admin_notify = 1

	outfit = /datum/outfit/city/kommandant

/datum/outfit/city/kommandant
	name = "Kommandant"

	equip_race = /datum/species/kommandant
	head = /obj/item/clothing/head/kommandant
	//ears = /obj/item/radio/headset/heads/cmo - Will add headset/earpiece when I get loudspeakers added.
	mask = /obj/item/clothing/mask/gas/kommandant
	uniform = /obj/item/clothing/under/kommandant
	suit = /obj/item/clothing/suit/armor/kommandant
	gloves = /obj/item/clothing/gloves/kommandant
	shoes = /obj/item/clothing/shoes/kommandant

/datum/job/city/bougie
	title = "Bourgeoisie"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	description = "You have ascended beyond the peon proletariat. Your job is to sell those below you products they make and secure contracts for due export."

	outfit = /datum/outfit/city/bougie

/datum/outfit/city/bougie
	name = "Bourgeoisie"

	uniform = /obj/item/clothing/under/vest_slacks
	shoes = /obj/item/clothing/shoes/brown

/datum/job/city/cleanser
	title = "Cleanser"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	selection_color = "#ddffdd"
	description = "You are the city's internal safekeepers, the hands of the Kommandant. You offer medical treatments to the citizenry such as parasite removal."

	outfit = /datum/outfit/city/cleanser

/datum/outfit/city/cleanser
	name = "Cleanser"

	equip_race = /datum/species/proletariat
	head = /obj/item/clothing/head/cleanser/sealed
	mask = /obj/item/clothing/mask/gp5/sealed
	suit = /obj/item/clothing/suit/cleansercoat
	uniform = /obj/item/clothing/under/cleanser/sealed
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/cleanser/sealed

/datum/job/city/prole
	title = "Proletariat"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	description = "You are of the rank and file. From the sweaty foundry to the dirty chapel grounds, your work encompasses all corners of the city."

	outfit = /datum/outfit/city/prole

/datum/outfit/city/prole
	name = "Proletariat"

	equip_race = /datum/species/proletariat
	uniform = /obj/item/clothing/under/boiler
	shoes = /obj/item/clothing/shoes/brown

/datum/job/city/bioslave
	title = "Bioslave"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	description = "You are at the very bottom of the city's hierarchy and suited best for chattel labor. Proletariat will use you to cart shit or pull scrap from heaps, as your life is cheap. Perhaps they may impart some experience upon you."

	outfit = /datum/outfit/city/bioslave

/datum/outfit/city/bioslave
	name = "Bioslave"

	equip_race = /datum/species/bioslave
	uniform = /obj/item/clothing/under/pants/bioslave_rags

/datum/job/city/vagrant
	title = "Vagrant"
	faction = "City"
	total_positions = -1
	spawn_positions = -1
	selection_color = "#42401b"
	description = "Blithering and stricken, you live from the blurred edges of this dying dream. Your home is gone, if it ever was at all. The horizon screams with the sounds of metal and work."
	forbids = "You are unbound to any civil codes. Act freely, die quickly."

	outfit = /datum/outfit/city/vagrant

/datum/outfit/city/vagrant
	name = "Vagrant"

	equip_race = /datum/species/vagrant
	uniform = /obj/item/clothing/under/boiler
	shoes = /obj/item/clothing/shoes/brown
