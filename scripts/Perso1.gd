extends "res://scripts/AbstractPerso.gd"

signal peche_un_objet
signal pose_un_objet

var initialScale:Vector2
var flipHSprite = false;

func _ready():
	$Sprite.play("bibou_rame")
	initialScale = $Sprite.scale

func _physics_process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		flipHSprite = true
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		flipHSprite = false
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	$Sprite.flip_h = flipHSprite
	
	move_and_collide((speed * delta) * direction)

func _on_Area2D_area_entered(area):
	if area.is_in_group('zonePeche'):
		emit_signal("peche_un_objet")
		$Sprite.play("bibou_peche")
		$BibouPeche.play()
		actionPersoAvecAttente('Je pêche grawh', 2)
		
func _on_Area2D_area_entered_drop(area):
	if area.is_in_group('dropZone'):
		emit_signal("pose_un_objet")
		$DepotDitem.play()
		actionPersoAvecAttente('Ca drop !', 1)

func reset_player_animation():
	.reset_player_animation()
	$Sprite.play("bibou_rame")
