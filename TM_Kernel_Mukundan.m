%% Tchebichef kernel function: R. Mukundan, "Some Computational Aspects of Discrete
%Orthonormal Moments", IEEE Trans. Image Process., vol.13, no.8,
%pp.1055-1059, 2004.
function T=TM_Kernel_Mukundan(N,p)

T = zeros(p+1,N);
c0 = 0;
c1 = 0;
c3 = 0;
c4 = 0;
T(1,1) =  1/sqrt(N);
%% �����еĹ�ʽ(18)���ÿ��������Ӧx=0���ĺ���ֵ
for n = 1:p
    c0 = -sqrt((N-n)/(N+n)) * sqrt((2*n+1)/(2*n-1));
    T(n+1,1) = c0*T(n,1); % ÿһ�е�һ��Ԫ�ص������̣���x=0�����
end
%% �����еĹ�ʽ(19)���ÿ��������Ӧx=1���ĺ���ֵ
for n = 0:p
    c1 = 1 + ( n*(1+n)/(1-N) );
    T(n+1,2) = c1*T(n+1,1);
end
%% �������������еĹ�ʽ(20)�����������x���ĺ���ֵ
for x = 2:(N/2-1) % ֻ������ߵ�ֵ��Ȼ����ݶԳƹ�ϵ����Ұ벿�ֵ�ֵ
    for n = 0:p
        c3 =(-n*(n+1)-(2*x-1)*(x-N-1)-x)/(x*(N-x));
        c4 = (x-1)*(x-N-1)/(x*(N-x));
        T(n+1,x+1) = c3*T(n+1,x)+c4*T(n+1,x-1);
    end
end

%% �������öԳƹ�ϵ(���й�ʽ22)���Ұ벿�ֵĺ���ֵ
for n=0:p
    for x=(N/2+1):N
        T(n+1,x)=(-1)^n*T(n+1,N-x+1);
    end
end

% figure,plot(0:(N-1),T)
% xlim([0 N])