function [hist_0,hist_1,range] = GetHist(ru0,ru1,bar_num)
min_value=min(min(ru0),min(ru1));
max_value=max(max(ru0),max(ru1));
range=linspace(min_value,max_value,bar_num);
hist_0=hist(ru0,range);
hist_1=hist(ru1,range);
range=[min_value max_value];
end

