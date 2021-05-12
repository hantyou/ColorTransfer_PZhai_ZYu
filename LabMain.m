clear,close all;
I0 = double(imread('scotland_house.png'))/255;
I1 = double(imread('scotland_plain.png'))/255;

%% Task 2: IDT
iter_num=10;
output = IDT(I0,I1,iter_num);
figure,subplot(131),imshow(I0),title("Original Image");
subplot(132),imshow(I1),title("Target Image")
txt=["IDT result with ",num2str(iter_num)," iterations"];
subplot(133),imshow(output),title(txt);
%% Task 3: example of self-generated 2D distribution
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
D1(:,:,2)=unidrnd(10,s,s)/2+unidrnd(30,s,s)/2+Mask*1.1+13;
D1(:,:,1)=raylrnd(5,s,s)+20;
D0=D0./50;
D1=D1./50;
output2 = IDT(D0,D1,iter_num,1);
%% Task 4: Fine grain
