extends Node2D

func _ready():
	spawn_circle()

func _process(_delta):
	if Input.is_action_pressed("1"):
		print("1")
		$Red.visible = true
		$yellow.visible = false
		$green.visible = false
	elif Input.is_action_pressed("2"):
		print("2")
		$Red.visible = false
		$yellow.visible = true
		$green.visible = false
	elif Input.is_action_pressed("3"):
		print("3")
		$Red.visible = false
		$yellow.visible = false
		$green.visible = true
	
func spawn_circle():
	var rand = randi()%3
	if rand == 0:
		pass
	elif rand == 1:
		pass
	elif rand == 2:
		pass