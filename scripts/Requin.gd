extends AnimatedSprite

# Le requin apparait aléatoirement sur la scène, toutes les X secondes.
# il y a 4 frames.  la première est plus longue et permet de voir ou va apparaitre le requin
# sa position est aléatoire, mais doit être a l'extérieur du vaisseau.
#pendant la frame 2 et 3, si le joueur touche la zone du requin:
#		- un son se joue
#		- une animation de sprite apparait pour symboliser que le joueur est touché.
#		- le joueur perd son objet.

# temps pour gérer l'apparition du requin. est décrémenté.
var AppearationTime=0;
var AnimationSpriteHandler=0;
export var etat = "Idle"; #Idle, Roar
# Called when the node enters the scene tree for the first time.
func _ready():
	etat = "Idle"
	#play("default")
	
	pass # Replace with function body.
	


func _process(delta):
	if ( etat == "Idle"):
		ApparitionHandler(delta)
	if ( etat == "Roar"):
		Roar(delta)
	pass

func ApparitionHandler(delta):
	AppearationTime-=delta
	if(AppearationTime<0):
		AppearationTime=5
		BeginRoar()
		
func BeginRoar():
	etat = "Roar"
	# choix d'une position aléatoire.
	
	
	$AudioStreamPlayer.play();
	
func RandomPositionOutsideShip():
	var windowsize = get_viewport().get_rect().size;
	var randomx = randf()*windowsize.x;
	var randomy = randf()*windowsize.y;
	#il faut vérifier qu'on soit pas dans le vaisseau, sinon on rerandomise
	position = RandomPositionOutsideShip();

func Roar():
	$AnimatedSprite.play("default")
	
	


