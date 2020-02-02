extends Node2D


func _ready():
	$Applause.play()
	$ToucheA.play()

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		_on_Button_pressed()

func _on_Button_pressed():
	get_tree().change_scene("res://scenes/MainWorld.tscn")


func _on_Applause_finished():
	$DemarrageVaisseau.play()
