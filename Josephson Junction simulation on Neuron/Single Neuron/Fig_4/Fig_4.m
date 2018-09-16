p5=[500 1.9 0.01];
[T,Y]=SI_dyna(p5,[]); %[(Times Duration) (I_b) (Slope of input current)]
para=SI_para(p5); 
I_in=para.I_in*(p5(3)*T+1); %Forgot to write the current slope as p5(3) /para.I_in_slope, but only 0.01 in Prof. File 
plot(T,Y(:,2),'r-',T,I_in,'b.');
xlabel('Time(arb.units)');
ylabel('Flux and I_{in}(arb.units)');
legend('V_p','I_{in}');
