extends Area2D



var travalled_distance = 0
var hit_count = 1;

func _physics_process(delta: float):
	const SPEED = 800
	const RANGE = 1200
	#give the turn direction which the bullet is rotated
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travalled_distance += SPEED * delta
	
	if travalled_distance > RANGE:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		hit_count -= 1;
		body.take_damage()
	else:
		hit_count = 0
	if hit_count == 0:
		queue_free()
