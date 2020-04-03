%% Parametrize Model
set_param('D5','StopTime','2');
%set solver
set_param('D5','Solver',['ode',sprintf('%d',8)]);
%set simulation step size
set_param('D5','FixedStep',sprintf('%f',0.001));
%set brake pressure parameter
set_param('D5/p','value',sprintf('%f',0.05));


%% Simulate and get output
res = sim('D5','SaveOutput','on','SaveState','on');
t = res.tout;
v2 = res.yout{1}.Values.Data;
s2 = res.yout{2}.Values.Data;
a = res.yout{3}.Values.Data;
v = res.yout{4}.Values.Data;
s = res.yout{5}.Values.Data;
%convert velocity to km/h
v = v*3.6;
v2 = v2*3.6;

%% Plot results
subplot(4,1,1);
plot(t,s, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Acceleration of car');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s]');

subplot(4,1,2);
plot(t,s2, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Acceleration of car');
xlabel('Time in [s]');
ylabel('Acceleration in [m/s]');

subplot(4,1,3);
plot(t,v, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Velocity of car');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');

subplot(4,1,4);
plot(t,v2, 'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Covered distance');
xlabel('Time in [s]');
ylabel('Distance in [m]');
