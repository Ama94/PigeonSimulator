extends RigidBody2D

const ACCELERATION = 10
# Declare member variables here. Examples:

var orientation = 0
var facing = Vector2(0.0, 0.0)
var radial_acceleration = 0.0
var gravity:float = 0.4
var velocity = Vector2(0.0, 0.0)
var force = Vector2(0.0, 0.0)
var value:float = 100.0;
var bullet_object =  load("res://bullet.tscn")
var direction = Vector2(2.0, 0.0)
var a = 2
var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	a=10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	linear_velocity = linear_velocity.normalized()*min(linear_velocity.length(), 300.0)
	process_input()
#	radial_acceleration *= 0.93
#	orientation = radial_acceleration
#	facing = Vector2( cos(orientation) , sin(orientation))
#	rotation = orientation
#	velocity *=0.95
#	position += velocity * delta + direction
#	position.y += gravity
#	velocity += force * delta
	print(linear_velocity)
	$Sprite.rotation = get_angle_to(linear_velocity+position)
	
	if(abs($Sprite.rotation_degrees) > 90):
		 $Sprite.set_flip_v(true)
	else:
		$Sprite.set_flip_v(false)
	$CollisionShape2D2.rotation = $Sprite.rotation+(PI/2)
	if(value < 100.0):
		value += 1
	get_node("../GUI/cooldown").set_value(value)
	$Sprite.texture = load("res://assets/pigeon_up.png")
	update()
	
	pass
func process_input():
	if Input.is_action_pressed("ui_right"):
		apply_central_impulse(Vector2(10,0))
#		direction = Vector2(2.0,0)
#		$Sprite.set_flip_h(false)
	if Input.is_action_pressed("ui_left"):
		apply_central_impulse(Vector2(-10,0))
#		direction = Vector2(-2.0,0)
#		$Sprite.set_flip_h(true)
	if(Input.is_action_just_pressed("ui_up")):
		apply_impulse(Vector2.ZERO,Vector2(0,-200))
#		position += Vector2(0,-15.0)
#		self.texture = load("res://assets/pigeon_up.png")
	if(Input.is_action_just_pressed("ui_select")):
		if(get_node("../GUI/cooldown").get_value() == 100):
			get_node("../GUI/cooldown").set_value(0)
			value = 0
			spawn_bullet()
#	pass
func spawn_bullet():
	var new_bullet = bullet_object.instance()
	new_bullet.position = position
	new_bullet.rotation = orientation
	new_bullet.velocity.y = 40
	$"../bullets".add_child(new_bullet)
func _draw():
	draw_line(Vector2(), velocity *1, Color(1,1,1),3)
