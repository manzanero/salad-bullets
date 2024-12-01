class_name Gun
extends Node3D


var lazer_scene := preload("res://assets/lazer/lazer.tscn") as PackedScene
var damaged_scene := preload("res://assets/damaged/damaged.tscn") as PackedScene


@onready var fire_point := %FirePoint as Marker3D
@onready var ray_cast := %FirePoint/RayCast3D as RayCast3D


func shot():
	var lazer : Lazer = lazer_scene.instantiate()
	get_tree().root.add_child(lazer)
	lazer.position = fire_point.global_position
	lazer.rotation = fire_point.global_rotation
	
	if ray_cast.is_colliding():
		var damaged = damaged_scene.instantiate()
		get_tree().root.add_child(damaged)
		damaged.position = ray_cast.get_collision_point()
