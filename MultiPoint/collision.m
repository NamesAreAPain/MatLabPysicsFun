function Network = collision(Network,Networks)
    for n = 1:length(Networks)
       if(isColliding(Network,Networks(n)))
           % apply the appropriate impulse
       end
    end
end