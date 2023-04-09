% Zadanie 1
% a) Dla punktów o współrzędnych x = [1 1.5 2 2.5] i y = [2 2.5 3.5 4.0] przygotować skrypt w programie
% MATLAB umożliwiający znalezienie przybliżonej wartości funkcji w punkcie x0 = 1.75 korzystając z
% wielomianu interpolacyjnego Lagrange`a.
% b) Dla wspomnianych punktów znaleźć wielomian interpolacyjny Lagrange`a (można skorzystać z
% obliczeń symbolicznych syms)
% c) Sporządzić wykres f(x) dla zadanych punktów x = [1 1.5 2 2.5] i y = [2 2.5 3.5 4.0]
% d) Sporządzić wykres W(x) dla wielomianu interpolacyjnego Lagrange`a w przedziale [1,2.5].



clc, clear;

x = [1 1.5 2 2.5];
y = [2 2.5 3.5 4];
x0=1.75;
syms X
[W,K]=size(x);
F=0;
G=1;
for j=1:1:K
    for k=1:1:K
        if k~=j
           G=G*((X-x(k))/(x(j)-x(k)));
        end
    end
    F=F+y(j)*G;
        G=1;
end
disp("Wzór interpolacyjny to: ")
pretty(F)% Odp do podpunktu A


D=matlabFunction(F);

disp(D(x0)); % Odp do podpunktu B

plot(y,x);% Odp do podpunktu C
hold on
Z = 1:1/100:2.5;
plot(D(Z),Z); % Odp do podpunktu D
hold off




