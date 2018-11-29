extends Control

onready var story = DataParser.load_data("res://NecRomancer.json")

# var stringer = "hello my gell-o"

var arrayson = ["hey", "hello", "howdy"]

var story_index = 0

func _ready():
	print_story()

func advance_story():
	if story_index <= story["passages"].size() - 2:
		story_index = story_index + 1
		print_story()

func print_story():
	var passage = story["passages"][story_index]
	var passage_voice = null
	for voice in story["voices"]:
		if voice["name"] == passage["voice"]:
			passage_voice = voice
	print(passage["label"])
	match passage["label"]:
		"START":
			print("it begins")
		"c00":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c00.png")
		"c01":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c01.png")
		"c02":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c02.png")
		"c03":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c03.png")
		"c04":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c04.png")
		"c05":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c05.png")
		"c06":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c06.png")
		"c07":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c07.png")
		"c08":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c08.png")
		"c09":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c09.png")
		"c10":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c10.png")
		"c11":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c11.png")
		"c12":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c12.png")
		"c13":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c13.png")
		"c14":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c14.png")
		"c15":
			get_node("Stage/BackgroundTexture").texture = load("res://backgrounds/c15.png")
		"END":
			print("it ends")
		_:
			pass
	match story_index:
		8:
			stage_enter("Necromancer", "Right", "D")
		10:
			stage_enter("Blacksmith", "Left", "B")
		12:
			stage_enter("Lydia", "Left", "A")
		18:
			stage_move("Necromancer", "C")
			stage_move("Lydia", "B")
			stage_move("Blacksmith", "A")
		21:
			stage_move("Blacksmith", "B")
			stage_move("Lydia", "A")
		37:
			stage_move("Lydia", "B")
			stage_move("Blacksmith", "A")
		43:
			stage_move("Blacksmith", "B")
			stage_move("Lydia", "A")
		48:
			stage_move("Lydia", "C")
			stage_move("Blacksmith", "A")
			stage_move("Necromancer", "C")
		50:
			stage_move("Necromancer", "E")
		55:
			stage_move("Necromancer", "D")
			stage_move("Lydia", "B")
		65:
			stage_exit("Necromancer", "Right")
			stage_exit("Blacksmith", "Left")
			stage_exit("Lydia", "Left")
		67:
			stage_enter("Blacksmith", "Bottom", "C")
		69:
			stage_move("Blacksmith", "D")
			stage_enter("Lydia", "Left", "B")
		93:
			stage_exit("Blacksmith", "Left")
		94:
			stage_exit("Lydia", "Right")
		109:
			stage_enter("Lydia", "Bottom", "C")
		113:
			stage_move("Lydia", "A")
			stage_enter("Amelia", "Right", "C")
			stage_enter("Boar", "Right", "E")
		118:
			stage_move("Lydia", "C")
			stage_move("Amelia", "B")
		119:
			stage_exit("Lydia", "Bottom")
			stage_exit("Amelia", "Bottom")
			stage_exit("Boar", "Bottom")
		120:
			stage_enter("Amelia", "Left", "D")
			stage_enter("Lydia", "Left", "B")
		137:
			stage_exit("Amelia", "Left")
		139:
			stage_exit("Lydia", "Right")
		143:
			stage_enter("Guard2", "Right", "C")
			stage_enter("Guard1", "Right", "E")
		146:
			stage_enter("Lydia", "Left", "A")
		170:
			stage_move("Guard1", "D")
		183:
			stage_exit("Guard2", "Right")
			stage_move("Guard1", "C")
		190: 
			stage_enter("Guard2", "Right", "C")
			stage_move("Guard1", "E")
		193:
			stage_move("Lydia", "B")
			stage_move("Guard2", "D")
		194:
			stage_move("Guard1", "D")
			stage_move("Guard2", "E")
		195:
			stage_exit("Lydia", "Right")
			stage_exit("Guard1", "Right")
			stage_exit("Guard2", "Right")
		200:
			stage_enter("Guard2", "Right", "B")
		201:
			stage_enter("Guard1", "Bottom", "D")
		203:
			stage_exit("Guard1", "Left")
			stage_exit("Guard2", "Right")
		208:
			stage_enter("Ghost", "Bottom", "C")
		212:
			stage_exit("Ghost", "Bottom")
		216:
			stage_enter("Skull1", "Left", "B")
			stage_enter("Skull2", "Right", "D")
		219:
			stage_enter("Lydia", "Bottom", "A")
		230:
			stage_exit("Lydia", "Right")
		245:
			stage_exit("Skull1", "Left")
			stage_exit("Skull2", "Left")
		257:
			stage_enter("Wilson", "Right", "C")
			stage_enter("Zombert", "Right", "D")
			stage_enter("Putric", "Right", "E")
		259:
			stage_enter("Lydia", "Left", "A")
		262:
			stage_move("Putric", "C")
			stage_move("Wilson", "E")
		268:
			stage_move("Wilson", "C")
			stage_move("Putric", "E")
		271:
			stage_move("Zombert", "C")
			stage_move("Wilson", "D")
		275:
			stage_exit("Zombert", "Right")
			stage_exit("Wilson", "Right")
			stage_exit("Putric", "Right")
			stage_exit("Lydia", "Left")
		283:
			stage_enter("Margot", "Bottom", "C")
		290:
			stage_move("Margot", "A")
		291:
			stage_move("Margot", "C")
		318:
			stage_exit("Margot", "Bottom")
		331:
			stage_enter("Amelia2", "Bottom", "C")
		335:
			stage_enter("2ofswords", "Bottom", "C")
		337:
			stage_exit("2ofswords", "Bottom")
		338:
			stage_enter("3ofswords", "Bottom", "C")
		339:
			stage_exit("3ofswords", "Bottom")
		340:
			stage_enter("2ofswords", "Bottom", "C")
		342:
			stage_exit("2ofswords", "Bottom")
		343:
			stage_enter("5ofswords", "Bottom", "C")
		345:
			stage_exit("5ofswords", "Bottom")
		346:
			stage_enter("2ofswords", "Bottom", "C")
		348:
			stage_exit("2ofswords", "Bottom")
		349:
			stage_enter("Themoon", "Bottom", "C")
		351:
			stage_exit("Themoon", "Bottom")
		353:
			stage_exit("Amelia2", "Left")
		356:
			stage_enter("Amelia2", "Bottom", "C")
		360:
			stage_exit("Amelia2", "Left")
		367:
			stage_enter("Amelia", "Bottom", "C")
		372:
			stage_exit("Amelia", "Right")
		373:
			stage_enter("Lydia", "Right", "A")
		375:
			stage_move("Lydia", "C")
		376:
			stage_enter("Necromancer", "Left", "B")
		377:
			stage_move("Lydia", "D")
		382:
			stage_enter("Amelia", "Right", "E")
		384:
			stage_move("Amelia", "C")
		390:
			stage_move("Amelia", "A")
		391:
			stage_move("Necromancer", "C")
			stage_move("Lydia", "E")
		392:
			stage_exit("Necromancer", "Right")
			stage_exit("Lydia", "Right")
			stage_exit("Amelia", "Left")
		398:
			stage_enter("Necromancer", "Left", "C")
		411:
			stage_exit("Necromancer", "Right")
		414:
			stage_enter("Necromancer", "Left", "D")
		416:
			stage_enter("Lydia", "Left", "B")
		421:
			stage_exit("Necromancer", "Right")
		423:
			stage_exit("Lydia", "Right")
		430:
			stage_enter("Necromancer", "Bottom", "D")
		431:
			stage_enter("Lydia", "Bottom", "B")
		458:
			stage_exit("Lydia", "Bottom")
			stage_exit("Necromancer", "Bottom")
		464:
			stage_enter("Lydia", "Bottom", "C")
		465:
			stage_enter("Necromancer", "Bottom", "B")
		467:
			stage_move("Necromancer", "B")
		468:
			stage_move("Lydia", "A")
			stage_move("Necromancer", "B")
			stage_enter("Fish", "Right", "D")
		470:
			stage_exit("Lydia", "Bottom")
			stage_exit("Necromancer", "Bottom")
			stage_exit("Fish", "Bottom")
		474:
			stage_enter("Lydia", "Left", "B")
		475:
			stage_enter("Necromancer", "Right", "D")
		482:
			stage_move("Necromancer", "C")
		484:
			stage_move("Necromancer", "D")
		499:
			stage_exit("Necromancer", "Bottom")
		500:
			stage_exit("Lydia", "Bottom")
		508:
			stage_enter("Necromancer", "Left", "C")
		513:
			stage_exit("Necromancer", "Right")
		522:
			stage_enter("Ghost", "Bottom", "D")
		523:
			stage_exit("Ghost", "Bottom")
		526:
			stage_enter("Lydia", "Left", "B")
		527:
			stage_enter("Necromancer", "Right", "D")
		570:
			stage_move("Lydia", "A")
		593:
			stage_move("Necromancer", "B")
		595:
			stage_move("Lydia", "B")
			stage_move("Necromancer", "D")
		597:
			stage_move("Lydia", "C")
		599:
			stage_move("Lydia", "B")
		609:
			stage_move("Necromancer", "C")
		611:
			stage_exit("Lydia", "Bottom")
			stage_exit("Necromancer", "Bottom")

	if passage["override"] == "1":
		pass
	else:
		if passage_voice:
			get_node("MainUI/DialogPanel/MainDialogText").add_color_override("default_color", passage_voice["text_color"])
			get_node("MainUI/DialogPanel").color = passage_voice["background_color"]
			if passage_voice["face"] == "":
				get_node("MainUI/DialogPanel/Face").texture = null
				get_node("MainUI/DialogPanel/MainDialogText").rect_position = Vector2(140,30)
			else:
				get_node("MainUI/DialogPanel/Face").texture = load(passage_voice["face"])
				get_node("MainUI/DialogPanel/MainDialogText").rect_position = Vector2(215,30)
	get_node("MainUI/DialogPanel/MainDialogText").bbcode_text = passage["text"]

