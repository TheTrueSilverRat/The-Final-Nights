
/datum/discipline/thanatosis
	name = "Thanatosis"
	desc = "Offers control over your own dead body"
	icon_state = "thanatosis"
	clan_restricted = TRUE
	power_type = /datum/discipline_power/thanatosis

/datum/discipline/thanatosis/post_gain()
	. = ..()

//Gets the funny name
	var/obj/item/implant/storage/imp = new()
	imp.implant(owner, owner)

/datum/discipline_power/thanatosis
	name = "Thanatosis power name"
	desc = "Thanatosis power description"


//SHROUDSIGHT
/datum/discipline_power/thanatosis/hag_wrinkles
	name = "Hag's Wrinkles"
	desc = "Morph your face to become unknowing."

	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	vitae_cost = 1

	activate_sound = 'code/modules/wod13/sounds/necromancy1on.ogg'
	deactivate_sound = 'code/modules/wod13/sounds/necromancy1off.ogg'

	toggled = TRUE
	duration_length = 0 SECONDS


/datum/discipline_power/thanatosis/hag_wrinkles/activate()
	. = ..()

	owner.real_name = "Unknown"
	owner.update_body()

/datum/discipline_power/thanatosis/hag_wrinkles/deactivate()
	. = ..()

	owner.real_name = initial(owner.real_name)

	owner.update_body()

//ETHEREAL HORDE
/datum/discipline_power/thanatosis/putrefaction
	name = "Putrefaction"
	desc = "Rot and Decay at a Touch."

	level = 2
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	vitae_cost = 1

	effect_sound = 'code/modules/wod13/sounds/necromancy2.ogg'

	violates_masquerade = TRUE

	range = 1
	cooldown_length = 5 SECONDS

/datum/discipline_power/thanatosis/putrefaction/activate(mob/living/target)
	. = ..()

	var/fortitudelevel
	var/totaldice
	var/totaldiff
	for(var/datum/action/discipline/Disc in owner.actions)
		if(Disc.discipline.name == "Fortitude")
			fortitudelevel = Disc.discipline.level
	totaldice = (owner.get_total_dexterity() + discipline.level)
	totaldiff = (target.get_total_physique() + fortitudelevel)
	var/mypower = SSroll.storyteller_roll(totaldice, difficulty = totaldiff, mobs_to_show_output = owner, numerical = TRUE)

	if(mypower >= 1)
		target.adjustBruteLoss(30)
		target.apply_status_effect(STATUS_EFFECT_PUTREFACTION, owner)
	else
		to_chat(owner, span_warning("Putrefaction has failed to affect"))


//ASHES TO ASHES


/mob/living/simple_animal/hostile/bloodcrawler/dust
	name = "ashes"
	desc = "Ashes to ashes, dust to dust, and into space."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	icon_living = "ash"
	speed = 5
	maxHealth = 300
	health = 300
	melee_damage_lower = 1
	melee_damage_upper = 1
	attack_verb_continuous = "splashes"
	attack_verb_simple = "splash"

/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler/dust
	shapeshift_type = /mob/living/simple_animal/hostile/bloodcrawler/dust

/datum/discipline_power/thanatosis/ashes_to_ashes
	name = "Ashes to Ashes"
	desc = "Turn into ash to hide."

	level = 3
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	vitae_cost = 2

	activate_sound = 'code/modules/wod13/sounds/necromancy3.ogg'

	violates_masquerade = TRUE

	duration_length = 10 SECONDS
	cooldown_length = 10 SECONDS

	var/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler/dust/DUSTY

/datum/discipline_power/thanatosis/ashes_to_ashes/activate(mob/target)
	. = ..()
	if (!DUSTY)
		DUSTY = new(owner)
	owner.drop_all_held_items()
	DUSTY.Shapeshift(owner)

//datum/discipline_power/thanatosis/ashes_to_ashes/deactivate()
	. = ..()
	DUSTY.Restore(DUSTY.myshape)
	owner.Stun(1.5 SECONDS)
	owner.do_jitter_animation(30)

/datum/discipline_power/thanatosis/withering
	name = "Withering"
	desc = "Place a chosen target, including yourself, into a corpse-like state."

	level = 4
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	target_type = TARGET_SELF | TARGET_LIVING
	range = 5
	vitae_cost = 1

	effect_sound = 'code/modules/wod13/sounds/necromancy4.ogg'

	aggravating = TRUE
	hostile = TRUE
	violates_masquerade = TRUE

	multi_activate = TRUE
	cooldown_length = 20 SECONDS
	duration_length =	 20 SECONDS

/datum/discipline_power/thanatosis/cold_of_the_grave/activate(mob/living/target)
	. = ..()


//SHAMBLING HORDE
/datum/discipline_power/thanatosis/shambling_horde
	name = "Shambling Horde"
	desc = "Raise savage zombies from corpses, their lethality determined by source material. Attack the living, and rebuild sentient undead."

	level = 5
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	target_type = TARGET_MOB
	range = 5 //less range than thaum, nerf if 2stronk

	effect_sound = 'code/modules/wod13/sounds/necromancy5.ogg'

	aggravating = TRUE
	hostile = TRUE
	violates_masquerade = TRUE

	cooldown_length = 5 SECONDS

/datum/discipline_power/thanatosis/shambling_horde/activate(mob/living/target)
	. = ..()
