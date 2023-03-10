%ejercicio5
%el programa no esta optimizado y lleva un tiempo.
phi=20;
gamma=9.7803.*(1+5.30244e-3.*sind(2*phi)-5.8e-6.*sind(2*phi));
epsL=[-20:20:20];
am=6371000;
a=[-180:1:180];
h=180+a;
G=6.47374e-14*am^2;
i=1;
j=1;
k=1;
z=1;
%calcular el potencial
    while j<4
        while k <362
        Ul1(j,k)=G.*3.*((sind(epsL(j)).^2)-(1/3)).*((sind(phi).^2)-1/3)
        Ul2(j,k)=-G.*sind(2*phi).*sind(2*epsL(j)).*cosd(h(k))
        Ul3(j,k)=G.*cosd(epsL(j)).^2*cosd(phi).^2*cosd(2*h(k))
        k=k+1;
        end 
        k=1;
        j=j+1;
    end
    j=1;
    k=1;
%calcular la altura de mareas
while i<4
    while j<4
        while k<362
        Xi1(j,k)=Ul1(j,k)./gamma
        Xi2(j,k)=Ul2(j,k)./gamma
        Xi3(j,k)=Ul3(j,k)./gamma 
        XiT(j,k)=Xi1(j,k)+Xi2(j,k)+Xi3(j,k)
        k=k+1;
        end
        k=1;
        j=j+1;
    end
j=1;
i=i+1;
end
%plotear las figuras
while z<4
n=z+3;
h=z+6;
p=z+9;
figure (z)
plot(Xi1(z,:),a(:),'r')
title1=['Inclinacion lunar ',num2str(epsL(z))];
title(title1);
xlabel ('Altura de Marea \xi_{0} (m)')
ylabel ('a, circulo horario lunar (grados)')
figure (n)
plot(Xi2(z,:),a(:),'r')
xlabel ('Altura de Marea \xi_{1} (m)')
ylabel ('a, circulo horario lunar (grados)')
title(title1)
figure (h)
plot(Xi3(z,:),a(:),'r')
xlabel ('Altura de Marea \xi_{2} (m)')
ylabel ('a, circulo horario lunar (grados)')
title(title1)
figure (p)
plot(XiT(z,:),a(:),'r')
xlabel ('Altura de Marea Total \xi_{T} (m)')
ylabel ('a, circulo horario lunar (grados)')
title(title1)
z=z+1;
end
%guardar las figuras
w=1;
while w<13
title2=['figura ',num2str(w)];
saveas(figure(w),title2,'jpg');
w=w+1;
end