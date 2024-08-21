%Figure2.m

clear variables
close all
clc

% Parameters
n = 1e3;                                  	% No. R steps
%Rmax = 1;   								% Max. value R	
Yset = [1/200, 1/2, 3/4];                   % Initial group frequencies
R = linspace(-1, 1, n)';                    % R set
L = 2;                                    	% Linewidth

t = tiledlayout(3, 1, 'TileSpacing', 'compact', 'Padding', 'compact'); 

% First tile
nexttile
i = 1;
Y = Yset(i);
PKby = (1 - exp(-2 * R * Y)) ./ (1 - exp(-2 * R)) ./ Y;
Pby = 1 + (1 - Y) * R + 1/3 * (1 - 3 * Y + 2 * Y^2) * R.^2;
plot(R, PKby, 'b', 'LineWidth', 1 * L)
hold on
plot(R, Pby, 'r--', 'LineWidth', 2 * L)
set(gca, 'xtick', -1:0.5:1, 'xticklabel', [])
set(gca, 'fontsize', 25, 'linewidth', 3, 'box', 'on')
h1 = gca;
set(h1, 'YLim', [-0.25, 3], 'YTick', [0, 1.5, 3])
hh = legend('{  }''exact''', '{  }second order{ }', 'location', 'northwest');
set(hh, 'ItemTokenSize', [25 * 2, 18]);
text(-0.1 + 0.011, 2.0, '$Y=1/200$', 'interpreter', 'latex', 'FontSize', 25)

% Second tile
nexttile
i = 2;
Y = Yset(i);
PKby = (1 - exp(-2 * R * Y)) ./ (1 - exp(-2 * R)) ./ Y;
Pby = 1 + (1 - Y) * R + 1/3 * (1 - 3 * Y + 2 * Y^2) * R.^2;
plot(R, PKby, 'b', 'LineWidth', 1 * L)
hold on
plot(R, Pby, 'r--', 'LineWidth', 2 * L)
set(gca, 'xtick', -1:0.5:1, 'xticklabel', [])
set(gca, 'fontsize', 25, 'linewidth', 3, 'box', 'on')
h2 = gca;
set(h2, 'YLim', [-0.25*2/3, 2+0.25*2/3], 'YTick', [0:2])
YL = ylabel('$P_{i}(\mathbf{y})/y_i$', 'interpreter', 'latex');
set(YL, 'Position', [-1.070 1.0000 -1.0000])
text(-0.1 + 0.011, 0.7 * 2.1, '$Y=1/2$', 'interpreter', 'latex', 'FontSize', 25)

% Third tile
nexttile
i = 3;
Y = Yset(i);
PKby = (1 - exp(-2 * R * Y)) ./ (1 - exp(-2 * R)) ./ Y;
Pby = 1 + (1 - Y) * R + 1/3 * (1 - 3 * Y + 2 * Y^2) * R.^2;
plot(R, PKby, 'b', 'LineWidth', 1 * L)
hold on
plot(R, Pby, 'r--', 'LineWidth', 2 * L)
set(gca, 'xtick', -1:0.5:1)
h3 = gca;
set(h3, 'YLim', [0.5, 1.5+0.25/3], 'YTick', [0.5, 1, 1.5])
xlabel('$R$', 'interpreter', 'latex')
text(-0.1 + 0.011, 0.57 * 2.2, '$Y=3/4$', 'interpreter', 'latex', 'FontSize', 25)

% Final adjustments
set(gca, 'fontsize', 25, 'linewidth', 3, 'box', 'on')
ounits = get(gcf, 'Units');
set(gcf, 'Units', 'normalized', 'OuterPosition', [0 0 1 1], 'Units', ounits)
orient landscape
print -depsc Figure2