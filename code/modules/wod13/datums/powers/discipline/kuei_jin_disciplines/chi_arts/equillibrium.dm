/datum/discipline/kj_discipline/equilibrium
	name = "Equilibrium"
	desc = "Allow yourself to master the flow of chi in not only yourself but in others as well"
	icon_state = "equilibrium"
	power_type = /datum/discipline_power/kj_discipline_power/equilibrium
	discipline_type = "Chi"
	yin_cost = 1
	yang_cost = 1

/datum/discipline/thaumaturgy/post_gain()
	. = ..()
	if (level >= 3)
		var/datum/action/rebalance/rebalance = new()
		rebalance.Grant(owner)


/datum/discipline_power/kj_discipline_power/equilibrium
	name = "Equilibrium power name"
	desc = "Equilibrium power description"

	yin_cost = 1
	yang_cost = 1

	activate_sound = 'code/modules/wod13/sounds/equilibrium.ogg'

	check_flags = DISC_CHECK_CONSCIOUS
	multi_activate = TRUE


/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost
	name = "Chi Boost"
	desc = "Channel Chi within yourself to push your body to greater heights."

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 4 TURNS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost/activate()
	. = ..()
	owner.dna.species.punchdamagehigh += 5
	owner.physiology.armor.melee += 15
	owner.physiology.armor.bullet += 15
	owner.dexterity += 2
	owner.athletics += 2
	owner.lockpicking += 2
	ADD_TRAIT(owner, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)
	owner.do_jitter_animation(1 SECONDS)
/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost/deactivate()
	. = ..()
	owner.dna.species.punchdamagehigh -= 5
	owner.physiology.armor.melee -= 15
	owner.physiology.armor.bullet -= 15
	owner.dexterity -= 2
	owner.athletics -= 2
	owner.lockpicking -= 2
	REMOVE_TRAIT(owner, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)


/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer
	name = "Chi Transfer"
	desc = "Transfer your Chi reserves between your Yin, Yang, and Demon."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	yin_cost = 0
	yang_cost = 0
	toggled = FALSE
	cooldown_length = 6 SECONDS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer/activate()
	. = ..()
	var/yang_shift = input(owner, "Where do you want to shift your Yang Chi?", "Chi Shift") as null|anything in list("Yin Pool", "Demon Pool", "Nowhere")
	if(yang_shift == "Yin Pool")
		var/init_yin = owner.yin_chi
		var/actually_shifted = min(min(owner.max_yin_chi, owner.yin_chi + owner.yang_chi) - init_yin, owner.yang_chi)
		owner.yang_chi -= actually_shifted
		owner.yin_chi += actually_shifted
		to_chat(owner, "<span class='warning'>You put your Yang into your Yin.</span>")
	if(yang_shift == "Demon Pool")
		var/init_demon = owner.demon_chi
		var/actually_shifted = min(min(owner.max_demon_chi, owner.demon_chi + owner.yang_chi) - init_demon, owner.yang_chi)
		owner.yang_chi -= actually_shifted
		owner.demon_chi += actually_shifted
		to_chat(owner, "<span class='warning'>You put your Yang into your Demon.</span>")

	var/yin_shift = input(owner, "Where do you want to shift your Yin Chi?", "Chi Shift") as null|anything in list("Yang Pool", "Demon Pool", "Nowhere")
	if(yin_shift == "Yang Pool")
		var/init_yang = owner.yang_chi
		var/actually_shifted = min(min(owner.max_yang_chi, owner.yang_chi + owner.yin_chi) - init_yang, owner.yin_chi)
		owner.yin_chi -= actually_shifted
		owner.yang_chi += actually_shifted
		to_chat(owner, "<span class='warning'>You put your Yin into your Yang.</span>")
	if(yin_shift == "Demon Pool")
		var/init_demon = owner.demon_chi
		var/actually_shifted = min(min(owner.max_demon_chi, owner.demon_chi + owner.yin_chi) - init_demon, owner.yin_chi)
		owner.yin_chi -= actually_shifted
		owner.demon_chi += actually_shifted
		to_chat(owner, "<span class='warning'>You put your Yin into your Demon.</span>")

	var/demon_shift = input(owner, "Where do you want to shift your Demon Chi?", "Chi Shift") as null|anything in list("Yin Pool", "Yang Pool", "Nowhere")
	if(demon_shift == "Yin Pool")
		var/init_yin = owner.yin_chi
		var/actually_shifted = min(min(owner.max_yin_chi, owner.yin_chi + owner.demon_chi) - init_yin, owner.demon_chi)
		owner.demon_chi -= actually_shifted
		owner.yin_chi += actually_shifted
		to_chat(owner, "<span class='warning'>You put your Demon into your Yin.</span>")
	if(demon_shift == "Yang Pool")
		var/init_yang = owner.yang_chi
		var/actually_shifted = min(min(owner.max_yang_chi, owner.yang_chi + owner.demon_chi) - init_yang, owner.demon_chi)
		owner.demon_chi -= actually_shifted
		owner.yang_chi += actually_shifted
		to_chat(owner, "<span class='warning'>You put your Demon into your Yang.</span>")


/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group
	name = "Group Chi Boost"
	desc = "Channel Chi within everyone else around you to push their bodies to greater heights."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 4 TURNS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost/activate()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in oviewers(5, owner))
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

/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost/deactivate()
	. = ..()
	for(var/mob/living/carbon/human/affected_mob in oviewers(5, owner))
		var/obj/effect/celerity/celerity_effect = new(get_turf(affected_mob))
		qdel(celerity_effect)
		if(affected_mob)
			affected_mob.dna.species.punchdamagehigh -= 5
			affected_mob.physiology.armor.melee -= 15
			affected_mob.physiology.armor.bullet -= 15
			affected_mob.dexterity -= 2
			affected_mob.athletics -= 2
			affected_mob.lockpicking -= 2
			REMOVE_TRAIT(affected_mob, TRAIT_IGNORESLOWDOWN, SPECIES_TRAIT)


/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun
	name = "Chi Stun"
	desc = "Aggravate the Chi of those around you, forcing them to collapse briefly in sheer pain."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	yin_cost = 1
	yang_cost = 1
	toggled = FALSE
	cooldown_length = 12 SECONDS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun/activate()
	. = ..()
	for(var/mob/living/affected_mob in oviewers(5, owner))
		affected_mob.AdjustKnockdown(4 SECONDS, TRUE)
		affected_mob.emote("scream")
		playsound(get_turf(affected_mob), 'code/modules/wod13/sounds/vicissitude.ogg', 75, FALSE)
		step_away(affected_mob, owner)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_feed
	name = "Ambient Chi Feed"
	desc = "Mastery of the Equilibrium arts has allowed you to feed on even the ambient chi of the area like the Mandarins."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	yin_cost = 0
	yang_cost = 0
	toggled = FALSE
	cooldown_length = 6 SECONDS

	grouped_powers = list(
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_transfer,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_boost_group,
		/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun
	)

/datum/discipline_power/kj_discipline_power/equilibrium/chi_stun/activate()
	. = ..()
	var/area/current_area = get_area(owner)
	if(current_area.yang_chi)
		owner.yang_chi = min(owner.yang_chi + current_area.yang_chi, owner.max_yang_chi)
		to_chat(owner, "<span class='engradio'>Some <b>Yang</b> Chi energy enters you...</span>")
	if(current_area.yin_chi)
		owner.yin_chi = min(owner.yin_chi + current_area.yin_chi, owner.max_yin_chi)
		to_chat(owner, "<span class='medradio'>Some <b>Yin</b> Chi energy enters you...</span>")
