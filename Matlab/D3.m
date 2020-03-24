%import velocity data
velocity_data = importdata('../MeasuredVelocities.txt');

%plot(velocity_data(:,1),velocity_data(:,2))

%compute mean velocity of all 4 wheels
mean_velocity = mean(velocity_data(:,2:5),2);

%plot mean velocity
plot(velocity_data(:,1),mean_velocity)