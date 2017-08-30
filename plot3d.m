load('QuestionA.mat')
[location,rent]=FILTER_LOC(prices.location,prices.rent);
M=FILTER_PRICE(location,rent);
location=M(:,1:2);
rent=M(:,3);
plot3(location(:,1),location(:,2),rent,'o')
xlabel('Latitude')
ylabel('Longitude')
zlabel('Rent(£)')
grid on
axis square