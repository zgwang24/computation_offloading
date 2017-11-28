function [t_time, c_time] = node_time_consume(node)
    t_time = node(6) / node(3) / 3600;
    c_time = node(6) / node(2) / 3600;
end