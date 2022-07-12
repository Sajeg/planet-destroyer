extends Node2D

func _ready():
	for i in Main.points:
		yield(get_tree().create_timer(0.000001), "timeout")
		$Score.text = str(i + 101)
