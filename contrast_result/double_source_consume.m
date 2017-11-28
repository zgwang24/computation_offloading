function [s_source, t_source] = double_source_consume(n1, n2, ratio)
    s_source = n1(5) * n1(6) / n1(3) / 3600;
    t_source = (n2(4) * n1(6) / n2(2) + ratio * n2(5) *  n1(6) / n2(3)) / 3600;
end