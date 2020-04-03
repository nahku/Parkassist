%Clear workspace
clear all

%import velocity data
velocity_data = importdata('MeasuredVelocities.txt');

%compute mean velocity of all 4 wheels
velocity_per_wheel = velocity_data(:,2:5);
mean_velocity = mean(velocity_per_wheel,2);
mean_velocity = mean_velocity/3.6;      %convert velocity from km/h to m/s
raw_mean_velocity = mean_velocity;      %for demonstration purposes

%apply moving average filter to smoothen the data
mean_velocity = movmean(mean_velocity, 200); 

%differentiate velocity to get acceleration
acceleration = diff(mean_velocity);
raw_acceleration = diff(raw_mean_velocity);     %for demonstration purposes
min(raw_acceleration)

%search for negative acceleration and set positive acceleration to NaN
%set all velocities that have a positive acceleration to NaN
neg_acceleration = acceleration;
decreasing_velocity = mean_velocity;
neg_acceleration(neg_acceleration>0) = nan;
decreasing_velocity(isnan(neg_acceleration)) = nan;

%find individual breaking sequences
notNaN_velocity = find(~isnan(decreasing_velocity));   % find index of every velocity that is not NaN -> one breaking sequence has
                                                       % consequent time steps -> one breaking sequence has consequent indices
diff_notNaN_velocity = diff(notNaN_velocity);          % differentiate indices -> if indices are not consequent (unequal 1), a new
                                                       % breaking sequence has begun
n = 1;                                                 % set start values
start = 1;

%seperate breaking sequences with previous findings
for i=1:length(diff_notNaN_velocity)
    %for every index check if indices are consequent -> equals 1
    if diff_notNaN_velocity(i) > 1
        %if not check if a breaking sequence consists of min 500 time
        %steps, this way small breaking sequences are sorted out
        if (i-start) > 500
            %add breaking sequence to section
            %i is end of sequence
            section{n} = notNaN_velocity(start:i);
            %start for new sequence is end of old sequence + 1
            start = i+1;
            %increment n
            n = n+1;
        else
            %if breaking sequence is to small, set start for new sequence
            %to end of old sequence + 1 anyway
            start = i+1;
        end
    end
end


%% Plots

%Plot 1 - Overview of velocity and acceleration of the car from the
%measurement
figure;
subplot(2,1,1);
plot(velocity_data(:,1), mean_velocity*3.6,'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Velocity of car');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');
subplot(2,1,2);
plot(velocity_data(2:length(velocity_data),1),acceleration,'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Acceleration of car');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s^2]');

%Plot 2 - Demonstration of the advantages of applying a moving average
%filter to the cars velocity
figure;
subplot(2,1,1);
plot(velocity_data(2:length(velocity_data),1),raw_acceleration,'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Acceleration of car');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s^2]');
subplot(2,1,2);
plot(velocity_data(2:length(velocity_data),1),acceleration,'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Acceleration of car with applied moving average filter');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s^2]');

%Plot 3 - Overview of velocity and acceleration while braking
figure
%Plot velocity of all braking sequences in one plot
subplot(2,1,1);
for i=1:length(section)
    plot(velocity_data(section{1,i},1),decreasing_velocity(section{1,i})*3.6,'LineWidth', 1.5)
    hold on
end 
set(gca,'FontSize',22)
title('Velocity of car while braking');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');

%Plot acceleration of all braking sequences in one plot
subplot(2,1,2);
for i=1:length(section)
    plot(velocity_data(section{1,i},1),neg_acceleration(section{1,i}), 'LineWidth', 1.5) 
    hold on
end
set(gca,'FontSize',22)
title('Acceleration of car while braking');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s^2]');

%Plot 4 - Extracted braking sequence
figure
%Plot only one braking sequence for a more detailled view
subplot(2,1,1);
plot(velocity_data(section{1,9},1),decreasing_velocity(section{1,9})*3.6, 'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Velocity of car while braking');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');

subplot(2,1,2);
plot(velocity_data(section{1,9},1),neg_acceleration(section{1,9}), 'LineWidth', 1.5) 
set(gca,'FontSize',22)
title('Acceleration of car while braking');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s^2]');

%Plot 5 - Extracted braking sequence
figure
%Plot another braking sequence for a more detailled view
subplot(2,1,1);
plot(velocity_data(section{1,7},1),decreasing_velocity(section{1,7})*3.6, 'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Velocity of car while braking');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');

subplot(2,1,2);
plot(velocity_data(section{1,7},1),neg_acceleration(section{1,7}), 'LineWidth', 1.5) 
set(gca,'FontSize',22)
title('Acceleration of car while braking');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s^2]');


