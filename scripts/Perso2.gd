extends "res://scripts/AbstractPerso.gd"

var isSpecialAction
signal recupere_objet
var initialScale:Vector2
var flipHSprite = false;
func _ready():
	isSpecialAction = ""
	initialScale = $Sprite.scale
	$Sprite.play("pouik_attend")

func _physics_process(delta):
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right2"):
		$Sprite.play("pouik_marche")
		direction.x += 1
		flipHSprite = true
	if Input.is_action_pressed("ui_left2"):
		$Sprite.play("pouik_marche")
		direction.x -= 1
		flipHSprite = false
	if Input.is_action_pressed("ui_down2"):
		$Sprite.play("pouik_marche")
		direction.y += 1
	if Input.is_action_pressed("ui_up2"):
		$Sprite.play("pouik_marche")
		direction.y -= 1
	
	if speed > 0:
		$Sprite.flip_h = flipHSprite
	
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
		$Sprite.play(isSpecialAction)
		actionPersoAvecAttente('Hop hop, on répare', 2)
		area._on_Perso2_repairModule(area)

func _on_Area2D_area_entered_drop(area):
	if area.is_in_group('dropZone'):
		$Sprite.stop()
		isSpecialAction = "pouik_recupere"
		$Sprite.play(isSpecialAction)
		actionPersoAvecAttente('Ca récupère !', 1)
		emit_signal("recupere_objet")
		
func reset_player_animation():
	.reset_player_animation()
	$Sprite.play("pouik_attend")
	isSpecialAction = ""
