package car;
import resources.CarMessages;
import resources.DriverMessages;
import resources.TimeTick;

import car.ParkAssistControllerClass;

static class ParkAssistController
reads CarMessages.ultrasonic_distance
writes DriverMessages.brake {
	ParkAssistControllerClass ParkAssistControllerClass_instance_3;
	ParkAssistControllerClass ParkAssistControllerClass_instance_4;
	@get
	private real time = 0.0;

	@generated("blockdiagram")
	@thread
	public void setBrake() {
		time = (TimeTick.dTs + time); // Main/setBrake 1
		DriverMessages.brake = ParkAssistControllerClass_instance_4.getBrake(time); // Main/setBrake 2
	}
}