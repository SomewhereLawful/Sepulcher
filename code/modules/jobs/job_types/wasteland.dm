/datum/job/wasteland
	department_flag = WASTELAND

/*
Wastelander
*/

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = "Wastelander"
	total_positions = -1
	spawn_positions = -1
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13wastelander

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = pick(
		/obj/item/claymore/machete/pipe, \
		/obj/item/claymore/machete/golf, \
		/obj/item/switchblade, \
		/obj/item/kitchen/knife)
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/kit, \
		/obj/item/clothing/suit/f13/veteran, \
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer, \
		/obj/item/clothing/suit/armor/f13/leatherarmor)
	l_pocket = 	/obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	belt = 	/obj/item/kitchen/knife/combat/survival
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/reagent_containers/pill/radx=1, \
		/obj/item/storage/bag/money/small/wastelander)
	suit_store = pick(
	/obj/item/gun/ballistic/revolver/detective, \
	/obj/item/gun/ballistic/shotgun/remington, \
	/obj/item/gun/ballistic/revolver/zipgun, \
	/obj/item/gun/ballistic/revolver/pipe_rifle)

/*
Punished Raider
*/

/*
/datum/job/wasteland/f13punraider
	title = "Punished Raider"
	flag = F13PUNRAIDER
	department_head = list("Captain")
	head_announce = list("Security")
	req_admin_notify = 1
//	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "no one"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/wasteland/f13punraider

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13punraider
	name = "Punished Raider"
	jobtype = /datum/job/wasteland/f13punraider

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/wasteland/f13punraider/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/kilt/highlander, \
		/obj/item/clothing/under/sexymime, \
		/obj/item/clothing/under/sundress, \
		/obj/item/clothing/under/schoolgirl, \
		/obj/item/clothing/under/rank/clown, \
		null)
	suit = pick(
		/obj/item/clothing/suit/whitedress, \
		/obj/item/clothing/suit/poncho/ponchoshame, \
		/obj/item/clothing/suit/chickensuit, \
		/obj/item/clothing/suit/straight_jacket, \
		null)
	head = pick(
		/obj/item/clothing/head/sombrero/shamebrero, \
		/obj/item/clothing/head/papersack, \
		/obj/item/clothing/head/chicken,\
		/obj/item/clothing/head/santa,\
		/obj/item/clothing/head/festive,\
		/obj/item/clothing/head/canada,\
		/obj/item/clothing/head/bandana,\
		/obj/item/clothing/head/collectable,\
		/obj/item/clothing/head/rice_hat,\
		/obj/item/clothing/head/jester,\
		/obj/item/clothing/head/cone,\
		/obj/item/clothing/head/hooded/carp_hood,\
		/obj/item/clothing/head/fedora,\
		/obj/item/clothing/head/lobsterhat,\
		null)
	mask = pick(
		/obj/item/clothing/mask/joy,\
		/obj/item/clothing/mask/spig,\
		/obj/item/clothing/mask/joy/joyful,\
		/obj/item/clothing/mask/cowmask,\
		/obj/item/clothing/mask/frog/cursed,\
		/obj/item/clothing/mask/horsehead,\
		null)
	r_pocket = pick(
		/obj/item/organ/appendix, \
		/obj/item/reagent_containers/food/snacks/grown/potato,\
		null)
	shoes = pick(
		/obj/item/clothing/shoes/clown_shoes,\
		null)
	backpack_contents = pick(
		/obj/item/restraints/handcuffs, \
		/obj/item/gun/ballistic/revolver/russian, \
		/obj/item/reagent_containers/food/snacks/grown/banana)
	belt  = /obj/item/claymore/machete/pipe

*/

/*
Trader
*/

/*
/datum/job/wasteland/f13traider
	title = "Traider"
	flag = F13TRAIDER
	department_head = list("Captain")
	department_flag = WASTELAND
	head_announce = list("Security")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "no one"
	selection_color = "#ffdddd"

	outfit = /datum/outfit/job/wasteland/f13traider

	access = list()
	minimal_access = list()

/datum/outfit/job/wasteland/f13traider
	name = "Traider"
	jobtype = /datum/job/wasteland/f13traider

	id = /obj/item/card/id/gold
	uniform =  /obj/item/clothing/under/rank/captain

*/
