extends Node

var banana = 0
var maca = 0
var goal = false

#var player #ja estava aqui, se precisar substituir, mude os proximos nomes
var playerDir
var player : Node2D

func _ready():
	pass
	
func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance


	
