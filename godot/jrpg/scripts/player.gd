extends CharacterBody2D

@export var move_speed:float = 100
@export var ground_layer: TileMapLayer
@export var encounter_rate: float = 0.1
@export var monsters : Array[enemyData]

var distance_traveled : float = 0.0

const ENCOUNTER_THRESHOLD : float = 50.0 

func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector("Move_left","Move_right","Move_up","Move_down")
	velocity = input_direction * move_speed
	
	move_and_slide()
	
	if velocity.length() > 0:
		distance_traveled += velocity.length() * _delta
		 
		if distance_traveled > ENCOUNTER_THRESHOLD:
			distance_traveled = 0
			check_for_encounter()
	
func check_for_encounter():
	var map_pos = ground_layer.local_to_map(global_position)
	var tile_data = ground_layer.get_cell_tile_data(map_pos)
	
	if tile_data.get_custom_data("is_encounter_zone"):
		print("Stepped on monster zone")
		
		if randf() < encounter_rate:
			print("Battle Started!")
			
			var random_monster = monsters.pick_random()
			print("A Random Monster: " + random_monster.name + "Appears")
			SignalBus.encounter_started.emit(random_monster)
