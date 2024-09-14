extends Area2D





func _on_body_entered(body: Node2D) -> void:
	queue_free()
	const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE_SCENE.instantiate();
	get_parent().add_child(smoke)
	smoke.global_position = global_position
	
	if body.has_method("increase_hit_count"):
		body.increase_hit_count()
