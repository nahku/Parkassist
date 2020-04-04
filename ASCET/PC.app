application {
	class resources.TimeTick
	class car.car
	class car.FrequencyComputation
	class car.ParkAssistController
	class test.SystemTestEnvironment
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task1 priority 0 period 2ms delay 0ms {
		process car.ParkAssistController.setBrake
		process car.FrequencyComputation.computePuls
		process car.car.drive
		process car.car.ultrasonic
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process car.car.drive
		process car.car.velocity
		process test.SystemTestEnvironment.calc
	}
}