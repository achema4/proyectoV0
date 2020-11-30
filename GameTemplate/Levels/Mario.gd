extends Node2D

export (String, FILE, "*.tscn") var Mario_Scene: String
onready var game_vars=get_node("/root/Game")
#var list=game_vars.listPrueba

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	retranslate()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func pasaEscena():
	Game.emit_signal("ChangeScene", "res://Levels/Mario.tscn")
	
func retranslate()->void:
	find_node("Text").text = tr("Texto1")
