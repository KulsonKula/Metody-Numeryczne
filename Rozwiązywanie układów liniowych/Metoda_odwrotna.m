%-------------------------
%Dane
%-------------------------

A=[8 1 2;...
   5 -3 -7;...
   0 -5 7];
A1=[8 1 2;...
   5 -3 -7;...
   0 -5 7];
B=[16;...
  -22;...
   11];

%-------------------------
%Wyzncznik
%-------------------------
tic
W=(A(1,1)*A(2,2)*A(3,3)+A(1,2)*A(2,3)*A(3,1)+A(1,3)*A(2,1)*A(3,2))-(A(1,3)*A(2,2)*A(3,1)+A(1,1)*A(2,3)*A(3,2)+A(1,2)*A(2,1)*A(3,3));
disp("Czas obliczneia wyznacznika to:")
toc
if(W==0)
    disp("Macierz nie odwracalna");
end
if(W~=0)
%-------------------------
%Dopełnień
%-------------------------
tic
for i=1:1:3
    for j=1:1:3
    D=A1;
    D(:,i)=[];
    D(j,:)=[];
    A(j,i)=(-1)^(j+i)*(D(1,1)*D(2,2)-D(2,1)*D(1,2));
    end
end
disp("Czas wyznacznia macierzy depełnień to:")
toc
%-------------------------
%Transponowana
%-------------------------
tic
temp=A(1,2);
A(1,2)=A(2,1);
A(2,1)=temp;

temp=A(1,3);
A(1,3)=A(3,1);
A(3,1)=temp;

temp=A(3,2);
A(3,2)=A(2,3);
A(2,3)=temp;
disp("Czas wyznacznia macierzy transponowanej to:")
toc
%-------------------------
%Odpowiedz
%-------------------------

X=A*B/W;

for i=1:1:3
fprintf("X%i=%i\n",i,X(i));
end
end
