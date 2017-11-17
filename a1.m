clear;
%s为源节点，t为目标节点；一维矩阵参数依次为节点能量、计算速率、传输速率、计算功率、传输功率、计算任务量；
s1=[2000, 5, 2, 20, 10, 400];
s2=[1500, 2, 1, 10, 5, 500];
s3=[1200, 5, 2, 20, 10, 100];
t1=[1800, 3, 2, 15, 10, 0];
t2=[2500, 5, 2, 20, 10, 0];
t3=[2400, 9, 4, 30, 15, 0];
%源节点数量n
n = 3;
%目标节点数量m
m = 3;

%矩阵全排列及行数
t_permutation = perms([1, 2, 3]);
permutation_rows =size(t_permutation,1);
%横纵坐标初始化
x = [];
y = [];
for i = 1 : permutation_rows
    %一组迁移的总能耗
    group_sum = 0;
    for j = 1 : m
        group_sum = group_sum + source_consume_method(eval(['s', num2str(j)]),eval(['t',num2str(t_permutation(i, j))]),0.2);
    end
    x(i) = i;
    y(i) = group_sum;
end
bar(x, y);
xlabel('目标节点组合'),ylabel('能量消耗情况');