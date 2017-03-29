function Networks = pointsnet(mass,velocity,location)

netNum = 2;
pntNum = 8;

Networks(netNum) = NETWORK;

for iteri = 1:netNum
    Networks(iteri) = NETWORK;
    Networks(iteri).pnts(pntNum) = POINT;

    for iterj = 1:pntNum
        Networks(iteri).pnts(iterj) = POINT;
        Networks(iteri).pnts(iterj).mass = mass(iteri)/pntNum;
        Networks(iteri).pnts(iterj).loca = location(iteri,:) + angl2vec(((2*pi)/pntNum)*(iterj-1));
        Networks(iteri).velo = velocity(iteri,:);
        Networks(iteri).avel = 0;
    end
end

end 
