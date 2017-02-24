function Network = collision(Network,Networks)
    for n = 1:length(Networks)
       if(isColliding(Network,Networks(n)))
           norm = disVec(centerOfspace(Networks(n)),centerOfSpace(Network)); 
           impulse = -1*(2)*dot((Networks(n).velo - Network.velo),norm)/(1/Network.mass + 1/Networks(n).mass);
           
       end
    end
end