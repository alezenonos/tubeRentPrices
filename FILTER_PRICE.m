function out=FILTER_PRICE(loc,price)
%concat location with prices
M=[loc,price];
%Remove rows that contain a price of £0 (I assume that they are probably noise-there is nothing for free these days)
indices = M(:,3)==0;
M(indices,:) = [];
out=M;

end