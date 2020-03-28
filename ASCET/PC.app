application {
	class resources.TimeTick
	class car.car
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process car.car.calc
	}
}