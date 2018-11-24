extends Control

var story = {}
var story_index = 0
var voice_index = 0
var story_url = "res://NecRomEditor/NecRomancer.json"

var choice_buffer = []

# JsonPanel nodes
onready var WriteJsonButton = get_node("JsonPanel/WriteJsonButton")
onready var ReadJsonButton = get_node("JsonPanel/ReadJsonButton")

# list nodes
onready var AddPassageButton = get_node("SelectorPanel/HSplitSelector/VBoxPassages/HBox/AddPassageButton")
onready var RemovePassageButton = get_node("SelectorPanel/HSplitSelector/VBoxPassages/HBox/RemovePassageButton")
onready var PassageList = get_node("SelectorPanel/HSplitSelector/VBoxPassages/PassageList")
onready var AddVoiceButton = get_node("SelectorPanel/HSplitSelector/VBoxVoices/HBox/AddVoiceButton")
onready var RemoveVoiceButton = get_node("SelectorPanel/HSplitSelector/VBoxVoices/HBox/RemoveVoiceButton")
onready var VoiceList = get_node("SelectorPanel/HSplitSelector/VBoxVoices/VoicesList")
onready var PassageMoveUpButton = get_node("SelectorPanel/HSplitSelector/VBoxPassages/HBox2/PassageMoveUpButton")
onready var PassageMoveDownButton = get_node("SelectorPanel/HSplitSelector/VBoxPassages/HBox2/PassageMoveDownButton")
onready var VoiceMoveUpButton = get_node("SelectorPanel/HSplitSelector/VBoxVoices/HBox2/VoiceMoveUpButton")
onready var VoiceMoveDownButton = get_node("SelectorPanel/HSplitSelector/VBoxVoices/HBox2/VoiceMoveDownButton")

# voice editor nodes
onready var VoiceFaceBackground = get_node("VoiceEditor/VoiceFaceBackground")
onready var VoiceFaceTexture = get_node("VoiceEditor/VoiceFaceBackground/VoiceFaceTexture")
onready var VoiceRemoveFaceButton = get_node("VoiceEditor/VoiceFaceBackground/VoiceRemoveFaceButton")
onready var VoiceNameEdit = get_node("VoiceEditor/VoiceNameEdit")
onready var VoiceBgColorPicker = get_node("VoiceEditor/VoiceBgColorPicker")
onready var VoiceTextColorPicker = get_node("VoiceEditor/VoiceTextColorPicker")
onready var VoiceBgColorPreview = get_node("VoiceEditor/VoiceBgColorPreview")
onready var VoiceTextColorPreview = get_node("VoiceEditor/VoiceTextColorPreview")
onready var VoiceSaveButton = get_node("VoiceEditor/VoiceSaveButton")
onready var VoiceUndoButton = get_node("VoiceEditor/VoiceUndoButton")

# passage editor nodes
onready var PassageFaceBackground = get_node("PassageEditor/PassageFaceBackground")
onready var PassageFaceTexture = get_node("PassageEditor/PassageFaceBackground/PassageFaceTexture")
onready var PassageRemoveFaceButton = get_node("PassageEditor/PassageFaceBackground/PassageRemoveFaceButton")
onready var LabelEdit = get_node("PassageEditor/LabelEdit")
onready var VoiceEdit = get_node("PassageEditor/VoiceEdit")
onready var OverrideCheck = get_node("PassageEditor/OverrideCheck")
onready var BgColorPicker = get_node("PassageEditor/BgColorPicker")
onready var TextColorPicker = get_node("PassageEditor/TextColorPicker")
onready var TextEdit = get_node("PassageEditor/TextEdit")
onready var ChoicesList = get_node("PassageEditor/ChoicesList")
onready var AddChoiceButton = get_node("PassageEditor/AddChoiceButton")
onready var DuplicateChoiceButton = get_node("PassageEditor/DuplicateChoiceButton")
onready var RemoveChoiceButton = get_node("PassageEditor/RemoveChoiceButton")
onready var JumpCheck = get_node("PassageEditor/JumpCheck")
onready var ChoicesCheck = get_node("PassageEditor/ChoicesCheck")
onready var ChoiceLabelEdit = get_node("PassageEditor/ChoiceLabelEdit")
onready var ChoiceTextEdit = get_node("PassageEditor/ChoiceTextEdit")
onready var ChoiceSaveButton = get_node("PassageEditor/ChoiceSaveButton")
onready var ChoiceUndoButton = get_node("PassageEditor/ChoiceUndoButton")
onready var PassageSaveButton = get_node("PassageEditor/PassageSaveButton")
onready var PassageUndoButton = get_node("PassageEditor/PassageUndoButton")
onready var PassageBgColorPreview = get_node("PassageEditor/PassageBgColorPreview")
onready var PassageTextColorPreview = get_node("PassageEditor/PassageTextColorPreview")

