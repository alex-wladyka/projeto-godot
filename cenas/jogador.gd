extends CharacterBody2D

@export var velocidade:= 500

var cooldown:= false
signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer_Atirar.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#Processo de movimentação do jogador
	var direcao = Input.get_vector("esquerda","direita","cima","baixo")
	velocity = direcao * velocidade
	move_and_slide()
	
	#Atirar
	if Input.is_action_just_pressed("atirar") and cooldown == true:
		laser.emit($Laser_StartPos.global_position)
		cooldown = false
		$Timer_Atirar.start()
		$lasersound.play()
	#position += Vector2(1,0) * 50 * delta
	#delta é uma "função" que padroniza to tempo de mudança do func _process qualquer seja a velocidade do computador
	#$jogador_spr.rotation += 0.1 * delta #Usado quando apenas se quer modificar atributos de algum node filho


func _on_timer_atirar_timeout() -> void:
	cooldown = true

func play_dano_sound():
	$jogador_spr.modulate = Color.RED
	$dano.play()
	await get_tree().create_timer(0.1).timeout
	$jogador_spr.modulate = Color.WHITE
