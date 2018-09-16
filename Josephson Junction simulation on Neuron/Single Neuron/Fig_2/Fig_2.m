[T,Y]=SI_dyna([200 2],[]);
plot(T,Y(:,2),'r-',T,-Y(:,4),'b.');
xlabel('Time(arb.units)');
ylabel('Flux(arb.units)');
legend('V_p','V_c');


