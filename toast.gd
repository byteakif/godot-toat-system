extends Node

var canvas: CanvasLayer
var panel: Panel
var label: Label
var margin: MarginContainer
var tween: Tween


func _ready():
	canvas = CanvasLayer.new()
	add_child(canvas)
	panel = Panel.new()
	canvas.add_child(panel)
	panel.visible = false
	panel.modulate.a = 0.0
	panel.custom_minimum_size = Vector2(320, 70)

	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.12, 0.12, 0.12, 0.95)
	style.corner_radius_top_left = 16
	style.corner_radius_top_right = 16
	style.corner_radius_bottom_left = 16
	style.corner_radius_bottom_right = 16
	style.shadow_color = Color(0, 0, 0, 0.4)
	style.shadow_size = 8
	panel.add_theme_stylebox_override("panel", style)

	margin = MarginContainer.new()
	panel.add_child(margin)
	margin.anchor_right = 1
	margin.anchor_bottom = 1
	margin.offset_left = 10
	margin.offset_right = -10
	margin.offset_top = 10
	margin.offset_bottom = -10

	label = Label.new()
	margin.add_child(label)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

func set_toast_position():
	var screen_size = get_viewport().get_visible_rect().size
	var bottom_offset = 120
	panel.position = Vector2(
		screen_size.x / 2 - panel.size.x / 2,
		screen_size.y - bottom_offset
	)

func show_toast(text: String, time := .5):
	label.text = text
	if tween:
		tween.kill()

	panel.visible = true
	panel.modulate.a = 0.0
	panel.scale = Vector2(0.9, 0.9)

	set_toast_position()
	tween = create_tween()
	tween.tween_property(panel, "modulate:a", 1.0, 0.15)
	tween.parallel().tween_property(panel, "scale", Vector2(1.0, 1.0), 0.15)
	tween.tween_interval(time)
	tween.tween_property(panel, "modulate:a", 0.0, 0.2)
	tween.parallel().tween_property(panel, "scale", Vector2(0.95, 0.95), 0.2)

	await tween.finished
	panel.visible = false
