extends Node2D

var objets = ['Plan', 'objet2', 'objet3']
var objet_select

var bibou_objet_tenu
var pouik_objet_tenu
var objet_pose

var bibou_tiens_objet = false
var pouik_tiens_objet = false
var objet_est_pose = false

func _ready():
	$VaisseauCoule.start()
	$Musique.play()
	
	randomize()
	$Players/Perso1.connect("peche_un_objet",self,"peche_un_objet")
	$Players/Perso1.connect("pose_un_objet",self,"pose_un_objet")
	
	$Players/Perso2.connect("recupere_objet",self,"recupere_objet")

func _process(delta):
	var timer = round($VaisseauCoule.time_left)
	$TempsRestant/TempsRestantTime.text = str(timer)
	if timer == 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
	elif timer < 20:
		if $TempsRestant/Alarme.is_playing() == false:
			$TempsRestant/Alarme.play()

func peche_un_objet():
	if bibou_tiens_objet == false :
		bibou_tiens_objet = true
		bibou_objet_tenu = objets[rand_range(0,2)]
		if bibou_objet_tenu == objets[0] :
			$InventaireJ1/PlancheDeBois.visible = true
		if bibou_objet_tenu == objets[1] :
			$InventaireJ1/PlaqueDeFer.visible = true
		if bibou_objet_tenu == objets[2] :
			$InventaireJ1/Scotch.visible = true
	else :
		print("bibou tiens déjà un objet")

func pose_un_objet():
	if bibou_tiens_objet == true and objet_est_pose == false :
		objet_est_pose = true
		bibou_tiens_objet = false
		objet_pose = bibou_objet_tenu
		bibou_objet_tenu = null
		print(objet_pose)
		if objet_pose == objets[0] :
			$InventaireJ1/PlancheDeBois.visible = false
			$Dropzone/PlancheDeBois.visible = true
		if objet_pose == objets[1] :
			$InventaireJ1/PlaqueDeFer.visible = false
			$Dropzone/PlaqueDeFer.visible = true
		if objet_pose == objets[2] :
			$InventaireJ1/Scotch.visible = false
			$Dropzone/Scotch.visible = true
	else :
		print("bibou ne tiens pas déjà d'objet ou il y a déjà un objet posé")

func recupere_objet():
	if pouik_tiens_objet == false and objet_est_pose == true :
		pouik_tiens_objet = true
		objet_est_pose = false
		pouik_objet_tenu = objet_pose
		objet_pose = null
		if pouik_objet_tenu == objets[0] :
			$InventaireJ2/PlancheDeBois2.visible = true
			$Dropzone/PlancheDeBois.visible = false
		if pouik_objet_tenu == objets[1] :
			$InventaireJ2/PlaqueDeFer2.visible = true
			$Dropzone/PlaqueDeFer.visible = false
		if pouik_objet_tenu == objets[2] :
			$InventaireJ2/Scotch2.visible = true
			$Dropzone/Scotch.visible = false
	else :
		print("pouik tiens déjà un objet ou aucun objet n'est posé")

func perd_objet_par_obstacle(qui):  #requin ou acide.
	if(qui=="Perso1"):
		print("BIBOU est touché par un requinnnnnnnnnnnn")
		if bibou_tiens_objet == true :
			$InventaireJ1/PlancheDeBois.visible = false
			$InventaireJ1/PlaqueDeFer.visible = false
			$InventaireJ1/Scotch.visible = false
			bibou_tiens_objet = false
			bibou_objet_tenu = null
			# jouer une superanimation de perte.
			print(qui+" BIBOU a perdu son objet")
	if(qui=="Perso2"):
		print("POUIK est touché par de l'acide'")
		if pouik_tiens_objet == true :
			$InventaireJ2/PlancheDeBois2.visible = false
			$InventaireJ2/PlaqueDeFer2.visible = false
			$InventaireJ2/Scotch2.visible = false
			pouik_tiens_objet = false
			pouik_objet_tenu = null
			# jouer une super animtion de perte
			print(qui+" POUIK  a perdu son objet")
		
	
	
	
	
	


func objet_aleatoire():
	return objets[rand_range(0,2)]

func _on_Musique_finished():
	$Musique.play()
