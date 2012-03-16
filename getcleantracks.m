function out=getcleantracks(in);

% selects tracks to throw out based on criteria set by constants below
% WARNING: does not keep track numbers the same...
% formerly part of "putinfields", which is now modified not to do this
% april 11, damon clark, daclark@fas.harvard.edu

MAXGAP=3;
TOOSHORT=10;
TOTMOV=3;
check=in;

    for i=1:length(in)
        d=in(i).f(2:end)'-in(i).f(1:end-1)';  % sufficiently high to get last one
        split=find(d>MAXGAP);
        if ~isempty(split)
            disp(['split track ' num2str(i)]);
            split=[split,length(in(i).f)];
            for j=1:length(split)-1
                new=length(in)+1;
                in(new).x=in(i).x(split(j)+1:split(j+1));
                in(new).y=in(i).y(split(j)+1:split(j+1));
                in(new).f=in(i).f(split(j)+1:split(j+1));
                in(new).num=length(in(new).x);
            end
            in(i).x=in(i).x(1:split(1));
            in(i).y=in(i).y(1:split(1));
            in(i).f=in(i).f(1:split(1));
            in(i).num=length(in(i).x);
        end
    end
    %keyboard;
    j=1;
    for i=1:length(in)
        Rsq=(max(in(i).x)-min(in(i).x))^2+(max(in(i).y)-min(in(i).y))^2;
        %keyboard;
        if (in(i).num >= TOOSHORT) & (Rsq>=TOTMOV^2)  % keepers
            temp(j)=in(i);
            j=j+1;
        %else
        %    disp(['killed track ' num2str(i) ', ' num2str(in(i).num) ', ' num2str(Rsq>TOTMOV^2)]);
        end
    end
    in=temp;

% sort them to get longest at front...

for i=1:length(in)
    leng(i)=in(i).num;
end
[dum, ind]=sort(-1*leng);
out=in(ind);