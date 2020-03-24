clear all

%import velocity data
velocity_data = importdata('MeasuredVelocities.txt');

%plot(velocity_data(:,1),velocity_data(:,2))

%compute mean velocity of all 4 wheels
a = velocity_data(:,2:5);
mean_velocity = mean(a,2);
mean_velocity = movmean(mean_velocity, 200); %apply moving average filter to smoothen the data
acceleration = diff(mean_velocity);

%plot mean velocity
plot(velocity_data(:,1),mean_velocity, 'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Mean car velocity');
xlabel('Time in [s]');
ylabel('Velocity in [m/s]');

neg_acceleration = acceleration;
decreasing_velocity = mean_velocity;

neg_acceleration(neg_acceleration>0) = nan;
decreasing_velocity(isnan(neg_acceleration)) = nan;

max = ceil(max(decreasing_velocity));
M = zeros(max,1);

for i=0:max-1
    index = find(decreasing_velocity >= i & decreasing_velocity < i+1);
    if (index(end) > length(neg_acceleration))
        index(end) = [];
    end
    tmp_acceleration = mean(neg_acceleration(index));
    M(i+1,1)= mean(tmp_acceleration);
end

%plot mean velocity and acceleration
subplot(2,1,1);
plot(velocity_data(:,1),mean_velocity)
subplot(2,1,2);
plot(velocity_data(2:length(velocity_data),1),acceleration)

%plot mean velocity and acceleration
subplot(2,1,1);
plot(velocity_data(:,1),decreasing_velocity)
subplot(2,1,2);
plot(velocity_data(2:length(velocity_data),1),neg_acceleration)
ylim([min(neg_acceleration) min(neg_acceleration)*-1])



%plot(M, 'o')
