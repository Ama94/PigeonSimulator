extends Node2D

var velocity = Vector2( 50.0 , 0.0 )

func _ready():
	self.position.x = 0.5 * get_viewport_rect().size.x;

func _physics_process(delta):
	self.position += velocity * delta
	
	if(self.position.x < 0.2 * get_viewport_rect().size.x or self.position.x > 0.6 * get_viewport_rect().size.x ):
		velocity *= -1
		get_node("Sprite").set_flip_h(false)
	if(self.position.x > 0.6 * get_viewport_rect().size.x ):
		get_node("Sprite").set_flip_h(true)


func _on_Area2D_body_entered(body):
	print("W CHOMIKU")
	globals.life -= 1;
	print(globals.life)
	if globals.life == 2:
		$"../GUI/lifes3".visible = false
		print("2")
	if globals.life == 1:
		print("1")
		$"../GUI/life2".visible = false
	if globals.life == 0:
		print("0")
		$"../GUI/life".visible = false
		get_tree().change_scene("res://menu.tscn")
