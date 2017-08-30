load('QuestionA.mat')
[location,rent]=FILTER_LOC(prices.location,prices.rent);
M=FILTER_PRICE(location,rent);
location=M(:,1:2);
rent=M(:,3);
[locx locy]=meshgrid(location(:,1),location(:,2));
%rentg=meshgrid(rent');
%surf(locx,locy,rentg);
%[mu,s]=CONSTANTS;
%[MU1 MU2]=meshgrid(mu(:,1),mu(:,2));
%fofx=BASIS_FUNCTION(location);
 train=trainRegressor(location,rent);
 test=testRegressor(location,train);
 surf(locx,locy,test);
shading interp
xlabel('Latitude')
ylabel('Longitude')