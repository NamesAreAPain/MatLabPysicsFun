function Networks = pointsnet(mass,velocity,location)

Network = struct('pnts',[],'boun',[],'area',0,'loca',[0 0],'velo',[0,0],'avel',0,'mass',0,'mofi',0,'forc',[0 0],'name', 'Network 1');
Networks = [Network];
Point = struct('mass',0,'chrg',0,'loca',[0,0],'velo', [0,0], 'forc',[0,0]);

netNum = 2;
pntNum = 8;

for iteri = 1:netNum
    Networks(iteri) = Network;
    for iterj = 1:pntNum
        Networks(iteri).pnts(iterj) = Point;
        Networks(iteri).pnts(iterj).mass = mass(iteri)/pntNum;
        Networks(iteri).pnts(iterj).loca = angl2vec(((2*pi)/pntNum)*(iterj-1));
        Networks(iteri).velo = velocity(iteri);
    end
end

end 
