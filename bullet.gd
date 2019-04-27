extends Sprite

# Declare member variables here. Examples:
var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = load("res://assets/flying_pigeon_shit.png")
	self.scale = Vector2(0.05,0.05)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(self.position.y > 0.8 * get_viewport_rect().size.y):
		self.texture = load("res://assets/pigeon_shit.png")
		self.scale = Vector2(0.5,0.5)
	else:
		position += velocity * delta * 5
