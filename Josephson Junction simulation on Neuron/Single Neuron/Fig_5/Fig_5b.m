[T,Y]=SI_dyna([500 1.95 50 55 100],[]); 
%The profile of 5b,5c are not quite similar to the paper, probably the problem of parameters? And i forgot the parameter in the previous trials....
plot(T,Y(:,2));
xlabel('Time');
ylabel('Flux');