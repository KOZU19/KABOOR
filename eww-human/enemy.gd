extends CharacterBody2D
@export var speed = 300.0
@export var lifetime := 5.0
@onready var hitbox: Area2D = $hitbox


var direction = Vector2.RIGHT
var change_timer = 0.0
func _ready():
	get_tree().create_timer(lifetime).timeout.connect(queue_free)
	randomize()
	pick_direction()
func pick_direction():
	direction = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
	change_timer = randf_range(1.0, 3.0)
func _physics_process(delta: float) -> void:
	change_timer -= delta
	if change_timer <= 0:
		pick_direction()
	velocity = direction *speed
	move_and_slide()
	if is_on_wall():
		direction= direction.bounce(get_wall_normal())
