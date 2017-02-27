function Network = applyImpulse(Network,impvec)
    Network.velo = (Network.velo*Network.mass+impvec)/Network.mass;
    Network = Network;
    fprintf('COLLISION! applying impulse of %.1f %.1f to %s\n',impvec,Network.name)
end
