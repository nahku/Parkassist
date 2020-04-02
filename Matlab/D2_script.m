%% Parametrize Model
set_param('D2','StopTime','2');
%set solver
set_param('D2','Solver',['ode',sprintf('%d',8)]);
%set simulation step size
set_param('D2','FixedStep',sprintf('%f',0.001));
%set brake pressure parameter
set_param('D2/p','value',sprintf('%f',0.05));


%% Simulate and get output
res = sim('D2','SaveOutput','on','SaveState','on');
t = res.tout;
v = res.yout{1}.Values.Data;
s = res.yout{2}.Values.Data;
a = res.yout{3}.Values.Data;
%convert velocity to km/h
v = v*3.6;

%% Plot results
subplot(3,1,1);
plot(t,a*ones(size(t)), 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Acceleration of car');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s]');

subplot(3,1,2);
plot(t,v, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Velocity of car');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');

subplot(3,1,3);
plot(t,s, 'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Covered distance');
xlabel('Time in [s]');
ylabel('Distance in [m]');


