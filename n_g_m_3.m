clear;
%s为源节点，t为目标节点；一维矩阵参数依次为节点能量、计算速率、传输速率、计算功率、传输功率、计算任务量；
%能量
S_MIN = 25;
S_MAX = 50;
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
s1 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s2 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s3 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s4 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s5 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s6 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s7 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s8 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s9 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
s10 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), W_S(randi([1 length(W_S)]))];
%目标节点
t1 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t2 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t3 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t4 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t5 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t6 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t7 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t8 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t9 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
t10 = [randi([S_MIN S_MAX]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0];
%源节点数量n
n = [1, 2, 3, 4, 5];
n_len = 5;
%目标节点数量m
m = 4;
%智能节点的能耗
s_source = [];
t_source = [];
for i = 1 : n_len
    s_source(i) = source_node(eval(['s', num2str(i)]));
end
for i = 1 : m
    t_source(i) = source_node(eval(['t', num2str(i)]));
end
s_source
t_source
%源节点数量为m的所有组合
s_combination = combntns(n, m);
size_combination = size(s_combination,1);
%源节点数量为m的所有排列情况
sum_size_permutation = 0;
s_permutation = [];
for i = 1 : size_combination
    s_permutation_item = perms(s_combination(i, :));
    s_permutation = [s_permutation; s_permutation_item];
    permutation_rows_item =size(s_permutation_item,1);
    sum_size_permutation = sum_size_permutation + permutation_rows_item;
end
matrix = [];
for i = 1 : sum_size_permutation
    matrix_row = [];
    for j = 1 : m
       [s_consume, t_consume] = source_consume_node(eval(['s', num2str(s_permutation(i, j))]),eval(['t',num2str(j)]),0.01);
        matrix_row(j) = s_source(s_permutation(i, j)) - s_consume;
        matrix_row(j + m) = t_source(j) - t_consume;      
    end
    matrix = [matrix ; matrix_row];
end
for i = 1 : sum_size_permutation
    matrix_row_min = S_MAX; 
    for j = 1 : (n + m)
        if(matrix(i, j) < matrix_row_min)
            matrix_row_min = matrix(i, j);
        end
    end
    x(i) = i;
    y(i) = matrix_row_min;
end
matrix_min_max = S_MIN;
matrix_min_max_index = 0;
for i = 1 : sum_size_permutation
    if (y(i) > matrix_min_max)
        matrix_min_max = y(i);
        matrix_min_max_index = i;
    end
end
matrix_min_max
s_permutation(matrix_min_max_index, : )
matrix(matrix_min_max_index, : )