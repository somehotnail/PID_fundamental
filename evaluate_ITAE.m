function ITAE = evaluate_ITAE(y, r, t, t0)
% y: 系统输出向量
% r: 期望输出向量
% t: 时间向量
% t0: 评估指标的起始时间

% 截取指定时间范围内的输出和期望输出
idx = find(t >= t0, 1);
y = y(idx:end);
r = r(idx:end);
t = t(idx:end);

% 计算ITAE指标
e = r - y;
ITAE = trapz(t, abs(e) .* t);
