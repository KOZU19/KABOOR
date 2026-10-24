extends Node2D
const enemy_scene = preload("res://enemy.tscn")
var spawn_timer = 0.0
var score_timer = 0.0
var score= 0
@onready var label: Label = $Label
func _ready():
	add_to_group("game_manager")
	$ColorRect3.visible = false
	$ColorRect4.visible = false
	
	
func game_over():
	print("aa")
	$ColorRect3.visible=true
	
func game_win():
	$ColorRect4.visible=true

	
func _process(delta: float) -> void:
	spawn_timer -= delta
	if spawn_timer <= 0 :
		spawn_enemy()
		spawn_timer = 0.8
	score_timer += delta
	if score_timer >= 1.0:
		score += 1
		score_timer -= 1
		label.text = "SCORE: " + str(score)
	if score >= 60:
		game_win()
func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	var screen = get_viewport_rect().size
	var side = randi_range(0, 3)
	match side:
		0: 
			enemy.position = Vector2(randf_range(0, screen.x), 0)
		1:
			enemy.position = Vector2(screen.x, randf_range(0, screen.y))
		2:
			enemy.position = Vector2(randf_range(0, screen.x), screen.y)
		3:
			enemy.position = Vector2(0, randf_range(0, screen.y))
	add_child(enemy)
	add_to_group("enemies")



func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://new_main.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
