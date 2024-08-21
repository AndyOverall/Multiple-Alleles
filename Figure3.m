% Figure3.m

% A plot of P1=y1*[1+(R12*y2+R13*y3)+2/3*(R12*y2+R13*y3)^2-1/3*(R12^2*y2+R13^2*y3)].
% Organise plots, so legend works well

% Box 1: R1=2,R2=0,R3=1,                Box 4: R1=2,R2=1,R3=0
% Box 2: R1=0,R2=1,R3=2,                Box 5: R1=0,R2=2,R3=1
% Box 3: R1=1,R2=2,R3=0,                Box 6: R1=1,R2=0,R3=2             


clear variables
close all
clc

% y values
y1=1/200;						% Value y1
Ny2=1e3;                        % No. of y2 values used
Y2=linspace(0,1-y1,Ny2);        % Set of y2 values used
Y3=1-y1-Y2;                     % Set of y3 values used

R=		[2,1,0;                 % Each row of Rsets is (R1,R2,R3)
		 1,2,0;
		 0,2,1;
		 2,0,1;
		 1,0,2;
		 0,1,2]/2;

Rdiffs=[R(:,1)-R(:,2),...
        R(:,1)-R(:,3)]; 		% Each row is (R1-R2,R1-R3)=(R12,R13)

P1=zeros(6,Ny2);                 % Each row contains P1(y1,Y2,1-y1-Y2) for corresp row of Rsets
for i=1:6
    R12=Rdiffs(i,1);
    R13=Rdiffs(i,2);
    Q=R12*Y2+R13*Y3;
    Q2=R12^2*Y2+R13^2*Y3;
    P1(i,:)=y1*(1+Q+2/3*Q.^2-1/3*Q2);
end

% Plot
h=zeros(6,1);

hold on

h(1)=plot(Y2,P1(1,:)/y1,'r' ,'linewidth',3);        % legend located at (1,1)
h(2)=plot(Y2,P1(2,:)/y1,'b' ,'linewidth',3);        % legend located at (2,1)
h(3)=plot(Y2,P1(3,:)/y1,'k' ,'linewidth',2.5);      % legend located at (3,1)
h(4)=plot(Y2,P1(4,:)/y1,'r:','linewidth',3);        % legend located at (1,2)
h(5)=plot(Y2,P1(5,:)/y1,'b:','linewidth',3);        % legend located at (2,2)
h(6)=plot(Y2,P1(6,:)/y1-0.05,'k:','linewidth',2.5); % legend located at (3,2)

H=legend(h(:),['{ }(1,  $\scriptstyle\frac{1}{2}$,  0){         }'],...
              ['{ }($\scriptstyle\frac{1}{2}$,  1,  0){         }'],...
              ['{ }(0,    1,  $\scriptstyle\frac{1}{2}$){         }'],...
              ['{ }(1,    0,  $\scriptstyle\frac{1}{2}$){ }'],...
              ['{ }($\scriptstyle\frac{1}{2}$,  0,  1){ }'],...
              ['{ }(0,  $\scriptstyle\frac{1}{2}$,  1){ }'],...
              'FontSize',25,'location','north','Interpreter','latex');

H.NumColumns=2;
H.Title.String = '$(R_{1}, R_{2}, R_{3})$';
H.Title.FontSize = 30;
H.Title.Interpreter = "latex";
H.ItemTokenSize = [52,18];

axis([0,1,0,4])
set(gca,'fontsize',25,'linewidth',3,'box','on')
set(gca,'xtick',0:0.2:1,'ytick',0:6)

xlabel('$y_2$','Interpreter','latex','FontSize',30)
ylabel('approx. $P_1({\bf y})/y_1$','Interpreter','latex','FontSize',30)

ounits=get(gcf,'Units');
set(gcf,'Units','normalized','OuterPosition',[0 0 1 1],'Units',ounits)
orient landscape
print -depsc Figure3