clc;clear
dp=0.5;
suma=0;
syms x
i=1;

%cos(x)
%metoda analityczna
Z=sin(pi/2)-sin(pi/6);
disp("Metoda analityczna dla funcji nr. 1:")
disp(Z)

%metoda prostokątów
for p=pi/6:dp:pi/2
    z=cos((p+p+dp)/2)*dp;
    suma=suma+z;
end
disp("Metoda kwadratów dla funcji nr. 1:")
disp(suma)
suma=0;

%metoda trapezów
for p=pi/6:dp:pi/2
z=(cos(p)+cos(p+dp))/2*dp;
suma=suma+z;
end
disp("Metoda trapezów dla funcji nr. 1:")
disp(suma)
suma=0;

%metoda Simsona
x0=pi/6;
x2=pi/2;
h=(x2-x0)/((abs(x2-x0))/dp);
suma=suma+cos(x0);
suma=suma+cos(x2);

for p=x0+dp:dp:x2-dp
    if mod(i,2)==1
        suma=suma+4*cos(p);
    else
        suma=suma+2*cos(p);
    end
    i=i+1;
end

suma=h*suma/3;
disp("Metoda Simpsona dla funcji nr. 1:")
disp(suma)
suma=0;
i=1;

%blad simpsona
f=cos(x);
Z=diff(f,4);
max=0;
F=matlabFunction(Z);
for p=x0:dp:x2
    if(max<abs(F(p)))
        max=abs(F(p));
    end
end

MAX=-h^5/90*max;
disp("blad simpsona:")
disp(MAX);

disp("-------------------------------")
%1/(1+x^2)
%metoda analityczna
Z=atan(1)-atan(0);
disp("Metoda analityczna dla funcji nr. 2:")
disp(Z)

%metoda prostokątów
for p=0:dp:1
z=1/(1+((p+p+dp)/2)^2)*dp;
suma=suma+z;
end
disp("Metoda kwadratów dla funcji nr. 2:")
disp(suma)
suma=0;

%metoda trapezów
for p=0:dp:1
z=((1/(1+((p))^2))+(1/(1+((p+dp))^2)))/2*dp;
suma=suma+z;
end
disp("Metoda trapezów dla funcji nr. 2:")
disp(suma)
suma=0;

%metoda Simsona
x0=0;
x2=1;
h=(x2-x0)/((abs(x2-x0))/dp);
suma=suma+(1/(1+x0^2));
suma=suma+1/((1+x2^2));

for p=x0+dp:dp:x2-dp
    if mod(i,2)==1
        suma=suma+4*1/(1+p^2);
    else
        suma=suma+2*1/(1+p^2);
    end
    i=i+1;
end

suma=h*suma/3;
disp("Metoda Simpsona dla funcji nr. 2:")
disp(suma)
suma=0;
i=1;

%blad
f=1/(1+x^2);
Z=diff(f,4);
max=0;
F=matlabFunction(Z);
for p=x0:dp:x2
    if(max<F(p))
        max=F(p);
    end
end

MAX=-h^5/90*max;
disp("blad simpsona:")
disp(MAX);

disp("-------------------------------")
%8/x
%metoda analityczna
Z=8*log(3)-8*log(15);
disp("Metoda analityczna dla funcji nr. 3:")
disp(Z)

%metoda prostokątów
for p=-15:dp:-3
z=8/(((p+p+dp))/2)*dp;
suma=suma+z;
end
disp("Metoda kwadratów dla funcji nr. 3:")
disp(suma)
suma=0;

%metoda trapezów
for p=-15:dp:-3
z=(8/p+8/(p+dp))/2*dp;
suma=suma+z;
end
disp("Metoda trapezów dla funcji nr. 3:")
disp(suma)
suma=0;

%metoda Simsona
x0=-15;
x2=-3;
h=(x2-x0)/((abs(x2-x0))/dp);
suma=suma+8/x0;
suma=suma+8/x2;

for p=x0+dp:dp:x2-dp
    if mod(i,2)==1
        suma=suma+4*8/p;
    else
        suma=suma+2*8/p;
    end
    i=i+1;
end

suma=h*suma/3;
disp("Metoda Simpsona dla funcji nr. 3:")
disp(suma)
suma=0;
i=1;

%blad
f=8/x;
Z=diff(f,4);
max=0;
F=matlabFunction(Z);
for p=x0:dp:x2
    if(max<abs(F(p)))
        max=abs(F(p));
    end
end

MAX=-h^5/90*max;
disp("blad simpsona:")
disp(MAX);
