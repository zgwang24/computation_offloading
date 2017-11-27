clear;
%s为源节点，t为目标节点；一维矩阵参数依次为节点能量、计算速率、传输速率、计算功率、传输功率、计算任务量；
%能量
S = randi([0 2000]);
%计算速率
C = 200 : 100 : 1000;
%传输速率
C_S = 50 : 50 : 300;
%计算功率
P = 100 : 100 : 2000;
%发射功率
P_S = 100 : 100 : 1000;
%计算任务量
W_S = 0.1 : 0.5 : 8;
W_T = 0;
%源节点
s1 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s2 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s3 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s4 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s5 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s6 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
%目标节点
t1 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t2 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t3 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t4 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t5 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t6 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
%源节点数量n
n = 4;
%目标节点数量m
m = [1, 2, 3, 4, 5];
%目标节点数量为n的所有组合
t_combination = combntns(m, n);
s_combination = size(t_combination,1);
%目标节点数量为n的所有排列情况
sum_size_permutation = 0;
t_permutation = [];
for i = 1 : s_combination
    t_permutation_item = perms(t_combination(i, :));
    t_permutation = [t_permutation; t_permutation_item];
    permutation_rows_item =size(t_permutation_item,1);
    sum_size_permutation = sum_size_permutation + permutation_rows_item;
end
%横纵坐标初始化
x = [];
y = [];
ab = 0.8;
for i = 1 : sum_size_permutation
    %每一组迁移的能耗
    group_source_sum = 0;
    %每一组迁移的时延
    group_time_sum = 0;
    for j = 1 : n
        group_source_sum = group_source_sum + source_consume_method(eval(['s', num2str(j)]),eval(['t',num2str(t_permutation(i, j))]),0.01);
        group_time_sum = group_time_sum + time_consume_method(eval(['s', num2str(j)]),eval(['t',num2str(t_permutation(i, j))]),0.01);
    end
    x(i) = i;
    y(i) = ab * group_source_sum + (1 - ab) * group_time_sum;
end
scatter(x, y, 'r');
xlabel('目标节点组合'),ylabel('能耗及时延消耗情况');
