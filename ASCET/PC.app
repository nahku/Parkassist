application {
	class resources.TimeTick
	class car.car
	class car.FrequencyComputation
	class car.ParkAssistController
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process car.ParkAssistController.calc
		process car.car.calc
		process car.FrequencyComputation.calc
	}
}