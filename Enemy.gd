extends Node2D

var velocity = Vector2( 50.0 , 0.0 )
var speed = 1.0

func _ready():
	self.position.x = 1.0 * get_viewport_rect().size.x;
	
func _physics_process(delta):
	self.position += velocity * delta * speed
	if(self.position.x < 0.1 * get_viewport_rect().size.x or self.position.x > 1.0 * get_viewport_rect().size.x):
		if(speed < 10):
			speed += 0.5
		velocity *= -1
		get_node("Sprite").set_flip_h(false)
	if(self.position.x > 1.0 * get_viewport_rect().size.x ):
		get_node("Sprite").set_flip_h(true)

func _on_Area2D_area_entered(area):
	area.get_node("CollisionShape2D").disabled = true
	globals.points += 1;
	$"../GUI/Points".text = "Punkty: " + str(globals.points)
