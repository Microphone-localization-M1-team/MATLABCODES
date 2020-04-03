d = 11.4e-3;
c = 343;
A=zeros(150,24);
Z=zeros(150,24);
width=16;
fid=fopen('test_data.coe','w');
%fprintf(fid,'memory_initialization_radix=16;\n');

for i=0:1:6
   k=30+20*i;
    for j=1:1:24
           A(k,j)=round(((j-1)*d*cosd(k))*10^6/c);
           Z=abs(A(k,j));
           fprintf(fid,'%x,\n',Z);
    end
end

