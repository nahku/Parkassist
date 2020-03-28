package car;
import resources.TimeTick;

class driveModel {
	const real b = 10.0;
	const real c = 1.5;
	@get
	real v;
	@set
	real p = 0.0;
	const real min_v = 0.0806;
	@get
	real s;
	const real zero = 0.0;
	real v_2;
	@get
	real acc;

	@generated("blockdiagram")
	public void calc() {
		v = ((((-c) - (b * p)) * TimeTick.dTs) + v); // Main/calc 1
		s = ((v * TimeTick.dTs) + s); // Main/calc 2
		if (v < min_v) {
			v = 0.0; // Main/calc 3/if-then 1
		} // Main/calc 3
		acc = ((-c) - (b * p)); // Main/calc 4
	}
}