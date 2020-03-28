package car;
import resources.DriverMessages;
import resources.CarMessages;

static class car
reads DriverMessages.brake
writes CarMessages.v, CarMessages.position, CarMessages.acceleration {
	real c;
	real b;
	real v;
	driveModel driveModel_instance_7;
	driveModel driveModel_instance_8;

	@generated("blockdiagram")
	@thread
	public void calc() {
		driveModel_instance_8.calc(); // Main/calc 1
		CarMessages.acceleration = driveModel_instance_8.acc; // Main/calc 2
		CarMessages.position = driveModel_instance_8.s; // Main/calc 3
		CarMessages.v = driveModel_instance_8.v; // Main/calc 4
		driveModel_instance_8.p = DriverMessages.brake; // Main/calc 5
	}
}