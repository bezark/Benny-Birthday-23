extends Node2D
var count = 0


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
			$pirate_text/RichTextLabel.set_text("Finally! With my captors ")
			$pirate_text.show()
			$Timer.stop()
	
