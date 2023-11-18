extends Node2D

var speed = 200  
var sprite  

func _ready():
	sprite = $Sprite2D 
	if not sprite:
		print("Sprite node not found. Make sure the node name in the script matches the actual node name.")

func _process(delta):
	var velocity = Vector2()
	var flip_sprite = true
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed * delta
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed * delta
		flip_sprite = !Input.is_action_pressed("ui_left")  

	self.translate(velocity)

	if sprite:
		sprite.flip_h = flip_sprite  
