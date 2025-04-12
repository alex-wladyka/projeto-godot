extends CanvasLayer

static var imagem = load("res://Graphics/PNG/UI/playerLife1_red.png") 

func set_vida(qtd):
	
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
		
	
	for i in qtd:
		var text_rect = TextureRect.new()
		text_rect.texture = imagem
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _process(_delta: float) -> void:
	$MarginContainer/Label.text = str(Global.score)
