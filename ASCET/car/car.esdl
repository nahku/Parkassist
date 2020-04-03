package car;
import resources.DriverMessages;
import resources.CarMessages;
import resources.TimeTick;

static class car
reads DriverMessages.brake
writes CarMessages.v, CarMessages.position, CarMessages.acceleration, CarMessages.ultrasonic_distance {
	driveModel driveModel_instance_3;
	driveModel driveModel_instance;
	driveModel driveModel_instance_2;

	@generated("blockdiagram")
	@thread
	public void velocity() {
		CarMessages.v = driveModel_instance_2.v; // Main/velocity 1
		CarMessages.position = driveModel_instance_2.s; // Main/velocity 2
	}

	@generated("blockdiagram")
	@thread
	public void ultrasonic() {
		CarMessages.ultrasonic_distance = driveModel_instance_2.ultrasonic_distance; // Main/ultrasonic 1
	}

	@generated("blockdiagram")
	@thread
	public void drive() {
		driveModel_instance_2.drive(DriverMessages.brake, TimeTick.dTs); // Main/drive 1
		CarMessages.acceleration = driveModel_instance_2.acc; // Main/drive 2
	}
}