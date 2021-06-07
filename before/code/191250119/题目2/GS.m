function [convergence, res] = GS(cm, bm, precision)
    iter = 1;
    convergence = true;
    max_iter = 10000;
    [rbm, ~] = size(bm);
    % 求系数矩阵的对角矩阵
    cm_diag = diag(diag(cm));
    % 求系数矩阵的下三角矩阵
    low_diag = -tril(cm, -1);
    % 求系数矩阵的下三角矩阵
    up_diag = -triu(cm, 1);
    
    B = (cm_diag - low_diag) \ up_diag;
    % 计算谱半径
    R = max(abs(eig(B)));
    if R >= 1
        convergence = false;
        res = zeros(rbm, 1);
        return
    end
    f = (cm_diag - low_diag) \ bm;
    res = zeros(rbm, 1);
    while (norm(res - (B * res + f)) >= precision && iter <= max_iter)
        res = B * res + f;
        iter = iter + 1;
    end
end