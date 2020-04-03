package car;
import resources.CarMessages;
import resources.TimeTick;

static class FrequencyComputation
reads CarMessages.v, CarMessages.position
writes CarMessages.pulse_signal {
	FrequencyComputationClass FrequencyComputationClass_instance_3;
	PulseSignalClass PulseSignalClass_instance;

	@generated("blockdiagram")
	@thread
	public void computePuls() {
		CarMessages.pulse_signal = PulseSignalClass_instance.generatePulsSignal(FrequencyComputationClass_instance_3.computeFrequency(CarMessages.v, CarMessages.position), TimeTick.dTs); // Main/computePuls 1
	}
}