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
