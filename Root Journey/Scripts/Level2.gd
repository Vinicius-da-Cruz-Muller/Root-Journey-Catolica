extends Node

var goal = false #tentar depois dentro de score 3

var life = 5

func _ready():
	Global.maca = 0
	Global.banana = 0
	$HUDL2/Holder/life.animation = str(life)
	
func count_life():
	life -= 1
	$HUDL2/Holder/life.animation = str(life)
