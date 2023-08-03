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

/turf/open/indestructible/ground/outside/water/sea/deep
	name = "deep sea water"
	desc = "An apparent ledge lay before you. This is the boundry."
	icon_state = "deepred_motion"
	baseturfs = /turf/open/indestructible/ground/outside/water/sea/deep
	density = TRUE

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
	slowdown = 2
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

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