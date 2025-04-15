//This is just an example DM format for making it easier when copy-pasting shizzle for refactoring the disciplines

/*
/datum/chi_discipline/example
	name = "Chi Discipline"
	desc = "Chi Discipline example."
	icon_state = "fortitude"
	power_type = /datum/chi_discipline_power/example

/datum/chi_discipline_power/example
	name = "Chi power name"
	desc = "Chi power description"

	activate_sound
	deactivate_sound =

//FORTITUDE 1
/datum/chi_discipline_power/example/one
	name = "Chi power name 1"
	desc = "HChi power description"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/example/two,
		/datum/chi_discipline_power/example/three,
		/datum/chi_discipline_power/example/four,
		/datum/chi_discipline_power/example/five
	)

/datum/chi_discipline_power/example/one/activate()
	. = ..()


/datum/chi_discipline_power/example/one/deactivate()
	. = ..()


//FORTITUDE 2
/datum/chi_discipline_power/example/two
	name = "Fortitude 2"
	desc = "Become as stone. Let nothing breach your protections."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/example/one,
		/datum/chi_discipline_power/example/three,
		/datum/chi_discipline_power/example/four,
		/datum/chi_discipline_power/example/five
	)

/datum/chi_discipline_power/example/two/activate()
	. = ..()


/datum/chi_discipline_power/example/two/deactivate()
	. = ..()

//FORTITUDE 3
/datum/chi_discipline_power/example/three
	name = "Fortitude 3"
	desc = "Look down upon those who would try to kill you. Shrug off grievous attacks."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/example/one,
		/datum/chi_discipline_power/example/two,
		/datum/chi_discipline_power/example/four,
		/datum/chi_discipline_power/example/five
	)

/datum/chi_discipline_power/example/three/activate()
	. = ..()

/datum/chi_discipline_power/example/three/deactivate()
	. = ..()

//FORTITUDE 4
/datum/chi_discipline_power/example/four
	name = "Fortitude 4"
	desc = "Be like steel. Walk into fire and come out only singed."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/example/one,
		/datum/chi_discipline_power/example/two,
		/datum/chi_discipline_power/example/three,
		/datum/chi_discipline_power/example/five
	)

/datum/chi_discipline_power/example/four/activate()
	. = ..()

/datum/chi_discipline_power/example/four/deactivate()
	. = ..()

//FORTITUDE 5
/datum/chi_discipline_power/example/five
	name = "Fortitude 5"
	desc = "Reach the pinnacle of toughness. Never fear anything again."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/chi_discipline_power/example/one,
		/datum/chi_discipline_power/example/two,
		/datum/chi_discipline_power/example/three,
		/datum/chi_discipline_power/example/four
	)

/datum/chi_discipline_power/example/five/activate()
	. = ..()

/datum/chi_discipline_power/example/five/deactivate()
	. = ..()

*/
