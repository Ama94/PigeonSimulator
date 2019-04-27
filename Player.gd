extends Node2D

const ACCELERATION = 10
# Declare member variables here. Examples:

var orientation = 0
var facing = Vector2(0.0, 0.0)
var radial_acceleration = 0.0
var gravity:float = 0.4
var velocity = Vector2(0.0, 0.0)
var force = Vector2(0.0, 0.0)

var bullet_object =  load("res://bullet.tscn")

var a = 2
var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	a=10

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	process_input()
	radial_acceleration *= 0.93
#	orientation = radial_acceleration
	facing = Vector2( cos(orientation) , sin(orientation))
	rotation = orientation
	velocity *=0.95
	position += velocity * delta
	position.y += gravity
	velocity += force * delta
	
	update()
	
	pass
func process_input():
	if Input.is_action_pressed("ui_right"):
		position += Vector2(5.0,0)
		get_node("../Pigeon").set_flip_h(false)
	if Input.is_action_pressed("ui_left"):
		position -= Vector2(5.0,0)
		get_node("../Pigeon").set_flip_h(true)
	if(Input.is_action_just_pressed("ui_up")):
		position += Vector2(0,-15.0)
	if(Input.is_action_just_pressed("ui_select")):
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
