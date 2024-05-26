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
	icon_state = "machete"
	item_state = "machete"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	damtype = SLASH
	force = 15
	throwforce = 3
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("chopped", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'
	sharpness = IS_SHARP

/obj/item/melee/knife
	name = "combat knife"
	icon_state = "knife"
	item_state = "knife"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	damtype = SLASH
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

/obj/item/twohanded/melee/whale_hook
	name = "polehook"
	desc = "A bizzare tool of no origin."
	icon = 'icons/obj/weapons/melee.dmi'
	icon_state = "whale_hook0"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("stabbed", "jabbed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'

/obj/item/twohanded/melee/whale_hook/update_icon()
	icon_state = "whale_hook[wielded]"

/obj/item/melee/baton
	name = "baton"
	desc = "Indispensible tool of correction."
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

/obj/item/melee/shovel
	name = "shovel"
	icon_state = "shovel"
	item_state = "shovel"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	damtype = SLASH
	force = 15
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("stabbed", "slashed", "sliced")
	hitsound = 'sound/weapons/machetehit.ogg'