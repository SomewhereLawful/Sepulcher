// Melee weapons //

/obj/item/melee/pipe
	name = "metal pipe"
	desc = "Let the blood drain."
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
	icon_state = "machete"
	item_state = "machete"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("chopped", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'
	sharpness = IS_SHARP

/obj/item/melee/knife
	name = "combat knife"
	desc = "Once used by agents of a gone empire - now for cutting bread and meat."
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
	sharpness = IS_SHARP

/obj/item/melee/harpoon
	name = "harpoon"
	desc = "Once used to hunt massive beasts in the depths."
	icon_state = "harpoon"
	item_state = "harpoon"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("stabbed", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'

/obj/item/melee/whale_hook
	name = "polehook"
	desc = "A bizzare tool of no origin."
	icon_state = "harpoon"
	item_state = "harpoon"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("stabbed", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'

/obj/item/melee/baton
	name = "baton"
	desc = "Indispensible tool of correction for Bioslaves."
	icon_state = "baton"
	item_state = "baton"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("bludgeoned", "whacked", "knocked")
	hitsound = 'sound/weapons/machetehit.ogg'

/obj/item/melee/axe
	name = "axe"
	icon_state = "axe"
	item_state = "axe"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("stabbed", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'