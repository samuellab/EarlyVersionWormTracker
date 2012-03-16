
function res = uberize(tracks);
%
% reassigns the unique ID# to 0,1,2,3...
% /presort will sort on ID# first, then reassign
% start will begin with that ID#
%
% function returns a new track array

ndat=length(tracks(1,:));
newtracks=tracks;
    

u=unq(newtracks(:,ndat));
ntracks=length(u);
u=[0;u];
for i=2:ntracks
    
    newtracks(u(i-1)+1:u(i),ndat) = i-1;
end

res = newtracks;
