extends Node2D

@export var battle_scene : PackedScene
@onready var ui_layer = $UILayer

@onready var player = $Player

func _ready() -> void:
	SignalBus.encounter_started.connect(start_battle)
	
func start_battle(enemy_data):
	get_tree().paused = true
	
	var battle_instance = battle_scene.instantiate()
	
	ui_layer.add_child(battle_instance)
	
	battle_instance.initialize(enemy_data,player)
