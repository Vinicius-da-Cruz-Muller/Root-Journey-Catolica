extends Node2D

@onready var charPosition = $Spawner
var character : Node2D = null

func _ready():
	character = load(Global.playerDir).instantiate()
	character.global_position = charPosition.global_position
	add_child(character)


