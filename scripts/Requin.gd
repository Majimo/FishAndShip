extends Node2D



# Le requin apparait aléatoirement sur la scène, toutes les X secondes.
# il y a 4 frames.  la première est plus longue et permet de voir ou va apparaitre le requin
# sa position est aléatoire, mais doit être a l'extérieur du vaisseau.
#pendant la frame 2 et 3, si le joueur touche la zone du requin:
#		- un son se joue
#		- une animation de sprite apparait pour symboliser que le joueur est touché.
#		- le joueur perd son objet.

# temps pour gérer l'apparition du requin. est décrémenté.


export(NodePath) var SpawnRandomZones

var AppearationTime=0;
var AnimationSpriteHandler=0;
export var etat = "Idle"; #Idle, Roar
# Called when the node enters the scene tree for the first time.
func _ready():
	etat = "Idle"
	$AnimationPlayer.play("RequinRoar")
	
	pass # Replace with function body.
	
	
var R2:CollisionShape2D

		
func BeginRoar():
	etat = "Roar"
	# choix d'une position aléatoire.
	
	
	$AudioStreamPlayer.play();

func RandomPositionOutsideShip():
	print(SpawnRandomZones)
	var ChildCount = get_node(SpawnRandomZones).get_child_count()
	if(ChildCount>0):
		var childrandom = round(rand_range(0,ChildCount))
		position = get_node(SpawnRandomZones).get_child( childrandom).position
	
	
		
	
	#Je check area2D
	
	

func Roar():
	print("roar")
	
	




func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("RequinRoar")
	pass # Replace with function body.
