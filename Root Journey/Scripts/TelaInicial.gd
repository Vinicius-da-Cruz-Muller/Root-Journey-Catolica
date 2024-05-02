extends Control


func _ready():
	$controls/startBtn.grab_focus()


func _on_startBtn_pressed():
	get_tree().change_scene_to_file("res://Levels/PilotLevel.tscn")
	


func _on_options_pressed():
	var control_screen = load("res://Prefabs/Guia.tscn").instantiate()
	get_tree().current_scene.add_child(control_screen)
	


func _on_quit_pressed():
	get_tree().quit()


func _on_select_character_pressed():
	var control_screen = load("res://Scenes/SelectCharacter.tscn").instantiate()
	get_tree().current_scene.add_child(control_screen)
