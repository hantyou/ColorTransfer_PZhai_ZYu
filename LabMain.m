clear,close all;
I0 = double(imread('scotland_house.png'))/255;
I1 = double(imread('Delft2611PP.jpg'))/255;


iter_num=12;
output = IDT(I0,I1,iter_num);
figure,subplot(131),imshow(I0),title("Original Image");
subplot(132),imshow(I1),title("Target Image")
txt=["IDT result with ",num2str(iter_num)," iterations"];
subplot(133),imshow(output),title(txt);
