// Melee weapons //

/obj/item/melee/pipe
	name = "metal pipe"
	desc = "Let the blood drain."
	icon = 'icons/obj/weapons/melee.dmi'
	icon_state = "pipe"
	item_state = "pipe"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("bashed", "wacked", "dented")
	hitsound = 'sound/weapons/pipehit.ogg'

/obj/item/melee/machete
	name = "chopper"
	desc = "Cleaves flesh, cuts rope."
	icon = 'icons/obj/weapons/melee.dmi'
	icon_state = "machete"
	item_state = "machete"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("chopped", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'

/obj/item/melee/knife
	name = "combat knife"
	desc = "Once used by agents of a gone empire - now for cutting bread and meat."
	icon = 'icons/obj/weapons/melee.dmi'
	icon_state = "knife"
	item_state = "knife"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	slot_flags = ITEM_SLOT_BELT
	throwforce = 7
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("stabbed", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'
