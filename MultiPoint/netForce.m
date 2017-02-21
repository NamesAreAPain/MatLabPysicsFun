%function calculates the net force 
function [Fx , Fy ] = netForce(point)
    Fx = sum(point.forc (:,1)); %calculates the net force in the x direction
    Fy = sum(point.forc (:,2)); %calculates the net force in the y direction 
end
