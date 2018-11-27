extends Control

signal win
signal lose

var enemy_name = "Zombie-Skeleton-Man-Boar"
var battle_message = "ROLL FOR INITIATIVE"
var player_hp = 30
var player_mp = 20
var enemy_hp = 45
var enemy_mp = 20
var gameover = false
var blocked = false
var turn = "player"

onready var AttackButton = get_node("AttackButton")
onready var HealButton = get_node("HealButton")
onready var RestButton = get_node("RestButton")

func _ready():
	AttackButton.connect("pressed", self, "_on_AttackButton_pressed")
	HealButton.connect("pressed", self, "_on_HealButton_pressed")
	RestButton.connect("pressed", self, "_on_RestButton_pressed")

func _on_AttackButton_pressed():
	attack()
func _on_HealButton_pressed():
	heal()
func _on_RestButton_pressed():
	rest()

func attack():
	randomize()
	if not blocked and not gameover:
		blocked = true
		attackroll = floor(rand_range(1, 6.9))
		battle_message = String("Lydia attacks for ", attackroll, " damage!")
		update_message()
		enemy_hp -= attackroll
		battle_round()

func update_message():
	pass

func battle_round():
	pass