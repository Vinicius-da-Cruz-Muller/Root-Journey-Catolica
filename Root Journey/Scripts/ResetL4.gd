extends Node2D

func _ready():
	pass 

func _on_Tentar_pressed():
	get_tree().change_scene("res://Levels/Level4.tscn")
