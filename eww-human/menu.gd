extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_button_pressed() -> void:
	$start.play()
	get_tree().create_timer(0.03).timeout
	get_tree().change_scene_to_file("res://new_main.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
