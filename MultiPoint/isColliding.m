function isColliding = isColliding(NetworkS,NetworkO)
    isColliding = 0;
    for pnt = NetworkS.pnts
        isColliding = isColliding | isClipping(pnt,NetworkO.pnts(NetworkO.boun));
    end
end

