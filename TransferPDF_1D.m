function t= TransferPDF_1D(p_0,p_1)
eps=1e-6;
bar_num=length(p_0);
P0=cumsum(p_0+eps);
P0=P0./max(P0);
P1=cumsum(p_1+eps);
P1=P1./max(P1);
t = interp1([0,P1], [0 0:bar_num-1], P0, 'linear');
t(P0<=P1(1)) = 0;
t(P0>=P1(end)) = bar_num-1;
end

