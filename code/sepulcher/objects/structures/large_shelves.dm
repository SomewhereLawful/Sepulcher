// Big shelves - courtesy of (stolen from) Afterglow-ss13

/obj/structure/rack/large
	name = "metal shelf"
	bound_width = 64
	icon = 'icons/obj/structures64.dmi'

/obj/structure/rack/large/Initialize()
	switch(dir)
		if(SOUTH, NORTH)
			bound_width = 64
			bound_height = 32
			bound_x = 0
		if(EAST, WEST)
			bound_width = 32
			bound_height = 64
			bound_x = 0
	. = ..()

/obj/structure/rack/large/shelf
	name = "metal shelf"
	desc = "An extra-large heavy-duty shelf. This could store a lot of things."
	icon_state = "metal_shelf"
	opacity = FALSE

/obj/structure/rack/large/shelf_rust
	desc = "An extra-large heavy-duty shelf. This could store a lot of things."
	icon_state = "metal_shelf_rust"
