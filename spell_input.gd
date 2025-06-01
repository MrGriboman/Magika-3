extends Node2D

var spell_queue = []
var elem_reg

func parse_element_name(element: Element) -> String:
	return element.element_name
	
	
func parse_elem_seq(seq: Array) -> Array:
	var human_readable_seq = []
	for elem in seq:
		human_readable_seq.append(parse_element_name(elem))
	return human_readable_seq
	

func _ready() -> void:
	elem_reg = ElementReg.new()
	
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("conj_fire"):
		print('fire')
		spell_queue.append(elem_reg.FIRE)
		print(parse_elem_seq(spell_queue))
		
	if Input.is_action_just_pressed("conj_water"):
		print("water")
		spell_queue.append(elem_reg.WATER)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_life"):
		print("life")
		spell_queue.append(elem_reg.LIFE)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_shield"):
		print("shield")
		spell_queue.append(elem_reg.SHIELD)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_frost"):
		print("frost")
		spell_queue.append(elem_reg.FROST)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_elec"):
		print("lightning")
		spell_queue.append(elem_reg.LIGHTNING)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_death"):
		print("death")
		spell_queue.append(elem_reg.DEATH)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_rock"):
		print("rock")
		spell_queue.append(elem_reg.ROCK)
		print(parse_elem_seq(spell_queue))
