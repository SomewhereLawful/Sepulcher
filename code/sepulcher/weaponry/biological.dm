// Biological weapons
// Ones that do Tox build up or otherwise are living.

/obj/item/melee/festering_hand
	name = "festering hand"
	desc = "Rotted degits, gushing with toxicity."
	icon_state = "fleshtostone"
	item_state = "pipe"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	damtype = TOXICITY
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("bashed", "wacked", "dented")
	hitsound = 'sound/weapons/pipehit.ogg'
