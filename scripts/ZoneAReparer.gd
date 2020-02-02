extends Area2D

var isBurning
signal module_repaired

var reparer = false

var materiaux = ['Planche','Plaque','Scotch']
var materiaux_select

func _ready():
	randomize()
	isBurning = true

func _on_Perso2_repairModule():
	if reparer == true:
		$Timer.start(2)
		emit_signal('module_repaired')

func _on_Timer_timeout():
	isBurning = false
	$AnimatedSprite.play('repaired')

func materiaux_necessaire():
	materiaux_select = materiaux[rand_range(0,3)]
	if materiaux_select == "Planche":
		$PlancheDeBois.visible = true
	if materiaux_select == "Plaque":
		$PlaqueDeFer.visible = true
	if materiaux_select == "Scotch":
		$Scotch.visible = true
	return materiaux_select

func _on_ZoneAReparer1_module_repaired():
	pass # Replace with function body.
