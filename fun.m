function [ fun ] = fun(s, r, x)
    fun = s - r.*x + ((x.*x)/(1+x.*x));
end
