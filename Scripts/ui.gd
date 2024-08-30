extends Control

@onready var inventory = $ColorRect
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_inventory"):
		inventory.visible = !inventory.visible
