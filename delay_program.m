d = 11.4e-3;
c = 343;
A=zeros(150,24);

for i=0:1:6
   k=30+20*i;
    for j=1:1:24
           A(k,j)=((j-1)*d*cosd(k))/c;
    end
end