//DON'T FORGET TO CHANGE THE REFILL SIZE IF YOU CHANGE THE MACHINE'S CONTENTS!
/obj/machinery/vending/clothing
	name = "ClothesMate" //renamed to make the slogan rhyme
	desc = "A vending machine for clothing."
	icon_state = "clothes"
	icon_deny = "clothes-deny"
	product_slogans = "Dress for success!;Prepare to look swagalicious!;Look at all this free swag!;Why leave style up to fate? Use the ClothesMate!"
	vend_reply = "Thank you for using the ClothesMate!"
	products = list(/obj/item/clothing/head/that = 2,
		            /obj/item/clothing/head/fedora = 1,
		            /obj/item/clothing/glasses/monocle = 1,
		            /obj/item/clothing/suit/hooded/wintercoat/blue = 1,
		            /obj/item/clothing/suit/jacket = 2,
		            /obj/item/clothing/suit/jacket/puffer/vest = 2,
		            /obj/item/clothing/suit/jacket/puffer = 2,
		            /obj/item/clothing/under/suit_jacket/navy = 1,
		            /obj/item/clothing/under/suit_jacket/really_black = 1,
		            /obj/item/clothing/under/suit_jacket/burgundy = 1,
		            /obj/item/clothing/under/suit_jacket/charcoal = 1,
		            /obj/item/clothing/under/suit_jacket/white = 1,
		            /obj/item/clothing/under/kilt = 1,
		            /obj/item/clothing/under/overalls = 1,
		            /obj/item/clothing/under/sl_suit = 1,
		            /obj/item/clothing/under/pants/jeans = 3,
		            /obj/item/clothing/under/pants/classicjeans = 2,
		            /obj/item/clothing/under/pants/camo = 1,
		            /obj/item/clothing/under/pants/blackjeans = 2,
		            /obj/item/clothing/under/pants/khaki = 2,
		            /obj/item/clothing/under/pants/white = 2,
		            /obj/item/clothing/under/pants/red = 1,
		            /obj/item/clothing/under/pants/black = 2,
		            /obj/item/clothing/under/pants/tan = 2,
		            /obj/item/clothing/under/pants/track = 1,
		            /obj/item/clothing/suit/jacket/miljacket = 1,
		            /obj/item/clothing/neck/tie/blue = 1,
		            /obj/item/clothing/neck/tie/red = 1,
		            /obj/item/clothing/neck/tie/black = 1,
		            /obj/item/clothing/neck/tie/horrible = 1,
		            /obj/item/clothing/neck/scarf/pink = 1,
		            /obj/item/clothing/neck/scarf/red = 1,
		            /obj/item/clothing/neck/scarf/green = 1,
		            /obj/item/clothing/neck/scarf/darkblue = 1,
		            /obj/item/clothing/neck/scarf/purple = 1,
		            /obj/item/clothing/neck/scarf/yellow = 1,
		            /obj/item/clothing/neck/scarf/orange = 1,
		            /obj/item/clothing/neck/scarf/cyan = 1,
		            /obj/item/clothing/neck/scarf = 1,
		            /obj/item/clothing/neck/scarf/black = 1,
		            /obj/item/clothing/neck/scarf/zebra = 1,
		            /obj/item/clothing/neck/scarf/christmas = 1,
		            /obj/item/clothing/neck/stripedredscarf = 1,
		            /obj/item/clothing/neck/stripedbluescarf = 1,
		            /obj/item/clothing/neck/stripedgreenscarf = 1,
		            /obj/item/clothing/accessory/waistcoat = 1,
		            /obj/item/clothing/under/skirt/black = 1,
		            /obj/item/clothing/under/skirt/blue = 1,
		            /obj/item/clothing/under/skirt/red = 1,
		            /obj/item/clothing/under/skirt/purple = 1,
		            /obj/item/clothing/under/sundress = 2,
		            /obj/item/clothing/under/stripeddress = 1,
		            /obj/item/clothing/under/sailordress = 1,
		            /obj/item/clothing/under/redeveninggown = 1,
		            /obj/item/clothing/under/blacktango = 1,
		            /obj/item/clothing/under/plaid_skirt = 1,
		            /obj/item/clothing/under/plaid_skirt/blue = 1,
		            /obj/item/clothing/under/plaid_skirt/purple = 1,
		            /obj/item/clothing/under/plaid_skirt/green = 1,
		            /obj/item/clothing/glasses/regular = 1,
		            /obj/item/clothing/glasses/regular/jamjar = 1,
		            /obj/item/clothing/head/sombrero = 1,
		            /obj/item/clothing/suit/poncho = 1,
		            /obj/item/clothing/suit/ianshirt = 1,
		            /obj/item/clothing/shoes/laceup = 2,
		            /obj/item/clothing/shoes/sneakers/black = 2,
		            /obj/item/clothing/shoes/sandal = 1,
		            /obj/item/clothing/gloves/fingerless = 2,
		            /obj/item/clothing/glasses/orange = 1,
		            /obj/item/clothing/glasses/red = 1,
		            /obj/item/storage/belt/fannypack = 1,
		            /obj/item/storage/belt/fannypack/blue = 1,
		            /obj/item/storage/belt/fannypack/red = 1,
		            /obj/item/clothing/suit/jacket/letterman = 2,
		            /obj/item/clothing/head/beanie = 1,
		            /obj/item/clothing/head/beanie/black = 1,
		            /obj/item/clothing/head/beanie/red = 1,
		            /obj/item/clothing/head/beanie/green = 1,
		            /obj/item/clothing/head/beanie/darkblue = 1,
		            /obj/item/clothing/head/beanie/purple = 1,
		            /obj/item/clothing/head/beanie/yellow = 1,
		            /obj/item/clothing/head/beanie/orange = 1,
		            /obj/item/clothing/head/beanie/cyan = 1,
		            /obj/item/clothing/head/beanie/christmas = 1,
		            /obj/item/clothing/head/beanie/striped = 1,
		            /obj/item/clothing/head/beanie/stripedred = 1,
		            /obj/item/clothing/head/beanie/stripedblue = 1,
		            /obj/item/clothing/head/beanie/stripedgreen = 1,
		            /obj/item/clothing/suit/jacket/letterman_red = 1,
		            /obj/item/clothing/ears/headphones = 10,
		            /obj/item/clothing/suit/apron/purple_bartender = 2,
		            /obj/item/clothing/under/rank/bartender/purple = 2)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool = 1,
		              /obj/item/clothing/mask/balaclava = 1,
		              /obj/item/clothing/head/ushanka = 1,
		              /obj/item/clothing/under/soviet = 1,
		              /obj/item/storage/belt/fannypack/black = 2,
		              /obj/item/clothing/suit/jacket/letterman_syndie = 1,
		              /obj/item/clothing/under/jabroni = 1,
		              /obj/item/clothing/suit/vapeshirt = 1,
		              /obj/item/clothing/under/geisha = 1)
	premium = list(/obj/item/clothing/under/suit_jacket/checkered = 1,
		           /obj/item/clothing/head/mailman = 1,
		           /obj/item/clothing/under/rank/mailman = 1,
		           /obj/item/clothing/suit/jacket/leather = 1,
		           /obj/item/clothing/suit/jacket/leather/overcoat = 1,
		           /obj/item/clothing/under/pants/mustangjeans = 1,
		           /obj/item/clothing/neck/necklace/dope = 3,
		           /obj/item/clothing/suit/jacket/letterman_nanotrasen = 1)
	refill_canister = /obj/item/vending_refill/clothing

