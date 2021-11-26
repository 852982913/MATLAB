tiqu=data_in(1274900:1275100,1:2);
nihe1=tiqu(:,1);nihe2=tiqu(:,2);
%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( nihe1, nihe2 );

% Set up fittype and options.
ft = fittype( 'sin1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf 0 -Inf];
opts.StartPoint = [0.432016114678895 170738731.182638 1.85507102709717];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'nihe2 vs. nihe1', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'nihe1', 'Interpreter', 'none' );
ylabel( 'nihe2', 'Interpreter', 'none' );
grid on