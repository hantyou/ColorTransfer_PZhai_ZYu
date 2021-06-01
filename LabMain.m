clear,close all;
I0 = double(imread('45.jpg'))/255;
I1 = double(imread('star.jpg'))/255;
% I0=imrotate(I0,90);
I0=imresize(I0,[round(size(I0,1)/2) round(size(I0,2)/2)]);
I1=imresize(I1,[round(size(I1,1)/4) round(size(I1,2)/4)]);
%% Task 2: IDT
iter_num=10;
output = IDT(I0,I1,iter_num);
figure(1),subplot(221),imshow(I0),title("Original Image");
subplot(222),imshow(I1),title("Target Image")
txt=["IDT result with ",num2str(iter_num)," iterations"];
subplot(223),imshow(output),title(txt);
%% Task 3: example of self-generated 2D distribution
% s=20;
% D0=zeros(s,s,2);
% Temp=raylrnd(5,s,s)+25;
% Mask=(unidrnd(2,s,s)-1);
% Mask(Mask==0)=-1;
% Mask=Mask.*10;
% Temp=Temp+Mask;
% D0(:,:,1)=Temp;
% D0(:,:,2)=(raylrnd(5,s,s)+10);
% D0(:,:,2)=D0(:,:,2)+(unidrnd(5,s,s)+30)/2+Mask;
% D1=zeros(s,s,2);
% D1(:,:,2)=unidrnd(10,s,s)/2+unidrnd(30,s,s)/2+Mask*1.1+13;
% D1(:,:,1)=raylrnd(5,s,s)+20;
% D0=D0./50;
% D1=D1./50;
% output2 = IDT(D0,D1,iter_num,1);
%% Task 4: Fine grain
iter_num=50;
[h,w,~]=size(I0);
output = FineGrain(imresize(output,[h/2,w/2]),imresize(I0,[h/2,w/2]),iter_num);
output=imresize(output,[h,w]);
output=output/255;
figure(1),subplot(224),imshow(output);
title('Refined Image');