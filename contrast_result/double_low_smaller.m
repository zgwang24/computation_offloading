clear;
%s为源节点，t为目标节点；一维矩阵参数依次为节点能量、计算速率、传输速率、计算功率、传输功率、计算任务量；
%能量
S_MIN = 0;S_MAX = 8000;
%计算速率
C = 200 : 100 : 1500;
%传输速率
C_S = 50 : 50 : 300;
%计算功率
P = 200 : 100 : 2000;
%发射功率
P_S = 100 : 100 : 1000;
%计算任务量
W_S = 0.1 : 0.5 : 8;
W_T = 0;
%源节点及目标节点初始化(目标节点数量=源节点数量+diff)
node_num = 100;
diff = 5;
for i = 1 : node_num + diff
    eval(['s', num2str(i), '=', '[randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))]', ';']);  
    eval(['t', num2str(i), '=', '[randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]', ';']);  
end
%展示
ab = 0.8;
x = [];
y1 = [];
y2 = [];
for i = 1 : node_num
    %横轴
    x(i) = i
    %正常匹配
    y1_item = 0;
    for j = 1 : i
        %[no_low_s_source, no_low_t_source] = double_source_consume(eval(['s', num2str(j)]), eval(['t', num2str(j)]), 0.1);
        %y1_item = y1_item + no_low_s_source + no_low_t_source;
        [no_low_s_source, no_low_t_source] = double_source_consume(eval(['s', num2str(j)]), eval(['t', num2str(j)]), 0.1);
        [no_low_s_time, no_low_t_time] = double_time_consume(eval(['s', num2str(j)]), eval(['t', num2str(j)]), 0.1);
        y1_item = y1_item + ab * (no_low_s_source + no_low_t_source) + (1 - ab) * (no_low_s_time + no_low_t_time);
    end
    y1(i) = y1_item
    %低能耗低时延策略
    %效益矩阵
    matric = [];
    for j = 1 : i
        for k = 1 : i + diff
            %[double_low_s_source, double_low_t_source] = double_source_consume(eval(['s', num2str(j)]), eval(['t', num2str(k)]), 0.1);
            %matric(j, k) =  double_low_s_source + double_low_t_source;
            [double_low_s_source, double_low_t_source] = double_source_consume(eval(['s', num2str(j)]), eval(['t', num2str(k)]), 0.1);
            [double_low_s_time, double_low_t_time] = double_time_consume(eval(['s', num2str(j)]), eval(['t', num2str(k)]), 0.1);
            matric(j, k) =  ab * (double_low_s_source + double_low_t_source) + (1 - ab) * (double_low_s_time + double_low_t_time);
        end
    end
    [match, cost] = edmonds(matric);
    y2(i) = cost
end
plot(x, y1, '--', x, y2, '-r');
title('能量及时间的消耗与节点数量的关系')
xlabel('智能节点对数');
ylabel('能量与时间消耗情况')
legend('正常匹配','低能耗低时延');
