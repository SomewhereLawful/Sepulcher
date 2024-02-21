/obj/structure/coven_object/chapel_font
	name = "cleansing font"
	desc = "Basin of untainted water, unknown in origin."
	icon_state = "church_font"
	density = FALSE

/obj/structure/coven_object/chapel_font/examine(mob/user)
	..()
	to_chat(user, "<span class='cyan'>Here you might rebuke the influence of natural machination, though such jealous intelligence will most certainly take their pound of flesh.</span>")

/obj/structure/coven_object/chapel_phylactery
	name = "city phylactery"
	desc = "Sealed container of texts. The city-faithful hold it in high importance."
	icon_state = "phylactery"

/obj/structure/coven_object/chapel_phylactery/examine(mob/user)
	..()
	to_chat(user, "<span class='cyan'>Touch the welds, the security of the city. Pledge your faith to the city-mind, if you have not already turned to true apostacy.</span>")
