function MF = M_ij(N_total,a)
% Compare the stimuli discrimination performance with a network without STD
% but with local inhibition.

% I will wait to see the results of the feedforward network, and 
% the recurrent network with local inhibition.

% For example, a purely feedforward network with spatially broader 
% feedforward inhibition than excitation may reproduce the main findings 
% if the input from two directions are independently fluctuating. Please, 
% explain the strength of this particular model-imprementation.

x = 1 : N_total;
y = (1 : N_total)';
dxy = bsxfun(@(x,y) (((N_total-2*abs(x-y)).*(abs(x-y)>N_total/2)+abs(x-y))*2*pi/N_total), y, x);
J = 1/sqrt(2*pi)/a*exp(-dxy.^2/4/a^2);

end