func _ready():
	if not story:
		story = DataParser.load_data(story_url)
	connect_lists()
	connect_voice()
	connect_passage()
	connect_json()
	populate_passages()
	populate_voices()

func print_passage(index = story_index):
	get_node("DialogPanel/MainDialogText").bbcode_text = story["passages"][index]["text"]

func preview_passage():
	get_node("DialogPanel/MainDialogText").bbcode_text = TextEdit.text

func connect_lists():
	PassageList.connect("item_selected", self, "_on_PassageList_item_selected")
	VoiceList.connect("item_selected", self, "_on_VoiceList_item_selected")
	ChoicesList.connect("item_selected", self, "_on_ChoicesList_item_selected")

func connect_voice():
	VoiceSaveButton.connect("pressed", self, "save_voice")
	VoiceNameEdit.connect("text_changed", self, "_on_voice_changed")
	VoiceBgColorPicker.connect("color_changed", self, "_on_voice_changed")
	VoiceTextColorPicker.connect("color_changed", self, "_on_voice_changed")

func connect_passage():
	PassageSaveButton.connect("pressed", self, "save_passage")
	AddChoiceButton.connect("pressed", self, "add_choice")
	RemoveChoiceButton.connect("pressed", self, "remove_choice")
	ChoiceSaveButton.connect("pressed", self, "save_choice")
	LabelEdit.connect("text_changed", self, "_on_passage_changed")
	VoiceEdit.connect("text_changed", self, "_on_passage_changed")
	OverrideCheck.connect("toggled", self, "_on_passage_changed")
	BgColorPicker.connect("color_changed", self, "_on_passage_changed")
	TextColorPicker.connect("color_changed", self, "_on_passage_changed")
	TextEdit.connect("text_changed", self, "_on_passage_changed")
	JumpCheck.connect("toggled", self, "_on_passage_changed")
	ChoicesCheck.connect("toggled", self, "_on_passage_changed")
	ChoiceLabelEdit.connect("text_changed", self, "_on_passage_changed")
	ChoiceTextEdit.connect("text_changed", self, "_on_passage_changed")

func add_choice(index = story_index):
	var choice = {
		"label": "choice",
		"text": "choice"
	}
	choice_buffer.append(choice)
	ChoicesList.add_item("option")
	ChoicesList.select(ChoicesList.get_item_count() - 1)

func remove_choice(index = story_index):
	if ChoicesList.get_selected_items():
		choice_buffer.remove(ChoicesList.get_selected_items()[0])
		ChoicesList.remove_item(ChoicesList.get_selected_items()[0])
		_on_passage_changed()

func save_choice(index = story_index):
	story["passages"][index]["links"] = choice_buffer

func connect_json():
	WriteJsonButton.connect("pressed", self, "_on_WriteJsonButton_pressed")
	ReadJsonButton.connect("pressed", self, "_on_ReadJsonButton_pressed")

func _on_WriteJsonButton_pressed():
	DataParser.write_data(story_url, story)

func _on_voice_changed(value = null):
	var voice = story["voices"][voice_index]
	var new_name = "[{0}] {1}".format([voice_index, VoiceNameEdit.text])
	VoiceList.set_item_text(voice_index, new_name)
	VoiceBgColorPreview.color = VoiceBgColorPicker.color.to_html()
	VoiceTextColorPreview.add_color_override("default_color", VoiceTextColorPicker.color.to_html())
	VoiceFaceBackground.color = VoiceBgColorPicker.color.to_html()

