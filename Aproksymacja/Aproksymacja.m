% Przykład 1
% Dokonano niezależnych pomiarów wielkości drgań pionowych gruntu (yi) w cm powstałych w wyniku
% trzęsienia ziemi w różnej odległości od ogniska trzęsienia (xi) w km. Oszacować parametry funkcji
% regresji wielkości drgań gruntu względem odległości od ogniska trzęsienia ziemi.
% x = [20 30 40 50 80 140 200 250];
% y = [4.8 3.2 2.5 2.5 1.5 1.7 1.2 0.8];

% Przykład 2
% W doświadczeniu fizycznym bada się w pewnych warunkach kąt obrotu wektora namagnesowania
% próbki w zależności od wielkości ziaren tej próbki. Z pomiarów otrzymano następujące wyniki (xi
% wielkość ziaren w mikrometrach, yi kąt w stopniach).
% x = [10 20 30 40 50 60 70 80];
% y = [6.5 5.5 3.8 3.3 2.5 2.2 1.7 1.5];

% Jakub Kula, gr6 31.05.2022
clc;
clear;
%-----------
%Zadanie 1
%-----------
syms z; %przygotowanie
 x = [10 20 30 40 50 60 70 80];
 y = [6.5 5.5 3.8 3.3 2.5 2.2 1.7 1.5];
L=length(x);
srednia=0;
max=-2;
xx=x;
yy=y;

%-----------
%wykres
%-----------
scatter(x,y),grid on, title('Wykres dla pomiarów z zadania nr.1'), xlabel(' odległości od ogniska trzęsienia [km]'), ylabel('wielkości drgań pionowych gruntu [cm]'), hold on;

%-----------
%współniczynik korealcji
%-----------
for Metoda=1:1:5 %idziemy po każdej metodzie
    switch(Metoda) % założenia dla każdej z niej
        case(1) %liniowa
            %nic nie rób
        case(2) %potęgowa
            xx=log(x);
            yy=log(y);
        case(3) %logarytmiczna
            xx=log(x);
        case(4) %wykładnicza
            yy=log(y);
        case(5) %hiperboliczna
            for i=1:1:L
            xx(i)=1/x(i);
            end  
    end

    for i=1:1:L %metoda najmniejszych kwadratów
        x2(i)=xx(i)^2;
        xy(i)=xx(i)*yy(i);
    end
    x1=sum(xx); 
    x2=sum(x2);
    y1=sum(yy);
    y2=sum(xy);

    temp= [L x1;x1 x2];
    temp1= [y1; y2];
    A=temp^-1*temp1; %Ax=B => x=A^-1*B <- zapisz do sprakwa ze tą metodą to robimy

    switch(Metoda) % stworzenie funckji (wszystko jest w instrukcji)
        case(1) %liniowa
            f=A(2,1)*z+A(1,1);
        case(2) %potęgowa
            f=exp(A(2,1)*log(z)+log(A(1,1)));
        case(3) %logarytmiczna
            f=A(2,1)*log(z)+A(1,1);
        case(4) %wykładnicza
            f=exp(log(A(1,1)+A(2,1)*z));
        case(5) %hiperboliczna
            f=A(2,1)*1/z+A(1,1);
    end

    F=matlabFunction(f); %tworzy tablice warotści funkcji f, dla argumentów podanych w zadaniu
    for i=1:1:L
        tempp(i)=F(x(i));
    end
    R=corrcoef(tempp,y); % sprawdza korelacje miedzy wartościami funkcji f a danymi w zadaniu
    RR(Metoda)=R(2,1); %wpisuje do tablicy
end

%wypisuje wartosci wspołcznika korelacji - daj do sprawka
disp("Liniowa:")
disp(RR(1))
disp("Potęgowa:")
disp(RR(2))
disp("Logarytmiczna:")
disp(RR(3))
disp("Wykładnicza:")
disp(RR(4))
disp("Hiperboliczna:")
disp(RR(5))

for i=1:1:Metoda %szuka który współczynik jest największy
    if max<RR(i)
        max=RR(i);
        RRi=i;
    end
end

switch(RRi) % Założenia dla najlepszej metody
    case(1) %liniowa
        xx=x;
        yy=y;
        disp("Została wybrana aproksymajca - liniowa")
    case(2) %potęgowa
        xx=log(x);
        yy=log(y);
        disp("Została wybrana aproksymajca - potęgowa")
    case(3) %logarytmiczna
        yy=y;
        xx=log(x);
        disp("Została wybrana aproksymajca - logarytmiczna")
    case(4) %wykładnicza
        xx=x;
        yy=log(y);
        disp("Została wybrana aproksymajca - wykładnicza")
    case(5) %hiperboliczna
        yy=y;
        for i=1:1:L
            xx(i)=1/x(i);
        end  
        disp("Została wybrana aproksymajca - hiperboliczna")
end

for i=1:1:L %metoda najmniejszych kwadratów dla wybranej metody
    x2(i)=xx(i)^2;
    xy(i)=xx(i)*yy(i);
end
x1=sum(xx); 
x2=sum(x2);
y1=sum(yy);
y2=sum(xy);

temp= [L x1;x1 x2];
temp1= [y1; y2];
A=temp^-1*temp1;

switch(RRi) % tworzy ostateczną funkcje aproksymującą
    case(1) %liniowa
        f=A(2,1)*z+A(1,1);
    case(2) %potęgowa
        f=exp(A(2,1)*log(z)+log(A(1,1)));
    case(3) %logarytmiczna
        f=A(2,1)*log(z)+A(1,1);
    case(4) %wykładnicza
        f=exp(log(A(1,1)+A(2,1)*z));
    case(5) %hiperboliczna
        f=A(2,1)*1/z+A(1,1);
end

fplot(f) %plotują ją

%bład średnio kwadratowy
F=matlabFunction(f);
for i=1:1:L
srednia=srednia+(y(i)-F(x(i)))^2;
end
srednia=srednia/L;
disp("Bład średnio kwadratowy:")
disp(srednia);