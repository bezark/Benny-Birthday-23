extends Node2D
var count = 0
var mapfound = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$speech.hide()
	$pirate_text.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	count+=1
	match count:
		1:
			$speech/dialogue.set_text("John: OK bye Lois! Be good while we're in New Orleans!")
			$speech.show()
		2:
			$speech/dialogue.set_text("Benny: Hey John why is Lois Grey??")
		3: 
			$speech/dialogue.set_text("John: Finding a Tuxedo Cat sprite sheet was suprisingly hard...")
		4:
			$speech/dialogue.set_text("Benny: Oh ok. What do you think she does while we're out of town?")
		5:
			$speech/dialogue.set_text("John: I have no idea......")
		6:
			$speech/dialogue.set_text("Benny: OK whatever. We're outta here like a Herd of Turtles.")
		7:
			$speech.hide()
		8:
			$pirate_text/RichTextLabel.set_text("Finally! With my captors gone I can return to the Seven Seas under my true name...")
			$pirate_text.show()
		9:
			$pirate_text/RichTextLabel.set_text("Captain Louise Burgeoise!!!")
		10:
			$pirate_text/RichTextLabel.set_text("Now to find my map...")
			$"../map/sprite".show()
			$"../map".monitoring=true
		11:
			$pirate_text.hide()
			$Timer.stop()
		14:
			get_tree().change_scene_to_file("res://levels/level_1.tscn")

func _on_map_body_entered(body):
	if not mapfound:
		$pirate_text/RichTextLabel.set_text("Ah-Ha! Now to return to Tortuna to find my ship!")
		$pirate_text.show()
		$"../map/sprite".play("unfold")
		mapfound = true
		$Timer.start()
