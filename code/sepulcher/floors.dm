// Sepulcher floors
// NOTE: Some flooring used ingame may not be here.

//water
/turf/open/indestructible/ground/outside/water
	name = "water"
	desc = "Mundane fluids that facilitate life."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater"
	slowdown = 2
	baseturfs = /turf/open/indestructible/ground/outside/water
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/indestructible/ground/outside/water/sea
	name = "sea water"
	desc = "Fluids from beyond."
	icon_state = "redwater_motion"
	baseturfs = /turf/open/indestructible/ground/outside/water/sea

/turf/open/indestructible/ground/outside/water/knee_high
	name = "water"
	desc = "Mundane fluids used in ritual."
	baseturfs = /turf/open/indestructible/ground/outside/water/knee_high

/turf/open/indestructible/ground/sewer_water
	name = "waste"
	desc = "Slurry of shit and urine. Repugnant and fermented."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater"
	baseturfs = /turf/open/indestructible/ground/sewer_water

/turf/open/indestructible/ground/outside/water/Entered(atom/movable/A)
	..()
	if(istype(A, /mob/living/carbon))
		var/mob/living/carbon/L = A
		L.update_top_overlay()
		if(istype(A, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = A
			/*if(H.shoes)
				H.shoes.clean_blood()*/
			if(H.fire_stacks)
				H.fire_stacks = 0
				H.ExtinguishMob()

/turf/open/indestructible/ground/outside/water/Exited(atom/movable/A)
	..()
	if(istype(A, /mob/living/carbon))
		var/mob/living/carbon/L = A
		L.update_top_overlay()
		flick("water_splash_movement", src)

// Dirt
/turf/open/indestructible/ground/outside/waste
	name = "dirt"
	icon_state = "railsnone"
	slowdown = 0.2

	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

//pavement
/turf/open/indestructible/ground/outside/sidewalk/tile
	name = "pavement"
	icon_state = "darkrustysolid"
	icon = 'icons/turf/f13floors2.dmi'

/turf/open/indestructible/ground/outside/sidewalk/stairs
	icon_state = "rampupbottom"
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
	desc = "It hungers for scrap metal. Watch your step."
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
	icon = 'icons/sepulcher/floor.dmi'

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

	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

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

/turf/open/indestructible/ground/floor/stairs
	name = "stairs"
	icon_state = "stairsup"
	gender = PLURAL

/turf/open/indestructible/ground/floor/stairs/down
	icon_state = "stairsdown"
