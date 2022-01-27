function Q_mat = Q_matrix(delta_t,Q_c,T,t_init,K_init,F_t,tf)
    for i=1:length(T)
        if i == 1
            Q_mat(i) = int(subs(tf,[t],[T(i)])*F_t*Q_c ...
                    *transpose(F_t)*transpose(subs(tf,[t],[T(i)])),s,t_init,T(i));
%         Q_mat(i) = [delta_t^3*Q_c/3 delta_t^2*Q_c/2 ; x...
%                 delta_t^2*Q_c/2 delta_t*Q_c];

%         Q_mat(i) = [delta_t^(-3)*Q_c^(-1)*12  -delta_t^(-2)*Q_c^(-1)*6 ; ...
%                 -delta_t^(-2)*Q_c^(-1)*6   4*delta_t^(-1)*Q_c^(-1)];
        else
            Q_mat(i) = int(subs(tf,[t],[T(i)])*F_t*Q_c ...
                    *transpose(F_t)*transpose(subs(tf,[t],[T(i)])),s,T(i-1),T(i));
        end
    end
    Q_mat = [K_init, Q_mat];
    Q_mat = diag(Q_mat);
end