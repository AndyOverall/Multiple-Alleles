% SimsTable1.m

% Simulates a diploid population of finite size, with A different alleles.
% X = A by 1 vector of allele frequencies, with sum_i(X_i)=1.

clear vars
close all
clc

N=100;                      % Population size
A=3;                        % No. alleles
Reps=1e5;                   % No. replicates
T=400*N;                    % Maximum No. generations  

R=[1,0.5,0]';               % Scaled selection strengths
s=R/2/N;                    % Selection strengths     

% Initialisation
X=zeros(A,Reps);            % X(a,r) = freq. of allele a in replicate r
FixedAllele=zeros(Reps,1);  % FixedAllele(r) is the allele fixed in replicate r

% Useful
AlleleSet=1:A;
OT=0:T;

% Initial frequencies
n1=1;                       % Initial copy number allele 1
n2=0;
n3=2*N-n1-n2;
X0=[n1;n2;n3]/2/N;

for r=1:Reps
    X(:,r)=X0;
    for t=1:T
        x=X(:,r);
        sbar=x'*s;
        F=x.*(s-sbar)/(1+2*sbar);
        m=mnrnd(2*N,x+F)';                          % m is an A by 1 column vector
        if any(m==2*N)
            FixedAllele(r)=AlleleSet(m==2*N);       % m==2*Ne: logical indicating fixing allele
            break
        end
        xnew=m/2/N;
        X(:,r)=xnew;
    end
end

sum(FixedAllele==0)                             	% No. replicates where fix does not occur by T

SimResult=sum(FixedAllele==1)/Reps/(1/2/N);

y1=1/200;
y2=n2/2/N;        % Set of y2 values used
y3=1-y1-y2;       % Set of y3 values used

%R=[1,1/2.0];

R12=R(1)-R(2);
R13=R(1)-R(3);
Q=R12*y2+R13*y3;
Q2=R12^2*y2+R13^2*y3;
P1=y1*(1+Q+2/3*Q^2-1/3*Q2);

ApproxResult=P1/y1;
Perct=(ApproxResult-SimResult)*100/SimResult;
Overall=[ApproxResult,SimResult,Perct]