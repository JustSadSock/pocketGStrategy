extends WindowDialog

@onready var world = get_tree().get_root().get_node("World")

func _on_Alliance_pressed():
    world.player.add_relation(1, 50)
    world.update_ui()
    hide()

func _on_War_pressed():
    world.player.add_relation(1, -100)
    world.update_ui()
    hide()
