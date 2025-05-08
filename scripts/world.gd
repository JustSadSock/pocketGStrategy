extends Node2D

const COLS = 10
const ROWS = 6
const CELL = 48

@onready var lbl_year    = $UI/Year
@onready var lbl_gold    = $UI/Gold
@onready var army_node   = $Armies/PlayerArmy
@onready var panel       = $UI/Info
var diplo_packed = preload("res://ui/diplomacy.tscn")

var player : Kingdom
var turn : int = 0
var year : int = 1000

func _ready():
    player = Kingdom.new()
    update_ui()
    army_node.kingdom = player
    army_node.move_to(Vector2i(1,1))

func _draw():
    for y in ROWS:
        for x in COLS:
            var r = Rect2(Vector2(x,y)*CELL, Vector2(CELL-1,CELL-1))
            draw_rect(r, Color(0.18,0.2,0.23))
            draw_rect(r, Color(0,0,0), false)

func _unhandled_input(event):
    if event is InputEventMouseButton and event.pressed and event.button_index==BUTTON_LEFT:
        var cell = Vector2i(event.position / CELL)
        if cell.x in 0..COLS-1 and cell.y in 0..ROWS-1:
            army_node.move_to(cell)
            panel.text = "Army moved to %d,%d" % [cell.x, cell.y]

func _on_NextTurn_pressed():
    turn += 1
    year += 1
    # доход: базовый + дополнительный за каждую запись в relations
    player.gold += 10 + player.relations.size()
    update_ui()

func update_ui():
    lbl_year.text = "Year %d" % year
    lbl_gold.text = "Gold %d" % player.gold

func _on_Diplomacy_pressed():
    var dlg = diplo_packed.instantiate()
    add_child(dlg)
    dlg.popup_centered()

func update_ui():
    lbl_year.text = "Year %d" % year
    lbl_gold.text = "Gold %d" % player.gold
