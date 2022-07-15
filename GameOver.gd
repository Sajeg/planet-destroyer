extends Node2D
var highscore

func _ready():

	highscore = load_data()


	var points = Main.points
	if points > highscore:
		highscore = points
		save(highscore)
	
	$Text2.text = "Highscore: " + str(highscore)
	
	print(str(points))
	$Score.text = str(points-1000)

	for i in 10:
		yield(get_tree().create_timer(0.1), "timeout")
		$Score.text = str(points-1000+(100*i))
	
	yield(get_tree().create_timer(0.1), "timeout")
	$Score.text = str(points)



func save(content): #Save the highscore in NORMAL mode
	var file = File.new()
	file.open("user://highscore.save", File.WRITE)
	file.store_string(str(content))
	file.close()


func load_data(): 
	#loads the highscore data
	var file = File.new()
	if file.file_exists("user://highscore.save"):
		file.open("user://highscore.save", File.READ)
		var content = file.get_as_text()
		content = int(content) 
		file.close()
		return content
	else:
# warning-ignore:return_value_discarded
		file.open("user://highscore.save", File.WRITE)
		file.store_string("0")
		file.close()
		return 0
		