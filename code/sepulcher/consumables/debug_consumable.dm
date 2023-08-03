/obj/item/consumable/debug
	name = "debug consumable"
	desc = "report if found - modifies stat by ten points"
	icon = 'icons/obj/drink.dmi'
	icon_state = "broken"

/obj/item/consumable/debug/health_up
	name = "healing consumable"
	health_points = -10

/obj/item/consumable/debug/health_down
	name = "hurting consumable"
	health_points = 10

/obj/item/consumable/debug/will_up
	name = "will giving consumable"
	will_points = -10

/obj/item/consumable/debug/will_down
	name = "will draining consumable"
	will_points = 10

/obj/item/consumable/debug/hunger_up
	name = "hunger sating consumable"
	feed_points = 10

/obj/item/consumable/debug/hunger_down
	name = "hunger draining consumable"
	feed_points = -10

/obj/item/consumable/debug/tox_up
	name = "toxic giving consumable"
	toxicity_points = 10

/obj/item/consumable/debug/tox_down
	name = "toxic draining consumable"
	toxicity_points = -10