%% Parametrize model
set_param('D6','StopTime','3');
set_param('D6','Solver',['ode',sprintf('%d',8)]);
set_param('D6','FixedStep',sprintf('%f',0.001));
set_param('D6/p','value',sprintf('%f',0.05));
res = sim('D6','SaveOutput','on','SaveState','on');

%% Simulate and get output
t = res.tout;
v = res.yout{1}.Values.Data;
s = res.yout{2}.Values.Data;
pulse_frequency = res.yout{3}.Values.Data;
pulse = res.yout{4}.Values.Data;

%% Plot results
subplot(4,1,1);
plot(t,v, 'LineWidth', 1.5);
set(gca,'FontSize',20)
title('Velocity of car');
xlabel('Time in [s]');
ylabel('Velocity in [m/s]');

subplot(4,1,2);
plot(t,s, 'LineWidth', 1.5)
set(gca,'FontSize',20)
title('Covered distance');
xlabel('Time in [s]');
ylabel('Distance in [m]');

subplot(4,1,3);
plot(t,pulse_frequency, 'LineWidth', 1.5)
set(gca,'FontSize',20)
title('Pulse frequency');
xlabel('Time in [s]');
ylabel('Pulse Frequency');

subplot(4,1,4);
plot(t,pulse, 'LineWidth', 1.5)
set(gca,'FontSize',20)
title('Pulse signal');
xlabel('Time in [s]');
ylabel('Pulse Signal');