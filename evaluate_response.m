function [PO, Ts, Tr] = evaluate_response(y, t, y_ss)
% y: 系统输出向量
% t: 时间向量
% y_ss: 系统稳态值

% 计算峰值超调量
Mp = max(y);
PO = (Mp - y_ss) / y_ss * 100;

% 计算调节时间
idx = find(abs(y - y_ss) > 0.05*y_ss, 1, 'last');%5%误差带  找到进入误差带的第一个元素的索引
Ts = t(idx);

% 计算响应时间
idx = find(y > 0.99*Mp, 1); %find (clause N direction) 第3个参数默认为first，即返回满足条件的前N个索引
Tr = t(idx);
