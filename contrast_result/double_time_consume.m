function [s_time, t_time] = double_time_consume(n1, n2, ratio)
    s_time = n1(6) / n1(3) / 3600;
    t_time = (n1(6) / n2(2) + ratio * n1(6) / n2(3)) / 3600;
end