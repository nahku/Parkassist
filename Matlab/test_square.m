function [period] = test_square(frequency)
%TEST_SQUARE Summary of this function goes here
%   Detailed explanation goes here
standard_pulse_width = 0.1; %second
if((frequency>=1) && (frequency <=9))
    period = 1/frequency;
    pulse_width = 0.1/period*100; %pulse width 0.1
else
    period = 0;
    pulse_width = 0;
end
end

