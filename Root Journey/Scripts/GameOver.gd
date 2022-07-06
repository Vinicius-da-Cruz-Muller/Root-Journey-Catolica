extends CanvasLayer


func _ready():
	pass 


func _on_retrybutton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")
