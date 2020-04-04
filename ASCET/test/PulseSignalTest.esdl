package test;

import assertLib.Assert;
import car.PulseSignalClass;

static class PulseSignalTest{
	
	PulseSignalClass pulseSignal;
	
	@Test
	public void signalZero(){
		real res;
		real frequency = 0.0;
		real dTs = 1.0;
		real expected_result = 0.0;
		
		res = pulseSignal.generatePulsSignal(frequency, dTs);
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void signalAlternatingZero(){
		real res;
		real frequency = 1.0;
		real dTs = 0.6;
		real expected_result = 0.0;
		
		res = pulseSignal.generatePulsSignal(frequency, 1.0);
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void signalAlternatingOne(){
		real res;
		real frequency = 1.0;
		real dTs = 0.1;
		real expected_result = 1.0;
		
		res = pulseSignal.generatePulsSignal(frequency, dTs);
		Assert.assertEqual(res, expected_result);
	}
	
	@Test
	public void continous_signal(){
		real res;
		real frequency = 10.0;
		real dTs = 1.0;
		real expected_result = 1.0;
		
		res = pulseSignal.generatePulsSignal(frequency, dTs);
		Assert.assertEqual(res, expected_result);
	}

}