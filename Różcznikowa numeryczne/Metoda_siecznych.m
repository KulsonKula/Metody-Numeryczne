clc;clear

syms x;
epsilon=0.00001;

x1=0.1;
x2=3;
f=x^3-6/x-6;

F=matlabFunction(f);
x3=100;
i=0;

while ~ ((F(x3) < epsilon && F(x3) > -epsilon))

    x3 = (F(x2) * x1 - F(x1) * x2) / (F(x2) - F(x1));
    if(F(x3) * F(x1) > 0)
    x1 = x3;
    else 
    x2 = x3;
    end
    i = i + 1;
end
disp("miejsce zerowe:")
disp(x3);
disp("wartość funkcji:")
disp(F(x3));
disp("ilość iteracji:")
disp(i);