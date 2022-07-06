extends Area2D

#onready var changer = get_parent().get_node()
export var path : String 
func _ready():
	pass 

func _physics_process(delta: float) -> void:
	_set_animation()

func _on_Goal_body_entered(body):
	if body.name == "player" and Global.goal == true || body.name == "player2" and Global.goal == true || body.name == "player3" and Global.goal == true:
		#body.hit_goal()
		#changer.change_scene(path)
		get_tree().change_scene("res://Levels/Level4.tscn")

func _set_animation():
	var anim = "default"
	
	if Global.goal == true:
		anim = "done"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)
		
	
