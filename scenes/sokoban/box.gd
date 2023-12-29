extends AnimatableBody2D

# https://youtu.be/HmnwNadwHWI?si=PhNAnIaVFOBdDecd&t=1209
var tile_size = 64
var inputs = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
}

@onready var ray = $RayCast2D

func move(dir):
	var vector_dir = inputs[dir] * tile_size
	ray.target_position = vector_dir
	ray.force_raycast_update()
	if !ray.is_colliding():
		position = position + vector_dir
		return true
	return false
