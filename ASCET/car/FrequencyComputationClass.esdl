package car;
import resources.curve_cont;

class FrequencyComputationClass {
	characteristic curve_cont frequency_lookup = {{1.0, 1.9}, {1.0, 9.0}};

	@generated("blockdiagram")
	public real computeFrequency(real in v, real in x) {
		if ((((v / 3.6) > 0.0) && ((v / 3.6) <= 1.0)) && (x >= 1.9)) {
			return 10.0; // Main/computeFrequency 1/if-then 1
		} else {
			if ((((v / 3.6) > 0.0) && ((v / 3.6) <= 1.0)) && (x >= 1.0)) {
				return frequency_lookup.getAt(x); // Main/computeFrequency 1/if-else 1/if-then 1
			} else {
				return 0.0; // Main/computeFrequency 1/if-else 1/if-else 1
			} // Main/computeFrequency 1/if-else 1
		} // Main/computeFrequency 1
	}
}