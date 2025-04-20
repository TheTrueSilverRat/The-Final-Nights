
/datum/discipline/chi_discipline/kiai
	name = "Kiai"
	desc = "Manipulate reality by voice."
	icon_state = "kiai"
	power_type = /datum/discipline_power/chi_discipline_power/kiai

/datum/discipline_power/chi_discipline_power/kiai
	name = "Kiai"
	desc = "Manipulate reality by voice."
	activate_sound =
	deactivate_sound =

/datum/movespeed_modifier/kiai
	multiplicative_slowdown = -0.3

/mob/living/carbon/human/proc/combat_to_caster()
	walk(src, 0)
	if(!CheckFrenzyMove())
		set_glide_size(DELAY_TO_GLIDE_SIZE(total_multiplicative_slowdown()))
		step_to(src,caster,0)
		face_atom(caster)
		a_intent = INTENT_HARM
		drop_all_held_items()
		UnarmedAttack(caster)

/datum/discipline_power/kiai/proc/kiai_check(mob/living/carbon/human/owner, mob/living/target, tiebreaker = FALSE) //These checks are common to all applications of Dominate.
	var/sound_gender = 'code/modules/wod13/sounds/kiai_male.ogg'
	switch(caster.gender)
		if(MALE)
			sound_gender = 'code/modules/wod13/sounds/kiai_male.ogg'
		if(FEMALE)
			sound_gender = 'code/modules/wod13/sounds/kiai_female.ogg'

	var/mypower = caster.get_total_social()
	var/theirpower = target.get_total_mentality()
	var/total_power = 1 //The proportion of your Social to their Mentality. Higher social means higher total_power and higher effect. If this is 1 or more, our social is at least as high as their mentality

	if((theirpower >= mypower) && !tiebreaker || (theirpower > mypower))
		to_chat(owner, span_warning("[target]'s mind is too powerful to kiai!"))
		return FALSE

	return TRUE

//KIAI 1
/datum/discipline_power/chi_discipline_power/kiai/one
	name = "Chi power name 1"
	desc = "HChi power description"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/kiai/two,
		/datum/discipline_power/chi_discipline_power/kiai/three,
		/datum/discipline_power/chi_discipline_power/kiai/four,
		/datum/discipline_power/chi_discipline_power/kiai/five
	)


/datum/discipline_power/chi_discipline_power/kiai/one/pre_activation_checks(mob/living/target)
	return kiai_check(owner, target)

/datum/discipline_power/dominate/command/activate(mob/living/target)

/datum/discipline_power/chi_discipline_power/kiai/one/activate()
	. = ..()
	playsound(caster.loc, sound_gender, 100, FALSE)
	caster.visible_message("<span class='danger'>[caster] SCREAMS!</span>")

/datum/discipline_power/chi_discipline_power/kiai/one/deactivate()
	. = ..()


//KIAI 2
/datum/discipline_power/chi_discipline_power/kiai/two
	name = "Fortitude 2"
	desc = "Become as stone. Let nothing breach your protections."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/kiai/one,
		/datum/discipline_power/chi_discipline_power/kiai/three,
		/datum/discipline_power/chi_discipline_power/kiai/four,
		/datum/discipline_power/chi_discipline_power/kiai/five
	)

/datum/discipline_power/chi_discipline_power/kiai/two/pre_activation_checks(mob/living/target)
	return kiai_check(owner, target)

/datum/discipline_power/chi_discipline_power/kiai/two/activate()
	. = ..()
	playsound(caster.loc, sound_gender, 100, FALSE)
	caster.visible_message("<span class='danger'>[caster] SCREAMS!</span>")

/datum/discipline_power/chi_discipline_power/kiai/two/deactivate()
	. = ..()

//KIAI 3
/datum/discipline_power/chi_discipline_power/kiai/three
	name = "Fortitude 3"
	desc = "Look down upon those who would try to kill you. Shrug off grievous attacks."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/kiai/one,
		/datum/discipline_power/chi_discipline_power/kiai/two,
		/datum/discipline_power/chi_discipline_power/kiai/four,
		/datum/discipline_power/chi_discipline_power/kiai/five
	)

/datum/discipline_power/chi_discipline_power/kiai/three/pre_activation_checks(mob/living/target)
	return kiai_check(owner, target)

/datum/discipline_power/chi_discipline_power/kiai/three/activate()
	. = ..()
	playsound(caster.loc, sound_gender, 100, FALSE)
	caster.visible_message("<span class='danger'>[caster] SCREAMS!</span>")

/datum/discipline_power/chi_discipline_power/kiai/three/deactivate()
	. = ..()

//KIAI 4
/datum/discipline_power/chi_discipline_power/kiai/four
	name = "Fortitude 4"
	desc = "Be like steel. Walk into fire and come out only singed."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/kiai/one,
		/datum/discipline_power/chi_discipline_power/kiai/two,
		/datum/discipline_power/chi_discipline_power/kiai/three,
		/datum/discipline_power/chi_discipline_power/kiai/five
	)

/datum/discipline_power/chi_discipline_power/kiai/four/pre_activation_checks(mob/living/target)
	return kiai_check(owner, target)


/datum/discipline_power/chi_discipline_power/kiai/four/activate()
	. = ..()
	playsound(caster.loc, sound_gender, 100, FALSE)
	caster.visible_message("<span class='danger'>[caster] SCREAMS!</span>")

/datum/discipline_power/chi_discipline_power/kiai/four/deactivate()
	. = ..()



//KIAI 5
/datum/discipline_power/chi_discipline_power/kiai/five
	name = "Fortitude 5"
	desc = "Reach the pinnacle of toughness. Never fear anything again."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/kiai/one,
		/datum/discipline_power/chi_discipline_power/kiai/two,
		/datum/discipline_power/chi_discipline_power/kiai/three,
		/datum/discipline_power/chi_discipline_power/kiai/four
	)

/datum/discipline_power/chi_discipline_power/kiai/five/pre_activation_checks(mob/living/target)
	return kiai_check(owner, target)

/datum/discipline_power/chi_discipline_power/kiai/five/activate()
	. = ..()
	playsound(caster.loc, sound_gender, 100, FALSE)
	caster.visible_message("<span class='danger'>[caster] SCREAMS!</span>")

/datum/discipline_power/chi_discipline_power/kiai/five/deactivate()
	. = ..()


