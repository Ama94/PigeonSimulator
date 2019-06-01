extends Node2D

var velocity = Vector2( 50.0 , 0.0 )
var speed = 1.0

func _ready():
	self.position.x = 0.7 * get_viewport_rect().size.x;
	velocity *= -1
	
func _physics_process(delta):
	self.position += velocity * delta * speed
	if(self.position.x < 0.1 * get_viewport_rect().size.x or self.position.x > 0.9 * get_viewport_rect().size.x ):
		if(speed < 15):
			speed += 0.8
		velocity *= -1
		get_node("Sprite").set_flip_h(true)
	if(self.position.x > 0.9 * get_viewport_rect().size.x ):
		get_node("Sprite").set_flip_h(false)


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
		$"../Game_Over".visible = true
		if $"../koniec".is_stopped ( ):
			$"../koniec".start()
		


func _on_koniec_timeout():
	get_tree().change_scene("res://menu.tscn")
