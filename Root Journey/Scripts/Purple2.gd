extends CharacterBody2D

@export var speed = 64
#export var health = 7
var motion = Vector2.ZERO
var gravity = 1200
var move_direction = -1
var hitted = false

func _physics_process(delta: float) -> void:
	motion.x = speed * move_direction
	motion.y = gravity * delta
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false 
	
	_set_animation()
	set_velocity(motion)
	move_and_slide()
	motion = velocity
	
		
func _on_anim_animation_finished(anim_name: String) -> void:
	if anim_name == "idle":
		$texture.flip_h != $texture.flip_h
		$ray_wall.scale.x *= -1
		move_direction *= -1
		$anim.play("run")

func _set_animation():
	var anim = "run"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	elif motion.x !=0:
		anim = "run"
		
	if hitted == true:
		anim = "hit"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func _on_hitbox_body_entered(body: Node)-> void:
	hitted = true
	body.velocity.y = body.jump_force 
	#health -= 1
	await get_tree().create_timer(0.2).timeout
	hitted = false 
	
	#if health == 0:
		#queue_free()
		#get_node("hitbox/collision").set_deferred("disabled", true)

