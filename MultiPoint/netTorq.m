%function calculates the net torque of the network
function netTorq = netTorq(network)
   netTorq = 0; %initially sets net torque to 0
   com = centerOfMass(network); %calculates the center of mass of the network
   for P = network.pnts %takes a set of points that make up the network
       cp = cross([disVec(com,P) 0],[netForce(P) 0]); %takes the cross product of the distance between the center of mass and a point and the netForce 
       netTorq = netTorq + cp(3);
   end
end
