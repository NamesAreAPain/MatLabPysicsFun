PointA = struct('mass',5.972*10^24,'loca',[0,0],'velo', [0,0], 'forc',[0,0]);
PointB = struct('mass',7.35*10^22 ,'loca',[0,384403080],'velo', [1,018.831316,0], 'forc',[0,0]);
%PointC = struct('mass',3000,'loca',[1.000,3.000],'velo', [0,0], 'forc',[[0,-9.8];[0,9.8]]);

global G;
G = 6.67408 * 10^-11; % m^3 kg^-1 s^-2

Points = [PointA PointB];
clear PointA
clear PointB