clear;
%sΪԴ�ڵ㣬tΪĿ��ڵ㣻һά�����������Ϊ�ڵ��������������ʡ��������ʡ����㹦�ʡ����书�ʡ�������������
%����
S = randi([0 21000]);
%��������
C = 200 : 200 : 1000;
%��������
C_S = 50 : 50 : 300;
%���㹦��
P = 100 : 200 : 2000;
%���书��
P_S = 100 : 100 : 1000;
%����������
W_S = randi([0 4]);
W_T = 0;
%Դ�ڵ�
s1 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s2 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s3 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s4 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s5 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
s6 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), randi([0 4])];
%Ŀ��ڵ�
t1 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t2 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t3 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t4 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t5 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
t6 = [randi([0 21000]), C(randi([1 length(C)])), C_S(randi([1 length(C_S)])), P(randi([1 length(P)])), P_S(randi([1 length(P_S)])), 0]
%Դ�ڵ�����n
n = 4;
%Ŀ��ڵ�����m
m = [1, 2, 3, 4, 5, 6];
%Ŀ��ڵ�����Ϊn���������
t_combination = combntns(m, n);
s_combination = size(t_combination,1);
%Ŀ��ڵ�����Ϊn�������������
sum_size_permutation = 0;
t_permutation = [];
for i = 1 : s_combination
    t_permutation_item = perms(t_combination(i, :));
    t_permutation = [t_permutation; t_permutation_item];
    permutation_rows_item =size(t_permutation_item,1);
    sum_size_permutation = sum_size_permutation + permutation_rows_item;
end
%���������ʼ��
x = [];
y = [];
ab = 0.4;
for i = 1 : sum_size_permutation
    %ÿһ��Ǩ�Ƶ��ܺ�
    group_source_sum = 0;
    %ÿһ��Ǩ�Ƶ�ʱ��
    group_time_sum = 0;
    for j = 1 : n
        group_source_sum = group_source_sum + source_consume_method(eval(['s', num2str(j)]),eval(['t',num2str(t_permutation(i, j))]),0.01);
        group_time_sum = group_time_sum + time_consume_method(eval(['s', num2str(j)]),eval(['t',num2str(t_permutation(i, j))]),0.01);
    end
    x(i) = i;
    y(i) = ab * group_source_sum + (1 - ab) * group_time_sum;
end
%bar(y);
scatter(x, y, 'r');
xlabel('Ŀ��ڵ����'),ylabel('�����������(mWh)');