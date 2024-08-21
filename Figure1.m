% Figure1.m

clear variables
close all
clc

% Parameters
n=1e3;                                  % No. R12 steps
R12max=1;   							% Max. Value R12
y=1/200;                                % Initial frequency

% Used
R12=linspace(-1,1,n)';                  % R12 set used
PK=(1-exp(-2*R12*y))./(1-exp(-2*R12));
PK1=y+(y-y^2)*R12;
PK2=y+(y-y^2)*R12 + 1/3*(y-3*y^2+2*y^3)*R12.^2;

hold on
h(1)=plot(R12,100*PK,'k:','linewidth',5);
h(2)=plot(R12,100*PK2,'r','linewidth',4);
h(3)=plot(R12,100*PK1,'b','linewidth',3);
h(4)=plot(R12,100*PK,'k:','linewidth',5);
h(5)=plot(R12,100*PK1,'b','linewidth',3);
H=legend(h(1:3),'{ }Kimura''s result',...
				'{ }second order approximation{  }',...
                '{ }first order approximation{   }',...
				'location','north');
set(H,'fontsize',30)
H.ItemTokenSize = [44,18];

axis([-1,1,0,1.5])
set(gca,'fontsize',25,'linewidth',3,'box','on')
set(gca,'xtick',-1:0.5:1,'ytick',0:0.5:2)

xlabel('$R_{1,2} \equiv 2N_e(s_{1}-s_{2})$','Interpreter','latex','FontSize',30)
ylabel('fixation probability (%)','FontSize',30)

ounits=get(gcf,'Units');
set(gcf,'Units','normalized','OuterPosition',[0 0 1 1],'Units',ounits)
orient landscape
print -depsc Figure1