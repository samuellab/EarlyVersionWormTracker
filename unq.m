function un = unq(arr, idx);
    num = nargin;
    s = size(arr);
    if num >= 2 
        q = arr(idx);
        indices = find(q ~= shiftr(q,1));
        count = length(indices);
        if count > 0
            un = idx(indices);
        else
            un = length(q) -1;
        end
    else
        indices = find(arr ~= shiftr(arr,1));
        count = length(indices);
        if count > 0
            un = indices;
        else  
            un = length(arr) -1;
        end
    end