%% Parametrize Model
set_param('D3_test','StopTime','2');
%set solver
set_param('D3_test','Solver',['ode',sprintf('%d',8)]);
%set simulation step size
set_param('D3_test','FixedStep',sprintf('%f',0.001));
%set brake pressure parameter
set_param('D3_test/v0','value',sprintf('%f',10));


%% Simulate and get output
res = sim('D3_test','SaveOutput','on','SaveState','on');
t = res.tout;
v = res.yout{1}.Values.Data;
s = res.yout{2}.Values.Data;
a = res.yout{3}.Values.Data;
p = res.yout{4}.Values.Data;
%convert velocity to km/h
v = v*3.6;

%% Plot results
subplot(4,1,1);
plot(t,s, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Travelled Distance');
xlabel('Time in [s]');
ylabel('Distance [m]');

subplot(4,1,2);
plot(t,v, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Velocity of car');
xlabel('Time in [s]');
ylabel('Velocity [km/h]');

subplot(4,1,3);
plot(t,a, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Acceleration of car');
xlabel('Time in [s]');
ylabel('Acceleration [m/s^2]');

subplot(4,1,4);
plot(t,p, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Brake pedal position');
xlabel('Time in [s]');
ylabel('Pedal position');
