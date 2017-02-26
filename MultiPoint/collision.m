function Network = collision(Network,Networks)
    for n = 1:length(Networks)
       if(isColliding(Network,Networks(n)))
           norm = disVec(struct('loca',centerOfSpace(Networks(n))),struct('loca',centerOfSpace(Network))); 
           impl = -1*(2)*dot((Networks(n).velo - Network.velo),norm)/(1/Network.mass + 1/Networks(n).mass);
           Network = applyImpulse(Network,impl * norm);
       end
    end
end