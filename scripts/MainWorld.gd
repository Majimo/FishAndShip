extends Node2D

var objets = ['Planche','Plaque','Scotch']
var objet_select

var bibou_objet_tenu
var pouik_objet_tenu
var objet_pose

var bibou_tiens_objet = false
var pouik_tiens_objet = false
var objet_est_pose = false

var objet_zone1
var objet_zone2
var objet_zone3

var zone1_repare = false
var zone2_repare = false
var zone3_repare = false

signal zone_est_repare

func _ready():
	$CrashVaisseau.play()
	$VaisseauCoule.start()
	$Musique.play()
	
	randomize()
	$Players/Perso1.connect("peche_un_objet",self,"peche_un_objet")
	$Players/Perso1.connect("pose_un_objet",self,"pose_un_objet")
	
	$Players/Perso2.connect("recupere_objet",self,"recupere_objet")
	$Players/Perso2.connect("repareZone1",self,"repareZone1")
	$Players/Perso2.connect("repareZone2",self,"repareZone2")
	$Players/Perso2.connect("repareZone3",self,"repareZone3")
	
	objet_zone1 = $ZonesAReparer/ZoneAReparer1.materiaux_necessaire()
	objet_zone2 = $ZonesAReparer/ZoneAReparer2.materiaux_necessaire()
	objet_zone3 = $ZonesAReparer/ZoneAReparer3.materiaux_necessaire()
			
func _process(delta):
	var timer = round($VaisseauCoule.time_left)
	$TempsRestant/TempsRestantTime.text = str(timer)
	if timer == 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
	elif timer < 20:
		if $TempsRestant/Alarme.is_playing() == false:
			$TempsRestant/Alarme.play()
			
	if zone1_repare == true and zone2_repare == true and zone3_repare == true :
		get_tree().change_scene("res://scenes/WinOver.tscn")

func peche_un_objet():
	bibou_tiens_objet = true
	bibou_objet_tenu = objets[rand_range(0,3)]
	if bibou_objet_tenu == objets[0] :
		$InventaireJ1/PlancheDeBois.visible = true
		$InventaireJ1/PlaqueDeFer.visible = false
		$InventaireJ1/Scotch.visible = false
	if bibou_objet_tenu == objets[1] :
		$InventaireJ1/PlancheDeBois.visible = false
		$InventaireJ1/PlaqueDeFer.visible = true
		$InventaireJ1/Scotch.visible = false
	if bibou_objet_tenu == objets[2] :
		$InventaireJ1/PlancheDeBois.visible = false
		$InventaireJ1/PlaqueDeFer.visible = false
		$InventaireJ1/Scotch.visible = true


func pose_un_objet():
	if bibou_tiens_objet == true and objet_est_pose == false :
		objet_est_pose = true
		bibou_tiens_objet = false
		objet_pose = bibou_objet_tenu
		bibou_objet_tenu = null
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

func repareZone1():
	if pouik_tiens_objet == true and pouik_objet_tenu == objet_zone1:
		pouik_tiens_objet = false
		$ZonesAReparer/ZoneAReparer1.visible = false
		if pouik_objet_tenu == objets[0] :
			$InventaireJ2/PlancheDeBois2.visible = false
		if pouik_objet_tenu == objets[1] :
			$InventaireJ2/PlaqueDeFer2.visible = false
		if pouik_objet_tenu == objets[2] :
			$InventaireJ2/Scotch2.visible = false
		pouik_objet_tenu = null
		emit_signal("zone1_est_repare")
		zone1_repare = true
	else:
		$Fail.play()
		print("pouik ne tiens pas le bon objet ou ne tiens pas d'objet")

func repareZone2():
	if pouik_tiens_objet == true and pouik_objet_tenu == objet_zone2:
		pouik_tiens_objet = false
		$ZonesAReparer/ZoneAReparer2.visible = false
		if pouik_objet_tenu == objets[0] :
			$InventaireJ2/PlancheDeBois2.visible = false
		if pouik_objet_tenu == objets[1] :
			$InventaireJ2/PlaqueDeFer2.visible = false
		if pouik_objet_tenu == objets[2] :
			$InventaireJ2/Scotch2.visible = false
		pouik_objet_tenu = null
		emit_signal("zone2_est_repare")
		zone2_repare = true
	else:
		$Fail.play()
		print("pouik ne tiens pas le bon objet ou ne tiens pas d'objet")

func repareZone3():
	if pouik_tiens_objet == true and pouik_objet_tenu == objet_zone3:
		pouik_tiens_objet = false
		$ZonesAReparer/ZoneAReparer3.visible = false
		if pouik_objet_tenu == objets[0] :
			$InventaireJ2/PlancheDeBois2.visible = false
		if pouik_objet_tenu == objets[1] :
			$InventaireJ2/PlaqueDeFer2.visible = false
		if pouik_objet_tenu == objets[2] :
			$InventaireJ2/Scotch2.visible = false
		pouik_objet_tenu = null
		emit_signal("zone3_est_repare")
		zone3_repare = true
	else:
		$Fail.play()
		print("pouik ne tiens pas le bon objet ou ne tiens pas d'objet")

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
