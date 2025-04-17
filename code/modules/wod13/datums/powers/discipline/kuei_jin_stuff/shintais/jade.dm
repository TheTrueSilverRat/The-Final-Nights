
/datum/discipline/chi_discipline/jade
	name = "Chi Discipline"
	desc = "Chi Discipline jade."
	icon_state = "fortitude"
	power_type = /datum/discipline_power/chi_discipline_power/jade
	discipline_type = "Shintai"
	cost_yang = 1

/datum/discipline_power/chi_discipline_power/jade
	name = "Chi power name"
	desc = "Chi power description"

	activate_sound
	deactivate_sound =

/obj/item/melee/powerfist/stone
	name = "stone-fist"
	icon = 'code/modules/wod13/items.dmi'
	icon_state = "stonefist"
	desc = "A stone gauntlet to punch someone."
	item_flags = DROPDEL

//JADE 1
/datum/discipline_power/chi_discipline_power/jade/one
	name = "Chi power name 1"
	desc = "HChi power description"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/jade/two,
		/datum/discipline_power/chi_discipline_power/jade/three,
		/datum/discipline_power/chi_discipline_power/jade/four,
		/datum/discipline_power/chi_discipline_power/jade/five
	)

/datum/discipline_power/chi_discipline_power/jade/one/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/jade/one/deactivate()
	. = ..()


//JADE 2
/datum/discipline_power/chi_discipline_power/jade/two
	name = "Fortitude 2"
	desc = "Become as stone. Let nothing breach your protections."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/jade/one,
		/datum/discipline_power/chi_discipline_power/jade/three,
		/datum/discipline_power/chi_discipline_power/jade/four,
		/datum/discipline_power/chi_discipline_power/jade/five
	)

/datum/discipline_power/chi_discipline_power/jade/two/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/jade/two/deactivate()
	. = ..()

//JADE 3
/datum/discipline_power/chi_discipline_power/jade/three
	name = "Fortitude 3"
	desc = "Look down upon those who would try to kill you. Shrug off grievous attacks."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/jade/one,
		/datum/discipline_power/chi_discipline_power/jade/two,
		/datum/discipline_power/chi_discipline_power/jade/four,
		/datum/discipline_power/chi_discipline_power/jade/five
	)

/datum/discipline_power/chi_discipline_power/jade/three/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/jade/three/deactivate()
	. = ..()

//JADE 4
/datum/discipline_power/chi_discipline_power/jade/four
	name = "Fortitude 4"
	desc = "Be like steel. Walk into fire and come out only singed."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/jade/one,
		/datum/discipline_power/chi_discipline_power/jade/two,
		/datum/discipline_power/chi_discipline_power/jade/three,
		/datum/discipline_power/chi_discipline_power/jade/five
	)

/datum/discipline_power/chi_discipline_power/jade/four/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/jade/four/deactivate()
	. = ..()

//JADE 5
/datum/discipline_power/chi_discipline_power/jade/five
	name = "Fortitude 5"
	desc = "Reach the pinnacle of toughness. Never fear anything again."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/jade/one,
		/datum/discipline_power/chi_discipline_power/jade/two,
		/datum/discipline_power/chi_discipline_power/jade/three,
		/datum/discipline_power/chi_discipline_power/jade/four
	)

/datum/discipline_power/chi_discipline_power/jade/five/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/jade/five/deactivate()
	. = ..()

