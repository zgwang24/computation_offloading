clear;
%s为源节点，t为目标节点；一维矩阵参数依次为节点能量、计算速率、传输速率、计算功率、传输功率、计算任务量；
%能量
S = randi([0 21000]);
%计算速率
C = 200 : 200 : 1000;
%传输速率
C_S = 50 : 50 : 300;
%计算功率
P = 100 : 200 : 2000;
%发射功率
P_S = 100 : 100 : 1000;
%计算任务量
W_S = randi([0 4]);
W_T = 0;
%源节点
s1 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s2 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s3 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s4 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s5 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s6 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
%目标节点
t1 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t2 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t3 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t4 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t5 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t6 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
%源节点数量n
n = 4;
%目标节点数量m
m = [1, 2, 3, 4, 5, 6];
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
for i = 1 : sum_size_permutation
    %一组迁移的总能耗
    group_sum = 0;
    for j = 1 : n
        group_sum = group_sum + source_consume_method(eval(['s', num2str(j)]),eval(['t',num2str(t_permutation(i, j))]),0.01);
    end
    x(i) = i;
    y(i) = group_sum;
end
bar(y);
%scatter(x, y, 'r');
xlabel('目标节点组合'),ylabel('能量消耗情况(mWh)');
