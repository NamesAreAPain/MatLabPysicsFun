function Network = genericForceApplication(Network,Networks,func)
    for psub = 1:length(Network.pnts)
        for n = 1:length(Networks)
            for pobj = 1:length(n.pnts)
                Network.pnts(psub).forc = [Network.pnts(psub).forc; func(Network.pnts(psub),Networks(n).pnts(pobj))];
            end
        end
    end
end