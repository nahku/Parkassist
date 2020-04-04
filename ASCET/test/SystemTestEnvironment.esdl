package test;
import resources.CarMessages;

static class SystemTestEnvironment
reads CarMessages.v, CarMessages.position{
	boolean position_less_2m;
	boolean pulse_zero;
	real acc;
	real v;

	@generated("blockdiagram")
	@thread
	public void calc() {
		position_less_2m = ((CarMessages.v == 0.0) && (CarMessages.position < 2.0)); // Main/calc 1
	}
}