/obj/item/vending_refill/clothing
	machine_name = "ClothesMate"
	icon_state = "refill_clothes"
	charges = list(38, 4, 4)// of 112 standard, 12 contraband, 10 premium(?)
	init_charges = list(38, 4, 4)

/obj/item/vending_refill/clothing/bos
	machine_name = "Civilian ClothesMate"
	icon_state = "refill_clothes"
	charges = list(38, 4, 4)// of 112 standard, 12 contraband, 10 premium(?)
	init_charges = list(40, 112, 5)

/obj/machinery/vending/clothing/bos
	name = "Civilian ClothesMate"
	desc = "A vending machine for civilian and waster disguises."
	products = list(/obj/item/clothing/suit/poncho = 5,
					/obj/item/clothing/under/f13/brahminf = 2,
					/obj/item/clothing/under/f13/brahminm = 2,
					/obj/item/clothing/under/f13/caravaneer = 2,
					/obj/item/clothing/under/f13/cowboyb = 2,
					/obj/item/clothing/under/f13/cowboyg = 2,
					/obj/item/clothing/under/f13/lumberjack = 2,
					/obj/item/clothing/under/f13/machinist = 2,
					/obj/item/clothing/under/f13/roving = 2,
					/obj/item/clothing/under/f13/settler = 2,
					/obj/item/clothing/shoes/sneakers/black = 5)
	contraband = list(/obj/item/clothing/under/syndicate/tacticool = 1)
	
	premium = list(/obj/item/clothing/under/suit_jacket/checkered = 1,
		            /obj/item/clothing/head/mailman = 1,
		            /obj/item/clothing/under/rank/mailman = 1,
		            /obj/item/clothing/suit/jacket/leather = 1,
		            /obj/item/clothing/suit/jacket/leather/overcoat = 1)
