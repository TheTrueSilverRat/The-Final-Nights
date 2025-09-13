
/datum/discipline/thanatosis
	name = "Thanatosis"
	desc = "Offers control over your own dead body"
	icon_state = "thanatosis"
	clan_restricted = TRUE
	power_type = /datum/discipline_power/thanatosis


/datum/discipline_power/thanatosis
	name = "Thanatosis power name"
	desc = "Thanatosis power description"

//STATUS EFFECTS START


///PUTREFACTION STUFF ROTTY ROTTY

/datum/status_effect/putrefaction
	id = "putrefaction"
	status_type = STATUS_EFFECT_MULTIPLE
	duration = 1 SCENES //3 Minutes
	alert_type = /atom/movable/screen/alert/status_effect/putrefaction


/atom/movable/screen/alert/status_effect/putrefaction
	name = "Putrefaction"
	desc = "Your face has aged terribly!!"
	icon_state = "wounded_soldier"

/datum/status_effect/putrefactionh/on_apply()
	. = ..()
	owner.social -= 2

/datum/status_effect/putrefaction/on_remove()
	. = ..()
	owner.social += 2


/datum/status_effect/putrefaction/two
	id = "putrefaction2"
	status_type = STATUS_EFFECT_MULTIPLE
	duration = 1 SCENES //3 Minutes
	alert_type = /atom/movable/screen/alert/status_effect/putrefaction

/datum/status_effect/putrefaction/two/on_apply()
	. = ..()
	owner.dexterity -= 1

/datum/status_effect/putrefaction/two/on_remove()
	. = ..()
	owner.dexterity += 1

/datum/status_effect/putrefaction/three
	id = "putrefaction3"
	status_type = STATUS_EFFECT_MULTIPLE
	duration = 1 SCENES //3 Minutes
	alert_type = /atom/movable/screen/alert/status_effect/putrefaction

/datum/status_effect/putrefaction/three/on_apply()
	. = ..()
	owner.social -= 1
	owner.dexterity -= 1
	owner.physique -= 1

/datum/status_effect/putrefaction/three/on_remove()
	. = ..()
	owner.social += 1
	owner.dexterity += 1
	owner.physique += 1

/datum/status_effect/putrefaction/four
	id = "putrefaction4"
	status_type = STATUS_EFFECT_MULTIPLE
	duration = 1 SCENES //3 Minutes
	alert_type = /atom/movable/screen/alert/status_effect/putrefaction

/datum/status_effect/putrefaction/three/on_apply()
	. = ..()
	owner.social -= 2
	owner.dexterity -= 1
	owner.physique -= 1

/datum/status_effect/putrefaction/three/on_remove()
	. = ..()
	owner.social -=2
	owner.dexterity += 1
	owner.physique += 1





//STATUS EFFECTS END



//HAG'S WRINKLES
/datum/discipline_power/thanatosis/hag_wrinkles
	name = "Hag's Wrinkles"
	desc = "Morph your face to become unknowing."

	level = 1
	check_flags = DISC_CHECK_CONSCIOUS
	vitae_cost = 1

	activate_sound = 'code/modules/wod13/sounds/necromancy1on.ogg'
	deactivate_sound = 'code/modules/wod13/sounds/necromancy1off.ogg'

	cancelable = TRUE
	duration_length = 2 INGAME_HOURS


/datum/discipline_power/thanatosis/hag_wrinkles/activate()
	. = ..()

	var/obj/item/implant/storage/imp = new()
	imp.implant(owner, owner)


/datum/discipline_power/thanatosis/hag_wrinkles/deactivate()
	. = ..()
	for(var/obj/item/implant/storage/i in owner.implants)
		i.removed(owner)



//PUTREFACTION
/datum/discipline_power/thanatosis/putrefaction
	name = "Putrefaction"
	desc = "Rot and Decay at a Touch."

	level = 2
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	target_type = TARGET_LIVING
	vitae_cost = 1

	effect_sound = 'code/modules/wod13/sounds/necromancy2.ogg'

	violates_masquerade = TRUE

	range = 5
	cooldown_length = 5 SECONDS

/datum/discipline_power/thanatosis/putrefaction/activate(mob/living/target)
	. = ..()

	var/fortitudelevel
	var/totaldice
	var/totaldiff
	var/mob/living/carbon/human/vampire = target
	if(iskindred(vampire))
		var/datum/species/kindred/clan = vampire.dna.species
		var/datum/discipline/fortitude/fortitude_check = clan.get_discipline(/datum/discipline/fortitude)
		if(fortitude_check)
			fortitudelevel = fortitude_check.level


	totaldice = (owner.get_total_dexterity() + discipline.level)
	totaldiff = (target.get_total_physique() + fortitudelevel)
	var/mypower = SSroll.storyteller_roll(totaldice, difficulty = totaldiff, mobs_to_show_output = owner, numerical = TRUE)

	if(mypower >= 1)
		target.adjustBruteLoss(30)
		target.apply_status_effect(STATUS_EFFECT_PUTREFACTION, owner)
	else
		to_chat(owner, span_warning("Putrefaction has failed to affect [target]"))


//ASHES TO ASHES


/mob/living/simple_animal/hostile/bloodcrawler/dust
	name = "ash"
	desc = "Ashes to ashes, dust to dust, and into space."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	icon_living = "ash"
	speed = -0.5
	maxHealth = 1000
	health = 1000
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

	duration_length = 30 SECONDS
	cooldown_length = 1 TURNS

	var/obj/effect/proc_holder/spell/targeted/shapeshift/bloodcrawler/dust/dust_transformation