func _process(delta):
	if Input.is_action_just_released("ui_accept"):
		advance_story()

onready var CharSprite = load("res://CharacterSprite.tscn")

onready var MarkA = get_node("Stage/MarkA")
onready var MarkB = get_node("Stage/MarkB")
onready var MarkC = get_node("Stage/MarkC")
onready var MarkD = get_node("Stage/MarkD")
onready var MarkE = get_node("Stage/MarkE")

onready var characters = {
	"Amelia2": {
		"name": "Amelia2",
		"sprite": "res://sprites/Amelia2.png",
		"adjust": ""
	},
	"Amelia": {
		"name": "Amelia",
		"sprite": "res://sprites/Amelia.png",
		"adjust": ""
	},
	"Blacksmith": {
		"name": "Blacksmith",
		"sprite": "res://sprites/Blacksmith.png",
		"adjust": ""
	},
	"Boar": {
		"name": "Boar",
		"sprite": "res://sprites/Boar.png",
		"adjust": ""
	},
	"Fish": {
		"name": "Fish",
		"sprite": "res://sprites/Fish.png",
		"adjust": ""
	},
	"Ghost": {
		"name": "Ghost",
		"sprite": "res://sprites/Ghost.png",
		"adjust": ""
	},
	"Guard1": {
		"name": "Guard1",
		"sprite": "res://sprites/Guard1.png",
		"adjust": ""
	},
	"Guard2": {
		"name": "Guard2",
		"sprite": "res://sprites/Guard2.png",
		"adjust": ""
	},
	"Lydia": {
		"name": "Lydia",
		"sprite": "res://sprites/Lydia.png",
		"adjust": ""
	},
	"Margot": {
		"name": "Margot",
		"sprite": "res://sprites/Margot.png",
		"adjust": ""
	},
	"Necromancer": {
		"name": "Necromancer",
		"sprite": "res://sprites/Necromancer.png",
		"adjust": ""
	},
	"Putric": {
		"name": "Putric",
		"sprite": "res://sprites/Putric.png",
		"adjust": ""
	},
	"Skull1": {
		"name": "Skull1",
		"sprite": "res://sprites/Skull1.png",
		"adjust": ""
	},
	"Skull2": {
		"name": "Skull2",
		"sprite": "res://sprites/Skull2.png",
		"adjust": ""
	},
	"Wilson": {
		"name": "Wilson",
		"sprite": "res://sprites/Wilson.png",
		"adjust": ""
	},
	"Zombert": {
		"name": "Zombert",
		"sprite": "res://sprites/Zombert.png",
		"adjust": ""
	},
	"2ofswords": {
		"name": "2ofswords",
		"sprite": "res://sprites/2.png",
		"adjust": ""
	},
	"3ofswords": {
		"name": "3ofswords",
		"sprite": "res://sprites/3.png",
		"adjust": ""
	},
	"5ofswords": {
		"name": "5ofswords",
		"sprite": "res://sprites/5.png",
		"adjust": ""
	},
	"Themoon": {
		"name": "Themoon",
		"sprite": "res://sprites/lua.png",
		"adjust": ""
	},
	"Back": {
		"name": "Back",
		"sprite": "res://sprites/verso.png",
		"adjust": ""
	}
}

