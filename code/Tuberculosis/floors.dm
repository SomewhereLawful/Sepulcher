// Tuberculosis floors
// NOTE: Some flooring used ingame may not be here.

//water
/turf/open/indestructible/ground/outside/water
	name = "water"
	desc = "Mundane fluids that facilitate life."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater"

/turf/open/indestructible/ground/outside/water/sea
	name = "sea water"
	desc = "Fluids from beyond. Fishermen make use of this."

/turf/open/indestructible/ground/outside/water/knee_high
	name = "water"
	desc = "Mundane fluids used in ritual."

/turf/open/indestructible/ground/sewer_water
	name = "waste"
	desc = "Slurry of shit and urine. Repugnant and fermented."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater"

//pavement
/turf/open/indestructible/ground/outside/sidewalk/tile
	name = "pavement"
	icon_state = "darkrustysolid"
	icon = 'icons/turf/f13floors2.dmi'

// Foundry chasm //
/turf/open/chasm/foundry
	name = "foundry pit"
	desc = "It hungers for scrap metal. Watch your step, it'd be a waste of meat."
	planetary_atmos = TRUE
	smooth = SMOOTH_FALSE
	icon_state = "foundry"
	icon = 'icons/turf/floors.dmi'
	baseturfs = /turf/open/chasm/foundry
	light_range = 1.9
	light_power = 1
	light_color = "#FAECCF"

/turf/open/foundry // Fake chasm for foundry catwalks
	name = "foundry pit"
	desc = "It hungers for scrap metal. Watch your step, it'd be a waste of meat."
	planetary_atmos = TRUE
	smooth = SMOOTH_FALSE
	icon_state = "foundry"
	icon = 'icons/turf/floors.dmi'
	baseturfs = /turf/open/foundry
	light_range = 1.9
	light_power = 1
	light_color = "#FAECCF"

/turf/open/indestructible/ground/floor
	name = "floor"
	icon = 'icons/tuberculosis/floor.dmi'

/turf/open/indestructible/ground/floor/lattice
	name = "floor"
	icon_state = "lattice_new1"

/turf/open/indestructible/ground/floor/lattice/New()
	if(icon_state == "lattice_new1")
		icon_state = "lattice_new[rand(1,21)]"
	..()

/turf/open/indestructible/ground/floor/wood_floor
	name = "floor"
	icon_state = "wood1"

/turf/open/indestructible/ground/floor/wood_floor/New()
	if(icon_state == "wood1")
		icon_state = "wood[rand(1,25)]"
	..()

/turf/open/indestructible/ground/floor/wood_floor/horizontal
	name = "floor"
	icon_state = "woodd1"

/turf/open/indestructible/ground/floor/wood_floor/horizontal/New()
	if(icon_state == "woodd1")
		icon_state = "woodd[rand(1,25)]"
	..()