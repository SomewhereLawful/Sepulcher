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
