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


/datum/discipline_power/thanatosis/putrefaction/activate()
	. = ..()

	owner.real_name = "Unknown"
	owner.update_body()

/datum/discipline_power/thanatosis/putrefaction/deactivate()
	. = ..()

	owner.real_name = initial(real_name)

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
/datum/discipline_power/thanatosis/ashes_to_ashes
	name = "Ashes to Ashes"
	desc = "Turn into ash to hide."

	level = 3
	check_flags = DISC_CHECK_CONSCIOUS | DISC_CHECK_CAPABLE | DISC_CHECK_FREE_HAND | DISC_CHECK_IMMOBILE
	vitae_cost = 2

	activate_sound = 'code/modules/wod13/sounds/necromancy3.ogg'

	violates_masquerade = TRUE

	cooldown_length = 10 SECONDS

/datum/discipline_power/thanatosis/ashes_to_ashes/activate(mob/target)
	. = ..()

/datum/discipline_power/thanatosis/Withering
	name = "Cold of the Grave"
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
	duration_length = 20 SECONDS

/datum/movespeed_modifier/corpsebuff
	multiplicative_slowdown = 0.4

/datum/movespeed_modifier/corpsenerf
	multiplicative_slowdown = 0.8 //lasts for a while

/datum/discipline_power/thanatosis/cold_of_the_grave/activate(mob/living/target)
	. = ..()

	owner.visible_message(span_warning("[owner] motions towards [target]."))
	if(iscarbon(target))
		var/mob/living/carbon/human/corpsebuff = target
		if(iskindred(target) || iscathayan(target) || iszombie(target)) //undead become spongier, but move slightly slower
			corpsebuff.visible_message(span_danger("[target]'s body seizes with rigor mortis."), span_danger("Your senses dull to pain and everything else."))
			corpsebuff.dna.species.brutemod = max(0.2, corpsebuff.dna.species.brutemod-0.3) //equivalent of the existing artifact
			ADD_TRAIT(corpsebuff, TRAIT_NOSOFTCRIT, NECROMANCY_TRAIT)
			ADD_TRAIT(corpsebuff, TRAIT_NOHARDCRIT, NECROMANCY_TRAIT)
			ADD_TRAIT(corpsebuff, TRAIT_IGNOREDAMAGESLOWDOWN, NECROMANCY_TRAIT)
			corpsebuff.add_movespeed_modifier(/datum/movespeed_modifier/corpsebuff)
			corpsebuff.do_jitter_animation(2 SECONDS)
		else //everyone else eats tox and CC
			corpsebuff.visible_message(span_danger("[target]'s skin grays, terrible illness gripping [target.p_their()] body."), span_userdanger("You feel terribly sick."))
			corpsebuff.vomit()
			corpsebuff.dizziness += 10
			corpsebuff.add_confusion(10)
			corpsebuff.apply_damage(50, TOX)
			corpsebuff.Stun(3 SECONDS) // ignored by tough flesh and shapeshifted werewolves
			corpsebuff.add_movespeed_modifier(/datum/movespeed_modifier/corpsenerf)
			corpsebuff.do_jitter_animation(2 SECONDS)

	else
		target.apply_damage(100, BRUTE)
		target.visible_message(span_danger("[target] shrivels up and withers!"))

/datum/discipline_power/thanatosis/cold_of_the_grave/deactivate(mob/living/target)
	. = ..()

	if(iscarbon(target))
		var/mob/living/carbon/human/corpsebuff = target
		if(iskindred(target) || iscathayan(target))
			corpsebuff.visible_message(span_notice("[target]'s body regains its luster."), span_notice("Feeling comes flooding back into your body."))
			corpsebuff.dna.species.brutemod = initial(corpsebuff.dna.species.brutemod)
			REMOVE_TRAIT(corpsebuff, TRAIT_NOSOFTCRIT, NECROMANCY_TRAIT)
			REMOVE_TRAIT(corpsebuff, TRAIT_NOHARDCRIT, NECROMANCY_TRAIT)
			REMOVE_TRAIT(corpsebuff, TRAIT_IGNOREDAMAGESLOWDOWN, NECROMANCY_TRAIT)
			corpsebuff.remove_movespeed_modifier(/datum/movespeed_modifier/corpsebuff)
		else
			corpsebuff.remove_movespeed_modifier(/datum/movespeed_modifier/corpsenerf)
			corpsebuff.visible_message(span_notice("[target]'s body regains its luster."), span_notice("Your unnatural ailing abates."))


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
	var/limit = 2 + owner.social + owner.more_companions - 1
	var/diff = limit - length(owner.beastmaster)
	if (target.stat == DEAD)
		if(diff <= 0)
			to_chat(owner, span_warning("The vitae cools - you cannot extend your will to any more followers."))
			return
		if(!length(owner.beastmaster))
			var/datum/action/beastmaster_stay/stay_action = new()
			stay_action.Grant(owner)
			var/datum/action/beastmaster_deaggro/deaggro_action = new()
			deaggro_action.Grant(owner)

		owner.visible_message(span_warning("[owner] gestures over [target]'s carcass."))
		target.visible_message(span_danger("[target] twitches and rises, puppeteered by an invisible force."))
		if(iscarbon(target))
			var/mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/zombie = new /mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/level4(owner.loc)
			zombie.my_creator = owner
			owner.beastmaster |= zombie
			zombie.beastmaster_owner = owner
			qdel(target)
		else
			switch(target.maxHealth)
				if (-INFINITY to 20) //rats and whatnot
					var/mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/zombie = new /mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/level2(owner.loc)
					zombie.my_creator = owner
					owner.beastmaster |= zombie
					zombie.beastmaster_owner = owner
					qdel(target)
				if (20 to 70) //cats and whatnot
					var/mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/zombie = new /mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/level3(owner.loc)
					zombie.my_creator = owner
					owner.beastmaster |= zombie
					zombie.beastmaster_owner = owner
					qdel(target)
				if (70 to 150) //dogs/biters and whatnot
					var/mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/zombie = new /mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/level4(owner.loc)
					zombie.my_creator = owner
					owner.beastmaster |= zombie
					zombie.beastmaster_owner = owner
					qdel(target)
				if (150 to INFINITY) //szlachta and whatnot
					var/mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/zombie = new /mob/living/simple_animal/hostile/beastmaster/giovanni_zombie/level5(owner.loc)
					zombie.my_creator = owner
					owner.beastmaster |= zombie
					zombie.beastmaster_owner = owner
					qdel(target)

	else if(iszombie(target))
		owner.visible_message(span_warning("[owner] aggressively gestures at [target]!"))
		target.visible_message(span_warning("[target]'s flesh knits together'!"), span_danger("Your rotten flesh reconstitutes!"))
		var/mob/living/carbon/human/zombie = target
		zombie.heal_ordered_damage(120, list(BRUTE, TOX, BURN, CLONE, OXY, BRAIN))
		zombie.bloodpool = min(zombie.maxbloodpool, zombie.bloodpool+3)
		if(length(zombie.all_wounds))
			var/datum/wound/wound = pick(zombie.all_wounds)
			wound.remove_wound()
	else
		owner.visible_message(span_warning("[owner] aggressively gestures at [target]!"))
		target.visible_message(span_warning("[target] is assaulted by necromantic energies!"), span_danger("You feel yourself rot from within!"))
		target.apply_damage(55, CLONE, owner.zone_selected) // 1/5 of a 5-dot "healthbar" in aggravated damage, on level with thaumaturgy's average output
		target.emote("scream")
