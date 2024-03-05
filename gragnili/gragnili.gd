extends Control

@export var meore_Manager : meoreManager
@onready var  global = get_node("/root/Global")
@onready var tree_root = get_tree().get_root()
@onready var article_label = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("gragnili/Panel/VBoxContainer/scroll/insidescroll/articleLabel")
@onready var scroll = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("gragnili/Panel/VBoxContainer/scroll")
@onready var box_choice = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("gragnili/Panel/VBoxContainer/boxChoice")
@onready var box_btns = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("gragnili/Panel/VBoxContainer/boxBtns")
@onready var back_btn = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("gragnili/Panel/VBoxContainer/backbtn")


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	meore_Manager.connect("goblinstart_ended",_on_goblinstart_ended)
	toggle_gragnili_visibility_on(false)
	
func _on_goblinstart_ended(ended: bool):
	global.goblinStoryChapter+=1
	if ended:
		show()
		var tree_root = get_tree().get_root()
		var node = tree_root.get_child( tree_root.get_child_count()-1 ).get_node("Node2D")
		var camera = tree_root.get_child(tree_root.get_child_count()-1).get_node("Node2D/Natsarqeqia/Camera2D")
		camera.zoom = Vector2(1.5,1.5)
		node.set_visible(false)
	else:
		hide()
		
# Called every frame. 'delta' is t           he elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_gragnili_visibility_on(chartva):
	if chartva == true:
		box_btns.set_visible(false)
		box_choice.set_visible(false)
		article_label.set_visible(true)
		back_btn.set_visible(true)
		scroll.set_visible(true)
	else:
		box_btns.set_visible(true)
		box_choice.set_visible(true)
		back_btn.set_visible(false)
		article_label.set_visible(false)
		scroll.set_visible(false)
func _on_rei_pressed():
	toggle_gragnili_visibility_on(true)

func _on_higinsi_pressed():
	article_label.text = "eqskaliburi aris miTiuri xmlis saxeli, romelic savaraudod ekuTvnoda mefe arturs, britaneTis legendarul mmarTvels.
es iyo araCveulebrivi Zalisa da silamazis xmali, romelic RmerTebma Seqmnes da arturs tbis qalbatonma gadasces.
eqskaliburs savaraudod hqonda Zala, moeWra yvelaferi da daecva Tavisi mepatrone
ziani. saxelic hqonda amotvifruli, wyaroebis Tanaxmad, es ar iyo „eqskaliburi“. es iyo „kaliburnusi“, rac eqskaliburis laTinuri saxelwodebaa.

wyaroebi iuwyian rom mas aseve hqonda kidev erTi xmali, romelic qvidan amoaZvrina axalgazrda biWi iyo.

arturi iyenebda orive xmals Tavis brZolebSi da TavgadasavalSi, magram man upiratesoba mianiWa eqskaliburs, radgan is ufro Sesaferisi iyo omisTvis.
is aseve ibrZoda mravali monstris winaaRmdeg, rogoricaa drakonebi, gigantebi da jadoqrebi. mas exmarebodnen misi erTguli raindebi,
romlebsac mrgvali magidis raindebi eZaxdnen.maTi istoriis Seswavlis Sedegad vxedavT rom, isini iyvnen mamaci da keTilSobili meomrebi, romlebic icavdnen raindobisa da Rirsebis kodeqss.
"
	toggle_gragnili_visibility_on(true)



func _on_backbtn_pressed():
	toggle_gragnili_visibility_on(false)


func _on_ray_btn_pressed():
	article_label.text = "is acxadebs, rom aris istorikosi da mwerali, romelic specializirebulia Sua saukuneebis
legendebsa da miTebSi. is ambobs, rom aqvs oqsfordis universitetis istoriis doqtorantura 
da dawerili aqvs ramdenime wigni mefe arturze da mis raindebze. misi wignebi mxilebuli iqna ramdenimejer faqtebis uzustobashi
misi TqmiT, man moinaxula mravali istoriuli adgili, romlebic dakavSirebulia arturiis legendebTan da Caatara vrceli
kvleva eqskaliburis warmoSobisa da mniSvnelobis Sesaxeb, magram gamotova mniSvnelovani faqtebi rac mianiSnebs
rom ar Cautarebia kvleva an Caatara gulgrilad."
	toggle_gragnili_visibility_on(true)



func _on_robert_btn_pressed():
	toggle_gragnili_visibility_on(true)
	article_label.text = "is aris Jurnalisti da blogeri, romelic wers sxvadasxva Temebze, maT Soris istoriaze,
mecnierebasa da kulturaze. mas aqvs bakalavris xarisxi JurnalistikaSi kolumbiis universitetidan 
da muSaobda ramdenime gazeTsa da JurnalSi, rogoricaa niu iork Taimsi da vaSington posti, The Washington Post
da National Geographic. man bevr qveyanaSi imogzaura da bevri eqsperti da cnobili adamiani
gamokiTxa. is ambobs, rom dainteresebulia eqskaliburis miTebiTa da realobiT da wakiTxuli
aqvs mravali wigni da statia am Temaze."


func _on_trust_ray_pressed():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "reiChosen")
	


func _on_trust_robert_pressed():
	get_tree().change_scene_to_file("res://tye.tscn")
	
