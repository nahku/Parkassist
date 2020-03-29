package car;
import resources.curve_cont;

class ParkAssistControllerClass {
	characteristic curve_cont curve_cont_table = {{0.0, 0.3, 0.75, 1.15, 1.5, 2.0}, {-0.15, 0.02, 0.12, 0.118, 0.1, -0.14}};

	@generated("blockdiagram")
	public real calc(real in ultrasonic_distance) {
		return curve_cont_table.getAt(ultrasonic_distance); // Main/calc 1
	}
}