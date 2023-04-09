clc, clear

y=input("Podaj ilość wyrazów szeregu: ");
W=cos(pi);
for j=0:1:y
    switch mod(j,4)
        case 0
            W=W+((-sin(pi)*(-pi)^j)/factorial(j));
        case 1
            W=W+((-cos(pi)*(-pi)^j)/factorial(j));
        case 2
            W=W+((sin(pi)*(-pi)^j)/factorial(j));
        case 3
            W=W+((cos(pi)*(-pi)^j)/factorial(j));
    end
end
disp(W)


