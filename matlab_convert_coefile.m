%%dalay data is converted to coe.file
%the order of data saving is put the first column(the first micro) to the
%second column(the second micro)and so on. The first 180 datas can be assigned to the first micro, 
%181th data to 360th data can be assigned to the seond micro and so on.
%%
clc;
clear;
width=8;% the width of data saved in ROM
%depth=256;%the depth of data saved in ROM(the number of the data of delays)
y=delays;%dalays will be saved in ROM
fid=fopen('test_data.coe','w');%open a .coe file
%store the first line as hexadecimal number
fprintf(fid,'memory_initialization_radix=16;\n');
%store the second line as hexadecimal number
fprintf(fid,'memory_initialization_vector=\n');
%store the 4343th data
fprintf(fid,'%x,\n',y(1:end-1));
%store the last data
fprintf(fid,'%x;\n',y(end));
fclose(fid);%close the coe.file
%not sure if the data is saved as hexadecimal number???????