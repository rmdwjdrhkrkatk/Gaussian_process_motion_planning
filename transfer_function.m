function tf = transfer_function(t,s,I)
    tf = [1*I (t-s)*I ; 0*I 1*I];
end