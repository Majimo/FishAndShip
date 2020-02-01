extends "res://scripts/AbstractPerso.gd"


func _ready():
	$Sprite.play("bibou_rame")

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
		$Sprite.play("bibou_peche")
		$BibouPeche.play()
		actionPersoAvecAttente('Je pêche grawh', 2)
		
func _on_Area2D_area_entered_drop(area):
	if area.is_in_group('dropZone'):
		$DepotDitem.play()
		actionPersoAvecAttente('Ca drop !', 1)

func reset_player_animation():
	.reset_player_animation()
	$Sprite.play("bibou_rame")
