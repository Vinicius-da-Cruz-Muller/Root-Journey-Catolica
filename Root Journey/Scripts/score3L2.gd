extends Label

var randnum = 0
var minimo = 24
var maximo = 47
const tempomax = 600
var  tempo = 0

#var prim = Global.maca
#var seg = Global.banana
func _ready():

	randnum = int(randf_range(minimo, maximo))
	
func _process(delta: float) -> void:
	
	tempo += delta

	text = String(randnum)
	
	if Global.maca + Global.banana == randnum:
		#print("Soma perfeita")
		Global.goal = true
	else:
		Global.goal = false
	if tempo >= tempomax:
		randnum = int(randf_range(minimo, maximo))
		tempo = 0
