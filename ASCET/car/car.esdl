package car;
import resources.ParkAssistMessages;
import resources.CarMessages;
import resources.TimeTick;

import car.DriveModel;

static class car
reads ParkAssistMessages.brake
writes CarMessages.v, CarMessages.position, CarMessages.acceleration, CarMessages.ultrasonic_distance {

	DriveModel driveModel_instance_2;

	@generated("blockdiagram")
	@thread
	public void velocity() {
		CarMessages.v = driveModel_instance_2.v; // Main/velocity 1
		CarMessages.position = driveModel_instance_2.s; // Main/velocity 2
		driveModel_instance_2.drive(ParkAssistMessages.brake, TimeTick.dTs); // Main/velocity 3
	}

	@generated("blockdiagram")
	@thread
	public void ultrasonic() {
		CarMessages.ultrasonic_distance = driveModel_instance_2.ultrasonic_distance; // Main/ultrasonic 1
	}

	@generated("blockdiagram")
	@thread
	public void drive() {
		CarMessages.acceleration = driveModel_instance_2.acc; // Main/drive 1
	}
}