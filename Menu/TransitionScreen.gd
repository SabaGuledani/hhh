extends CanvasLayer

signal transitioned

func transition(mode):
	if mode == "gamestart":
		$RichTextLabel.text = "iyo da ara iyo ra, mediawignierebaze ukeTesi ra iqneboda..."
	else:
		$RichTextLabel.text = "...Wiri iqa, lxini aqa, qato iqa, fqvili aqa."

	$AnimationPlayer.play("fade_to_black")
	await get_tree().create_timer(1).timeout
	$RichTextLabel.visible = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
		await get_tree().create_timer(1).timeout
		$RichTextLabel.visible = false
