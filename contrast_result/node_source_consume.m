function [t_source, c_source] = node_source_consume(node)
    t_source = (node(5) * node(6) / node(3)) / 3600;
    c_source = (node(4) * node(6) / node(2)) / 3600;
end