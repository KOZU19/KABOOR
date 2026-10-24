extends Button
var hover_tween:Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size /2.0
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered()->void:
	animate_scale(Vector2(1.08, 1.08))
func _on_mouse_exited() -> void:
	animate_scale(Vector2.ONE)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func animate_scale(target_scale: Vector2):
	if hover_tween and hover_tween.is_running():
		hover_tween.kill()
	hover_tween = create_tween()
	hover_tween.set_trans(Tween.TRANS_BACK)
	hover_tween.set_ease(Tween.EASE_OUT)
	hover_tween.tween_property(self, "scale", target_scale, 0.18)
