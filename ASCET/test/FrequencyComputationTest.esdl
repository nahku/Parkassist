package test;

import assertLib.Assert;
import car.FrequencyComputationClass;

static class FrequencyComputationTest{
	
	FrequencyComputationClass frequencyComputation;
	
	@Test
	public void continuousPulse(){
		real res;
		real v = (0.5)*3.6;
		real x = 1.91;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 10.0);
	}
	
	@Test
	public void noFrequencyBecauseVelocity(){
		real res;
		real v = (1.5)*3.6;
		real x = 1.8;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 0.0);
	}
	
	@Test
	public void noFrequencyBecauseVelocityZero(){
		real res;
		real v = 0.0;
		real x = 1.8;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 0.0);
	}
	
	@Test
	public void noFrequencyBecausePositon(){
		real res;
		real v = (0.9)*3.6;
		real x = 0.9;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 0.0);
	}
	
	@Test
	public void noFrequencyBecauseVelocityAndPositon(){
		real res;
		real v = (1.1)*3.6;
		real x = 0.9;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 0.0);
	}
	
	@Test
	public void frequencyLow(){
		real res;
		real v = (1.0)*3.6;
		real x = 1.0;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 1.0);
	}

	@Test
	public void frequencyHigh(){
		real res;
		real v = (1.0)*3.6;
		real x = 1.9;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertEqual(res, 9.0);
	}
	
	@Test
	public void frequencyMid(){
		real res;
		real v = (1.0)*3.6;
		real x = 1.5;
		
		res = frequencyComputation.computeFrequency(v,x);
		Assert.assertBetween(res, 5.44, 5.45);
	}	
}

