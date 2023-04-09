clc;clear

syms x;
x1=1.1;
x2=5;
f=3*(x - 3) * (x + 1) + 8;
F=matlabFunction(f);
epsilon=0.5;
i=0;
%sprawdzanie
if(F(x1)==0)
    wynik=x1;
end
if(F(x2)==0)
    wynik=x2;
end
if(F(x1)*F(x2)>0)
    wynik=brak;
end 

c=(x1+x2)/2;

while~((F(c) < epsilon && F(c) > -epsilon))
    c=(x1+x2)/2;
    if(F(c)==0)
        wynik=c;
    end
    if(F(c)*F(x1)>0)
        x1=c;
    else
        x2=c;
    end
    i=i+1;
end
disp("Obliczone miejsce zerowe dla metody nr. 1")
disp(c)
disp("wartość dla obliczonego miejsca zerowego dla metody nr. 1")
disp(F(c))
disp("ilość iteracji:")
disp(i);

