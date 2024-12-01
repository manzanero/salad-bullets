class_name Lazer
extends Node3D


@onready var animation_player := $AnimationPlayer as AnimationPlayer


func _ready():
	animation_player.current_animation = "shot"
	$AudioStreamPlayer3D.play()
	get_tree().create_timer(3).timeout.connect(queue_free)
