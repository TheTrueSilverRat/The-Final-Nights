//Currently this is set as a child object of the parent discipline as just in case I need to do extra stuff that should only be done to KJs

/datum/discipline/kj_discipline
	/* CUSTOMIZABLE */
	///Name of this Discipline.
	name = "Discipline name"
	///Text description of this Discipline.
	desc = "Discipline description"
	///Icon for this Discipline as in code/modules/wod13/UI/kuei_jin.dmi
	icon_state
	///Due to the nature of KJs, no concept of clan_restricted should exist. Although theoretically this could work for specific stuff like Prayer-eating and Tainted Shintais for Heretical Dharmas
	clan_restricted = FALSE
	///The root type of the powers this Discipline uses.
	power_type = /datum/discipline_power
	///If this Discipline can be selected at all, or has special handling.
	selectable = TRUE
	///Needed for the buying of disciplines (The options are Shintai, Demon, and Chi. Case Sensitive)
	var/discipline_type = "Demon"
	///These are only for displaying stuff in preferences or character creation menu
	///How many Yin Chi Points this discipline costs to use
	var/yin_cost = 0
	///How many Yang Chi Points this discipline costs to use
	var/yang_cost = 0
	///How many Demon Chi Points this discipline costs to use
	var/demon_cost = 0
