extends PanelContainer

@onready var ascii_label: Label = $Picture

func _ready() -> void:
	load_ascii_art("res://ASCII_Pictures/camp.txt")

func load_ascii_art(file_path: String) -> void:
	if FileAccess.file_exists(file_path):
		var file := FileAccess.open(file_path, FileAccess.READ)
		var content := file.get_as_text().replace("\r", "")
		# Заменяем символ U+22C0 на обычную крышечку, которая есть в любом шрифте
		ascii_label.text = content.replace("⋀", "^")
	else:
		ascii_label.text = "Ошибка: файл не найден"
