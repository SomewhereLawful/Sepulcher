
/obj/effect/particle_effect/smoke/reality_edge
	name = "edge of a decaying reality"
	color = "#963a20"
	amount = 8
	lifetime = INFINITE
	opaque = 1
	density = TRUE

/obj/effect/particle_effect/smoke/reality_edge/process()
	for(var/mob/living/L in range(0,src))
		smoke_mob(L)
	return 1