func _on_passage_changed(value = null):
	var passage = story["passages"][story_index]
	var snippet = TextEdit.text
	var new_name = ""
	if LabelEdit.text == "":
		new_name = "[{0}] \"{1}\"".format([story_index, snippet])
	else:
		var item_label = LabelEdit.text
		new_name = "[{0}] [{1}] \"{2}\"".format([story_index, item_label, snippet])
	PassageList.set_item_text(story_index, new_name)
	PassageFaceBackground.color = BgColorPicker.color.to_html()
	PassageBgColorPreview.color = BgColorPicker.color.to_html()
	PassageTextColorPreview.add_color_override("default_color", TextColorPicker.color.to_html())
	#if ChoicesList.get_selected_items():
	#	var new_choice_name = "[{0}] [{1}]".format([ChoicesList.get_selected_items()[0], ChoiceLabelEdit.text])
	#	ChoicesList.set_item_text(ChoicesList.get_selected_items()[0], new_choice_name)
	if ChoicesList.items.size() > 0:
		for choice_index in passage["links"].size():
			var choice_label = passage["links"][choice_index]["label"]
			var choice_text = passage["links"][choice_index]["text"]
			if ChoicesList.get_selected_items():
				if choice_index == ChoicesList.get_selected_items()[0]:
					choice_label = ChoiceLabelEdit.text
					choice_text = ChoiceTextEdit.text
			var new_choice_name = "[{0}] [{1}] \"{2}\"".format([choice_index, choice_label, choice_text])
			ChoicesList.set_item_text(choice_index, new_choice_name)
	preview_passage()

func save_voice(index = voice_index):
	var voice = story["voices"][index]
	voice["name"] = VoiceNameEdit.text
	voice["face"] = VoiceFaceTexture.texture.resource_path
	voice["background_color"] = VoiceBgColorPicker.color.to_html()
	voice["text_color"] = VoiceTextColorPicker.color.to_html()

func save_passage(index = story_index):
	var passage = story["passages"][index]
	passage["label"] = LabelEdit.text
	passage["voice"] = VoiceEdit.text
	if OverrideCheck.pressed:
		passage["override"] = "1"
	else:
		passage["override"] = "0"
	passage["face"] = PassageFaceTexture.texture.resource_path
	passage["background_color"] = BgColorPicker.color.to_html()
	passage["text_color"] = TextColorPicker.color.to_html()
	passage["text"] = TextEdit.text
	if JumpCheck.pressed:
		passage["jump"] = "1"
	else:
		passage["jump"] = "0"
	if ChoicesCheck.pressed:
		passage["choices"] = "1"
	else:
		passage["choices"] = "0"
	passage["links"] = choice_buffer

func _on_PassageList_item_selected(index):
	load_passage(index)

func _on_VoiceList_item_selected(index):
	load_voice(index)

func _on_ChoicesList_item_selected(index):
	load_choice(index)

func load_voice(index):
	voice_index = index
	var voice = story["voices"][index]
	VoiceNameEdit.text = voice["name"]
	VoiceBgColorPicker.color = voice["background_color"]
	VoiceTextColorPicker.color = voice["text_color"]
	VoiceFaceBackground.color = voice["background_color"]
	VoiceBgColorPreview.color = voice["background_color"]
	VoiceTextColorPreview.add_color_override("default_color", voice["text_color"])

func load_passage(index):
	clear_choice()
	choice_buffer = []
	story_index = index
	print_passage(index)
	var passage = story["passages"][index]
	LabelEdit.text = passage["label"]
	VoiceEdit.text = passage["voice"]
	OverrideCheck.pressed = int(passage["override"])
	BgColorPicker.color = passage["background_color"]
	TextColorPicker.color = passage["text_color"]
	TextEdit.text = passage["text"]
	populate_choices(index)
	preview_passage()

func load_choice(choice_index):
	clear_choice()
	ChoiceLabelEdit.text = choice_buffer[choice_index]["label"]
	ChoiceTextEdit.text = choice_buffer[choice_index]["text"]

func clear_choice():
	ChoiceLabelEdit.text = ""
	ChoiceTextEdit.text = ""

func populate_choices(passage_index):
	ChoicesList.clear()
	for choice_index in story["passages"][passage_index]["links"].size():
		var label = story["passages"][passage_index]["links"][choice_index]["label"]
		var item_title = "[{0}] {1}".format([choice_index, label])
		ChoicesList.add_item(item_title)
		choice_buffer.append(story["passages"][passage_index]["links"][choice_index])

func populate_passages():
	PassageList.clear()
	for index in story["passages"].size():
		var snippet = story["passages"][index]["text"]
		var item_title = ""
		if story["passages"][index]["label"] == "":
			item_title = "[{0}] \"{1}\"".format([index, snippet])
		else:
			var item_label = story["passages"][index]["label"]
			item_title = "[{0}] [{1}] \"{2}\"".format([index, item_label, snippet])
		PassageList.add_item(item_title)

func populate_voices():
	VoiceList.clear()
	for index in story["voices"].size():
		var item_title = "[{0}] {1}".format([index, story["voices"][index]["name"]])
		VoiceList.add_item(item_title)

func move_choice_up(index):
	var test = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
	print(test)
	test.insert(index - 1, test[index])
	test.remove(index + 1)
	print(test)