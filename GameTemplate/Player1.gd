extends KinematicBody2D

var direccion = Vector2(0,0)
var arriba=Vector2(0,-2)
var velocidad = 200
var gravedad=100
var sentido = 0
var salto=200

# Called when the node enters the scene tree for the first time.
func _ready():
	var limite=get_viewport().size
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	mover()
	aplicar_gravedad()
	move_and_slide(direccion,arriba)
	animacion()
	reset_velocidad()

func mover():
	if Input.is_action_pressed("izquierda"):
		direccion [0]= direccion[0]-velocidad
		sentido=1
	elif Input.is_action_pressed("derecha"):
		direccion [0]= direccion[0]+velocidad
		sentido=2
	elif Input.is_action_pressed("arriba"):
		direccion[1]=direccion[1]-salto
		sentido=3
	else:
		sentido=0
	#direccion[0]=clamp(direccion[0],0,limite[0])
	#direccion[1]=clamp(direccion[1],0,limite[1])
		
func aplicar_gravedad():
	if sentido==3:
		direccion[1]=0
	else:
		direccion[1]=direccion[1] + gravedad
	
	
		
func reset_velocidad():
	direccion[0]=0
	direccion[1]=0
	
func animacion():
	if sentido == 1 :
		$animacion.flip_h=true
		$animacion.play("andando")
	elif sentido==2:
		$animacion.flip_h=false
		$animacion.play("andando")
	elif sentido==3:
		$animacion.flip_h=true
		$animacion.play("jump")
	else:
		$animacion.play("parado")
		
