package car;
import resources.DriverMessages;
import resources.CarMessages;

static class ParkAssist
writes DriverMessages.brake
reads CarMessages.acceleration, CarMessages.ultrasonic_distance {
	@generated("blockdiagram")
	@thread
	public void calc() {
		DriverMessages.brake = 0.5; // Main/calc 1
	}
}