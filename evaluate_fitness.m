%系统综合评估函数

function fitness = evaluate_fitness(y, t, y_ss)
% y: 系统输出向量
% t: 时间向量
% y_ss: 系统稳态值

% 计算峰值超调量、调节时间和响应时间
[Mp, Ts, Tr] = evaluate_response(y, t, y_ss);

% 计算适应度
fitness = 1 / (0.5*Mp + 0.3*Ts + 0.2*Tr);
