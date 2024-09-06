extends NinePatchRect


var hovered = false
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	selected()


func _on_mouse_entered() -> void:
	hovered = true
	self_modulate = Color("cdcdcd")


func _on_mouse_exited() -> void:
	hovered = false
	self_modulate = Color("ffffff")

func selected():
	if Input.is_action_just_pressed("ui_click") and hovered:
		#grab item here
		self_modulate = Color("919191")
	if Input.is_action_just_released("ui_click") and hovered:
		#drop item here
		self_modulate = Color("cdcdcd")
