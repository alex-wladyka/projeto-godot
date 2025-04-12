extends Area2D

var velocidade: int
var velocidade_rotacao: int
var direcao_x: float
var can_collide: = true

var width: int
var height: int


signal collision

func _ready() -> void:
	var rng:= RandomNumberGenerator.new()
	
	#textura sprite aleatória
	var path: String = "res://Graphics/PNG/Meteors/" +str(rng.randi_range(1,6))+".png"
	$meteoro_spr.texture = load(path)
	
	#Posição Inicial
	width = get_viewport().get_visible_rect().size[0]
	height = get_viewport().get_visible_rect().size[1]
		
	#Gerando uma posição inicial aleatória no eixo x e y
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-50)
	
	#Deslocando o meteoro para a posição sorteada
	position = Vector2(random_x,random_y)
	
	# velocidade / rotacao / direcao
	velocidade = rng.randi_range(200,500)
	direcao_x = rng.randf_range(-1,1)
	velocidade_rotacao = rng.randi_range(40,100)
 
	
func _process(delta: float) -> void:
	width = get_viewport().get_visible_rect().size[0]
	height = get_viewport().get_visible_rect().size[1]
	
	position += Vector2(direcao_x,1) * velocidade * delta
	rotation_degrees += velocidade_rotacao * delta
	if position > Vector2(width,height) || !can_collide:
		$meteoro_spr.hide()
	else:
		$meteoro_spr.show()	
	if position.y > 2000:
		queue_free()	
	
func _on_body_entered(_body: Node2D) -> void:
	if can_collide:
		collision.emit()

func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	Global.score += 1 
	$explosion.play()
	can_collide = false
	$meteoro_spr.hide()
	await get_tree().create_timer(1).timeout
	queue_free()
	
