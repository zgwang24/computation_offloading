function [z,ans]=fenpei(marix)
%//////////////////////////////////////////////////
            %输入效率矩阵 marix 为方阵;
            %若效率矩阵中有 M,则用一充分大的数代替;
            %输出z为最优解，ans为 最优分配矩阵；
%//////////////////////////////////////////////////
a=marix;
b=a;
%确定矩阵维数
s=length(a);
%确定矩阵行最小值，进行行减
ml=min(a');
for i=1:s
    a(i,:)=a(i,:)-ml(i);
end
%确定矩阵列最小值，进行列减
mr=min(a);
for j=1:s
    a(:,j)=a(:,j)-mr(j);
end
% start working
num=0;
while(num~=s)  %终止条件是“（0）”的个数与矩阵的维数相同
    %index用以标记矩阵中的零元素，若a(i,j)=0，则index(i,j)=1,否则index(i,j)=0
    index=ones(s);
    index=a&index;
    index=~index;
    %flag用以标记划线位，flag=0 表示未被划线，
    %flag=1 表示有划线过，flag=2 表示为两直线交点
    %ans用以记录 a 中“（0）”的位置
    %循环后重新初始化flag,ans
    flag = zeros(s);
    ans = zeros(s);
    %一次循环划线全过程，终止条件是所有的零元素均被直线覆盖，
    %即在flag>0位,index=0
    while(sum(sum(index)))
        %按行找出“（0）”所在位置，并对“（0）”所在列划线，
        %即设置flag,同时修改index,将结果填入ans
        for i=1:s
            t=0;
            l=0;
            for j=1:s
                if(flag(i,j)==0&&index(i,j)==1)
                    l=l+1;
                    t=j;
                end
            end
            if(l==1)
                flag(:,t)=flag(:,t)+1;
                index(:,t)=0;
                ans(i,t)=1;
            end
        end
        %按列找出“（0）”所在位置，并对“（0）”所在行划线，
        %即设置flag,同时修改index,将结果填入ans
        for j=1:s
            t=0;
            r=0;
            for i=1:s
                if(flag(i,j)==0&&index(i,j)==1)
                    r=r+1;
                    t=i;
                end
            end
            if(r==1)
                flag(t,:)=flag(t,:)+1;
                index(t,:)=0;
                ans(t,j)=1;
            end
        end
    end  %对 while(sum(sum(index)))
    %处理过程
    %计数器：计算ans中1的个数，用num表示
    num=sum(sum(ans));
    % 判断是否可以终止，若可以则跳出循环
    if(s==num)
        break;
    end
    %否则，进行下一步处理
    %确定未被划线的最小元素，用m表示
    m=max(max(a));
    for i=1:s
        for j=1:s
            if(flag(i,j)==0)
                if(a(i,j)<m)
                    m=a(i,j);
                end
            end
        end
    end
    %未被划线，即flag=0处减去m；线交点，即flag=2处加上m
    for i=1:s
        for j=1:s
            if(flag(i,j)==0)
                a(i,j)=a(i,j)-m;
            end
            if(flag(i,j)==2)
                   a(i,j)=a(i,j)+m;
            end
       end
   end
end  %对while(num~=s) 
%计算最优（min）值
zm=ans.*b;
z=0;
z=sum(sum(zm));
