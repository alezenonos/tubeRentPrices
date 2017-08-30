function [processedData,finalRent]=FILTER_LOC(data,rent)
%[longitude latidute]=data;
lat=data(:,1);
long=data(:,2);
%Test that data are correctly inserted in the function
if length(long)~=length(lat)
fprintf('Longitude must have a corresponding latitude and vice versa');
end
%filter out inrelevant locations -points taken from Google Earth 2012

LowerBoundLat=51.2855;
UpperBoundLat=51.66722;
LowerBoundLong=-0.52204;
UpperBoundLong=0.27294;

cleandata=zeros(length(long),2);
newRent=ones(length(rent),1);
for i=1:length(long)
    if((long(i)<=UpperBoundLong & (long(i)>=LowerBoundLong)) & ((lat(i)>=LowerBoundLat) & (lat(i)<=UpperBoundLat))) 
    cleandata(i,:)=[lat(i),long(i)];
    newRent(i)=rent(i);
    end
end
%keep only longitude and langitude that makes sense with their
%corresponding price
processedData=cleandata(any(cleandata,2),:);
finalRent=newRent(newRent~=1);
%plot(processedData(:,1),processedData(:,2),'o');
end