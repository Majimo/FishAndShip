extends "res://scripts/AbstractPerso.gd"

var isSpecialAction
signal recupere_objet
signal repare


func _ready():
	isSpecialAction = ""
	$Sprite.play("pouik_attend")

func _physics_process(delta):
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right2"):
		$Sprite.play("pouik_marche")
		direction.x += 1
	if Input.is_action_pressed("ui_left2"):
		$Sprite.play("pouik_marche")
		direction.x -= 1
	if Input.is_action_pressed("ui_down2"):
		$Sprite.play("pouik_marche")
		direction.y += 1
	if Input.is_action_pressed("ui_up2"):
		$Sprite.play("pouik_marche")
		direction.y -= 1
	
	if direction == Vector2(0, 0) && isSpecialAction == "":
		$Sprite.play("pouik_attend")
	if isSpecialAction != "":
		$Sprite.play(isSpecialAction)

	move_and_collide((speed * delta) * direction)

func _on_Area2D_area_entered(area):
	if area.is_in_group('zoneAReparer'):
		$PouikSoude.play()
		$Sprite.stop()
		isSpecialAction = "pouik_soude"
		$Sprite.play("pouik_soude")
		actionPersoAvecAttente('Hop hop, on répare', 2)
		print(area._on_Perso2_repairModule())
		emit_signal("repare")


func _on_Area2D_area_entered_drop(area):
	if area.is_in_group('dropZone'):
		$PouikSoude.play()
		$Sprite.stop()
		isSpecialAction = "pouik_recupere"
		$Sprite.play("pouik_recupere")
		actionPersoAvecAttente('Ca récupère !', 1)
		emit_signal("recupere_objet")
		
func reset_player_animation():
	.reset_player_animation()
	$Sprite.play("pouik_attend")
	isSpecialAction = ""
