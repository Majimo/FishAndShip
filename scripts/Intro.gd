extends Node2D

func _on_Button_pressed():
	$ArriveeVaisseau.play()


func _on_ArriveeVaisseau_finished():
	get_tree().change_scene("res://scenes/MainWorld.tscn")
