 %function calculates the center of mass
 function cenOfMass = centerOfMass(network)
    sumX = 0; %initial values to work with 
    sumY = 0;
    sumM = 0;
    for P = network.pnts %for loop iterates through the points of the network 
        sumX = sumX + P.loca(1)*P.mass; %multiplies the position and the mass of the points in the network to get the sum of all x values
        sumY = sumY + P.loca(2)*P.mass; %multiplies the position and the mass of the points in the network to get the sum of all y values
        sumM = sumM + P.mass; %adds of the masses to get the total mass
    end
    cenOfMass = [sumX sumY]./sumM; %takes the vector made up of the sum of the x and y values and divides each element by the total mass
end
