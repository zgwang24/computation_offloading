function [s, t] = source_consume_node(p1,p2,ratio)
s = (p1(5) * p1(6) / p1(3)) / 3600;
t = (p2(4) * p1(6) / p2(2) + p2(5) * ratio * p1(6) / p2(3)) / 3600;
end

