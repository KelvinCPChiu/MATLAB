function H = Sum_Hebbs(N_total,a,s)
%s=0.25;
Y=cell((N_total-1)/s+1,1);
for p=1:s:N_total
        T=Hebbs(N_total,p,a);
        Y(((p-1)/s)+1,1)={T};
end
X=cell2mat(Y); %matrix of all J 
% save Coupling_Audio_J X    
M=X'*X; %% entry = sum r1r2
mean=sum(X)/((N_total-1)/s+1);  
Mean=bsxfun(@times,mean,mean');  %<ri><rj>
H=(M-((N_total-1)/s+1)*Mean);
H=H/max(max(H));
%Hebb Rule coupling
% save Coupling_Audio H;

end

function Hebbs_Couple = Hebbs(N_total,p,a)
x = 1 : N_total;
dxy = bsxfun(@(x,p) (((N_total-2*abs(x-p)).*(abs(x-p)>N_total/2)+abs(x-p))*2*pi/N_total), x,p);
Hebbs_Couple = 1/sqrt(2*pi)/a*exp(-dxy.^2/4/a^2);
end