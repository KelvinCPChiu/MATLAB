[T,Y]=SI_dyna([200 2],[]);
para=SI_para([200 2]);
Flux=para.lambda*(Y(:,1)+Y(:,3)); %This flux is Total flux , integration of V_p+V_c
plot(T,Flux);
xlabel('Time(arb.units)');
ylabel('Flux(arb.units)');
legend('Flux');


