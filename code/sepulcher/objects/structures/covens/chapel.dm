/obj/structure/coven_object/chapel_font
	name = "cleansing font"
	desc = "Basin of untainted water, unknown in origin."
	icon_state = "church_font"

	coven_title = "Cleanse your spirit..."
	coven_msg = "Splash your face with the pure water?"
	coven_initiate_msg = "You splash the water on your face..."

/obj/structure/coven_object/chapel_font/examine(mob/user)
	..()
	to_chat(user, "<span class='cyan'>Here you might rebuke the influence of natural machination, though such jealous intelligence will most certainly take their pound of flesh.</span>")

/obj/structure/coven_object/chapel_phylactery
	name = "city phylactery"
	desc = "Sealed container of texts. The city-faithful hold it in high importance."
	icon_state = "phylactery"

	coven_title = "The City-Mind Faithful..."
	coven_msg = "Touch the welds?"
	coven_initiate_msg = "Let the security of the city envelope you. The natural intelligences can rot with their outside world."

/obj/structure/coven_object/chapel_phylactery/examine(mob/user)
	..()
	to_chat(user, "<span class='cyan'>Touch the welds, the security of the city. Pledge your faith to the city-mind, if you have not already turned to true apostacy.</span>")
