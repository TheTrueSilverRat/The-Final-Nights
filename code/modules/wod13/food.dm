/obj/item/food/vampire
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	w_class = WEIGHT_CLASS_SMALL
	eatsound = 'code/modules/wod13/sounds/eat.ogg'
	var/biten = FALSE

/obj/item/food/vampire/proc/got_biten()
	if(biten == FALSE)
		biten = TRUE
		icon_state = "[icon_state]-biten"
//----------FAST FOOD--------///
/obj/item/food/vampire/burger
	name = "burger"
	desc = "The cornerstone of every american trucker's breakfast."
	icon_state = "burger"
	bite_consumption = 3
	tastes = list("bun" = 2, "beef patty" = 4)
	foodtypes = GRAIN | MEAT
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 1)
	eat_time = 15

/obj/item/food/vampire/donut
	name = "donut"
	desc = "Goes great with robust coffee."
	icon_state = "donut1"
	bite_consumption = 5
	tastes = list("donut" = 1)
	foodtypes = JUNKFOOD | GRAIN | FRIED | SUGAR | BREAKFAST
	food_flags = FOOD_FINGER_FOOD
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/sugar = 3)

/obj/item/food/vampire/donut/Initialize()
	. = ..()
	icon_state = "donut[rand(1, 3)]"

/obj/item/food/vampire/pizza
	name = "square pizza slice"
	desc = "A nutritious slice of pizza."
	icon_state = "pizza"
	food_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("crust" = 1, "tomato" = 1, "cheese" = 1, "meat" = 1)
	foodtypes = GRAIN | VEGETABLES | DAIRY | MEAT

/obj/item/food/vampire/taco
	name = "taco"
	desc = "A traditional cornshell taco with meat, cheese, and lettuce."
	icon_state = "taco"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	tastes = list("taco" = 4, "meat" = 2, "cheese" = 2, "lettuce" = 1)
	foodtypes = MEAT | DAIRY | GRAIN | VEGETABLES

/obj/item/trash/vampirenugget
	name = "chicken wing bone"
	icon_state = "nugget0"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'

/obj/item/food/vampire/nugget
	name = "chicken wing"
	desc = "Big Wing for a big man."
	icon_state = "nugget1"
	trash_type = /obj/item/trash/vampirenugget
	bite_consumption = 1
	tastes = list("chicken" = 1)
	foodtypes = MEAT
	food_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/protein = 3)
	eat_time = 15

//--------PACKAGED SNACKS-----------//

/obj/item/trash/vampirebar
	name = "chocolate bar wrapper"
	icon_state = "bar0"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'

/obj/item/food/vampire/bar
	name = "chocolate bar"
	desc = "A fast way to reduce hunger."
	icon_state = "bar2"
	food_reagents = list(/datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/nutriment = 1)
	junkiness = 5
	trash_type = /obj/item/trash/vampirebar
	tastes = list("chocolate" = 1)
	food_flags = FOOD_IN_CONTAINER
	foodtypes = JUNKFOOD | SUGAR

/obj/item/food/vampire/bar/proc/open_bar(mob/user)
	to_chat(user, "<span class='notice'>You pull back the wrapper of \the [src].</span>")
	playsound(user.loc, 'sound/items/foodcanopen.ogg', 50)
	icon_state = "bar1"
	reagents.flags |= OPENCONTAINER

/obj/item/food/vampire/bar/attack_self(mob/user)
	if(!is_drainable())
		open_bar(user)
	return ..()

/obj/item/food/vampire/bar/attack(mob/living/M, mob/user, def_zone)
	if (!is_drainable())
		to_chat(user, "<span class='warning'>[src]'s wrapper hasn't been opened!</span>")
		return FALSE
	return ..()

/obj/item/trash/vampirecrisps
	name = "chips wrapper"
	icon_state = "crisps0"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'

/obj/item/food/vampire/crisps
	name = "chips"
	desc = "\"Days\" chips... Crispy!"
	icon_state = "crisps2"
	trash_type = /obj/item/trash/vampirecrisps
	bite_consumption = 1
	food_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/salt = 1)
	junkiness = 10
	tastes = list("salt" = 1, "crisps" = 1)
	food_flags = FOOD_IN_CONTAINER
	foodtypes = JUNKFOOD | FRIED
	eatsound = 'code/modules/wod13/sounds/crisp.ogg'

