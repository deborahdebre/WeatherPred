%% Weather Prediction

wind_data = ["2014100500_2014100600_daily-ifremer-L3-MWF-GLO-20141007102250-01.0.nc"
    "2014100600_2014100700_daily-ifremer-L3-MWF-GLO-20141008102141-01.0.nc" 
    '2014100800_2014100900_daily-ifremer-L3-MWF-GLO-20141010102041-01.0.nc' 
    '2014100900_2014101000_daily-ifremer-L3-MWF-GLO-20141011102104-01.0.nc'
    '2014101000_2014101100_daily-ifremer-L3-MWF-GLO-20141012101944-01.0.nc' 
    '2014101100_2014101200_daily-ifremer-L3-MWF-GLO-20141013101956-01.0.nc'
    '2014101200_2014101300_daily-ifremer-L3-MWF-GLO-20141014101956-01.0.nc'
    '2014101300_2014101400_daily-ifremer-L3-MWF-GLO-20141015102027-01.0.nc'
    '2014101400_2014101500_daily-ifremer-L3-MWF-GLO-20141016101929-01.0.nc'
    '2014101500_2014101600_daily-ifremer-L3-MWF-GLO-20141017102606-01.0.nc'];
sizeW = size(wind_data);
%% MOVIE & FULL FRAME PLOTS
for i = 1:sizeW(1)
    longitude = ncread (wind_data(i),'longitude');
    latitude = ncread (wind_data(i),'latitude');
    windspeed = ncread (wind_data(i),'wind_speed');
    dateW = ncreadatt (wind_data(i),'/','start_date');
    [Latitude , Longitude] = meshgrid(latitude,longitude);
    plotLLW = pcolor(Longitude,Latitude,windspeed);
    set(plotLLW , 'EdgeColor', 'none')
    colormap(jet)
    caxis([0 20])
    shading flat
    colorbar
    xlabel('Longitude');
    ylabel('Latitude');
    title(dateW)
    text(5,15,'Africa')
    text(-122.3,47,'North America')
    text(80,45,'Asia')
    text(30,55,'Europe')
    text(120,-25,'Australia')
    text(-75,-12,'South America')
    text(-5,-66,'Antarctica')
    text(-60,36,'Atlantic Ocean')
    text(58,-5.125,'Indian Ocean')
    text(134,20,'Pacific Ocean')
    text(-158,-12,'Pacific Ocean')
    text(-5,-50,'Southern Ocean')
    text(-31,-17,'Atlantic Ocean')
    Movie(i)=getframe(gcf);
end  
Vid = VideoWriter('Group5A_final_project_wind_movie.mp4','MPEG-4');
Vid.FrameRate =2;
open(Vid);
writeVideo(Vid,Movie);
close(Vid)

%% SUBPLOTS
for i = 1:sizeW(1)
    longitude = ncread (wind_data(i),'longitude');
    latitude = ncread (wind_data(i),'latitude');
    windspeed = ncread (wind_data(i),'wind_speed');
    dateW = ncreadatt (wind_data(i),'/','start_date');
    [Latitude , Longitude] = meshgrid(latitude,longitude);
    if i <=4
        if i == 1
        figure()
        hold on;
        end
    subplot(2,2,i)
    elseif i>4 && i <=8
        if i == 5
            figure()
            hold on;
        end
    subplot (2,2,i-4)
    elseif i>8 && i <=10
         if i == 9
            figure()
            hold on;
        end
    subplot (2,2,i-8)
    end    
    plotLLW = pcolor(Longitude,Latitude,windspeed);
    set(plotLLW , 'EdgeColor', 'none')
    colormap(jet)
    caxis([0 20])
    shading flat
    colorbar
    xlabel('Longitude');
    ylabel('Latitude');
    title(dateW)
    text(5,15,'Africa')
    text(-122.3,47,'North America')
    text(80,45,'Asia')
    text(30,55,'Europe')
    text(120,-25,'Australia')
    text(-75,-12,'South America')
    text(-5,-66,'Antarctica')
    text(-60,36,'Atlantic Ocean')
    text(58,-5.125,'Indian Ocean')
    text(134,20,'Pacific Ocean')
    text(-158,-12,'Pacific Ocean')
    text(-5,-50,'Southern Ocean')
    text(-31,-17,'Atlantic Ocean')
end