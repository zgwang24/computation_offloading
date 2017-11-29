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
%源节点及目标节点初始化
node_num = 30;
for i = 1 : node_num
    eval(['s', num2str(i), '=', '[randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))]', ';']);  
    eval(['t', num2str(i), '=', '[randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]', ';']);  
end
%展示
x = [];
y1 = [];
y2 = [];
for i = 1 : node_num
    %所有节点能量初始化
    s_source = [];
    t_source = [];
    s_exist_time = [];
    t_exist_time = [];
    for j = 1 : i
        s_source(j) = get_node_source(eval(['s', num2str(j)]));
    end
    for j = 1 : i
        t_source(j) = get_node_source(eval(['t', num2str(j)]));
    end  
    %横轴
    x(i) = i;
    %正常匹配
    for j = 1 : i
        [no_low_s_source, no_low_t_source] = double_source_consume(eval(['s', num2str(j)]), eval(['t', num2str(j)]), 0.1);
        [no_low_s_time, no_low_t_time] = double_time_consume(eval(['s', num2str(j)]), eval(['t', num2str(j)]), 0.1);
        s_exist_time(j) = s_source(j) / no_low_s_source * no_low_s_time;
        t_exist_time(j) = t_source(j) / no_low_t_source * no_low_t_time;
    end
    y1(i) = min([s_exist_time t_exist_time]);
    %自组网饱和时间持久性
    source_consume_matric = [];
    time_consume_matric = [];
    for j = 1 : i
        for k = 1 : i
            [no_low_s_source, no_low_t_source] = double_source_consume(eval(['s', num2str(j)]), eval(['t', num2str(k)]), 0.1);
            source_consume_matric(j, k) = no_low_t_source;
            [no_low_s_time, no_low_t_time] = double_time_consume(eval(['s', num2str(j)]), eval(['t', num2str(k)]), 0.1);
            time_consume_matric(j, k) = no_low_t_time;
        end        
    end
    %能量矩阵转化为迁移次数矩阵
    offload_num_matric = [];
    for j = 1 : i
        for k = 1 : i
            offload_num_matric(j, k) = t_source(k) / source_consume_matric(j, k);
        end        
    end
    %迁移次数矩阵转化为时间矩阵
    node_exist_time = [];
    for j = 1 : i
        for k = 1 : i
            node_exist_time(j, k) = offload_num_matric(j, k) * time_consume_matric(j, k);
        end        
    end
    saturation_exist_time = [];
    for j = 1 : i
       min_val = min(node_exist_time(:, j));
       saturation_exist_time(j) = min_val;
    end
    y2(i) = min([s_exist_time max(saturation_exist_time)])
end
% plot(x, y1, '-b', x, y2, '-r');
bar(x, [y1; y2]');
title('自组网饱和时间与节点数量的关系')
xlabel('智能节点对数');
ylabel('计算迁移次数')
legend('正常匹配','饱和策略');
