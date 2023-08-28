// Foundry //
/obj/structure/foundry
	name = "foundry machine"
	desc = "A machine of spectral machination."
	icon = 'icons/obj/foundry.dmi'
	density = TRUE
	anchored = TRUE

	/// Has item within it?
	var/occupied = FALSE
	var/failure_message = "You fail to operate the machine. You die."
	var/obj/item/occupying_item = null
	var/obj/item/output_item = null


/obj/structure/foundry/examine(mob/user)
	..()
	if(occupied == TRUE)
		to_chat(user, "<span class='red'>There is an [occupying_item] within.</span>")
