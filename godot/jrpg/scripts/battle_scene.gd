extends Control



@onready var enemy_texture: TextureRect = $MainLayout/BattleArea/EnemySide/VBoxContainer/TextureRect
@onready var enemy_health_bar: ProgressBar = $MainLayout/BattleArea/EnemySide/VBoxContainer/EnemyHealthBar
@onready var player_health_bar: ProgressBar = $MainLayout/BattleArea/PlayerSide/VBoxContainer/PlayerHealthBar
@onready var text_label: Label = $MainLayout/PanelContainer/Label
@onready var attack_button: Button = $MainLayout/AttackButton
@onready var run_button: Button = $MainLayout/RunButton

var current_enemy_health : int = 0
var enemy_damage : int = 0 
var player :CharacterBody2D


func initialize(enemy_data:enemyData, player_ref: CharacterBody2D):
	player = player_ref
	current_enemy_health = enemy_data.health
	enemy_damage = enemy_data.damage
	
	enemy_health_bar.max_value = enemy_data.health
	enemy_health_bar.value = current_enemy_health 
	
	player_health_bar.max_value = player.max_health
	player_health_bar.value = player.current_health
	
	
	enemy_texture.texture = enemy_data.texture
	text_label.text = "A wild " + enemy_data.name + " appeared!"


func _on_run_button_pressed() -> void:
	get_tree().paused = false
	
	queue_free()


func _on_attack_button_pressed() -> void:
	attack_button.disabled = true
	run_button.disabled = true
	
	var rng = RandomNumberGenerator.new()
	var current_attack_damage = rng.randi_range(10,15)
	current_enemy_health -= current_attack_damage
	enemy_health_bar.value = current_enemy_health
	text_label.text = "You hit the monster for "+  current_attack_damage + "damage!"
	
	await get_tree().create_timer(1.0).timeout
	
	if current_enemy_health <=0:
		win_battle()
	else
		enemy_turn()
func enemy_turn():
	text_label.text = "monster has attacked"
	await get_tree().create_timer(1.0).timeout
	
	
