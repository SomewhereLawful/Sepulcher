/obj/structure/lore_altar
	name = "altar of knowledge"
	desc = "Knowledge transends death."
	density = TRUE
	anchored = TRUE
	icon_state = "lore_altar"
	var/altar_content = null

/obj/structure/lore_altar/attack_hand(mob/user)
	if(altar_content)
		user << browse("[altar_content]", "window=changes")
		playsound(src, 'sound/effects/page_flip.ogg', 50, 0)
	else
		to_chat(user, "<span class='red'>The book is blank.</span>")

/obj/structure/lore_altar/church
	icon_state = "altar_church"
	altar_content = "<center>Hateful glare of machinations like vultures.<br>Dragged from aetherium into rotten bodies.<br>Dying dream, dead world.<br>Sepulcher for our sins.<br><br>We hail our Kommandant, saintly flesh.<br>Decider of tithes and ascension.<br>Cleansers expulse parasites and purify our wounds.<br>Through enkoimesis, the mind is renewed.<br>Bourgeoisie control commerce, divining import.<br>Oversee shops and supply.<br>Proletariat inhabit each city-recess, like blood.<br>From harbor to foundry.</center>"
