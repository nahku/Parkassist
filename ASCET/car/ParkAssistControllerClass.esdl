package car;
import resources.curve_cont;

class ParkAssistControllerClass {
	characteristic curve_cont curve_cont_table = {{0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8}, {0.0, 0.01, 0.05, 0.08, 0.09, 0.08, 0.05, 0.01, 0.0}};

	@generated("blockdiagram")
	public real getBrake(real in time) {
		return curve_cont_table.getAt(time); // Main/getBrake 1
	}
}