/datum/vampireclane/salubri
	name = CLAN_SALUBRI
	desc = "The Salubri are one of the original 13 clans of the vampiric descendants of Caine. Salubri believe that vampiric existence is torment from which Golconda or death is the only escape. Consequently, the modern Salubri would Embrace, teach a childe the basics of the route, leave clues for the childe to follow to achieve Golconda, and then have their childe diablerize them."
	curse = "Hunted and consensual feeding."
	clane_disciplines = list(
		/datum/discipline/auspex,
		/datum/discipline/fortitude,
		/datum/discipline/valeren
	)
	male_clothes = /obj/item/clothing/under/vampire/salubri
	female_clothes = /obj/item/clothing/under/vampire/salubri/female
	whitelisted = FALSE
	clan_keys = /obj/item/vamp/keys/salubri

/*
/datum/action/salubri_eye
	name = "Close/Open the Third Eye"
	desc = "Decide whether to Close or Open the Third Eye."
	button_icon_state = "auspex"
	button_icon = 'code/modules/wod13/UI/actions.dmi'
	background_icon_state = "discipline"
	icon_icon = 'code/modules/wod13/UI/actions.dmi'
	check_flags = AB_CHECK_CONSCIOUS

/datum/action/salubri_eye/Trigger()
	if(istype(owner, /mob/living/carbon/human))
		var/mob/living/carbon/human/user = owner

/*
		var/new_form = input(user, "Choose your Demon Form", "Demon Form") as null|anything in list("Samurai", "Tentacles", "Demon", "Giant", "Foul")
		if(new_form)
			to_chat(user, "Your new form is [new_form].")
			for(var/datum/action/chi_discipline/chi_action in user.actions)
				if(chi_action)
					if(istype(chi_action.discipline, /datum/chi_discipline/demon_shintai))
						var/datum/chi_discipline/demon_shintai/demon_shintai = chi_action.discipline
						demon_shintai.current_form = new_form*/
		button.color = "#970000"
		animate(button, color = "#ffffff", time = 2 SECONDS, loop = 1)
*/
