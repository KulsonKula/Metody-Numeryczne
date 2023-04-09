clc;clear
epsilon=0.00001;
syms x;

i=0;
x1=1.1;
x2=5;
f=x^x/exp(x)-5;

fprim=diff(f,1);
fbis=diff(f,2);
F=matlabFunction(f);
Fprim=matlabFunction(fprim);
Fbis=matlabFunction(fbis);
x3=100;

z = (x1 + x2) / 2;
if (Fprim(z) * Fbis(z) > 0)
temp = x1;
x1 = x2;
x2 = temp;
end

while ~ ((F(x3) < epsilon && F(x3) > -epsilon))
    x3 = x1 - F(x1) / Fprim(x1);
    x1 = x3;
    i = i + 1;
end

disp("Obliczone miejsce zerowe dla metody nr. 1")
disp(x3)
disp("wartość dla obliczonego miejsca zerowego dla metody nr. 1")
disp(F(x3))
disp("ilość iteracji:")
disp(i);
