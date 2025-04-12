extends Node2D

#Passo 1 : Carregar a cena do objeto
var meteor_scene: PackedScene = load("res://cenas/meteoro.tscn")
var laser_scene: PackedScene = load("res://cenas/laser.tscn")

var vida : int = 3

func _ready() -> void:
	Global.score = 0

func _on_timer_meteoro_timeout() -> void:
	#Passo 2: Criar uma instância do objeto
	var metoro = meteor_scene.instantiate()
	
	#Passo 3: Linkar o nó na "árvore" da cena
	$Meteoros.add_child(metoro)
	
	#Conectar o Sinal do Meteoro
	metoro.connect('collision', _on_meteoro_collision)


func _on_meteoro_collision():
	$jogador.play_dano_sound()
	vida -= 1
	get_tree().call_group('ui', 'set_vida', vida)
	if vida <= 0:
		get_tree().change_scene_to_file("res://cenas/fimjogo.tscn")
		


func _on_jogador_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	
	
	
