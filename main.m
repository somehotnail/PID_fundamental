%% ISE评估
% 定义系统传递函数
G = tf([1], [1, 2, 1]);

% 设定期望输出信号
t = 0:0.01:10;
r = sin(t);

% 模拟系统响应
[y, ~, ~] = lsim(G, r, t);

% 计算ISE指标
t0 = 1; % 从t=1s开始评估
ISE = evaluate_ISE(y, r, t, t0);

% 显示评估结果
fprintf('ISE指标: %.2f\n', ISE);

% 绘制系统响应曲线
plot(t, y);
hold on;
plot(t, r, '--');
xlabel('时间 (s)');
ylabel('输出');
title('系统响应');
legend('输出', '期望输出');

%% 系统指标评估 响应时间 调节时间和超调量
% 定义系统传递函数
G = tf([1], [1, 2, 1]);

% 设定步长输入信号
t = 0:0.01:10;
u = ones(size(t));

% 模拟系统响应
[y, ~, ~] = lsim(G, u, t);

% 计算峰值超调量、调节时间和响应时间
[y_ss, ~] = dcgain(G);
[PO, Ts, Tr] = evaluate_response(y, t, y_ss);
fitness = evaluate_fitness(y, t, y_ss)
% 显示评估结果
fprintf('峰值超调量: %.2f%%\n', PO);
fprintf('调节时间: %.2fs\n', Ts);
fprintf('响应时间: %.2fs\n', Tr);
fprintf('适应度: %.2f\n', fitness);
% 绘制系统响应曲线
plot(t, y);
xlabel('时间 (s)');
ylabel('输出');
title('系统响应');


%% ITAE评估
% 定义系统传递函数
G = tf([1], [1, 2, 1]);

% 设定期望输出信号
t = 0:0.01:10;
r = sin(t);

% 模拟系统响应
[y, ~, ~] = lsim(G, r, t);

% 计算ITAE指标
t0 = 1; % 从t=1s开始评估
ITAE = evaluate_ITAE(y, r, t, t0);

% 显示评估结果
fprintf('ITAE指标: %.2f\n', ITAE); 

% 绘制系统响应曲线
plot(t, y);
hold on;
plot(t, r, '--');
xlabel('时间 (s)');
ylabel('输出');
title('系统响应');
legend('输出', '期望输出');

