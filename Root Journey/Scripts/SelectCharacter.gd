extends Control

var Pepe = "res://Scenes/player.tscn"
var Petunia = "res://Scenes/player2.tscn"
var Pinho = "res://Scenes/player3.tscn"

func _ready():
	pass 

func goToScene():
	get_tree().change_scene("res://Prefabs/TelaInicial.tscn")


func _on_Pepe_pressed():
	Global.playerDir = Pepe
	goToScene()
	get_tree().change_scene("res://Levels/PilotLevel.tscn")


func _on_Pinho_pressed():
	Global.playerDir = Pinho
	goToScene()
	get_tree().change_scene("res://Levels/PilotLevel.tscn")


func _on_Petunia_pressed():
	Global.playerDir = Petunia
	goToScene()
	get_tree().change_scene("res://Levels/PilotLevel.tscn")
