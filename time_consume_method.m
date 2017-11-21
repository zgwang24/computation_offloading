function res = time_consume_method(p1,p2,ratio)
s_consume = p1(6) / p1(3);
t_consume = p1(6) / p2(2) + ratio * p1(6) / p2(3);
res = (s_consume + t_consume);
end