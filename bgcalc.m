% create background mask for subtraction in centroid finding program
function bgframe = bgcalc(stack,f)
bgframe=[];
bgstack = double(stack(:,:,:,1));
for i = 2:f
    bgstack = double(bgstack)+double(stack(:,:,:,i));
end
bgframe = bgstack / f;