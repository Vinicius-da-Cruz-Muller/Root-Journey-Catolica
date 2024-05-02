extends Node2D

func _ready():
	pass 

func _on_Tentar_pressed():
	get_tree().change_scene_to_file("res://Levels/Level2.tscn")
