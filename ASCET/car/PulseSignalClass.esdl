package car;
import resources.TimeTick;

class PulseSignalClass {
	real integrated_frequency;

	@generated("blockdiagram")
	public real calc(real in frequency, real in dTs) {
		if (10.0 == frequency) {
			return 1.0; // Main/calc 1/if-then 1
		} else {
			if (frequency == 0.0) {
				return 0.0; // Main/calc 1/if-else 1/if-then 1
			} else {
				if (integrated_frequency > 1.0) {
					integrated_frequency = 0.0; // Main/calc 1/if-else 1/if-else 1/if-then 1
				} // Main/calc 1/if-else 1/if-else 1
				integrated_frequency = ((frequency * dTs) + integrated_frequency); // Main/calc 1/if-else 1/if-else 2
				if (integrated_frequency >= 0.5) {
					return 1.0; // Main/calc 1/if-else 1/if-else 3/if-then 1
				} else {
					return 0.0; // Main/calc 1/if-else 1/if-else 3/if-else 1
				} // Main/calc 1/if-else 1/if-else 3
			} // Main/calc 1/if-else 1
		} // Main/calc 1
	}
}