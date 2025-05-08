extends Resource
class_name Kingdom

@export var name : String = "Player"
@export var color : Color = Color(1,0.8,0)
var gold : int = 200
var relations : Dictionary = {}

func add_relation(id:int, delta:int):
    relations[id] = relations.get(id, 0) + delta
