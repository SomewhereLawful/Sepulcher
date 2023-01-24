// Tuberculosis floors
// NOTE: Some flooring used ingame may not be here.

//water
/turf/open/indestructible/ground/outside/water
	name = "\proper sidewalk"
	name = "water"
	desc = "Mundane fluids that facilitate life."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater"

/turf/open/indestructible/ground/outside/water/sea
	name = "sea water"
	desc = "Fluids from beyond. Fishermen make use of this."

/turf/open/indestructible/ground/outside/water/sewer
	name = "waste"
	desc = "Slurry of shit and urine. Repugnant and fermented."

/turf/open/indestructible/ground/outside/water/knee_high
	name = "water"
	desc = "Mundane fluids used in ritual."

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