extends Label
var title_tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size/ 2.0
	start_animation()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func start_animation():
	title_tween= create_tween()
	title_tween.set_loops()
	title_tween.set_trans(Tween.TRANS_SINE)
	title_tween.set_ease(Tween.EASE_OUT_IN)
	title_tween.tween_property(self, "scale", Vector2(1.05, 1.05), 1.0)
	title_tween.tween_property(self, "scale", Vector2.ONE, 1.0)
	
