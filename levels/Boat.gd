extends RigidBody2D
var sailing = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	move_and_collide(sailing)


func _on_player_sailing():
	sailing.x = 1
	$sail.animation = "sail"
	$Timer.start()



	



	


func _on_timer_timeout():
	sailing.x =0
	print("done")
	$"Camera2D/pirate_text/RichTextLabel".set_text("[center] Happy B-Day! May winds be at your back.[p][center]~Fin~")
	$"Camera2D/pirate_text".show()
