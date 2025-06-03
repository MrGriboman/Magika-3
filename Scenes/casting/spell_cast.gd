extends Node2D

var types_priority
var water_spray_scene = preload("res://Scenes/casting/spray.tscn")

func _init() -> void:
	types_priority = {
		'spray': 0,
		'lightning': 1,
		'steam_spray': 2,
		'beam': 3,
		'projectile': 4,
		'shield': 5
	}
	
func get_type_of_spell(spell_queue: Array) -> String:
	var type_of_spell = 'spray'
	var max_priority = 0
	for element in spell_queue:
		if types_priority[element.type] > max_priority:
			max_priority = types_priority[element.type]
			type_of_spell = element.type
	if type_of_spell == 'steam_spray':
		type_of_spell = 'spray'
	return type_of_spell

func _on_spell_input_spell_cast(spell_queue: Variant) -> void:
	var type_of_spell = get_type_of_spell(spell_queue)
	if type_of_spell == 'spray':
		var water_spray = water_spray_scene.instantiate()
		add_child(water_spray)
	print(type_of_spell)
