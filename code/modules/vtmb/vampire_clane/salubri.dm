/datum/vampireclane/salubri
	name = CLAN_SALUBRI
	desc = "The Salubri are one of the original 13 clans of the vampiric descendants of Caine. Salubri believe that vampiric existence is torment from which Golconda or death is the only escape. Consequently, the modern Salubri would Embrace, teach a childe the basics of the route, leave clues for the childe to follow to achieve Golconda, and then have their childe diablerize them."
	curse = "Hunted and consensual feeding."
	clane_disciplines = list(
		/datum/discipline/auspex,
		/datum/discipline/fortitude,
		/datum/discipline/valeren
	)
	common_disciplines = list(/datum/discipline/valeren_warrior)
	male_clothes = /obj/item/clothing/under/vampire/salubri
	female_clothes = /obj/item/clothing/under/vampire/salubri/female
	whitelisted = FALSE
	clan_keys = /obj/item/vamp/keys/salubri
	salubri = TRUE


/datum/action/salubri_eye
	name = "Close the Third Eye"
	desc = "Decide whether to Close or Open the Third Eye."
	button_icon_state = "auspex"
	button_icon = 'code/modules/wod13/UI/actions.dmi'
	background_icon_state = "discipline"
	icon_icon = 'code/modules/wod13/UI/actions.dmi'
	check_flags = AB_CHECK_CONSCIOUS

/datum/action/salubri_eye/Trigger()
	if(istype(owner, /mob/living/carbon/human))
		var/mob/living/carbon/human/user = usr

		if(do_after(user, 5 SECONDS))
			if(!(user.salubri_eye))
				to_chat(owner, span_warning("You already have an open eye"))
			if(user.salubri_eye)
				var/obj/item/organ/eyes/eyes = new()
				eyes.Insert(user, TRUE, FALSE)
				if(user.base_body_mod == "f")
					user.base_body_mod = ""
				user.update_body()
				user.salubri_eye = FALSE
