extends Control

var story = {}
var story_index = 0
var voice_index = 0
var story_url = "res://NecRomEditor/NecRomancer.json"

func _ready():
	if not story:
		story = DataParser.load_data(story_url)
	populate_passages()

func print_story(index = story_index):
	get_node("DialogPanel/MainDialogText").bbcode_text = story["passages"][index]

func populate_passages():
	var PassageList = get_node("SelectorPanel/HSplitSelector/VBoxPassages/PassageList")
	for index in story["passages"].size():
		var item_title = String([index, ": ", story["passages"][index]["label"]])
		PassageList.add_item(item_title)