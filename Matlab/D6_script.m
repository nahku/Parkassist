set_param('D6','StopTime','10');
set_param('D6','FixedStep',sprintf('%f',0.01));
set_param('D6/p','value',sprintf('%f',0.1));
res = sim('D6','SaveOutput','on','SaveState','on');

t = res.tout;
v = res.yout{1}.Values.Data;
s = res.yout{2}.Values.Data;
pulse_hz = res.yout{3}.Values.Data;

