extends CharacterBody2D

# https://kidscancode.org/godot_recipes/4.x/2d/grid_movement/index.html
# I will implement the script for the player
# https://youtu.be/HmnwNadwHWI?si=S5ldGgg4OL4NJTeL&t=390
var tile_size = 64
var inputs = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position = position + Vector2.ONE * tile_size/2

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

@onready var ray = $RayCast2D

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position = position + inputs[dir] * tile_size