/datum/discipline_power/thanatosis/ashes_to_ashes/activate(mob/target)
	. = ..()
	if (!dust_transformation)
		dust_transformation = new(owner)
	owner.drop_all_held_items()
	dust_transformation.Shapeshift(owner)

/datum/discipline_power/thanatosis/ashes_to_ashes/deactivate()
	. = ..()
	dust_transformation.Restore(dust_transformation.myshape)
	owner.Stun(1.5 SECONDS)
	owner.do_jitter_animation(30)


//WITHERING
/datum/discipline_power/thanatosis/withering
	name = "Withering"
	desc = "Wither Bodies into Decay"

	level = 4
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	target_type = TARGET_LIVING
	range = 5
	vitae_cost = 1

	effect_sound = 'code/modules/wod13/sounds/necromancy4.ogg'

	aggravating = TRUE
	hostile = TRUE
	violates_masquerade = TRUE

	cooldown_length = 1 TURNS

/datum/discipline_power/thanatosis/withering/activate(mob/living/target)
	. = ..()
	var/fortitudelevel
	var/totaldice
	var/totaldiff
	var/mob/living/carbon/human/vampire = target
	if(iskindred(vampire))
		var/datum/species/kindred/clan = vampire.dna.species
		var/datum/discipline/fortitude/fortitude_check = clan.get_discipline(/datum/discipline/fortitude)
		if(fortitude_check)
			fortitudelevel = fortitude_check.level


	totaldice = (owner.get_total_mentality() + discipline.level)
	totaldiff = (target.get_total_physique() + fortitudelevel + 2)
	var/mypower = SSroll.storyteller_roll(totaldice, difficulty = totaldiff, mobs_to_show_output = owner, numerical = TRUE)

	if((mypower >= 1) && (mypower < 3))
		target.adjustStaminaLoss(60)
	else if(mypower >= 3)
		if(iscarbon(target))
			var/mob/living/carbon/deady = target
			var/obj/item/bodypart/target_part = pick(deady.bodyparts)
			var/datum/wound/blunt/critical/crit_wound = new
			crit_wound.apply_wound(target_part)
		else
			target.adjustBruteLoss(200)
	else
		to_chat(owner, span_warning("Withering has failed to affect [target]"))


//NECROSIS
/datum/discipline_power/thanatosis/necrosis
	name = "Necrosis"
	desc = "A more horrific version of Putrefaction"

	level = 5
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	target_type = TARGET_HUMAN
	vitae_cost = 2
	range = 5
	effect_sound = 'code/modules/wod13/sounds/necromancy5.ogg'

	aggravating = TRUE
	hostile = TRUE
	violates_masquerade = TRUE

	cooldown_length = 5 SECONDS

/datum/discipline_power/thanatosis/necrosis/activate(mob/living/carbon/human/target)
	. = ..()
	var/fortitudelevel
	var/totaldice
	var/totaldiff
	var/mob/living/carbon/human/vampire = target
	if(iskindred(vampire))
		var/datum/species/kindred/clan = vampire.dna.species
		var/datum/discipline/fortitude/fortitude_check = clan.get_discipline(/datum/discipline/fortitude)
		if(fortitude_check)
			fortitudelevel = fortitude_check.level

	totaldice = (owner.get_total_dexterity() + discipline.level)
	totaldiff = (target.get_total_physique() + fortitudelevel + 2)
	var/mypower = SSroll.storyteller_roll(totaldice, difficulty = totaldiff, mobs_to_show_output = owner, numerical = TRUE)

	target.adjustBruteLoss(30 * mypower)

	if(mypower <= 1)
		to_chat(owner, span_warning("Necrosis has failed to affect [target]!"))
		return
	switch(mypower)
		if(1)
			return
		if(2)
			target.apply_status_effect(STATUS_EFFECT_PUTREFACTION, owner)
		if(3)
			target.apply_status_effect(STATUS_EFFECT_PUTREFACTION, owner)
			if(iscarbon(target))
				for(var/i in target.bodyparts)
					var/obj/item/bodypart/bodypart = i
					var/datum/wound/burn/moderate/burnt = new
					burnt.apply_wound(bodypart)
			if(ishumanbasic(vampire))
				target.dexterity -= 1
		if(4)
			target.apply_status_effect(STATUS_EFFECT_PUTREFACTIONTWO, owner)
			if(iscarbon(target))
				for(var/i in target.bodyparts)
					var/obj/item/bodypart/bodypart = i
					var/datum/wound/burn/severe/burnt = new
					burnt.apply_wound(bodypart)
			if(ishumanbasic(vampire))
				target.dexterity -= 1
				target.physique -= 1
		if(5)
			target.apply_status_effect(STATUS_EFFECT_PUTREFACTIONTHREE, owner)
			if(iscarbon(target))
				for(var/i in target.bodyparts)
					var/obj/item/bodypart/bodypart = i
					var/datum/wound/burn/critical/burnt = new
					burnt.apply_wound(bodypart)
			if(ishumanbasic(vampire))
				target.dexterity -= 1
				target.physique -= 1
		else
			target.apply_status_effect(STATUS_EFFECT_PUTREFACTIONFOUR, owner)
			if(iscarbon(target))
				for(var/i in target.bodyparts)
					var/obj/item/bodypart/bodypart = i
					var/datum/wound/burn/critical/burnt = new
					burnt.apply_wound(bodypart)
			if(ishumanbasic(vampire))
				target.dexterity -= 1
				target.physique -= 1
