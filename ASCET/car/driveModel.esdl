package car;
import resources.TimeTick;

class driveModel {
	const real b = 10.0;
	const real c = 1.5;
	@get
	real v = 10.0;
	@get
	real s = 0.0;
	@get
	real acc;
	const real target_position = 2.0;
	@get
	real ultrasonic_distance = 0.0;

	@generated("blockdiagram")
	public void drive(real in p, real in dTs) {
		acc = ((-c) - (b * p)); // Main/drive 1
		v = ((dTs * 3.6 * ((-c) - (b * p))) + v); // Main/drive 2
		if (v < 0.29) {
			v = 0.0; // Main/drive 3/if-then 1
		} // Main/drive 3
		s = (((dTs * v) / 3.6) + s); // Main/drive 4
		ultrasonic_distance = (target_position - s); // Main/drive 5
	}
}