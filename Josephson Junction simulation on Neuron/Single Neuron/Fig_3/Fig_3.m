hold on
xlabel('Time(arb.units)');
ylabel('Flux(arb.units)');
Peak_Flux=zeros(1,round((0.55-0.45)/0.01+1));
for x=0.45:0.01:0.55  %Forgot to correct the Peak x for prof...after correction of parameter
[T,Y]=SI_dyna([100 1.7 x],[]);
plot(T,Y(:,2));%plot(T(100:size(T)),Y(100:size(T),2));
Peak_Flux(round((x-0.45)/0.01+1))=max(Y(:,2)); %Forgot to correct the Peak x for prof...after correction of parameter
end
hold off
% For , it is the peak, type
% plot([0.45:0.01:0.55],Peak_Flux); %Forgot to correct the Peak x for prof...after correction of parameter