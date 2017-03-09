function Network = genericForceApplication(Network,Networks,func)
    for psub = 1:length(Network.pnts)
        for n = Networks
            for pobj = n.pnts
                Network.pnts(psub).forc = [Network.pnts(psub).forc; func(Network.pnts(psub),n.pobj)];
            end
        end
    end
end