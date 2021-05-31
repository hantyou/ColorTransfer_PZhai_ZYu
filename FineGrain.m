function output = FineGrain(Im,I0,iter_num)
%FINEGRAIN This function perform fine grain to the mapped image
%   Detailed explanation goes here
I0=I0*255;
Im=Im*255;
Psi_tsd=5;
[h,w,c]=size(I0);
output=zeros(h,w,c);
for k=1:c
    I0k=I0(:,:,k);
    Imk=Im(:,:,k);
    J=Imk;
    [Gm0,~]=imgradient(I0k,'prewitt');
    %% Psi and Phi
    Psi=min(Gm0./5,1);
    Phi=30./(1+10*(Gm0+1));
%     temp=Phi;
%     Phi=Psi;
%     Psi=temp;
    %% a1-a6
    Y=1:h;
    X=1:w;
    Ym1=Y-1;Xm1=X-1;
    Yp1=Y+1;Xp1=X+1;
    Yp1(end)=Yp1(end)-1;
    Xp1(end)=Xp1(end)-1;
    Ym1(1)=Ym1(1)+1;
    Xm1(1)=Xm1(1)+1;
    
    %     a1=-(Psi(Ym1,X)+Psi(Y,X))/2;
    %     a2=-(Psi(Yp1,X)+Psi(Y,X))/2;
    %     a3=-(Psi(Y,Xm1)+Psi(Y,X))/2;
    %     a4=-(Psi(Y,Xp1)+Psi(Y,X))/2;
    %     a5=-(a1+a2+a3+a4)+Phi(Y,X);
    % %     a5=1/2*(4*Psi(Y,X)+Psi(Ym1,X)+Psi(Yp1,X)+Psi(Y,Xm1)+Psi(Y,Xp1))+Phi(Y,X);
    %     %     a6=1/2*(Psi(Y,X)+Psi(Ym1,X)).*(Ik(Ym1,X)-Ik(Y,X))...
    %     %         +(Psi(Y,X)+Psi(Yp1,X).*(Ik(Yp1,X)-Ik(Y,X)))...
    %     %         +(Psi(Y,X)+Psi(Y,Xm1).*(Ik(Y,Xm1)-Ik(Y,X)))...
    %     %         +(Psi(Y,X)+Psi(Y,Xp1).*(Ik(Y,Xp1)-Ik(Y,X)))...
    %     %         +Phi(Y,X).*Ik(Y,X);
    a1=(Psi(Ym1,X)+Psi(Y,X))/2;
    a2=(Psi(Yp1,X)+Psi(Y,X))/2;
    a3=(Psi(Y,Xm1)+Psi(Y,X))/2;
    a4=(Psi(Y,Xp1)+Psi(Y,X))/2;
    a5=(a1+a2+a3+a4)+Phi(Y,X);
    %     a6=a1.*J1+a2.*J2+a3.*J3+a4.*J4+a5.*J5;
    
%     a1=padarray(a1,[1,1],1);
%     a2=padarray(a2,[1,1],1);
%     a3=padarray(a3,[1,1],1);
%     a4=padarray(a4,[1,1],1);
%     a5=padarray(a5,[1,1],1);
    %         a6=padarray(a6,[1,1],1);
    %         J1=padarray(J1,[1,1],1);
    %         J2=padarray(J2,[1,1],1);
    %         J3=padarray(J3,[1,1],1);
    %         J4=padarray(J4,[1,1],1);
    for i =1:iter_num
        J1=J(Ym1,X);
        J2=J(Yp1,X);
        J3=J(Y,Xm1);
        J4=J(Y,Xp1);
%         J1=padarray(J1,[1,1],1);
%         J2=padarray(J2,[1,1],1);
%         J3=padarray(J3,[1,1],1);
%         J4=padarray(J4,[1,1],1);
        I0k1=I0k(Ym1,X);
        I0k2=I0k(Yp1,X);
        I0k3=I0k(Y,Xm1);
        I0k4=I0k(Y,Xp1);
%         I0k1=padarray(I0k1,[1,1],1);
%         I0k2=padarray(I0k2,[1,1],1);
%         I0k3=padarray(I0k3,[1,1],1);
%         I0k4=padarray(I0k4,[1,1],1);
%                 J5=J(Y,X);
%                 J=1./a5.*(...
%                     a5-a1.*J1...
%                     -a2.*J2...
%                     -a3.*J3-a4.*J4...
%                     );
        J=(Phi.*Imk+a1.*(J1-I0k1+I0k)+a2.*(J2-I0k2+I0k)+a3.*(J3-I0k3+I0k)+a4.*(J4-I0k4+I0k))./a5;
        %         J=padarray(J,[1,1],128);
    end
    output(:,:,k)=J;
end
end

