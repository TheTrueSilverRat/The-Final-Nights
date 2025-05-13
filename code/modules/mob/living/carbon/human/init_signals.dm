/mob/living/carbon/human/register_init_signals()
	. = ..()
	RegisterSignal(src, list(SIGNAL_ADDTRAIT(TRAIT_SALUBRI_EYE), SIGNAL_REMOVETRAIT(TRAIT_SALUBRI_EYE)), PROC_REF(on_salubri_eye))

/mob/living/carbon/human/proc/on_salubri_eye()
	SIGNAL_HANDLER


	var/datum/action/salubri_eye/salubri_opener = new()
	if(HAS_TRAIT(src, TRAIT_SALUBRI_EYE))


		if(!(HAS_TRAIT_FROM(src, TRAIT_SALUBRI_EYE_OPEN, SALUBRI_EYE_TRAIT)))
			var/obj/item/organ/eyes/salubri/salubri_eye = new()
			salubri_eye.Insert(src, TRUE, FALSE)
			salubri_opener.Grant(src)
			salubri_eye.eye_icon_state = "salubri"
			update_body()
			ADD_TRAIT(src, TRAIT_SALUBRI_EYE_OPEN, SALUBRI_EYE_TRAIT)
