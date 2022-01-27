function A_mat = A_matrix(T,t_init,tf)
    for i = 1:length(T)+1
        for j = 1:length(T)+1
            if i == j
                A(i,j) = 1;
            elseif i > j
                if j == 1
                    A(i,j) = tf(T(i-1),t_init);
                else
                    A(i,j) = tf(T(i-1),T(j-1));
                end
            else
                A(i,j) = 0;
            end
        end
    end
end