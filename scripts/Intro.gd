extends Node2D


func _ready():
	$ToucheA.play()

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		_on_Button_pressed()

func _on_Button_pressed():
	$ArriveeVaisseau.play()


func _on_ArriveeVaisseau_finished():
	get_tree().change_scene("res://scenes/MainWorld.tscn")
