function [convergence, res] = jacobi(cm, bm, precision)
    iter = 1;
    convergence = true;
    max_iter = 2000;
    [rbm, ~] = size(bm);
    % 求系数矩阵的对角矩阵
    cm_diag = diag(diag(cm));
    
    B = cm_diag \ (cm_diag - cm);
    % 计算谱半径
    R = max(abs(eig(B)));
    if R >= 1
        convergence = false;
        res = zeros(rbm, 1);
        return
    end
    f = cm_diag \ bm;
    res = zeros(rbm, 1);
    while (norm(res - (B * res + f)) >= precision && iter <= max_iter)
        res = B * res + f;
        iter = iter + 1;
    end
end