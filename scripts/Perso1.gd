extends "res://scripts/AbstractPerso.gd"


func _ready():
	$Sprite.play("biou_rame")

func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		
	
	move_and_collide((speed * delta) * direction)

func _on_Area2D_area_entered(area):
	if area.is_in_group('zonePeche'):
		actionPersoAvecAttente('Je pêche grawh')
		
func _on_Area2D_area_entered_drop(area):
	if area.is_in_group('dropZone'):
		actionPersoAvecAttente('Ca drop !')
