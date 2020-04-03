package car;
import resources.TimeTick;
import resources.ParkAssistMessages;

static class ParkAssistController
writes ParkAssistMessages.brake {
	ParkAssistControllerClass ParkAssistControllerClass_instance_4;
	@get
	private real time = 0.0;

	@generated("blockdiagram")
	@thread
	public void setBrake() {
		time = (TimeTick.dTs + time); // Main/setBrake 1
		ParkAssistMessages.brake = ParkAssistControllerClass_instance_4.getBrake(time); // Main/setBrake 2
	}
}