function t= TransferPDF_1D(p_0,p_1)
%TRANSFERPDF_1D
%t= TransferPDF_1D(p_0,p_1)
%This function calculate the operator t(*) to make
%t(u)=G^(-1)(F(u)). Here F and G are accumulate function of f and g, which
%are respectively the pdf of original and target picture. In this function,
%p_0 is the normalized histogram of original picture, and p_1 is normalized
%histogram of target picture. 
%The G function is a function from the image values to probabilities, so
%G^(-1) should be a function from probabilities to image values. Then t(u)
%is also a function from probabilities to image values, and here we set
%these probabilities as the probabilities calculated from F(u). 
eps=1e-6;%this is used to prevent verticle lines after inversion of function
bar_num=length(p_0);
P0=cumsum(p_0+eps);
P0=P0./max(P0);
P1=cumsum(p_1+eps);
P1=P1./max(P1);
t = interp1([0,P1], [0 0:bar_num-1], P0, 'linear');
% P1 are the input of original function, 0 is there to prevent appearance
% of NaN value. [0 0:bar_num-1] are the image values. So the first two 
% input gives a function from probabilities to image values. P0 are the original
% probability values, that is F(u) in the model. And the value calculated
% should be G^(-1)((F(u))), which is exactly t(u).
t(P0<=P1(1)) = 0;
t(P0>=P1(end)) = bar_num-1;
end

