function plotItermediateResultFromData(u)
%PLOTITERMEDIATERESULTFROMDATA plot itermediate result from 2D datas.
%   u is the input datas.
% u;
% figure(101),scatter(u(1,:),u(2,:));
L=size(u,2);
N=50;
F=zeros(N,N);
h=round(500*N/1000);
sigma=2;
G=zeros(2*h+1,2*h+1);
for l=1:L
    x=u(1,l);
    y=u(2,l);
    a=round(x*N);
    b=round(y*N);
    for i=(a-h):(a+h)
        for j=(b-h):(b+h)
            if sqrt((i-a)^2+(j-b)^2)<=h
                temp=exp(-((i-a)^2+(j-b)^2)/2/sigma);
                if (i>=1)&&(j>=1)&&(i<=N)&&(j<=N)
                    F(i,j)=F(i,j)+temp;
                end
            end
        end
    end
end
% imshow(log(F+1)./max(max(log(F+1))));
contour(log(F+1));
axis square;
end

