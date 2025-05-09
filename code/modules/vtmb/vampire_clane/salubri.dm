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
	desc = "Close the Third Eye."
	button_icon_state = "auspex"
	button_icon = 'code/modules/wod13/UI/actions.dmi'
	background_icon_state = "discipline"
	icon_icon = 'code/modules/wod13/UI/actions.dmi'
	check_flags = AB_CHECK_CONSCIOUS

/datum/action/salubri_eye/Trigger()
	if(istype(owner, /mob/living/carbon/human))
		var/mob/living/carbon/human/user = usr


		if(!(HAS_TRAIT(user, TRAIT_EYE_OPEN)))
			var/obj/item/organ/eyes/salubri/eyes = new()
			eyes.Insert(user, TRUE, FALSE)
			user.visible_message("<span class='danger'>[owner] sprouts a Third Eye on their Forehead!</span>", "<span class='userdanger'>Your third eye forcibly awakens!</span>")
			user.update_body()
			ADD_TRAIT(user, TRAIT_EYE_OPEN, SALUBRI_EYE_TRAIT)
			return
		if(HAS_TRAIT(user, TRAIT_EYE_OPEN))
			var/obj/item/organ/eyes/eyes = new()
			eyes.Insert(user, TRUE, FALSE)
			user.visible_message("<span class='danger'>[owner]'s Third Eye sinks back into their head</span>", "<span class='userdanger'>You close your third eye!</span>")
			user.update_body()
			REMOVE_TRAIT(user, TRAIT_EYE_OPEN, SALUBRI_EYE_TRAIT)
			return
