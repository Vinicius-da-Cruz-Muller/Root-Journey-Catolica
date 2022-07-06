extends Node2D

onready var charPosition = $Spawner
var character : Node2D = null

func _ready():
	character = load(Global.playerDir).instance()
	character.global_position = charPosition.global_position
	add_child(character)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
