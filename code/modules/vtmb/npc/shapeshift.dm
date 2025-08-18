

/mob/living/simple_animal/hostile/shapeshift //Only used for Shapeshifting
	speed = -0.50
	maxHealth = 200
	health = 200
	harm_intent_damage = 20
	melee_damage_lower = 24
	melee_damage_upper = 42
	melee_damage_type = CLONE
	damage_coeff = list(BRUTE = 0.5, BURN = 2, TOX = 1, CLONE = 1, STAMINA = 0, OXY = 0)
	name = "dog"
	desc = "Woof-woof."
	icon = 'code/modules/wod13/mobs.dmi'
	icon_state = "dog"
	icon_living = "dog"
	icon_dead = "dog_dead"
	del_on_death = 1
	footstep_type = FOOTSTEP_MOB_CLAW
	mob_biotypes = MOB_ORGANIC
	speak_chance = 0
	turns_per_move = 1
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'code/modules/wod13/sounds/dog.ogg'
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	bloodpool = 2
	maxbloodpool = 2
	loot = list()
	AIStatus = AI_OFF

/mob/living/simple_animal/hostile/shapeshift/dog
	name = "Black Dog"
	desc = "Woof."
	icon = 'code/modules/wod13/werewolf_lupus.dmi'
	icon_state = "black"
	icon_living = "black"
	icon_dead = "black_rest"

/mob/living/simple_animal/hostile/shapeshift/dog/gray
	name = "Grey Dog"
	desc = "Standing strong despite its age."
	icon_state = "gray"
	icon_living = "gray"
	icon_dead = "gray_rest"

/mob/living/simple_animal/hostile/shapeshift/dog/red
	name = "Red Dog"
	desc = "You feel like it wants to be collared."
	icon_state = "red"
	icon_living = "red"
	icon_dead = "red_rest"

/mob/living/simple_animal/hostile/shapeshift/dog/white
	name = "Albino Dog"
	desc = "Fur sleek as snow."
	icon_state = "white"
	icon_living = "white"
	icon_dead = "white_rest"

/mob/living/simple_animal/hostile/shapeshift/dog/ginger
	name = "Ginger Dog"
	desc = "You see no souls in its eyes."
	icon_state = "ginger"
	icon_living = "ginger"
	icon_dead = "ginger_rest"

/mob/living/simple_animal/hostile/shapeshift/dog/brown
	name = "Brown Wolf"
	desc = "Howling and Snarling."
	icon_state = "brown"
	icon_living = "brown"
	icon_dead = "brown_rest"


/mob/living/simple_animal/hostile/shapeshift/wolf
	name = "Black Wolf"
	desc = "Howling and Snarling."
	icon = 'code/modules/wod13/tfn_lupus.dmi'
	icon_state = "black"
	icon_living = "black"
	icon_dead = "black_rest"

/mob/living/simple_animal/hostile/shapeshift/wolf/gray
	name = "Gray Wolf"
	desc = "Howling and Snarling."
	icon_state = "gray"
	icon_living = "gray"
	icon_dead = "gray_rest"

/mob/living/simple_animal/hostile/shapeshift/wolf/red
	name = "Red Wolf"
	desc = "Howling and Snarling."
	icon_state = "red"
	icon_living = "red"
	icon_dead = "red_rest"

/mob/living/simple_animal/hostile/shapeshift/wolf/white
	name = "White Wolf"
	desc = "The Most Malicious Wolf."
	icon_state = "white"
	icon_living = "white"
	icon_dead = "white_rest"

/mob/living/simple_animal/hostile/shapeshift/wolf/ginger
	name = "Ginger Wolf"
	desc = "You see no souls in its eyes."
	icon_state = "ginger"
	icon_living = "ginger"
	icon_dead = "ginger_rest"

/mob/living/simple_animal/hostile/shapeshift/wolf/brown
	name = "Brown Wolf"
	desc = "Howling and Snarling."
	icon_state = "brown"
	icon_living = "brown"
	icon_dead = "brown_rest"
