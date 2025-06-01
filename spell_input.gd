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


func check_for_opposites(element: Element, seq: Array) -> void:
	for i in range(seq.size()):
		if seq[i] in element.opposites:
			seq.remove_at(i)
			seq.pop_back()
			return
	return
	
	
func fire_on_water_and_ice(seq: Array) -> void:
	for i in range(seq.size()):
		if seq[i].element_name == 'water':
			seq[i] = elem_reg.STEAM
			seq.pop_back()
			return
		if seq[i].element_name == 'ice':
			seq[i] = elem_reg.WATER
			seq.pop_back()
			return
	return
	

func frost_on_water_and_steam(seq: Array) -> void:
	for i in range(seq.size()):
		if seq[i].element_name == 'water':
			seq[i] = elem_reg.ICE
			seq.pop_back()
			return
		if seq[i].element_name == 'steam':
			seq[i] = elem_reg.WATER
			seq.pop_back()
			return
	return


func _init() -> void:
	elem_reg = ElementReg.new()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("cast_magicka"):
		print('BOOM!!!')
		spell_queue.clear()
		
	if len(spell_queue) <= 5:
		if Input.is_action_just_pressed("conj_fire"):
			print('fire')
			spell_queue.append(elem_reg.FIRE)
			check_for_opposites(spell_queue[-1], spell_queue)
			fire_on_water_and_ice(spell_queue)
			print(parse_elem_seq(spell_queue))
			
		if Input.is_action_just_pressed("conj_water"):
			print("water")
			spell_queue.append(elem_reg.WATER)
			check_for_opposites(spell_queue[-1], spell_queue)
			print(parse_elem_seq(spell_queue))

		if Input.is_action_just_pressed("conj_life"):
			print("life")
			spell_queue.append(elem_reg.LIFE)
			check_for_opposites(spell_queue[-1], spell_queue)
			print(parse_elem_seq(spell_queue))

		if Input.is_action_just_pressed("conj_shield"):
			print("shield")
			spell_queue.append(elem_reg.SHIELD)
			check_for_opposites(spell_queue[-1], spell_queue)
			print(parse_elem_seq(spell_queue))

		if Input.is_action_just_pressed("conj_frost"):
			print("frost")
			spell_queue.append(elem_reg.FROST)
			check_for_opposites(spell_queue[-1], spell_queue)
			frost_on_water_and_steam(spell_queue)
			print(parse_elem_seq(spell_queue))

		if Input.is_action_just_pressed("conj_elec"):
			print("lightning")
			spell_queue.append(elem_reg.LIGHTNING)
			check_for_opposites(spell_queue[-1], spell_queue)
			print(parse_elem_seq(spell_queue))

		if Input.is_action_just_pressed("conj_death"):
			print("death")
			spell_queue.append(elem_reg.DEATH)
			check_for_opposites(spell_queue[-1], spell_queue)
			print(parse_elem_seq(spell_queue))

		if Input.is_action_just_pressed("conj_rock"):
			print("rock")
			spell_queue.append(elem_reg.ROCK)
			check_for_opposites(spell_queue[-1], spell_queue)
			print(parse_elem_seq(spell_queue))
			
		if spell_queue.size() > 5:
			spell_queue.pop_back()
