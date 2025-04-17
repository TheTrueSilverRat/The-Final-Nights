

/datum/discipline/chi_discipline/yin_prana
	name = "Yin Prana"
	desc = "Master the Flow of your Yin Chi."
	icon_state = "Yin Prana"
	power_type = /datum/discipline_power/chi_discipline_power/yin_prana
	discipline_type = "Chi"
	cost_yin = 2

/datum/discipline_power/chi_discipline_power/yin_prana
	name = "Yin Prana"
	desc = "Master the Flow of your Yin Chi."

	activate_sound = 'code/modules/wod13/sounds/yin_prana.ogg'
	deactivate_sound = 'code/modules/wod13/sounds/yin_prana.ogg'

//Yin Prana 1
/datum/discipline_power/chi_discipline_power/yin_prana/one
	name = "Chi power name 1"
	desc = "HChi power description"

	level = 1

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/yin_prana/two,
		/datum/discipline_power/chi_discipline_power/yin_prana/three,
		/datum/discipline_power/chi_discipline_power/yin_prana/four,
		/datum/discipline_power/chi_discipline_power/yin_prana/five
	)

/datum/discipline_power/chi_discipline_power/yin_prana/one/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/yin_prana/one/deactivate()
	. = ..()


//Yin Prana 2
/datum/discipline_power/chi_discipline_power/yin_prana/two
	name = "Yin Prana 2"
	desc = "Become as stone. Let nothing breach your protections."

	level = 2

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/yin_prana/one,
		/datum/discipline_power/chi_discipline_power/yin_prana/three,
		/datum/discipline_power/chi_discipline_power/yin_prana/four,
		/datum/discipline_power/chi_discipline_power/yin_prana/five
	)

/datum/discipline_power/chi_discipline_power/yin_prana/two/activate()
	. = ..()


/datum/discipline_power/chi_discipline_power/yin_prana/two/deactivate()
	. = ..()

//Yin Prana 3
/datum/discipline_power/chi_discipline_power/yin_prana/three
	name = "Yin Prana 3"
	desc = "Look down upon those who would try to kill you. Shrug off grievous attacks."

	level = 3

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/yin_prana/one,
		/datum/discipline_power/chi_discipline_power/yin_prana/two,
		/datum/discipline_power/chi_discipline_power/yin_prana/four,
		/datum/discipline_power/chi_discipline_power/yin_prana/five
	)

/datum/discipline_power/chi_discipline_power/yin_prana/three/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/yin_prana/three/deactivate()
	. = ..()

//Yin Prana 4
/datum/discipline_power/chi_discipline_power/yin_prana/four
	name = "Yin Prana 4"
	desc = "Be like steel. Walk into fire and come out only singed."

	level = 4

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/yin_prana/one,
		/datum/discipline_power/chi_discipline_power/yin_prana/two,
		/datum/discipline_power/chi_discipline_power/yin_prana/three,
		/datum/discipline_power/chi_discipline_power/yin_prana/five
	)

/datum/discipline_power/chi_discipline_power/yin_prana/four/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/yin_prana/four/deactivate()
	. = ..()

//Yin Prana 5
/datum/discipline_power/chi_discipline_power/yin_prana/five
	name = "Yin Prana 5"
	desc = "Reach the pinnacle of toughness. Never fear anything again."

	level = 5

	check_flags = DISC_CHECK_CONSCIOUS

	toggled = TRUE
	duration_length = 2 TURNS

	grouped_powers = list(
		/datum/discipline_power/chi_discipline_power/yin_prana/one,
		/datum/discipline_power/chi_discipline_power/yin_prana/two,
		/datum/discipline_power/chi_discipline_power/yin_prana/three,
		/datum/discipline_power/chi_discipline_power/yin_prana/four
	)

/datum/discipline_power/chi_discipline_power/yin_prana/five/activate()
	. = ..()

/datum/discipline_power/chi_discipline_power/yin_prana/five/deactivate()
	. = ..()

