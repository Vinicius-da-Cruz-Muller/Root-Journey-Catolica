extends Area2D
var ponto = 1


func _on_maca_body_entered(body: Node) -> void:
	$anim.play("collected")
	Global.maca += ponto


func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name == "collected":
		queue_free()
	
