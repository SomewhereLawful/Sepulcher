//predominantly negative traits

/datum/quirk/no_machines
	name = "Doltish"
	desc = "Of you is a simple mind. Regardless of your form, machines are god-shaped - you cannot understand them."
	value = -3

/datum/quirk/nearsighted
	name = "Clouded Irises"
	desc = "Something has taken your farsight. Spectacles may help."
	value = -2
	gain_text = "<span class='danger'>Things far away from you start looking blurry.</span>"
	lose_text = "<span class='notice'>You start seeing faraway things normally again.</span>"

/datum/quirk/nearsighted/add()
	quirk_holder.become_nearsighted(ROUNDSTART_TRAIT)

/datum/quirk/blooddeficiency
	name = "Wasting Sickness"
	desc = "Your body rots. Constant attention is required."
	value = -3
	gain_text = "<span class='danger'>You feel your vigor slowly fading away.</span>"
	lose_text = "<span class='notice'>You feel vigorous again.</span>"
	// medical_record_text = "Patient requires regular treatment for blood loss due to low production of blood."

/datum/quirk/blooddeficiency/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	if(NOBLOOD in H.dna.species.species_traits) //can't lose blood if your species doesn't have any
		return
	else 
		quirk_holder.adjustBruteLoss(0.1)

/datum/quirk/willdraining
	name = "Slipping Mind"
	desc = "The desire to continue weakens. Your will constantly drains."
	value = -3
	gain_text = "<span class='danger'>You feel your will slowly fading away.</span>"
	lose_text = "<span class='notice'>You feel confident in your mind again.</span>"

/datum/quirk/willdraining/on_process()
	quirk_holder.adjustWillLoss(0.1)

/datum/quirk/nyctophobia
	name = "Fear of Dark"
	desc = "Dark places are homes to monstrosity. You've accepted this fact and tread carefully because of it."
	value = -2

/datum/quirk/nyctophobia/on_process()
	var/mob/living/carbon/human/H = quirk_holder
	if(H.dna.species.id in list("shadow", "nightmare"))
		return //we're tied with the dark, so we don't get scared of it; don't cleanse outright to avoid cheese
	var/turf/T = get_turf(quirk_holder)
	var/lums = T.get_lumcount()
	if(lums <= 0.2)
		if(quirk_holder.m_intent == MOVE_INTENT_RUN)
			to_chat(quirk_holder, "<span class='warning'>The darkness absorbs you...</span>")
			quirk_holder.toggle_move_intent()
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "nyctophobia", /datum/mood_event/nyctophobia)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "nyctophobia")

/datum/quirk/poor_aim
	name = "Tremoring Hands"
	desc = "Your hands shake constantly. Your aim is terrible."
	value = -1
	mob_trait = TRAIT_POOR_AIM
	medical_record_text = "Patient possesses a strong tremor in both hands."

/datum/quirk/insanity
	name = "Invoked Bedlam"
	desc = "Leaking seams in the mind. You see the unreal, hear the unspoken. The madness leads many to forsake you."
	value = -2
	//no mob trait because it's handled uniquely
	lose_text = "<span class='notice'>You feel in tune with the world again.</span>"
	//medical_record_text = "Patient suffers from acute Reality Dissociation Syndrome and experiences vivid hallucinations."

/datum/quirk/insanity/on_process()
	if(quirk_holder.reagents.has_reagent("mindbreaker"))
		quirk_holder.hallucination = 0
		return
	if(prob(2)) //we'll all be mad soon enough
		madness()

/datum/quirk/insanity/proc/madness()
	quirk_holder.hallucination += rand(10, 25)

/datum/quirk/insanity/post_add() //I don't /think/ we'll need this but for newbies who think "roleplay as insane" = "license to kill" it's probably a good thing to have
	if(!quirk_holder.mind || quirk_holder.mind.special_role)
		return
	to_chat(quirk_holder, "<span class='magenta'>Your visions, even when understood, offer no use to others. Excuses, they say... Best to keep them to yourself.</span>")

/datum/quirk/social_anxiety
	name = "Social Neurosis"
	desc = "You torment yourself with the expectations of others. You fall mute and jittery to observers."
	value = -2
	gain_text = "<span class='danger'>You start worrying about what you're saying.</span>"
	lose_text = "<span class='notice'>You feel easier about talking again.</span>" //if only it were that easy!
	medical_record_text = "Patient is usually anxious in social encounters and prefers to avoid them."
	var/dumb_thing = TRUE

/datum/quirk/social_anxiety/on_process()
	var/nearby_people = 0
	for(var/mob/living/carbon/human/H in view(5, quirk_holder))
		if(H.client)
			nearby_people++
	var/mob/living/carbon/human/H = quirk_holder
	if(prob(2 + nearby_people))
		H.stuttering = max(3, H.stuttering)
	else if(prob(min(3, nearby_people)) && !H.silent)
		to_chat(H, "<span class='danger'>You retreat into yourself. You <i>really</i> don't feel up to talking.</span>")
		H.silent = max(10, H.silent)
	else if(prob(0.5) && dumb_thing)
		to_chat(H, "<span class='userdanger'>You think of a dumb thing you said a long time ago and scream internally.</span>")
		dumb_thing = FALSE //only once per life
		if(prob(1))
			new/obj/item/reagent_containers/food/snacks/pastatomato(get_turf(H)) //now that's what I call spaghetti code
