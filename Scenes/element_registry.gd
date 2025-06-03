extends Node2D
class_name ElementReg

var FIRE = Element.new()
var WATER = Element.new()
var LIFE = Element.new()
var SHIELD = Element.new()
var FROST = Element.new()
var LIGHTNING = Element.new()
var DEATH = Element.new()
var ROCK = Element.new()

var STEAM = Element.new()
var ICE = Element.new()

var action_map
var types

func _init() -> void:
	FIRE.element_name = "fire"
	FIRE.element_dmg = 100.0
	FIRE.opposites = [FROST]
	FIRE.combinations = {'water': STEAM, 'ice': WATER}
	FIRE.type = 'spray'

	WATER.element_name = "water"
	WATER.element_dmg = 90.0
	WATER.opposites = [LIGHTNING]
	WATER.combinations = {'fire': STEAM, 'frost': ICE}
	WATER.type = 'spray'

	LIFE.element_name = "life"
	LIFE.element_dmg = 80.0
	LIFE.opposites = [DEATH]
	LIFE.type = 'beam'

	SHIELD.element_name = "shield"
	SHIELD.element_dmg = 70.0
	SHIELD.opposites = [SHIELD]
	SHIELD.type = 'shield'

	FROST.element_name = "frost"
	FROST.element_dmg = 85.0
	FROST.opposites = [FIRE]
	FROST.combinations = {'water': ICE, 'steam': WATER}
	FROST.type = 'spray'

	LIGHTNING.element_name = "lightning"
	LIGHTNING.element_dmg = 95.0
	LIGHTNING.opposites = [WATER, ROCK]
	LIGHTNING.type = 'lightning'

	DEATH.element_name = "death"
	DEATH.element_dmg = 110.0
	DEATH.opposites = [LIFE]
	DEATH.type = 'beam'

	ROCK.element_name = "rock"
	ROCK.element_dmg = 120.0
	ROCK.opposites = [LIGHTNING]
	ROCK.type = 'projectile'
	
	STEAM.element_name = "steam"
	STEAM.element_dmg = 100.0
	STEAM.combinations = {'frost': WATER}
	STEAM.type = 'steam_spray'
	
	ICE.element_name = "ice"
	ICE.element_dmg = 100.0
	ICE.combinations = {'fire': WATER}
	ICE.type = 'projectile'
	
	action_map = {
		"conj_fire": FIRE,
		"conj_water": WATER,
		"conj_life": LIFE,
		"conj_shield": SHIELD,
		"conj_frost": FROST,
		"conj_elec": LIGHTNING,
		"conj_death": DEATH,
		"conj_rock": ROCK
	}
