// Coven objects - used for giving coven traits //
/obj/structure/coven_object
	name = "coven base object"
	icon = 'icons/obj/coven.dmi'
	density = TRUE

	var/coven_title
	var/coven_msg
	var/coven_initiate_msg

/obj/structure/coven_object/attack_hand(mob/user)
	var/choice = alert("[coven_msg]", "[coven_title]", "Yes", "No")
	if(choice != "Yes")
		return
	to_chat(user, "<span class='cyan'>[coven_initiate_msg]</span>")