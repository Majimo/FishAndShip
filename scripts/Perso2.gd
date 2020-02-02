extends "res://scripts/AbstractPerso.gd"

signal recupere_objet


func _physics_process(delta):
	var direction = Vector2()
	$Sprite.play("pouik_marche")
	
	if Input.is_action_pressed("ui_right2"):
		direction.x += 1
	if Input.is_action_pressed("ui_left2"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down2"):
		direction.y += 1
	if Input.is_action_pressed("ui_up2"):
		direction.y -= 1

	move_and_collide((speed * delta) * direction)

func _on_Area2D_area_entered(area):
	if area.is_in_group('zoneAReparer'):
		$PouikSoude.play()
		actionPersoAvecAttente('Hop hop, on répare', 2)
		area._on_Perso2_repairModule()

func _on_Area2D_area_entered_drop(area):
	if area.is_in_group('dropZone'):
		actionPersoAvecAttente('Ca récupère !', 1)
		emit_signal("recupere_objet")
