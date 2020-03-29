package car;
import resources.DriverMessages;
import resources.CarMessages;

static class car
reads DriverMessages.brake
writes CarMessages.v, CarMessages.position, CarMessages.acceleration, CarMessages.ultrasonic_distance {
	driveModel driveModel_instance_3;

	@generated("blockdiagram")
	@thread
	public void calc() {
		driveModel_instance_3.calc(DriverMessages.brake); // Main/calc 1
		CarMessages.v = driveModel_instance_3.v; // Main/calc 2
		CarMessages.position = driveModel_instance_3.s; // Main/calc 3
		CarMessages.acceleration = driveModel_instance_3.acc; // Main/calc 4
		CarMessages.ultrasonic_distance = driveModel_instance_3.ultrasonic_distance; // Main/calc 5
	}
}