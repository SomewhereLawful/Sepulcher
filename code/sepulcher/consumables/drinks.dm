/obj/item/consumable/food/drink
	name = "broken fluid"
	desc = "fluid broken"
	icon = 'icons/obj/drink.dmi'
	icon_state = "broken"

	use_sound = 'sound/items/drink_bottle.ogg'
	uses_verb = "drinks"
	use_verb = "drink"

/obj/item/consumable/food/drink/firewater
	name = "fire water"
	desc = "Galvanizes your spirit, brines your organs."
	icon_state = "firewater"
	feed_points = 2
	will_points = -20
	drunk_points = 20

/obj/item/consumable/food/drink/rotgut
	name = "rotgut"
	desc = "Sickening, disorienting, dissociating."
	icon_state = "rotgut"
	feed_points = -4
	toxicity_points = 15
	will_points = -30
	drunk_points = 40

/obj/item/consumable/food/drink/redeye
	name = "red eye"
	desc = "Neurotoxin, o' burst vessels."
	icon_state = "redeye"
	feed_points = 3
	toxicity_points = 20
	will_points = -30
	drunk_points = 50

/obj/item/consumable/food/drink/moleworm
	name = "wormshine"
	desc = "Fermented ground vermin."
	feed_points = 3
	toxicity_points = 10
	will_points = -30
	drunk_points = 40