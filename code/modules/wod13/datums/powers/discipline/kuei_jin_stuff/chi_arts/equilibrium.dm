
/datum/chi_discipline/equilibrium
	name = "Equilibrium"
	desc = "Channel the flow of the Chis not only within you but in others as well"
	icon_state = "equilibrium"
	cost_yang = 1
	cost_yin = 1
	discipline_type =  = 'Chi'
	power_type = /datum/chi_discipline_power/equilibrium

/datum/chi_discipline/equilibrium/post_gain()
	. = ..()
	if (level >= 3)
		var/datum/action/rebalance/rebalance = new()
		rebalance.Grant(user)


/datum/chi_discipline_power/equilibrium
	name = "Chi power name"
	desc = "Chi power description"
	cost_yang = 1
	cost_yin = 1

	activate_sound = 'code/modules/wod13/sounds/equilibrium.ogg'

//List of the datum equillibirum stuff (needed to make it easier to copy and paste grouped powers)
		/datum/chi_discipline_power/equilibrium/chi_boost,
		/datum/chi_discipline_power/equilibrium/shift_chi,
		/datum/chi_discipline_power/equilibrium/group_chi_boost,
		/datum/chi_discipline_power/equilibrium/aggravate_chi,
		/datum/chi_discipline_power/equilibrium/area_feed

//Equilibrium 1
/datum/chi_discipline_power/equilibrium/chi_boost
	name = "Boost of your Chi's Inner Strength"
	desc = "Use the Chi within you to push yourself even further"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS + owner.bloodpower_time_plus //Felt it was appropriate that the Kuei jin equivalent of blood power was affected by the respective boost

	grouped_powers = list(
		/datum/chi_discipline_power/equilibrium/shift_chi,
		/datum/chi_discipline_power/equilibrium/group_chi_boost,
		/datum/chi_discipline_power/equilibrium/aggravate_chi,
		/datum/chi_discipline_power/equilibrium/area_feed
	)

/datum/chi_discipline_power/equilibrium/chi_boost/activate()
	. = ..()
	owner.dna.species.punchdamagehigh += 5
	owner.physiology.armor.melee += 15
	owner.physiology.armor.bullet += 15
	owner.dexterity += 2
	owner.athletics += 2
	owner.lockpicking += 2
	ADD_TRAIT(owner, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)
	owner.do_jitter_animation(1 SECONDS)
	spawn(delay+owner.discipline_time_plus)

/datum/chi_discipline_power/equilibrium/chi_boost/deactivate()
	. = ..()
	owner.dna.species.punchdamagehigh -= 5
	owner.physiology.armor.melee -= 15
	owner.physiology.armor.bullet -= 15
	owner.dexterity -= 2
	owner.athletics -= 2
	owner.lockpicking -= 2
	REMOVE_TRAIT(owner, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)

//Equilibrium 2
/datum/chi_discipline_power/equilibrium/shift_chi
	name = "Flow of the Triat-Fold Chi"
	desc = "Shift the Chi within you, from yin to yang, as well as to fuel or to derive your demon chi"

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	cost_yang = 0
	cost_yin = 0
	cooldown_length = 1 TURN

	grouped_powers = list(
		/datum/chi_discipline_power/equilibrium/chi_boost,
		/datum/chi_discipline_power/equilibrium/group_chi_boost,
		/datum/chi_discipline_power/equilibrium/aggravate_chi,
		/datum/chi_discipline_power/equilibrium/area_feed

	)

/datum/chi_discipline_power/equilibrium/shift_chi/activate()
	. = ..()	//Redeeming for the shift
	var/yang_shift = input(caster, "Where do you want to shift your Yang Chi?", "Chi Shift") as null|anything in list("Yin Pool", "Demon Pool", "Nowhere")
	if(yang_shift == "Yin Pool")
		var/init_yin = caster.yin_chi
		var/actually_shifted = min(min(caster.max_yin_chi, caster.yin_chi + caster.yang_chi) - init_yin, caster.yang_chi)
		caster.yang_chi -= actually_shifted
		caster.yin_chi += actually_shifted
		to_chat(caster, "<span class='warning'>You put your Yang into your Yin.</span>")
	if(yang_shift == "Demon Pool")
		var/init_demon = caster.demon_chi
		var/actually_shifted = min(min(caster.max_demon_chi, caster.demon_chi + caster.yang_chi) - init_demon, caster.yang_chi)
		caster.yang_chi -= actually_shifted
		caster.demon_chi += actually_shifted
		to_chat(caster, "<span class='warning'>You put your Yang into your Demon.</span>")

	var/yin_shift = input(caster, "Where do you want to shift your Yin Chi?", "Chi Shift") as null|anything in list("Yang Pool", "Demon Pool", "Nowhere")
	if(yin_shift == "Yang Pool")
		var/init_yang = caster.yang_chi
		var/actually_shifted = min(min(caster.max_yang_chi, caster.yang_chi + caster.yin_chi) - init_yang, caster.yin_chi)
		caster.yin_chi -= actually_shifted
		caster.yang_chi += actually_shifted
		to_chat(caster, "<span class='warning'>You put your Yin into your Yang.</span>")
	if(yin_shift == "Demon Pool")
		var/init_demon = caster.demon_chi
		var/actually_shifted = min(min(caster.max_demon_chi, caster.demon_chi + caster.yin_chi) - init_demon, caster.yin_chi)
		caster.yin_chi -= actually_shifted
		caster.demon_chi += actually_shifted
		to_chat(caster, "<span class='warning'>You put your Yin into your Demon.</span>")

	var/demon_shift = input(caster, "Where do you want to shift your Demon Chi?", "Chi Shift") as null|anything in list("Yin Pool", "Yang Pool", "Nowhere")
	if(demon_shift == "Yin Pool")
		var/init_yin = caster.yin_chi
		var/actually_shifted = min(min(caster.max_yin_chi, caster.yin_chi + caster.demon_chi) - init_yin, caster.demon_chi)
		caster.demon_chi -= actually_shifted
		caster.yin_chi += actually_shifted
		to_chat(caster, "<span class='warning'>You put your Demon into your Yin.</span>")
	if(demon_shift == "Yang Pool")
		var/init_yang = caster.yang_chi
		var/actually_shifted = min(min(caster.max_yang_chi, caster.yang_chi + caster.demon_chi) - init_yang, caster.demon_chi)
		caster.demon_chi -= actually_shifted
		caster.yang_chi += actually_shifted
		to_chat(caster, "<span class='warning'>You put your Demon into your Yang.</span>")


