%%%%%%%%%%%%%%%%%%%%%%%%%%% Source location finder %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
fin = fopen('Z:\DAT096\matlab_code\final_raw\final_30.raw', 'r');%%% Change the file namce according to the folder
A = fread(fin);
leng= floor(length(A)/4);
fclose(fin);
fin_2 = fopen('Z:\DAT096\matlab_code\final_raw\final_30.raw', 'r');%%% Change the file namce according to the folder
U = fread(fin_2,leng*4,'uint8=>uint8');
Z = uint32(U);
data = zeros(leng, 1);
for j = 1:leng
    data(j,1) = Z(j*4-3)*(16^6) + Z(j*4-2)*(16^4) + Z(j*4-1)*(16^2) + Z(j*4);
end
Sweep_angle = zeros(1,61);
Elevation_angle = zeros(1,61);
Calculated_energy = zeros(1,61);
data(1) = 0;
for i = 1:61
    Sweep_angle(i) = ((30 + (i-1) * 2)/180) * pi;
    Elevation_angle(i) = 30 + (i-1) * 2;    
    Calculated_energy(i) = data(i + 1 * 61,1);
end
[energy_max, index] = max(Calculated_energy);
psy_max = Sweep_angle(index);
Source_angle=(psy_max/pi)*180;
figure(1);
polarplot(Sweep_angle, Calculated_energy,psy_max, energy_max, 'ro');
thetalim([0 180]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

