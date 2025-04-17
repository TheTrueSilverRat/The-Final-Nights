
/datum/discipline/chi_discipline/hellweaving
	name = "Hellweaving"
	desc = "Chi Discipline hellweaving."
	icon_state = "hellweaving"
	power_type = /datum/discipline_power/chi_discipline_power/hellweaving

/datum/discipline_power/chi_discipline_power/hellweaving
	name = "Chi power name"
	desc = "Chi power description"

	activate_sound = "code/modules/wod13/sounds/hellweaving_activate.ogg"

/atom/movable/screen/fullscreen/yomi_world
	icon = 'icons/hud/fullscreen.dmi'
	icon_state = "hall"
	layer = CURSE_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/yomi_world/Initialize()
	. = ..()
	dir = pick(NORTH, EAST, WEST, SOUTH, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/effect/particle_effect/smoke/bad/yomi
	name = "dark red smoke"
	color = "#6f0000"
	opaque = FALSE

/datum/effect_system/smoke_spread/bad/yomi
	effect_type = /obj/effect/particle_effect/smoke/bad/yomi

/obj/effect/particle_effect/smoke/bad/yomi/smoke_mob(mob/living/carbon/inhaling_mob)
	. = ..()
	if(.)
		inhaling_mob.adjustCloneLoss(10, TRUE)
		inhaling_mob.emote(pick("scream", "groan", "cry"))
		return TRUE

/datum/movespeed_modifier/yomi_flashback
	multiplicative_slowdown = 6

//HELLWEAVING 1
/datum/discipline_power/chi_discipline_power/hellweaving/one
	name = "Chi power name 1"
	desc = "HChi power description"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS


	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/hellweaving/two,
		/datum/discipline_power/chi_discipline_power/hellweaving/three,
		/datum/discipline_power/chi_discipline_power/hellweaving/four,
		/datum/discipline_power/chi_discipline_power/hellweaving/five
	)

/datum/discipline_power/chi_discipline_power/hellweaving/one/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/hellweaving/one/deactivate()
	. = ..()


//HELLWEAVING 2
/datum/discipline_power/chi_discipline_power/hellweaving/two
	name = "Fortitude 2"
	desc = "Become as stone. Let nothing breach your protections."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS


	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/hellweaving/one,
		/datum/discipline_power/chi_discipline_power/hellweaving/three,
		/datum/discipline_power/chi_discipline_power/hellweaving/four,
		/datum/discipline_power/chi_discipline_power/hellweaving/five
	)

/datum/discipline_power/chi_discipline_power/hellweaving/two/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/hellweaving/two/deactivate()
	. = ..()

//HELLWEAVING 3
/datum/discipline_power/chi_discipline_power/hellweaving/three
	name = "Fortitude 3"
	desc = "Look down upon those who would try to kill you. Shrug off grievous attacks."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS


	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/hellweaving/one,
		/datum/discipline_power/chi_discipline_power/hellweaving/two,
		/datum/discipline_power/chi_discipline_power/hellweaving/four,
		/datum/discipline_power/chi_discipline_power/hellweaving/five
	)

/datum/discipline_power/chi_discipline_power/hellweaving/three/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/hellweaving/three/deactivate()
	. = ..()

//HELLWEAVING 4
/datum/discipline_power/chi_discipline_power/hellweaving/four
	name = "Fortitude 4"
	desc = "Be like steel. Walk into fire and come out only singed."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS


	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/hellweaving/one,
		/datum/discipline_power/chi_discipline_power/hellweaving/two,
		/datum/discipline_power/chi_discipline_power/hellweaving/three,
		/datum/discipline_power/chi_discipline_power/hellweaving/five
	)

/datum/discipline_power/chi_discipline_power/hellweaving/four/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/hellweaving/four/deactivate()
	. = ..()

//HELLWEAVING 5
/datum/discipline_power/chi_discipline_power/hellweaving/five
	name = "Fortitude 5"
	desc = "Reach the pinnacle of toughness. Never fear anything again."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS


	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/hellweaving/one,
		/datum/discipline_power/chi_discipline_power/hellweaving/two,
		/datum/discipline_power/chi_discipline_power/hellweaving/three,
		/datum/discipline_power/chi_discipline_power/hellweaving/four
	)

/datum/discipline_power/chi_discipline_power/hellweaving/five/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/hellweaving/five/deactivate()
	. = ..()

