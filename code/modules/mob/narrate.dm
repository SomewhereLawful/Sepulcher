// Narrate Verb
/mob/verb/narrate_area(mob/user)
	set name = "Inspect Location"
	set category = "IC"
	set desc = "Gain small insight of your location."
	var/area/N = get_area(user)

	if(!N.narrate)
		to_chat(user, "<span class='magenta'>This place is unremarkable.</span>")
	else
		to_chat(user, "<span class='magenta'>[N.narrate]</span>")
