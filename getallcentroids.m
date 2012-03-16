function out=getallcentroids(stk,thr,mn,mx);

% finds all the centroids in each frame of stk
% with a fractional threshold set with thr
% mn = min area in pixels
% mx = max area in pixels
% out = formatted to be fed into debugged track...
% 4/6/05, damon clark, daclark@fas.harvard.edu

out=[];
backframe = bgcalc(stk,20); % was 20
for i=1:size(stk,4)
    disp(['Processing frame ' num2str(i)]);        
    im=double(stk(:,:,1,i))-double(backframe);  % subtract first frame
    % new 8/18/06
%    s=sort(reshape(im,1,prod(size(im))));
%    immax=s(end-10);
%    im=im/immax;
    % old code -- comment back in to get old behavior
    im=im/max(max(im));
    [x,y]=getcentroids(im,thr,mn,mx);
    out=[out;[x',y',ones(length(x),1)*i]];
end