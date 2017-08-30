function ealing2stratford
load('QuestionA.mat')
[location,rent]=FILTER_LOC(prices.location,prices.rent);
M=FILTER_PRICE(location,rent);
location=M(:,1:2);
rent=M(:,3);

%Prepare the list with the correct Central Line stations
stations=tube.station;
locations=tube.location;
relevantStations={'Ealing Broadway','West Acton','North Acton','East Acton','White City','Shepherd''s Bush','Holland Park','Notting Hill Gate','Queensway','Lancaster Gate','Marble Arch','Bond Street','Oxford Circus','Tottenham Court Road','Holborn','Chancery Lane','St.Paul''s','Bank','Liverpool Street','Bethnal Green','Mile End','Stratford'};
relevantLocations=zeros(length(relevantStations),2);
for i=1:length(relevantStations)
indexes=find(ismember(stations,relevantStations{i})==1);
index=indexes(1);%take only the first occurance of the station in the list
relevantLocations(i,:)=locations(index,:);
end
%relevantLocations
train=trainRegressor(location,rent);
test=testRegressor(relevantLocations,train);

%create bar chart with the predicted prices
bar(test);
%set(gca,'XTickLabel',relevantStations);
end