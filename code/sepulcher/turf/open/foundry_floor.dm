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
	footstep = FOOTSTEP_CATWALK

// Fake chasm for foundry catwalks
/turf/open/foundry
	name = "foundry pit"
	desc = "It hungers for scrap metal. Watch your step."
	planetary_atmos = TRUE
	smooth = SMOOTH_FALSE
	icon_state = "foundry"
	icon = 'icons/turf/floors.dmi'
	baseturfs = /turf/open/foundry
	light_range = 1.9
	light_power = 1
	light_color = "#FAECCF"
	footstep = FOOTSTEP_CATWALK