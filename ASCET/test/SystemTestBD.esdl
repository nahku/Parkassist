package test;
import resources.CarMessages;
import resources.StateHandlerMessages;

static class SystemTestBD
reads CarMessages.pulse_signal, CarMessages.v, CarMessages.position
writes StateHandlerMessages.systemTest {
	SystemTest SystemTest_instance_3;

	@generated("blockdiagram")
	@thread
	public void calc() {
		SystemTest_instance_3.systemTestStatemachineTrigger(); // Main/calc 1
		SystemTest_instance_3.pulseSignal = CarMessages.pulse_signal; // Main/calc 2
		SystemTest_instance_3.v = CarMessages.v; // Main/calc 3
		SystemTest_instance_3.position = CarMessages.position; // Main/calc 4
		StateHandlerMessages.systemTest = SystemTest_instance_3.systemTest; // Main/calc 5
	}
}