//Equilibrium 3
/datum/chi_discipline_power/equilibrium/group_chi_boost
	name = "Aupiscious Raise of Peers' Strengths"
	desc = "Channel the Chi of your peers and strengthen them further."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/equilibrium/chi_boost,
		/datum/chi_discipline_power/equilibrium/shift_chi,
		/datum/chi_discipline_power/equilibrium/aggravate_chi,
		/datum/chi_discipline_power/equilibrium/area_feed
	)

/datum/chi_discipline_power/equilibrium/three/activate()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in oviewers(5, caster))
		affected_mob.dna.species.punchdamagehigh += 5
		affected_mob.physiology.armor.melee += 15
		affected_mob.physiology.armor.bullet += 15
		affected_mob.dexterity += 2
		affected_mob.athletics += 2
		affected_mob.lockpicking += 2
		ADD_TRAIT(affected_mob, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)
		var/obj/effect/celerity/celerity_effect = new(get_turf(affected_mob))
		celerity_effect.appearance = affected_mob.appearance
		celerity_effect.dir = affected_mob.dir
		var/matrix/double_size = matrix(affected_mob.transform)
		double_size.Scale(2, 2)
		animate(celerity_effect, transform = double_size, alpha = 0, time = 1 SECONDS)

/datum/chi_discipline_power/equilibrium/three/deactivate()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in oviewers(5, caster))
		if(affected_mob)
			qdel(celerity_effect)
			affected_mob.dna.species.punchdamagehigh -= 5
			affected_mob.physiology.armor.melee -= 15
			affected_mob.physiology.armor.bullet -= 15
			affected_mob.dexterity -= 2
			affected_mob.athletics -= 2
			affected_mob.lockpicking -= 2
			REMOVE_TRAIT(affected_mob, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)

//Equilibrium 4
/datum/chi_discipline_power/equilibrium/aggravate_chi
	name = "Disruption of the Flow of Chi"
	desc = "Disrupt the flow of your Enemies' Chi and make them writhe in pain."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	cooldown_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/equilibrium/chi_boost,
		/datum/chi_discipline_power/equilibrium/shift_chi,
		/datum/chi_discipline_power/equilibrium/group_chi_boost,
		/datum/chi_discipline_power/equilibrium/area_feed
	)

/datum/chi_discipline_power/equilibrium/four/activate()
	. = ..()
	for(var/mob/living/affected_mob in oviewers(5, caster))
		affected_mob.AdjustKnockdown(4 SECONDS, TRUE)
		affected_mob.emote("scream")
		playsound(get_turf(affected_mob), 'code/modules/wod13/sounds/vicissitude.ogg', 75, FALSE)
		step_away(affected_mob, caster)

//Equilibrium 5
/datum/chi_discipline_power/equilibrium/area_feed
	name = "Mimicry of a Mandarin's Diet"
	desc = "Do a facisimile of an Elder's feed on the ambient area's chi and feed upon it with your mastery of the flow of Chi"

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	cost_yang = 0
	cost_yin = 0
	cooldown_length = 1 TURN

	grouped_powers = list(
		/datum/chi_discipline_power/equilibrium/chi_boost,
		/datum/chi_discipline_power/equilibrium/shift_chi,
		/datum/chi_discipline_power/equilibrium/group_chi_boost,
		/datum/chi_discipline_power/equilibrium/aggravate_chi
	)

/datum/chi_discipline_power/equilibrium/five/activate()
	. = ..()
	if(current_area.yang_chi)
		caster.yang_chi = min(caster.yang_chi + current_area.yang_chi, caster.max_yang_chi)
		to_chat(caster, "<span class='engradio'>Some <b>Yang</b> Chi energy enters you...</span>")
	if(current_area.yin_chi)
		caster.yin_chi = min(caster.yin_chi + current_area.yin_chi, caster.max_yin_chi)
		to_chat(caster, "<span class='medradio'>Some <b>Yin</b> Chi energy enters you...</span>")
	if(current_area.demon_chi > 0)
		caster.yin_chi = min(caster.yin_chi + current_area.demon_chi, caster.max_demon_chi)
		to_chat(caster, "<span class='medradio'>Some <b>Demon</b> Chi energy enters you...</span>")
	if(current_area.demon_chi < 0)
		caster.yin_chi = min(caster.yin_chi + current_area.demon_chi, caster.max_demon_chi)
		to_chat(caster, "<span class='medradio'>This area takes away some of your <b>Demon</b> Chi energy away..</span>")


