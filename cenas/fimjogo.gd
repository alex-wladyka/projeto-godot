extends Control

var cena_nivel: PackedScene = load("res://cenas/nivel.tscn")

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)


		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		get_tree().change_scene_to_packed(cena_nivel)
	
