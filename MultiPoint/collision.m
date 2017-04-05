function Networks = collision(Networks,a,b)
       if(isColliding(Networks(a),Networks(b)))
           v1fx = ( (Networks(a).mass - Networks(b).mass) * Networks(a).velo(1) + 2*Networks(b).mass*Networks(b).velo(1))/(Networks(a).mass + Networks(b).mass);
           v2fx = ( 2*Networks(a).mass*Networks(a).velo(1) - (Networks(a).mass-Networks(b).mass)*Networks(b).velo(1))/(Networks(a).mass+Networks(b).mass);
           v1fy = ( (Networks(a).mass - Networks(b).mass) * Networks(a).velo(2) + 2*Networks(b).mass*Networks(b).velo(2))/(Networks(a).mass + Networks(b).mass);
           v2fy = ( 2*Networks(a).mass*Networks(a).velo(2) - (Networks(a).mass-Networks(b).mass)*Networks(b).velo(2))/(Networks(a).mass+Networks(b).mass);
           Networks(a) = applyImpulse(Networks(a),[v1fx - Networks(a).velo(1),v1fy - Networks(a).velo(2)]*Networks(a).mass);
           Networks(b) = applyImpulse(Networks(b),[v2fx - Networks(b).velo(1),v2fy - Networks(b).velo(2)]*Networks(b).mass);
       end
end

function isCollidingo = isColliding(NetworkS,NetworkO)
    isCollidingo = 0;
    %if(distance(NetworkS,NetworkO) > 
    for pnt = 1:length(NetworkS.pnts)
        isCollidingo = isCollidingo | isClipping(NetworkS.pnts(pnt),NetworkO.pnts(NetworkO.boun));
    end
end

%looks at the vetices of the network and calculates the angle between the vertices and the point of the other network to see if it has overlaped
function bool = isClipping(pntA, vertices)
    dVecs = zeros(length(vertices),2);
    for iter = 1:length(vertices)
        dVecs(iter,:) = disVec(pntA, vertices(iter));
    end
    angles = atan2(dVecs(:,2),dVecs(:,1));
    totalA = sum(angles);
    bool = abs(0-totalA) < 0.05;
end


function Network = applyImpulse(Network,impvec)
    Network.velo = (Network.velo*Network.mass+impvec)/Network.mass;
    fprintf('COLLISION! applying impulse of %.1f %.1f to %s\n',impvec,Network.name)
end

% If you are reading this, and planning on building on it for your ENGR160
% project, 1) shame on you for taking the easy way out rather than building
% something new 2) editing this function is the right, but thankless thing
% to do. No one is going to say, "golly, his objects richochet off each
% other not like balls, but like the shape they actually are!" But you'll
% know. Down in your heart, you'll remember that all nighter hacking it
% together. And you should be proud. -The Creator
%
%P.S. There are hidden messages in this project.
%P.P.S. I have some suggestions for what you could do:
%       1) add the third dimension. Or fourth
%       2) add concave shape support so that you can do things like gears
%       3) add more forces
%       4) alchemy
%       If you do anything cool with it, hit me up. 