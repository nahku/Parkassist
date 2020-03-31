package car;
import resources.CarMessages;
import resources.TimeTick;

static class FrequencyComputation
reads CarMessages.v, CarMessages.position
writes CarMessages.pulse_signal {
	PulseSignalClass PulseSignalClass_instance_2;
	FrequencyComputationClass FrequencyComputationClass_instance_3;
	PulseSignalClass PulseSignalClass_instance_3;
	PulseSignalClass PulseSignalClass_instance;

	@generated("blockdiagram")
	@thread
	public void calc() {
		CarMessages.pulse_signal = PulseSignalClass_instance.calc(FrequencyComputationClass_instance_3.calc(CarMessages.v, CarMessages.position), TimeTick.dTs); // Main/calc 1
	}
}