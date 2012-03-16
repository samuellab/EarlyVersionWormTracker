%D original was as below...
%D function [cents,tr,trf]=getouttracks(ims);
%D changed to only extract trf

function [cln]=processimages(ims);

% function is a master function, combining all the steps to get out a nice
% version of the tracks for use with other functions...
% thr = fractional threshold
% mn = min worm area
% mx = max worm area
% rad = radius of giration (how many pixels max inbetween frames)
% output trf will be most useful, but others might come in handy, too

%D invoke function to create background average of first x frames
%D default set at 20 frames, higher better but minimize worms
%D stopping and created too severe a hole

% backframe = bgcalc(ims,20);
% first=double(ims(:,:,1,20))-double(backframe);
% first=first/max(max(first));

%D following 2 lines were crashing matlab
% figure; imhist(first);
% zoom on;

%D threshold, minium, maxiumim, rad all preset values

%D thr=input('Choose a threshold: ');
%D mn=input('Choose min pixel area value for worms: ');
%D mx=input('Choose max pixel area value for worms: ');
%D rad=input('Choose radius of gyration for track algorithm: ');

thr=0.09; % was 0.09 (dim - few or no saturated pixels/worm) .17 (bright - many saturated pixels/worm)
mn=60; % was 15 normal 60
mx=140; 
rad=10;

% first, get all the centers
cents=getallcentroids(ims,thr,mn,mx);

% run tracking algorithm
tr=track(cents,rad);

% nice to use
trf=putinfields(tr);

% clean tracks
cln=getcleantracks(trf);

% add speed component with 3 second window
% fin=computespeed(cln,3);

% NOTE: this last function cleans the data -- make sure parameters within
% "putinfields" are set the way you want them...

%D now, do visualization of results
%D f1=figure;
%D for i=2:size(ims,4)
%D imagesc(ims(:,:,1,i));
%D hold on;
%D choose=find(cents(:,3)==i);
%D plot(cents(choose,1),cents(choose,2),'r.');
%D title(['Frame number ' num2str(i)]);
%D pause;
%D end;

%D f2=

% figure; hold on;
% for i=1:length(trf)
%    plot(trf(i).x,trf(i).y,'r.');
end