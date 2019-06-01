extends Node2D

# Declare member variables here. Examples:
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = load("res://assets/flying_pigeon_shit.png")
	$Sprite.scale = Vector2(0.05,0.05)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.y > 0.8 * get_viewport().size.y):
		$Sprite.texture = load("res://assets/pigeon_shit.png")
		$Sprite.scale = Vector2(0.5,0.5)
		$Area2D/CollisionShape2D.disabled = true
		if $Timer.is_stopped ( ):
			$Timer.start()
	else:
		position += velocity * delta * 5


func _on_Timer_timeout():
	print("OUT")
	queue_free()

