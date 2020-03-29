package car;
import resources.TimeTick;

class driveModel {
	const real b = 10.0;
	const real c = 1.5;
	@get
	real v = 0.0;
	@get
	real s = 0.0;
	@get
	real acc;
	const real target_position = 2.0;
	@get
	real ultrasonic_distance = 0.0;

	@generated("blockdiagram")
	public void calc(real in p) {
		if (p == -0.14) {
			v = 10.0; // Main/calc 1/if-then 1
		} // Main/calc 1
		acc = ((-c) - (b * p)); // Main/calc 2
		v = ((((-c) - (b * p)) * 3.6 * TimeTick.dTs) + v); // Main/calc 3
		if (v < 0.29) {
			v = 0.0; // Main/calc 4/if-then 1
		} // Main/calc 4
		s = (((v * TimeTick.dTs) / 3.6) + s); // Main/calc 5
		ultrasonic_distance = (target_position - s); // Main/calc 6
	}
}