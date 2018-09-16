function center_angle = cm(u,N_total,L)
if size(u,1) ~= N_total
    u = u';
end
su = size(u);
center_angle = zeros(1,su(2));

for iu = 1 :su(2)
    x_c = cos(0:(2*pi/N_total):(2*pi*(1-1/N_total)))*u(:,iu);
    y_c = sin(0:(2*pi/N_total):(2*pi*(1-1/N_total)))*u(:,iu);
    if y_c==0
        if x_c < 0
            center_angle(iu) = pi;
        else
            center_angle(iu) = 0;
        end
    else
        if x_c>0
            center_angle(iu) = asin(y_c/sqrt(x_c^2+y_c^2));
        else
            center_angle(iu) = pi-asin(y_c/sqrt(x_c^2+y_c^2));
        end
    end
    if center_angle(iu)<0
        center_angle(iu) = center_angle(iu)+2*pi;
    end
end
center_angle = center_angle/(2*pi)*L;
end