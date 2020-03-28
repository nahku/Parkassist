package car;
import resources.DriverMessages;
import resources.CarMessages;

static class car
reads DriverMessages.brake
writes CarMessages.v, CarMessages.position, CarMessages.acceleration, CarMessages.ultrasonic_distance {
	driveModel driveModel_instance;

	@generated("blockdiagram")
	@thread
	public void calc() {
		driveModel_instance.p = DriverMessages.brake; // Main/calc 1
		driveModel_instance.calc(); // Main/calc 2
		CarMessages.v = driveModel_instance.v; // Main/calc 3
		CarMessages.position = driveModel_instance.s; // Main/calc 4
		CarMessages.acceleration = driveModel_instance.acc; // Main/calc 5
		CarMessages.ultrasonic_distance = driveModel_instance.ultrasonic_distance; // Main/calc 6
	}
}