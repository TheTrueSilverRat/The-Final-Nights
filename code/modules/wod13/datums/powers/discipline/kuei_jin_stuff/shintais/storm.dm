/*
/datum/discipline/chi_discipline/storm
	name = "Chi Discipline"
	desc = "Chi Discipline storm."
	icon_state = "fortitude"
	power_type = /datum/discipline_power/chi_discipline_power/storm

/datum/discipline_power/chi_discipline_power/storm
	name = "Chi power name"
	desc = "Chi power description"

	activate_sound
	deactivate_sound =

//FORTITUDE 1
/datum/discipline_power/chi_discipline_power/storm/one
	name = "Chi power name 1"
	desc = "HChi power description"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/storm/two,
		/datum/discipline_power/chi_discipline_power/storm/three,
		/datum/discipline_power/chi_discipline_power/storm/four,
		/datum/discipline_power/chi_discipline_power/storm/five
	)

/datum/discipline_power/chi_discipline_power/storm/one/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/storm/one/deactivate()
	. = ..()


//FORTITUDE 2
/datum/discipline_power/chi_discipline_power/storm/two
	name = "Fortitude 2"
	desc = "Become as stone. Let nothing breach your protections."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/storm/one,
		/datum/discipline_power/chi_discipline_power/storm/three,
		/datum/discipline_power/chi_discipline_power/storm/four,
		/datum/discipline_power/chi_discipline_power/storm/five
	)

/datum/discipline_power/chi_discipline_power/storm/two/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/storm/two/deactivate()
	. = ..()

//FORTITUDE 3
/datum/discipline_power/chi_discipline_power/storm/three
	name = "Fortitude 3"
	desc = "Look down upon those who would try to kill you. Shrug off grievous attacks."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/storm/one,
		/datum/discipline_power/chi_discipline_power/storm/two,
		/datum/discipline_power/chi_discipline_power/storm/four,
		/datum/discipline_power/chi_discipline_power/storm/five
	)

/datum/discipline_power/chi_discipline_power/storm/three/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/storm/three/deactivate()
	. = ..()

//FORTITUDE 4
/datum/discipline_power/chi_discipline_power/storm/four
	name = "Fortitude 4"
	desc = "Be like steel. Walk into fire and come out only singed."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/storm/one,
		/datum/discipline_power/chi_discipline_power/storm/two,
		/datum/discipline_power/chi_discipline_power/storm/three,
		/datum/discipline_power/chi_discipline_power/storm/five
	)

/datum/discipline_power/chi_discipline_power/storm/four/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/storm/four/deactivate()
	. = ..()

//FORTITUDE 5
/datum/discipline_power/chi_discipline_power/storm/five
	name = "Fortitude 5"
	desc = "Reach the pinnacle of toughness. Never fear anything again."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/storm/one,
		/datum/discipline_power/chi_discipline_power/storm/two,
		/datum/discipline_power/chi_discipline_power/storm/three,
		/datum/discipline_power/chi_discipline_power/storm/four
	)

/datum/discipline_power/chi_discipline_power/storm/five/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/storm/five/deactivate()
	. = ..()
*/
