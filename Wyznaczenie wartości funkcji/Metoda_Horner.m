clc, clear;


y=input("Podaj stopień wielomianu ");
y=y+1;
W=zeros(y,1);
Q=zeros(y,1);

for i=1:1:y
    temp=input("Podaj wartości paramertów zaczynajac od najwyższej potęgi: ");
    W(i)=temp;
end

X=input("Podaj argument dla którego chcesz obliczyć przybliżoną wartość: ");
Q(1)=W(1);

for i=2:1:y
Q(i)=Q(i-1)*X+W(i);
end


disp("Wartość wielomianu w punkcie wynosi: ")
disp(Q(y))
 
%--------------------------------------------
%--------------------------------------------
D=input("Podaj oczekiwana dokładność: ");

Dokl=log10(D*(abs(X)-1)/(abs(X)^(y-1)-1)/0.5);

disp("Obliczenia należy prowadzić z dokładnością")
disp(Dokl)
%--------------------------------------------
%--------------------------------------------

P=zeros(y-1,1);

P(1)=Q(1);

for i=2:1:y-2
P(i)=P(i-1)*X+Q(i);
end

disp("Wartość pochodnej wielomianu w punkcie wynosi: ")
disp(P(y-2))
