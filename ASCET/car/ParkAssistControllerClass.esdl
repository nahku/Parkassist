package car;
import resources.curve_cont;

class ParkAssistControllerClass {
	characteristic curve_cont curve_cont_table = {{0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2}, {0.0, 0.043, 0.073, 0.078, 0.073, 0.043, 0.0}};
	
	@generated("blockdiagram")
	public real getBrake(real in time) {
		return curve_cont_table.getAt(time); // Main/getBrake 1
	}
}