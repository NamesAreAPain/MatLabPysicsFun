function isCollidingo = isColliding(NetworkS,NetworkO)
    isCollidingo = 0;
    for pnt = NetworkS.pnts
        isCollidingo = isCollidingo | isClipping(pnt,NetworkO.pnts(NetworkO.boun));
    end
end

