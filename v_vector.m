function v_vec = v_vector(T,t_init,v_t,mu_init,tf)
    for i=1:length(T)
        if i == 1
            v_vec(i) = integral(@(s) tf(T(i),s)*v_t(s), t_init, T(i));
        else
            v_vec(i) = integral(@(s) tf(T(i),s)*v_t(s), T(i-1), T(i));
        end
    v_vec = [mu_init v_vec];
end