# marvolous stage processing
func stage_move(character, mark):
	for sprite in get_node("Stage").get_children():
		if sprite.is_in_group("characters"):
			if sprite.char_name == character:
				match mark:
					"A":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(MarkA.rect_position.x, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
					"B":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(MarkB.rect_position.x, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
					"C":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(MarkC.rect_position.x, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
					"D":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(MarkD.rect_position.x, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
					"E":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(MarkE.rect_position.x, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
	
func stage_exit(character, origin):
	for sprite in get_node("Stage").get_children():
		var wr = weakref(sprite)
		if (!wr.get_ref()):
			return
		if sprite.is_in_group("characters"):
			if sprite.char_name == character:
				match origin:
					"Left":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(0 - sprite.rect_size.x - 1, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
					"Right":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(get_viewport_rect().size.x + 1, 0), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
					"Bottom":
						var tween = sprite.get_node("Tween")
						tween.interpolate_property(sprite, "rect_position",
												sprite.rect_position,
												Vector2(sprite.rect_position.x, sprite.rect_size.y + 1), 0.5,
												Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
						tween.start()
				yield(get_tree().create_timer(0.55), "timeout")
				sprite.queue_free()

func stage_enter(character, origin, mark):
	var new_char = CharSprite.instance()
	new_char.texture = load(characters[character]["sprite"])
	new_char.char_name = characters[character]["name"]
	new_char.visible = false
	get_node("Stage").add_child(new_char)
	match origin:
		"Left":
			new_char.rect_position.x = 0 - new_char.rect_size.x - 1
		"Right":
			new_char.rect_position.x = get_viewport_rect().size.x + 1
		"Bottom":
			var mark_position_x = 0
			match mark:
				"A":
					mark_position_x = MarkA.rect_position.x
				"B":
					mark_position_x = MarkB.rect_position.x
				"C":
					mark_position_x = MarkC.rect_position.x
				"D":
					mark_position_x = MarkD.rect_position.x
				"E":
					mark_position_x = MarkE.rect_position.x
			new_char.rect_position.x = mark_position_x
			new_char.rect_position.y = MarkA.rect_position.y
	new_char.visible = true
	match mark:
		"A":
			var tween = new_char.get_node("Tween")
			tween.interpolate_property(new_char, "rect_position",
									new_char.rect_position,
									Vector2(MarkA.rect_position.x, 0), 0.5,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
		"B":
			var tween = new_char.get_node("Tween")
			tween.interpolate_property(new_char, "rect_position",
									new_char.rect_position,
									Vector2(MarkB.rect_position.x, 0), 0.5,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
		"C":
			var tween = new_char.get_node("Tween")
			tween.interpolate_property(new_char, "rect_position",
									new_char.rect_position,
									Vector2(MarkC.rect_position.x, 0), 0.5,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
		"D":
			var tween = new_char.get_node("Tween")
			tween.interpolate_property(new_char, "rect_position",
									new_char.rect_position,
									Vector2(MarkD.rect_position.x, 0), 0.5,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
		"E":
			var tween = new_char.get_node("Tween")
			tween.interpolate_property(new_char, "rect_position",
									new_char.rect_position,
									Vector2(MarkE.rect_position.x, 0), 0.5,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()