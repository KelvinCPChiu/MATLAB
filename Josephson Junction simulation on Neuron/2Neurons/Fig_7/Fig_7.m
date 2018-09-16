[T,Y]=SI_dyna([1000 -1.9 1.9],[]);
plot(T,Y(:,11),'r-',T,Y(:,5)-2,'bO');%Plot Vp2 versus time only
xlabel('Time');
ylabel('Flux');
legend('V_{p2}','V_{p1}')
title('Title');
