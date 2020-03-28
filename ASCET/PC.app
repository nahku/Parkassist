application {
	class resources.TimeTick
	class car.car
	class car.ParkAssist
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process car.ParkAssist.calc
		process car.car.calc
	}
}