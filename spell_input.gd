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


func check_for_opposites(element: Element, seq: Array) -> bool:
	for i in range(seq.size()):
		if seq[i] in element.opposites:
			seq.remove_at(i)
			return true
	return false
	

func check_for_combos(element: Element, seq: Array) -> bool:
	if element.combinations == null:
		return false
	for i in range(seq.size()):
		if seq[i].element_name in element.combinations:
			seq[i] = element.combinations[seq[i].element_name]
			return true
	return false


func _init() -> void:
	elem_reg = ElementReg.new()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("cast_magicka"):
		print('BOOM!!!')
		spell_queue.clear()
		
	if Input.is_action_just_pressed("conj_fire"):
		print('fire')
		var element = elem_reg.FIRE
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))
		
	if Input.is_action_just_pressed("conj_water"):
		print("water")
		var element = elem_reg.WATER
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_life"):
		print("life")
		var element = elem_reg.LIFE
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_shield"):
		print("shield")
		var element = elem_reg.SHIELD
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_frost"):
		print("frost")
		var element = elem_reg.FROST
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_elec"):
		print("lightning")
		var element = elem_reg.LIGHTNING
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_death"):
		print("death")
		var element = elem_reg.DEATH
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))

	if Input.is_action_just_pressed("conj_rock"):
		print("rock")
		var element = elem_reg.ROCK
		var op = check_for_opposites(element, spell_queue)
		var comb = check_for_combos(element, spell_queue)
		if not op and not comb and spell_queue.size() < 5:
			spell_queue.append(element)
		print(parse_elem_seq(spell_queue))
