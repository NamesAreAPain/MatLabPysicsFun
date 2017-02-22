PointA = struct('mass',1,'chrg',0,'loca',[3,3],'velo', [0,0], 'forc',[0,0]);
PointB = struct('mass',1,'chrg',0,'loca',[-3,3],'velo', [0,0], 'forc',[0,0]);
PointC = struct('mass',1,'chrg',0,'loca',[-3,-3],'velo', [0,0], 'forc',[0,0]);
PointD = struct('mass',1,'chrg',0,'loca',[3,-3],'velo', [0,0], 'forc',[0,0]);
PointE = struct('mass',1,'chrg',0,'loca',[0,0],'velo', [0,0], 'forc',[0,0]);


Network1 = struct('pnts',[PointA PointB],'boun',[],'area',0,'loca',[0 0],'velo',[0,0],'avel',0,'mass',0,'mofi',0,'forc',[0 0]);
Network2 = struct('pnts',[PointC PointD],'boun',[],'area',0,'loca',[0 0],'velo',[0,0],'avel',0,'mass',0,'mofi',0,'forc',[0 0]);

Networks = [Network1 Network2];

options = struct('FOV', 4, 'stuff', 1);





