function [Korrelation,Corr_max,shiftx,shifty] = CrossCorr2D(template,reference,interpolate)


%% Interpolation
if interpolate == true

    
    for P = 1:2
        if P == 1
            UW_plot = template;
        end
        if P == 2
            UW_plot = reference;
        end
                
    % Interpolate NaN
FalseNan = zeros(size(UW_plot));
for i=1:length(UW_plot(:,1))
    for j = 1:length(UW_plot(1,:))
        if isnan(UW_plot(i,j))
            FalseNan(i,j) = 1;
        end
    end
end



num_interation = 100;
for it = 1:num_interation
for yy = 1:length(UW_plot(:,1))
    for zz = 1:length(UW_plot(1,:))
        if FalseNan(yy,zz) == 1
            
            minyy = max([1 yy-1]);
            maxyy = min([yy+1 length(UW_plot(:,1))]);
            
            minzz = max([1 zz-1]);
            maxzz = min([zz+1 length(UW_plot(1,:))]);
            
            UW_int1 = 0.5 * (UW_plot(minyy,zz) + UW_plot(maxyy,zz));
            UW_int2 = 0.5 * (UW_plot(yy,minzz) + UW_plot(yy,maxzz));
            
            UW_plot(yy,zz) = mean([UW_int1,UW_int2],'omitnan');
            
            if isnan(UW_int1) && isnan(UW_int2)
                if yy<3
                    UW_int3 = UW_plot(yy+1,zz) - (UW_plot(yy+2,zz)- UW_plot(yy+1,zz));
                    UW_int4 = NaN;
                end
                if yy>length(UW_plot(:,1))-2
                    UW_int3 = NaN;
                    UW_int4 = UW_plot(yy-1,zz) - (UW_plot(yy-2,zz)- UW_plot(yy-1,zz));
                end
                if yy>2 && yy<length(UW_plot(:,1))-1
                    UW_int3 = UW_plot(yy+1,zz) - (UW_plot(yy+2,zz)- UW_plot(yy+1,zz));
                    UW_int4 = UW_plot(yy-1,zz) - (UW_plot(yy-2,zz)- UW_plot(yy-1,zz));
                end
                
                if zz<3
                    UW_int5 = UW_plot(yy,zz+1) - (UW_plot(yy,zz+2)- UW_plot(yy,zz+1));
                    UW_int6 = NaN;
                end
                if zz>length(UW_plot(1,:))-2
                    UW_int5 = NaN;
                    UW_int6 = UW_plot(yy,zz-1) - (UW_plot(yy,zz-2)- UW_plot(yy,zz-1));
                end
                if zz>2 && zz<length(UW_plot(1,:))-1
                    UW_int5 = UW_plot(yy,zz+1) - (UW_plot(yy,zz+2)- UW_plot(yy,zz+1));
                    UW_int6 = UW_plot(yy,zz-1) - (UW_plot(yy,zz-2)- UW_plot(yy,zz-1));
                end
            
            UW_plot(yy,zz) = mean([UW_int3,UW_int4,UW_int5,UW_int6],'omitnan');
            end
            
            

        end
    end
end
end


        if P == 1
            
            template = UW_plot;
        end
        if P == 2
           
            reference = UW_plot;
        end
        
        clearvars UW_plot
        
    end

end


%% Kreuzkorrelation


Korrelation = normxcorr2(template,reference);

Corr_max = max(max(Korrelation));
      
      [ypeak,xpeak] = find(Korrelation==max(Korrelation(:)));
      
      yoffSet = ypeak-size(template,1);
      xoffSet = xpeak-size(template,2);

shiftx = xoffSet;
shifty = yoffSet;


end