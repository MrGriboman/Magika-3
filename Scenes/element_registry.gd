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

func _init() -> void:
	FIRE.element_name = "fire"
	FIRE.element_dmg = 100.0
	FIRE.opposites = [FROST]
	FIRE.combinations = {'water': STEAM, 'ice': WATER}

	WATER.element_name = "water"
	WATER.element_dmg = 90.0
	WATER.opposites = [LIGHTNING]
	WATER.combinations = {'fire': STEAM, 'frost': ICE}

	LIFE.element_name = "life"
	LIFE.element_dmg = 80.0
	LIFE.opposites = [DEATH]

	SHIELD.element_name = "shield"
	SHIELD.element_dmg = 70.0
	SHIELD.opposites = [SHIELD]

	FROST.element_name = "frost"
	FROST.element_dmg = 85.0
	FROST.opposites = [FIRE]
	FROST.combinations = {'water': ICE, 'steam': WATER}

	LIGHTNING.element_name = "lightning"
	LIGHTNING.element_dmg = 95.0
	LIGHTNING.opposites = [WATER, ROCK]

	DEATH.element_name = "death"
	DEATH.element_dmg = 110.0
	DEATH.opposites = [LIFE]

	ROCK.element_name = "rock"
	ROCK.element_dmg = 120.0
	ROCK.opposites = [LIGHTNING]
	
	STEAM.element_name = "steam"
	STEAM.element_dmg = 100.0
	STEAM.combinations = {'frost': WATER}
	
	ICE.element_name = "ice"
	ICE.element_dmg = 100.0
	ICE.combinations = {'fire': WATER}
