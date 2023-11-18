extends Node2D

var speed = 200  # Adjust the speed to your liking
var sprite  # Reference to the Sprite node

func _ready():
	sprite = $Sprite  # Assuming your sprite node is named "Sprite"

func _process(delta):
	var velocity = Vector2()
	var flip_sprite = false
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed * delta
		flip_sprite = false  # Character is moving right
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed * delta
		flip_sprite = true  # Character is moving left

	self.translate(velocity)

	if sprite:
		if flip_sprite:
			sprite.scale.x = -1  # Flip the sprite horizontally
		else:
			sprite.scale.x = 1  # Reset the sprite's scale
