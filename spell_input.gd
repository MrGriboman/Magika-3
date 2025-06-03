extends Node2D

var spell_queue = []
var elem_reg

signal spell_cast(spell_queue)

func _init() -> void:
	elem_reg = ElementReg.new()


func parse_element_name(element: Element) -> String:
	return element.element_name
	
	
func parse_elem_seq(seq: Array) -> Array:
	var human_readable_seq = []
	for elem in seq:
		human_readable_seq.append(parse_element_name(elem))
	return human_readable_seq


func check_for_opposites(element: Element, seq: Array) -> bool:
	for i in range(seq.size() - 1, -1, -1):
		if seq[i] in element.opposites:
			seq.remove_at(i)
			return true
	return false
	

func check_for_combos(element: Element, seq: Array) -> bool:
	if element.combinations == null:
		return false
	
	for k in range(2):	
		for i in range(seq.size() - 1, -1, -1):
			if seq[i].element_name in element.combinations:
				if k == 1 or element.combinations[seq[i].element_name] == elem_reg.WATER:
					seq[i] = element.combinations[seq[i].element_name]
					return true
	return false


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("cast_magicka"):
		print('BOOM!!!')
		spell_queue.clear()
		
	if Input.is_action_just_pressed("cast_spell"):
		print('cast spell')
		spell_cast.emit(spell_queue)
		spell_queue.clear()
		
	for action in elem_reg.action_map:
		if Input.is_action_just_pressed(action):
			print(elem_reg.action_map[action].element_name)
			var element = elem_reg.action_map[action]
			var op = check_for_opposites(element, spell_queue)
			var comb = check_for_combos(element, spell_queue)
			if not op and not comb and spell_queue.size() < 5:
				spell_queue.append(element)
			print(parse_elem_seq(spell_queue))
		
	
