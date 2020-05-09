d = 11.4e-3;
c = 343;
A=zeros(150,24);
B=zeros(150,24);
Z=zeros(150,24);
width=16;
fid=fopen('test_data.coe','w');
%fprintf(fid,'memory_initialization_radix=16;\n');

for i=0:1:6
   k=30+20*i;
    for j=1:1:24
        if k > 90 % if condition to invert the data after 90degree
            
            A(k,25-j)=round(((j-1)*d*cosd(k))*1.41e6/c); % 1.41 is the PDM clock cycle
        else
            A(k,j)=round(((j-1)*d*cosd(k))*1.41e6/c); % 1.41 is the PDM clock cycle
        end
        
         %  A(k,j)=round(((j-1)*d*cosd(k))*1.41e6/c); % 1.41 is the PDM clock cycle
%            Delay_real_time=round(((j-1)*d*cosd(k))/c);
%            pdm_clock;
%            clock_cycle_lengh = 1/pdm_clock;
%            delay_in_cycle= Delay_real_time/clock_cycle_length;
           B(k,j)=(((j-1)*d*cosd(k))/c);
           Z=abs(A(k,j));
           fprintf(fid,'%x,\n',Z);
    end
end
mamimum_delay= max(B);
Maximum_clock= max(A);
