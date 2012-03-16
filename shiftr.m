function y = shiftr(x,nsr,nsc)
%SHIFTR Shift by rotating a vector or matrix.
%       For vectors SHIFT(X,N) returns vector with indicies shifted by N
%       For matricies SHIFT(X,N,M) returns vector with row indicies
%       shifted by N and column indicies shifted by M
%
%       Shifts/rotates are left for positive N or M, right for negative.
%       e.g. SHIFTR(1:10,2)  returns [3 4  5 6 7 8 9 10 1 2]
%            SHIFTR(1:10,-2) returns [9 10 1 2 3 4 5 6  7 8]
%
%       [No Guarantees. M. Lubinski]

if nargin == 1,
  y=x;
  return ;
end
[m,n] = size(x);
if nargin == 2,
  if m==1                               % Row vector
    nsc = nsr;
    nsr = 0;
  elseif n==1                           % Column vector
    nsc=0;
  else
    error('Not enough input arguments for matrix input');
  end
end

% Account for aliased rotations and negative rotations
nsr=rem(nsr,m)+ m*(nsr<0);
nsc=rem(nsc,n)+ n*(nsc<0);

% Compute new indecies
m1=1:nsr;
n1=1:nsc;
m2=(nsr+1):m;
n2=(nsc+1):n;

% Answer
y = [x(m2,n2) x(m2,n1); x(m1,n2) x(m1,n1)];
