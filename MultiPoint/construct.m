function network = construct(network)
    netMass = 0;
    Xs = zeros(length(network.pnts),1);
    Ys = zeros(length(network.pnts),1);
    iter = 1;
    for P = network.pnts
        netMass = netMass + P.mass;
        Xs(iter) = P.loca(1);
        Ys(iter) = P.loca(2);
        iter = iter + 1;
    end
    Xs = Xs';
    Ys = Ys';
    network.mass = netMass;
    network.loca = centerOfMass(network);
    network.mofi = momentOfInertia(network);
    [A,network.area] = convhull(Xs,Ys,'simplify',true);
    

    network.boun = A;

    network = network;
end

%momentOfInertia function takes the network of points and uses the center of mass and the distance from the points to the center of mass to calculate the moment of inertia
function mOI = momentOfInertia(network)
    mOI = 0;
    cOM = centerOfMass(network);
    for P = network.pnts
       A = struct('loca',P.loca);
       B = struct('loca',cOM);
       mOI = mOI + P.mass * distance(A,B)^2; 
    end
end

 %function calculates the center of mass
 function cenOfMass = centerOfMass(network)
    sumX = 0;
    sumY = 0;
    sumM = 0;
    for P = network.pnts %for loop iterates through the points of the network 
        sumX = sumX + P.loca(1)*P.mass; %multiplies the position and the mass of the points in the network to get the sum of all x values
        sumY = sumY + P.loca(2)*P.mass; %multiplies the position and the mass of the points in the network to get the sum of all y values
        sumM = sumM + P.mass; %adds of the masses to get the total mass
    end
    cenOfMass = [sumX sumY]./sumM; %takes the vector made up of the sum of the x and y values and divides each element by the total mass
end