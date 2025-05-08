extends Node2D

@export var kingdom : Kingdom
@export var inf : int = 10
@export var arc : int = 0
@export var cav : int = 0

const CELL := 48

func power() -> float:
    return inf * 1 + arc * 1.5 + cav * 2

func move_to(cell:Vector2i):
    position = cell * CELL + Vector2(CELL/2, CELL/2)
