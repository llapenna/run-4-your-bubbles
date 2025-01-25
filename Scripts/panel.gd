extends Panel


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var miliseconds: int= 0


func _process(delta: float) -> void:
	time +=delta
	miliseconds = fmod(time, 1) * 100
	seconds= fmod(time, 60)
	minutes= fmod(time,3600) / 60
	$Horas.text= "%02d:" % minutes
	$Minutos.text="%02d." % seconds
	$Segundos.text="%03d" % miliseconds