/obj/item/food/vampire/crisps/proc/open_crisps(mob/user)
	to_chat(user, "<span class='notice'>You pull back the wrapper of \the [src].</span>")
	playsound(user.loc, 'sound/items/foodcanopen.ogg', 50)
	icon_state = "crisps1"
	reagents.flags |= OPENCONTAINER

/obj/item/food/vampire/crisps/attack_self(mob/user)
	if(!is_drainable())
		open_crisps(user)
	return ..()

/obj/item/food/vampire/crisps/attack(mob/living/M, mob/user, def_zone)
	if (!is_drainable())
		to_chat(user, "<span class='warning'>[src]'s wrapper hasn't been opened!</span>")
		return FALSE
	return ..()

/obj/item/food/vampire/icecream
	name = "ice cream"
	desc = "Taste the childhood."
	icon_state = "icecream2"
	food_reagents = list(/datum/reagent/consumable/cream = 2, /datum/reagent/consumable/vanilla = 1, /datum/reagent/consumable/sugar = 4)
	tastes = list("vanilla" = 2, "ice cream" = 2)
	foodtypes = FRUIT | DAIRY | SUGAR

/obj/item/food/vampire/icecream/chocolate
	icon_state = "icecream1"
	tastes = list("chocolate" = 2, "ice cream" = 2)
	food_reagents = list(/datum/reagent/consumable/hot_coco = 4, /datum/reagent/consumable/salt = 1,  /datum/reagent/consumable/cream = 2, /datum/reagent/consumable/vanilla = 1, /datum/reagent/consumable/sugar = 4)

/obj/item/food/vampire/icecream/berry
	icon_state = "icecream3"
	tastes = list("berry" = 2, "ice cream" = 2)
	food_reagents = list(/datum/reagent/consumable/berryjuice = 4, /datum/reagent/consumable/salt = 1,  /datum/reagent/consumable/cream = 2, /datum/reagent/consumable/vanilla = 1, /datum/reagent/consumable/sugar = 4)

//---------DRINKS---------//

/obj/item/reagent_containers/food/drinks/coffee/vampire
	name = "coffee"
	desc = "Careful, the beverage you're about to enjoy is extremely hot."
	icon_state = "coffee"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	list_reagents = list(/datum/reagent/consumable/coffee = 30)
	spillable = TRUE
	resistance_flags = FREEZE_PROOF
	isGlass = FALSE
	foodtype = BREAKFAST

/obj/item/reagent_containers/food/drinks/coffee/vampire/robust
	name = "robust coffee"
	icon_state = "coffee-alt"

/obj/item/reagent_containers/food/drinks/beer/vampire
	name = "beer"
	desc = "Beer."
	icon_state = "beer"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	list_reagents = list(/datum/reagent/consumable/ethanol/beer = 30)
	foodtype = GRAIN | ALCOHOL
	custom_price = PAYCHECK_EASY

/obj/item/reagent_containers/food/drinks/beer/vampire/blue_stripe
	name = "blue stripe"
	desc = "Blue stripe beer, brought to you by King Breweries and Distilleries!"
	icon_state = "beer_blue"
	list_reagents = list(/datum/reagent/consumable/ethanol/beer = 40, /datum/reagent/toxin/amatoxin = 10)

/obj/item/reagent_containers/food/drinks/beer/vampire/typhon
	name = "Typhon's Beer"
	desc = "A sanguine drink to sate those of vampiric tastes"
	icon_state = "typhon"
	foodtype = SANGUINE
	list_reagents = list(/datum/reagent/consumable/ethanol/beer/typhon = 30)

//I hate Flav for forcing me to add in this entire thing just so vampires can drink the damn beer

