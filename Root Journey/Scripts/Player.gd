extends CharacterBody2D

var velocity = Vector2.ZERO
var move_speed = 480
var gravity = 1200
var jump_force = -360
var health = 5
var hurt = false
var game

var knockback_dir = 1
var knockback_int = 1400

var is_grounded
@onready var raycasts = $raycasts

func _ready():
	Global.set("player", self)
	game = get_tree().current_scene
	#health +=1
	

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity.x = 0
	
	if ! hurt:
		_get_input()
	
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	is_grounded = _check_is_grounded()
	
	_set_animation()
		
func _get_input():
	velocity.x = 0
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2)
		
	if move_direction !=0:
		$texture.scale.x = move_direction
		knockback_dir = move_direction 
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and is_grounded:
		velocity.y = jump_force
		
func _check_is_grounded():
	for raycast in raycasts.get_children():
		if raycast.is_colliding():
			return true 
	return false 
	
func _set_animation():
	var anim = "idle"
	
	if !is_grounded:
		anim = "jump"
	elif velocity.x !=0:
		anim = "run"
		
	if hurt:
		anim = "hit"
		
	if $anim.assigned_animation != anim:
		$anim.play(anim)
	


func _on_fallzone_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

func knockback():
	if $hurtbox/right.is_colliding():
		velocity.x = -knockback_dir * knockback_int
	if $hurtbox/left.is_colliding():
		velocity.x = knockback_dir * knockback_int
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
func _on_hurtbox_body_entered(body: Node)-> void:
		hurt = true
		health -= 1
		game.count_life()
		knockback()
		#get_node("hitbox/collision").set_deferred("disabled", true)
		await get_tree().create_timer(0.5).timeout
		#get_node("hitbox/collision").set_deferred("disabled", false)
		hurt = false
		
		if health < 1:
			game_over()


func _on_hurtbox_area_entered(area):
	hurt = true
	health -= 1
	game.count_life()
	knockback()
	#get_node("hitbox/collision").set_deferred("disabled", true)
	await get_tree().create_timer(0.5).timeout
 #get_node("hitbox/collision").set_deferred("disabled", false)
	hurt = false
	
	if health < 1:
		game_over()
		
func game_over() -> void:
	queue_free()
	get_tree().change_scene_to_file("res://Prefabs/GameOver.tscn")
	
