extends CharacterBody2D

signal sailing

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var _unlocked = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		#animated_sprite.animation = "cat_jump"
		
		velocity.y += gravity * delta
		if(velocity.y<= 0):
			animated_sprite.play("cat_jump")
		else:
			animated_sprite.play("cat_fall")
	else:
		if(velocity.x==0):
			animated_sprite.animation = "cat_idle"
		else:
			animated_sprite.animation = "cat_run"
		# Handle Jump.
	if _unlocked:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		if(velocity.x<0):
			animated_sprite.flip_h = true
		if(velocity.x>0):
			animated_sprite.flip_h = false
	else:
		velocity.x = 0
		animated_sprite.animation = "cat_idle"
		if velocity.y == 0:
			hide()
			$"../Boat/fakeLois".show()
			emit_signal("sailing")
			$Camera2D.enabled = false
		
	move_and_slide()


	

func _on_area_area_entered(area):
	print("boat")
	_unlocked = false


func _on_area_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("entered")
	_unlocked = false
