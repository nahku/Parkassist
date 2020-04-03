package test;

import assertLib.Assert;
import car.DriveModel;


static class DriveModelTest{
	
	DriveModel driveModelInstance;
	
	@Test
	public void pZero(){
		real res_acc;
		real res_v;
		real res_s;
		real res_ultrasonic_distance;
		real p = 0.0;
		real dTs = 1.0;
		real expected_v = 4.6;
		
		driveModelInstance.drive(p, dTs);
		
		res_acc = driveModelInstance.acc;
		res_v = driveModelInstance.v;
		res_s = driveModelInstance.s;
		res_ultrasonic_distance = driveModelInstance.ultrasonic_distance;
		
		Assert.assertEqual(res_acc, -1.5);
		Assert.assertEqual(res_v, expected_v);
		Assert.assertBetween(res_s, 1.27, 1.28);
		Assert.assertBetween(res_ultrasonic_distance, 0.72, 0.73);
	}
	
	@Test
	public void p_0_5(){
		real res_acc;
		real res_v;
		real res_s;
		real res_ultrasonic_distance;
		real p = 0.5;
		real dTs = 0.1;
		real expected_v = 7.66;
		
		driveModelInstance.drive(p, dTs);
		
		res_acc = driveModelInstance.acc;
		res_v = driveModelInstance.v;
		res_s = driveModelInstance.s;
		res_ultrasonic_distance = driveModelInstance.ultrasonic_distance;
		
		Assert.assertEqual(res_acc, -6.5);
		Assert.assertEqual(res_v, expected_v);
		Assert.assertBetween(res_s, 0.21, 0.22);
		Assert.assertBetween(res_ultrasonic_distance, 1.7, 1.8);
	}
}