/obj/item/reagent_containers/food/drinks/beer/vampire/typhon/attack(mob/living/M, mob/user, def_zone)

	if(!reagents || !reagents.total_volume)
		to_chat(user, "<span class='warning'>[src] is empty!</span>")
		return FALSE

	if(!canconsume(M, user))
		return FALSE

	if (!is_drainable())
		to_chat(user, "<span class='warning'>[src]'s lid hasn't been opened!</span>")
		return FALSE

	if(M == user)
		user.visible_message("<span class='notice'>[user] swallows a gulp of [src].</span>", \
			"<span class='notice'>You swallow a gulp of [src].</span>")
		if(HAS_TRAIT(M, TRAIT_VORACIOUS))
			M.changeNext_move(CLICK_CD_MELEE * 0.5) //chug! chug! chug!

	else
		M.visible_message("<span class='danger'>[user] attempts to feed [M] the contents of [src].</span>", \
			"<span class='userdanger'>[user] attempts to feed you the contents of [src].</span>")
		if(!do_mob(user, M))
			return
		if(!reagents || !reagents.total_volume)
			return // The drink might be empty after the delay, such as by spam-feeding
		M.visible_message("<span class='danger'>[user] fed [M] the contents of [src].</span>", \
			"<span class='userdanger'>[user] fed you the contents of [src].</span>")
		log_combat(user, M, "fed", reagents.log_list())

	SEND_SIGNAL(src, COMSIG_DRINK_DRANK, M, user)
	var/fraction = min(gulp_size/reagents.total_volume, 1)
	reagents.trans_to(M, gulp_size, transfered_by = user, methods = VAMPIRE)
	checkLiked(fraction, M)

	playsound(M.loc,'sound/items/drink.ogg', rand(10,50), TRUE)
	if(iscarbon(M))
		var/mob/living/carbon/carbon_drinker = M
		var/list/diseases = carbon_drinker.get_static_viruses()
		if(LAZYLEN(diseases))
			var/list/datum/disease/diseases_to_add = list()
			for(var/d in diseases)
				var/datum/disease/malady = d
				if(malady.spread_flags & DISEASE_SPREAD_CONTACT_FLUIDS)
					diseases_to_add += malady
			if(LAZYLEN(diseases_to_add))
				AddComponent(/datum/component/infective, diseases_to_add)
	return TRUE

/obj/item/reagent_containers/food/drinks/bottle/vampirecola
	name = "two liter cola bottle"
	desc = "Coca cola espuma..."
	icon_state = "colared"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/consumable/space_cola = 100)
	foodtype = SUGAR
	age_restricted = FALSE

/obj/item/reagent_containers/food/drinks/bottle/vampirecola/blue
	desc = "Pep Cola. Put some pep in your step"
	list_reagents = list(/datum/reagent/consumable/space_up = 100)
	icon_state = "colablue"

/obj/item/reagent_containers/food/drinks/bottle/vampirecola/summer_thaw
	name = "summer thaw"
	desc = "A refreshing drink. Brought to you by King Breweries and Distilleries!"
	icon_state = "soda"
	list_reagents = list(/datum/reagent/consumable/space_cola = 75, /datum/reagent/medicine/muscle_stimulant = 15, /datum/reagent/toxin/amatoxin = 10)

/obj/item/reagent_containers/food/drinks/bottle/vampirecola/thaw_club
	name = "thaw club soda"
	desc = "For your energy needs. Brought to you by King Breweries and Distilleries!"
	icon_state = "soda"
	list_reagents = list(/datum/reagent/consumable/monkey_energy = 50)
	foodtype = SUGAR | JUNKFOOD

/obj/item/reagent_containers/food/drinks/bottle/vampirewater
	name = "water bottle"
	desc = "H2O."
	icon_state = "water1"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	isGlass = FALSE
	list_reagents = list(/datum/reagent/water = 100)
	age_restricted = FALSE

/obj/item/reagent_containers/food/drinks/soda_cans/vampirecola
	name = "cola"
	desc = "Coca cola espuma..."
	icon_state = "colared2"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	list_reagents = list(/datum/reagent/consumable/space_cola = 50)
	foodtype = SUGAR

/obj/item/reagent_containers/food/drinks/soda_cans/vampirecola/blue
	desc = "Pep cola. Put some Pep in your step"
	icon_state = "colablue2"
	list_reagents = list(/datum/reagent/consumable/space_up = 50)

/obj/item/reagent_containers/food/drinks/soda_cans/vampiresoda
	name = "soda"
	desc = "More water..."
	icon_state = "soda"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	list_reagents = list(/datum/reagent/consumable/sodawater = 50)
	foodtype = SUGAR

/obj/item/reagent_containers/food/condiment/vampiremilk
	name = "milk"
	desc = "More milk..."
	icon_state = "milk"
	icon = 'code/modules/wod13/items.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	list_reagents = list(/datum/reagent/consumable/milk = 50)
	fill_icon_thresholds = null

/obj/item/reagent_containers/food/condiment/vampiremilk/malk
	desc = "a carton of fish-brand milk, a subsidary of malk incorporated."

/obj/food_cart
	name = "food cart"
	desc = "Ding-aling ding dong. Get your cholesterine!"
	icon = 'code/modules/wod13/32x48.dmi'
	icon_state = "vat1"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/food_cart/Initialize()
	. = ..()
	icon_state = "vat[rand(1, 3)]"


