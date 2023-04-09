%-------------------------
%Dane
%-------------------------
A=[8 1 2;...
   5 -3 -7;...
   0 -5 7];
B=[16;...
  -22;...
   11];
tic
C=[A B];
[W,K]=size(C);
%-------------------------
%Eliminacja Gaussa
%-------------------------
for i=1:1:W
G=C(i,i);
    for j=1:1:W
        if j~=i
            M=C(j,i)/G;
            for l=1:1:K
               C(j,l)=C(j,l)-M*C(i,l);
            end
        end
    end
end

for i=1:1:W
C(i,K)=C(i,K)/C(i,i);
end
disp("Czas operacji:")
toc
%-------------------------
%Odpowiedz
%-------------------------
for i=1:1:W
fprintf("X%i=%i\n",i,C(i,K));
end