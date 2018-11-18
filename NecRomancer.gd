extends Control

var story = [
	"And so our story begins. Once upon a time...",
	"In the land of Hyrule.",
	"Everyone was okay, and everything was cool.",
	"Then the dark lord Ganon appeared and said:",
	"\"The Triforce is mine, and everything is dead!\""
]

var story_index = 0

func _ready():
	print_story()

func advance_story():
	if story_index <= story.size() - 2:
		story_index = story_index + 1
		print_story()

func print_story():
	get_node("MainUI/DialogPanel/MainDialogText").bbcode_text = story[story_index]

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		advance_story()