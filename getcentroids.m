function [xall,yall]=getcentroids(im,thr,mn,mx);

% [xall,yall]=getcentroids(im,thr,mn,mx)
% gets the centroids of all separate regions in an image, with
% min area mn and max area mx, using the threshold thr
% 4/6/05, damon clark, daclark@fas.harvard.edu

% applicationof gaussian filter (takes way to long)

% [x,y]=meshgrid([-20:20],[-20:20]);
% f=exp((-x.^2-y.^2)/5);   % note: '5' can be changed to some other length
                         % scale, depending on image.  change '20' too.
% im=conv2(im,f,'same');


DIL=3; % number of dilations

% threshold it
binim=im2bw(im,thr);
if 1
se = strel('square',3);
for i=1:DIL
    binim=imdilate(binim,se);
end
for i=1:DIL
    binim=imerode(binim,se);
end
end

% find regions
L=bwlabel(binim);
N=max(max(L));

% process
xall=[];
yall=[];
for i=1:N
    [y,x]=find(L==i);
    if length(x)>=mn & length(x)<=mx
        x=mean(x); y=mean(y);
        xall=[xall,x];
        yall=[yall,y];
    end
end