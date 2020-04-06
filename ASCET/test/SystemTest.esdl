package test;
@generated("statemachine")
type SystemTestStatemachineStates is enum {
	Correct,
	Error
};

class SystemTest {
	@set
	real v;
	@set
	real pulseSignal;
	@set
	real position;
	@get
	boolean systemTest;

	@generated("statemachine")
	public void systemTestStatemachineTrigger() triggers SystemTestStatemachine;

	@generatedStateMachine
	statemachine SystemTestStatemachine using SystemTestStatemachineStates {
		start Correct;

		state Correct {
			static {
				systemTest = true;
			}
			transition v == 0.0 && pulseSignal == 1.0 to Error;
			transition position >= 2.0 to Error;
			transition v > 0.0 && position >= 1.9 && pulseSignal == 0.0 to Error;
		}

		state Error {
			static {
				systemTest = false;
			}
		}
	}
}