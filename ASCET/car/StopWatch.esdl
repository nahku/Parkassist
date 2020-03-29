package car;

class StopWatch {
	@get
	private real time = 0.0;

	@generated("blockdiagram")
	public void calc(real in deltaT) {
		time = (deltaT + time); // Main/calc 1
	}
}