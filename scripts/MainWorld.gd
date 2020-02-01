extends Node2D

var objets = ['objet1', 'objet2', 'objet3']

var bibou_objet_tenu
var pouik_objet_tenu
var objet_pose

var bibou_tiens_objet = false
var pouik_tiens_objet = false
var objet_est_pose = false

func _ready():
	$Players/Perso1.connect("peche_un_objet",self,"peche_un_objet")
	$Players/Perso1.connect("pose_un_objet",self,"pose_un_objet")
	
	$Players/Perso2.connect("recupere_objet",self,"recupere_objet")
	
func peche_un_objet():
	if bibou_tiens_objet == false :
		bibou_tiens_objet = true
		pouik_objet_tenu = objets[rand_range(0,2)]
		print(pouik_objet_tenu)
	else :
		print("bibou tiens déjà un objet")

func pose_un_objet():
	if bibou_tiens_objet == true and objet_est_pose == false :
		objet_est_pose = true
		bibou_tiens_objet = false
		objet_pose = bibou_objet_tenu
		bibou_objet_tenu = null
		print(2)
	else :
		print("bibou ne tiens pas déjà d'objet ou il y a déjà un objet posé")

func recupere_objet():
	if pouik_tiens_objet == false and objet_est_pose == true :
		pouik_tiens_objet = true
		objet_est_pose = false
		pouik_objet_tenu = objet_pose
		objet_pose = null
		print(3)
	else :
		print("pouik tiens déjà un objet ou aucun objet n'est posé")
