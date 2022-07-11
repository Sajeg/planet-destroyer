extends Node2D

var CircleColor
var points = 1000

func _ready():
	spawn_circle()

func _process(_delta):
	add_points()
	$Label.text = "Points: " + str(points)
	
	

func add_points():
	if CircleColor == "Red":
		if Input.is_action_just_pressed("1"):
			points += 1000
			spawn_circle()
		elif Input.is_action_just_pressed("2"):
			points -= 1000
		elif Input.is_action_just_pressed("3"):
			points -= 1000
	elif CircleColor == "Yellow":
		if Input.is_action_just_pressed("1"):
			points -= 1000
		elif Input.is_action_just_pressed("2"):
			points += 1000
			spawn_circle()
		elif Input.is_action_just_pressed("3"):
			points -= 1000
	elif CircleColor == "Green":
		if Input.is_action_just_pressed("1"):
			points -= 1000
		elif Input.is_action_just_pressed("2"):
			points -= 1000
		elif Input.is_action_just_pressed("3"):
			points += 1000
			spawn_circle()



func spawn_circle():
	var rand = randi()%3
	if rand == 0:
		CircleColor = "Red"
		$RedObject.visible = true
		$yellowObject.visible = false
		$greenObject.visible = false
	elif rand == 1:
		CircleColor = "Yellow"
		$RedObject.visible = false
		$yellowObject.visible = true
		$greenObject.visible = false
	elif rand == 2:
		CircleColor = "Green"
		$RedObject.visible = false
		$yellowObject.visible = false
		$greenObject.visible = true