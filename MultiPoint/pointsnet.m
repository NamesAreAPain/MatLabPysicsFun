function Networks = pointsnet(varargin)
global mass
global location
global velocity 

n = nargin;
location =  varargin{1};
if n == 2
    varargin{2} = velocity;
else
    varargin{2} = velocity;
    varargin{3} = mass;
   


if length(mass) == 2
    netNum = 2;
elseif length(mass) == 1
    netNum = 1;
else 
    netNum = 3;
end
pntNum = 8;

Networks(netNum) = NETWORK;

for iteri = 1:netNum
    Networks(iteri) = NETWORK;
    Networks(iteri).pnts(pntNum) = POINT;

    for iterj = 1:pntNum
        Networks(iteri).pnts(iterj) = POINT;
        Networks(iteri).pnts(iterj).mass = mass(iteri)/pntNum;
        Networks(iteri).pnts(iterj).loca = location(iteri,:) + angl2vec(((2*pi)/pntNum)*(iterj-1));
        Networks(iteri).velo = velocity(iteri,:);
        Networks(iteri).avel = 0;
    end
end

end 
