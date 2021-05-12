function output = IDT(I0,I1,iter_num,plotIterResult)
% u0=zeros(3,size(I0,1)*size(I0,2));
% u1=size(u0);
if nargin<4
    plotIterResult=0;
end
channel=size(I0,3);
for i=1:channel
    u0(i,:) = reshape(I0(:,:,i), 1, size(I0,1)*size(I0,2));
    u1(i,:) = reshape(I1(:,:,i), 1, size(I1,1)*size(I1,2));
end
u_original=u0;
if size(I0,3)>2
    if plotIterResult
        disp('You are inputing data more than 2 dimension, so its impossible to plot itermediate results.')
    end
    plotIterResult=0;
end
bar_num=300;
% R=[1/3 2/3 2/3;2/3 1/3 -2/3;-2/3 2/3 -1/3];% This is an initialized rotation matrix
R=eye(channel);
% R=[eye(3);R];
if plotIterResult
    figure;
        subplot(ceil(iter_num/4),4,1);
        plotItermediateResultFromData(u_original);
        title('original');
        subplot(ceil(iter_num/4),4,2);
        plotItermediateResultFromData(u1);
        title('target');
end
for iter=1:iter_num
    txt=['IDT iteration\t',num2str(iter),'/',num2str(iter_num),'\n'];
    fprintf(txt);
    axis_num=size(R,1);
    ru0=R*u0;
    ru1=R*u1;
    % ru0 and ru1 are rotated (projected) values
    u0_out=zeros(size(u0));
    for c=1:axis_num
        ru0_c=ru0(c,:);
        ru1_c=ru1(c,:);
        [hist_0,hist_1,range] = GetHist(ru0_c,ru1_c,bar_num);
        min_value=range(1);
        max_value=range(2);
        range=linspace(min_value,max_value,bar_num);
        t_c= TransferPDF_1D(hist_0,hist_1);% find the transform in 1-D
        ru0_c_out=interp1(range,t_c,ru0_c,'linear')./(bar_num-1).*(max_value-min_value)+min_value;% apply the transform
        u0_out(c,:)=ru0_c_out;
    end
    u0=u0+inv(R)*(u0_out-ru0);% everytime we take a new R, so we project the vectors back to the original axis
    if plotIterResult
        subplot(ceil((iter_num+2)/4),4,2+iter);
        plotItermediateResultFromData(u0);
        title(['Iteration',num2str(iter)]);
        pause(0.5);
    end
    R=R*orth(randn(channel,channel));
    % According to the paper, there says 'Taking a random selection of orthogonal bases seems to
    % be sufficient to obtain convergence,...'. So we just calculate a new
    % rotation matrix randomly.
end
output_1D=u0;
output=zeros(size(I0));
for c=1:channel
    output(:,:,c)=reshape(output_1D(c,:),size(I0,1),size(I0,2));
end
end

