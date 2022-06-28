extends Area2D
var ponto = 3

func _on_bananana_body_entered(body: Node) -> void:
	$anim.play("collected")
	Global.banana += ponto


func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name == "collected":
		queue_free()
