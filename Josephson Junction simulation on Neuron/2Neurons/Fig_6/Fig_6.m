[T,Y]=SI_dyna([300 2 2],[]);
plot(T,Y(:,11),'r-',T,Y(:,5),'bO');
xlabel('Time');
ylabel('Flux');
legend('V_{p2}','V_{p1}')
title('Title');
