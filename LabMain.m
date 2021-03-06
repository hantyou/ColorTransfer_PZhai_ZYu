clear,close all;
I0 = double(imread('scotland_house.png'))/255;
I1 = double(imread('scotland_plain.png'))/255;
% I0=imrotate(I0,90);
% I0=imresize(I0,[round(size(I0,1)/5) round(size(I0,2)/5)]);
% I1=imresize(I1,[round(size(I1,1)/8) round(size(I1,2)/8)]);
%% Task 2: IDT
iter_num=10;
output0 = IDT(I0,I1,iter_num,1);
figure(1),subplot(231),imshow(I0),title("Original Image");
subplot(232),imshow(I1),title("Target Image")
txt=["IDT result with ",num2str(iter_num)," iterations"];
subplot(233),imshow(output0),title(txt);
%% Task 3: example of self-generated 2D distribution
iter_num=14;
s=20;
D0=zeros(s,s,2);
Temp=raylrnd(5,s,s)+25;
Mask=(unidrnd(2,s,s)-1);
Mask(Mask==0)=-1;
Mask=Mask.*10;
Temp=Temp+Mask;
D0(:,:,1)=Temp;
D0(:,:,2)=(raylrnd(5,s,s)+10);
D0(:,:,2)=D0(:,:,2)+(unidrnd(5,s,s)+30)/2+Mask;
D1=zeros(s,s,2);
D1(:,:,2)=unidrnd(10,s,s)/2+unidrnd(30,s,s)/2+Mask*1.2+13;
D1(:,:,1)=raylrnd(5,s,s)+20;
D2(:,:,1)=unidrnd(10,s,s)/2+unidrnd(30,s,s)/2+Mask*1.2+13;
D2(:,:,2)=raylrnd(5,s,s)+20;
D1=[D1 D2];
D0=[D0 D0];
D0=D0./50;
D1=D1./50;
output2 = IDT(D0,D1,iter_num,1);
pause(0.01);
%% Task 4: Fine grain
iter_num=100;
[h,w,~]=size(I0);
Phi_upp=30000;
output1 = FineGrain(imresize(output0,[h,w]),imresize(I0,[h,w]),iter_num,Phi_upp);
output1=output1/255;
output = regrain(I0,output0);
% output=imresize(output,[h,w]);
output=output;
figure(1),subplot(234),imshow(output);
title('Refined Image');
figure(1),subplot(235),imshow(output1);
title(['Refined Image with our function, Phi as ',num2str(Phi_upp)]);
Phi_upp=30;
output2 = FineGrain(imresize(output0,[h,w]),imresize(I0,[h,w]),iter_num,Phi_upp);
output2=output2/255;
figure(1),subplot(236),imshow(output2);
title(['Refined Image with our function, Phi as ',num2str(Phi_upp)]);
