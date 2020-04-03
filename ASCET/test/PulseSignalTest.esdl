package test;

import assertLib.Assert;
import car.PulseSignalClass;

static class PulseSignalTest{
	
	PulseSignalClass pulseSignal;
	
	@Test
	public void signalZero(){
		real res;
		real frequency = 0.0;
		real expected_result = 0.0;
		
		res = pulseSignal.generatePulsSignal(frequency, 1.0);
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void continous_signal(){
		real res;
		real frequency = 10.0;
		real expected_result = 1.0;
		
		res = pulseSignal.generatePulsSignal(frequency, 1.0);
		Assert.assertEqual(res, expected_result);
	}

}