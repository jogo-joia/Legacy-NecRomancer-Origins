extends Node

onready var file = File.new()
onready var dir = Directory.new()

func load_data(url):
	if url == null:
		return
	if not file.file_exists(url):
		return
	file.open(url, File.READ)
	
	var data = {}
	data = parse_json(file.get_as_text())
	file.close()
	
	return data

func write_data(url, dict):
	if url == null:
		return
	file.open(url, File.WRITE)
	
	file.store_line(to_json(dict))
	file.close()

func mkdir(path):
	if dir.open(path) == OK:
		print("DataParser.mkdir(): Directory '%s' already exists" % path)
		return -1
	else:
		dir.make_dir(path)

func mkdir_recursive(path):
	if dir.open(path) == OK:
		print("DataParser.mkdir_recursive(): Directory '%s' already exists." % path)
		return -1
	else:
		dir.make_dir_recursive(path)