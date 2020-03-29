package car;
import resources.TimeTick;

class settingsExperimentEnvironment {
	StopWatch StopWatch_instance;
	real time;

	@generated("blockdiagram")
	public boolean calc() {
		time = StopWatch_instance.time; // Main/calc 1
		StopWatch_instance.calc(TimeTick.dTs); // Main/calc 2
		return(time < 5.0); // Main/calc 3
	}
}