extends Node2D

onready var yellow_path_follow = get_node("YellowObject/Path2D/PathFollow2D")
onready var red_path_follow= get_node("RedObject/Path2D/PathFollow2D")
onready var green_path_follow = get_node("GreenObject/Path2D/PathFollow2D")

var CircleColor
var points = 1000

var points_decrease = 4000
var points_increase = 10000


func _ready():
	spawn_circle()
	timer()

func _process(_delta):
	Main.points = points
	add_points()
	$Label.text = "Points: " + str(points)
	if CircleColor == "Red":
		if red_path_follow.unit_offset >= 0.95:
			return
		red_path_follow.offset += 1
	if CircleColor == "Green":
		if green_path_follow.unit_offset >= 0.95:
			return
		green_path_follow.offset += 1
	if CircleColor == "Yellow":
		if yellow_path_follow.unit_offset >= 0.95:
			return
		yellow_path_follow.offset += 1

func timer():
	for i in 59:
		yield(get_tree().create_timer(1), "timeout")
		print(str(i))
		if 59-i < 10:
			$Background/TimerShow.text = "0" + str(59-i)
		else:
			$Background/TimerShow.text = str(59-i)
		if i == 58:
			get_tree().change_scene("res://GameOver.tscn")
			


func add_points():
	if CircleColor == "Red":
		if Input.is_action_just_pressed("1"):
			points += round(points_increase/(red_path_follow.unit_offset + 1))
			spawn_circle()
		elif Input.is_action_just_pressed("2"):
			points -= points_decrease
		elif Input.is_action_just_pressed("3"):
			points -= points_decrease
	elif CircleColor == "Yellow":
		if Input.is_action_just_pressed("1"):
			points -= points_decrease
		elif Input.is_action_just_pressed("2"):
			points += round(points_increase/(yellow_path_follow.unit_offset + 1))
			spawn_circle()
		elif Input.is_action_just_pressed("3"):
			points -= points_decrease
	elif CircleColor == "Green":
		if Input.is_action_just_pressed("1"):
			points -= points_decrease
		elif Input.is_action_just_pressed("2"):
			points -= points_decrease
		elif Input.is_action_just_pressed("3"):
			points += round(points_increase/(green_path_follow.unit_offset + 1))
			spawn_circle()



func spawn_circle():
	var rand_path = randi()%5

	var rand = randi()%3
	if rand == 0:
		if CircleColor == "Red":
			spawn_circle()
			return
		CircleColor = "Red"
		$RedObject.visible = true
		$YellowObject.visible = false
		$GreenObject.visible = false
		$RedObject/Path2D/PathFollow2D.unit_offset = 0
		$RedObject/Path2D.curve =  load("res://paths/path_red" + str(rand_path) + ".tres")
	elif rand == 1:
		if CircleColor == "Yellow":
			spawn_circle()
			return
		CircleColor = "Yellow"
		$RedObject.visible = false
		$YellowObject.visible = true
		$GreenObject.visible = false
		$YellowObject/Path2D/PathFollow2D.unit_offset = 0
		$YellowObject/Path2D.curve = load("res://paths/path_yellow" + str(rand_path) + ".tres")
	elif rand == 2:
		if CircleColor == "Green":
			spawn_circle()
			return
		CircleColor = "Green"
		$RedObject.visible = false
		$YellowObject.visible = false
		$GreenObject.visible = true
		$GreenObject/Path2D/PathFollow2D.unit_offset = 0
		$GreenObject/Path2D.curve = load("res://paths/path_green" + str(rand_path) + ".tres")
