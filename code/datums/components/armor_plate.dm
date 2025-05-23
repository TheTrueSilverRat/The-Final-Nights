/datum/component/armor_plate
	var/amount = 0
	var/maxamount = 3
	var/upgrade_item = /obj/item/stack/sheet/animalhide/goliath_hide
	var/datum/armor/added_armor = list(MELEE = 10)
	var/upgrade_name

/datum/component/armor_plate/Initialize(_maxamount,obj/item/_upgrade_item,datum/armor/_added_armor)
	if(!isobj(parent))
		return COMPONENT_INCOMPATIBLE

	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(examine))
	RegisterSignal(parent, COMSIG_PARENT_ATTACKBY, PROC_REF(applyplate))
	RegisterSignal(parent, COMSIG_PARENT_PREQDELETED, PROC_REF(dropplates))
	if(istype(parent, /obj/vehicle/sealed/mecha/working/ripley))
		RegisterSignal(parent, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(apply_mech_overlays))

	if(_maxamount)
		maxamount = _maxamount
	if(_upgrade_item)
		upgrade_item = _upgrade_item
	if(_added_armor)
		if(islist(_added_armor))
			added_armor = getArmor(arglist(_added_armor))
		else if (istype(_added_armor, /datum/armor))
			added_armor = _added_armor
		else
			stack_trace("Invalid type [_added_armor.type] passed as _armor_item argument to armorplate component")
	else
		added_armor = getArmor(arglist(added_armor))
	var/obj/item/typecast = upgrade_item
	upgrade_name = initial(typecast.name)

/datum/component/armor_plate/proc/examine(datum/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	//upgrade_item could also be typecast here instead
	if(ismecha(parent))
		if(amount)
			if(amount < maxamount)
				examine_list += "<span class='notice'>Its armor is enhanced with [amount] [upgrade_name].</span>"
			else
				examine_list += "<span class='notice'>It's wearing a fearsome carapace entirely composed of [upgrade_name] - its pilot must be an experienced monster hunter.</span>"
		else
			examine_list += "<span class='notice'>It has attachment points for strapping monster hide on for added protection.</span>"
	else
		if(amount)
			examine_list += "<span class='notice'>It has been strengthened with [amount]/[maxamount] [upgrade_name].</span>"
		else
			examine_list += "<span class='notice'>It can be strengthened with up to [maxamount] [upgrade_name].</span>"

/datum/component/armor_plate/proc/applyplate(datum/source, obj/item/I, mob/user, params)
	SIGNAL_HANDLER

	if(!istype(I,upgrade_item))
		return
	if(amount >= maxamount)
		to_chat(user, "<span class='warning'>You can't improve [parent] any further!</span>")
		return

	if(istype(I,/obj/item/stack))
		I.use(1)
	else
		if(length(I.contents))
			to_chat(user, "<span class='warning'>[I] cannot be used for armoring while there's something inside!</span>")
			return
		qdel(I)

	var/obj/O = parent
	amount++
	O.armor = O.armor.attachArmor(added_armor)

	if(ismecha(O))
		var/obj/vehicle/sealed/mecha/R = O
		R.update_appearance()
		to_chat(user, "<span class='info'>You strengthen [R], improving its resistance against melee, bullet and laser damage.</span>")
	else
		SEND_SIGNAL(O, COMSIG_ARMOR_PLATED, amount, maxamount)
		to_chat(user, "<span class='info'>You strengthen [O], improving its resistance against melee attacks.</span>")


/datum/component/armor_plate/proc/dropplates(datum/source, force)
	SIGNAL_HANDLER

	if(ismecha(parent)) //items didn't drop the plates before and it causes erroneous behavior for the time being with collapsible helmets
		for(var/i in 1 to amount)
			new upgrade_item(get_turf(parent))

/datum/component/armor_plate/proc/apply_mech_overlays(obj/vehicle/sealed/mecha/mech, list/overlays)
	SIGNAL_HANDLER

	if(amount)
		var/overlay_string = "ripley-g"
		if(amount >= 3)
			overlay_string += "-full"
		if(!LAZYLEN(mech.occupants))
			overlay_string += "-open"
		overlays += overlay_string
