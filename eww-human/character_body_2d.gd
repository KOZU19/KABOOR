extends CharacterBody2D
@onready var hitbox: Area2D = $hitbox

@export var speed = 800.0
var target = Vector2.ZERO
var moving = false
func _ready():
	target = global_position
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			target = get_global_mouse_position()
			moving = true
func _physics_process(delta: float) -> void:
	if moving:
		var direction = global_position.direction_to(target)
		if global_position.distance_to(target) < 5:
			moving = false
			velocity = Vector2.ZERO
		else :
			velocity = direction * speed
	move_and_slide()
#func _on_hitbox_body_entered(body):
	#if body.is_in_group("enemies"):
		#print("hit")
		#get_tree().call_group("game_manager", "game_over")


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		print("hlo")
		print("hit")
		get_tree().call_group("game_manager", "game_over")
