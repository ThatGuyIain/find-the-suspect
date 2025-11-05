extends Node2D


@onready var main = get_node(".")
const MINX = 0
const MAXX = 1000
const MINY = 0
const MAXY = 1000
const totalDistractions = 50

var distractionScene = preload("res://scenes/RandomPng.tscn")
var suspect = preload("res://scenes/suspect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sus = suspect.instantiate()
	sus.position.x = randf_range(MINX, MAXX)
	sus.position.y = randf_range(MINY, MAXY)
	main.add_child(sus)
	for i in range(totalDistractions):
		var thing = distractionScene.instantiate()
		thing.position.x = randf_range(MINX, MAXX)
		thing.position.y = randf_range(MINY, MAXY)
		main.add_child(thing)
