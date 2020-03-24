set_param('D2','StopTime','1');
set_param('D2','FixedStep',sprintf('%f',0.01));
%set_param('D2/v0','value',sprintf('%f',10));
res = sim('D2','SaveOutput','on','SaveState','on');

t = res.tout;
v = res.yout{1}.Values.Data;
s = res.yout{2}.Values.Data;
v = v*3.6;
subplot(2,1,1);
plot(t,v, 'LineWidth', 1.5);
set(gca,'FontSize',22)
title('Velocity of car in full brake');
xlabel('Time in [s]');
ylabel('Velocity in [km/h]');

subplot(2,1,2);
plot(t,s, 'LineWidth', 1.5)
set(gca,'FontSize',22)
title('Covered distance');
xlabel('Time in [s]');
ylabel('Distance in [m]');


