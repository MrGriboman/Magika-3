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

func _init() -> void:
	FIRE.element_name = "fire"
	FIRE.element_dmg = 100.0

	WATER.element_name = "water"
	WATER.element_dmg = 90.0

	LIFE.element_name = "life"
	LIFE.element_dmg = 80.0

	SHIELD.element_name = "shield"
	SHIELD.element_dmg = 70.0

	FROST.element_name = "frost"
	FROST.element_dmg = 85.0

	LIGHTNING.element_name = "lightning"
	LIGHTNING.element_dmg = 95.0

	DEATH.element_name = "death"
	DEATH.element_dmg = 110.0

	ROCK.element_name = "rock"
	ROCK.element_dmg = 120.0
