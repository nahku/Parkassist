package car;
import resources.CarMessages;
import resources.DriverMessages;

static class ParkAssistController
reads CarMessages.ultrasonic_distance
writes DriverMessages.brake {
	settingsExperimentEnvironment settingsExperimentEnvironment_instance;
	ParkAssistControllerClass ParkAssistControllerClass_instance_3;
	ParkAssistControllerClass ParkAssistControllerClass_instance_4;

	@generated("blockdiagram")
	@thread
	public void calc() {
		if (settingsExperimentEnvironment_instance.calc()) {
			DriverMessages.brake = -0.15; // Main/calc 1/if-then 1
		} else {
			DriverMessages.brake = ParkAssistControllerClass_instance_4.calc(CarMessages.ultrasonic_distance); // Main/calc 1/if-else 1
		} // Main/calc 1
	}
}