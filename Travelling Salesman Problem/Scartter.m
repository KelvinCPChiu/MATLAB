function [ Ux, Uy] = Scartter(Path)
City=CitySet();
if size(Path,2)==9
    DD=11;
else
    DD=21;
end
Ux=zeros(1,DD);
Uy=zeros(1,DD);
label=cell(1,DD);
for x=1:DD
    if x==1||x==DD
        Ux(x)=City.a1(1);
        Uy(x)=City.a1(2);
        label(x)={'City 1'};
    else
eval(['label(',int2str(x),')={''City',int2str(Path(x-1)),'''};']);
eval(['Ux(',int2str(x),')=City.a',int2str(Path(x-1)),'(1);']);
eval(['Uy(',int2str(x),')=City.a',int2str(Path(x-1)),'(2);']);
    end
  
end
plot(Ux,Uy,'-^');
text(Ux,Uy,label,'VerticalAlignment','bottom','HorizontalAlignment','right')
xlabel('X location');
ylabel('Y location');
%title
end

