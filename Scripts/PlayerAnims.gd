extends Node2D

@onready var body = $BodyAnim
@onready var legs = $LegAnim


func _process(delta: float) -> void:
	if get_parent().direction != Vector2(0,0):
		legs.play("Walk")
	else: legs.stop()

func attack(anim):
	if body.is_playing():
		pass
	else:
		randomize()
		var odds = (randi() & 2) - 1
		if odds < 0:
			get_parent().body.flip_v = true 
		else: get_parent().body.flip_v = false
		
		AudioManager.play_sound(get_parent().punch_audio)
		body.play(anim)
