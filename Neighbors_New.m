for fold=1:1
    
    temp_site = Sites(Species(i2,6),Species(i2,5)); % значение рассматриваемого узла
    
    Diff = ones(1,6); % 0 - нет действия, 1 - простой скачок, 2 - обмен, 3 - десорбция
    
    % 1 - СЛЕВА СВЕРХУ
    
    Neighbors_1 = zeros(7,10);
    
    if Species(i2,5)+1 > n_site
        x_1 = Species(i2,5)+1-n_site;
    else
        x_1 = Species(i2,5)+1;
    end
    y_1 = Species(i2,6)+1; % границы сверху мы не достигнем, так как всегда создаём запасные слои
    
    if Sites(y_1,x_1) == 0 % если позиция не занята, то это простая диффузия
        Sites(Species(i2,6),Species(i2,5)) = 0; % узел зануляется, чтобы сымитировать ситуацию, когда он переместится
    else
        % если атомы разного типа, то это обмен
        if sp_type ~= round(10*(Sites(y_1,x_1)-fix(Sites(y_1,x_1))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_1,x_1); % на место текущего узла становится атом-сосед
            Diff(1) = 2;
            % если одинакового
        else
            if make_pause == 1 % проверим на всякий случай
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_1,x_1)
                pause
            end % и если так и есть, то диффузия в эту позицию невозможна
            Diff(1) = 0;
        end
    end
    
    % 1-я КС:
    % сверху:
    Neighbors_1(1,1) = Sites(y_1+1,x_1); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if x_1-1 < 1
        if y_1-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors_1(1,2) = Sites(y_1,x_1-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors_1(1,2) = Sites(y_1-1,x_1-1+n_site);
        end
    else
        if y_1-1 < 1
            Neighbors_1(1,2) = Sites(y_1,x_1-1);
        else
            Neighbors_1(1,2) = Sites(y_1-1,x_1-1);
        end
    end
    % снизу слева:
    if x_1+1 > n_site
        if y_1-1 < 1
            Neighbors_1(1,3) = Sites(y_1,x_1+1-n_site);
        else
            Neighbors_1(1,3) = Sites(y_1-1,x_1+1-n_site);
        end
    else
        if y_1-1 < 1
            Neighbors_1(1,3) = Sites(y_1,x_1+1);
        else
            Neighbors_1(1,3) = Sites(y_1-1,x_1+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if x_1+1 > n_site
        Neighbors_1(2,1) = Sites(y_1+1,x_1+1-n_site);
    else
        Neighbors_1(2,1) = Sites(y_1+1,x_1+1);
    end
    % сверху справа:
    if x_1-1 < 1
        Neighbors_1(2,2) = Sites(y_1+1,x_1-1+n_site);
    else
        Neighbors_1(2,2) = Sites(y_1+1,x_1-1);
    end
    % снизу:
    if y_1-1 < 1
        Neighbors_1(2,3) = Sites(y_1,x_1);
    else
        Neighbors_1(2,3) = Sites(y_1-1,x_1);
    end
    
    % 3-я КС:
    % слева:
    if x_1+1 > n_site
        Neighbors_1(3,1) = Sites(y_1,x_1+1-n_site);
    elseif Sites(y_1,x_1+1) ~= 0
        Neighbors_1(3,1) = Sites(y_1,x_1+1);
    end
    % сверху через 2 атома:
    Neighbors_1(3,2) = Sites(y_1+2,x_1);
    % справа:
    if x_1-1 < 1
        Neighbors_1(3,3) = Sites(y_1,x_1-1+n_site);
    else
        Neighbors_1(3,3) = Sites(y_1,x_1-1);
    end
    % снизу через 2 атома:
    if y_1-2 < 1
        Neighbors_1(3,4) = Sites(y_1,x_1);
    else
        Neighbors_1(3,4) = Sites(y_1-2,x_1);
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if x_1+2 > n_site % граничное условие
        Neighbors_1(4,1) = Sites(y_1,x_1+2-n_site);
    else
        Neighbors_1(4,1) = Sites(y_1,x_1+2);
    end
    % сверху через 2 атома слева:
    if x_1+1 > n_site
        Neighbors_1(4,2) = Sites(y_1+2,x_1+1-n_site);
    else
        Neighbors_1(4,2) = Sites(y_1+2,x_1+1);
    end
    % сверху через 2 атома справа:
    if x_1-1 < 1
        Neighbors_1(4,3) = Sites(y_1+2,x_1-1+n_site);
    else
        Neighbors_1(4,3) = Sites(y_1+2,x_1-1);
    end
    % справа через 2 атома:
    if x_1-2 < 1
        Neighbors_1(4,4) = Sites(y_1,x_1-2+n_site);
    else
        Neighbors_1(4,4) = Sites(y_1,x_1-2);
    end
    % снизу через 2 атома справа:
    if x_1-1 < 1
        if y_1-2 < 1
            Neighbors_1(4,5) = Sites(y_1,x_1-1+n_site);
        else
            Neighbors_1(4,5) = Sites(y_1-2,x_1-1+n_site);
        end
    else
        if y_1-2 < 1
            Neighbors_1(4,5) = Sites(y_1,x_1-1);
        else
            Neighbors_1(4,5) = Sites(y_1-2,x_1-1);
        end
    end
    % снизу через 2 атома слева:
    if x_1+1 > n_site
        if y_1-2 < 1
            Neighbors_1(4,6) = Sites(y_1,x_1+1-n_site);
        else
            Neighbors_1(4,6) = Sites(y_1-2,x_1+1-n_site);
        end
    else
        if y_1-2 < 1
            Neighbors_1(4,6) = Sites(y_1,x_1+1);
        else
            Neighbors_1(4,6) = Sites(y_1-2,x_1+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if x_1+2 > n_site
        Neighbors_1(5,1) = Sites(y_1+1,x_1+2-n_site);
    else
        Neighbors_1(5,1) = Sites(y_1+1,x_1+2);
    end
    % сверху через 3 атома слева
    if x_1+1 > n_site
        Neighbors_1(5,2) = Sites(y_1+3,x_1+1-n_site);
    else
        Neighbors_1(5,2) = Sites(y_1+3,x_1+1);
    end
    % сверху через 3 атома справа
    if x_1-1 < 1
        Neighbors_1(5,3) = Sites(y_1+3,x_1-1+n_site);
    else
        Neighbors_1(5,3) = Sites(y_1+3,x_1-1);
    end
    % сверху справа через 2 атома
    if x_1-2 < 1
        Neighbors_1(5,4) = Sites(y_1+1,x_1-2+n_site);
    else
        Neighbors_1(5,4) = Sites(y_1+1,x_1-2);
    end
    % снизу справа через 2 атома
    if x_1-2 < 1
        if y_1-1 < 1
            Neighbors_1(5,5) = Sites(y_1,x_1-2+n_site);
        else
            Neighbors_1(5,5) = Sites(y_1-1,x_1-2+n_site);
        end
    else
        if y_1-1 < 1
            Neighbors_1(5,5) = Sites(y_1,x_1-2);
        else
            Neighbors_1(5,5) = Sites(y_1-1,x_1-2);
        end
    end
    % снизу через 3 атома справа
    if x_1-1 < 1
        if y_1-3 < 1
            Neighbors_1(5,6) = Sites(y_1,x_1-1+n_site);
        else
            Neighbors_1(5,6) = Sites(y_1-3,x_1-1+n_site);
        end
    else
        if y_1-3 < 1
            Neighbors_1(5,6) = Sites(y_1,x_1-1);
        else
            Neighbors_1(5,6) = Sites(y_1-3,x_1-1);
        end
    end
    % снизу через 3 атома слева
    if x_1+1 > n_site
        if y_1-3 < 1
            Neighbors_1(5,7) = Sites(y_1,x_1+1-n_site);
        else
            Neighbors_1(5,7) = Sites(y_1-3,x_1+1-n_site);
        end
    else
        if y_1-3 < 1
            Neighbors_1(5,7) = Sites(y_1,x_1+1);
        else
            Neighbors_1(5,7) = Sites(y_1-3,x_1+1);
        end
    end
    % снизу слева через 2 атома
    if x_1+2 > n_site
        if y_1-1 < 1
            Neighbors_1(5,8) = Sites(y_1,x_1+2-n_site);
        else
            Neighbors_1(5,8) = Sites(y_1-1,x_1+2-n_site);
        end
    else
        if y_1-1 < 1
            Neighbors_1(5,8) = Sites(y_1,x_1+2);
        else
            Neighbors_1(5,8) = Sites(y_1-1,x_1+2);
        end
    end
    % сверху через 3 атома
    Neighbors_1(5,9) = Sites(y_1+3,x_1);
    % снизу через 3 атома:
    if y_1-3 < 1
        Neighbors_1(5,10) = Sites(y_1,x_1);
    else
        Neighbors_1(5,10) = Sites(y_1-3,x_1);
    end
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if x_1+2 > n_site
        Neighbors_1(6,1) = Sites(y_1+2,x_1+2-n_site);
    else
        Neighbors_1(6,1) = Sites(y_1+2,x_1+2);
    end
    % сверху через 2 атома справа через 2 атома
    if x_1-2 < 1
        Neighbors_1(6,2) = Sites(y_1+2,x_1-2+n_site);
    else
        Neighbors_1(6,2) = Sites(y_1+2,x_1-2);
    end
    % снизу через 2 атома справа через 2 атома
    if x_1-2 < 1
        if y_1-2 < 1
            Neighbors_1(6,3) = Sites(y_1,x_1-2+n_site);
        else
            Neighbors_1(6,3) = Sites(y_1-2,x_1-2+n_site);
        end
    else
        if y_1-2 < 1
            Neighbors_1(6,3) = Sites(y_1,x_1-2);
        else
            Neighbors_1(6,3) = Sites(y_1-2,x_1-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if x_1+2 > n_site
        if y_1-2 < 1
            Neighbors_1(6,4) = Sites(y_1,x_1+2-n_site);
        else
            Neighbors_1(6,4) = Sites(y_1-2,x_1+2-n_site);
        end
    else
        if y_1-2 < 1
            Neighbors_1(6,4) = Sites(y_1,x_1+2);
        else
            Neighbors_1(6,4) = Sites(y_1-2,x_1+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if x_1+3 > n_site
    %     Neighbors_1(7,1) = Sites(y_1,x_1+3-n_site);
    % else
    %     Neighbors_1(7,1) = Sites(y_1,x_1+3);
    % end
    % сверху через 4 атома
    if y_1+4 > size(Sites,1)
        Neighbors_1(7,2) = 0;
        Diff(1) = 3;
    else
        Neighbors_1(7,2) = Sites(y_1+4,x_1);
    end
    % % справа через 3 атома
    % if x_1-3 < 1
    %     Neighbors_1(7,3) = Sites(y_1,x_1-3+n_site);
    % else
    %     Neighbors_1(7,3) = Sites(y_1,x_1-3);
    % end
    % снизу через 4 атома:
    if y_1-4 < 1
        Neighbors_1(7,4) = Sites(y_1,x_1);
    else
        Neighbors_1(7,4) = Sites(y_1-4,x_1);
    end
    
    % 2 - СВЕРХУ
    
    Neighbors_2 = zeros(7,10);
    
    x_2 = Species(i2,5);
    y_2 = Species(i2,6)+1;
    
    if Sites(y_2,x_2) == 0 % если позиция не занята
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % если атомы разного типа
        if sp_type ~= round(10*(Sites(y_2,x_2)-fix(Sites(y_2,x_2))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_2,x_2);
            Diff(2) = 2;
            % если одинакового
        else
            if make_pause == 1 % проверим на всякий случай
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_2,x_2)
                pause
            end % и если так и есть, то диффузия в эту позицию невозможна
            Diff(2) = 0;
        end
    end
    
    % 1-я КС:
    % сверху:
    Neighbors_2(1,1) = Sites(y_2+1,x_2); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if x_2-1 < 1
        if y_2-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors_2(1,2) = Sites(y_2,x_2-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors_2(1,2) = Sites(y_2-1,x_2-1+n_site);
        end
    else
        if y_2-1 < 1
            Neighbors_2(1,2) = Sites(y_2,x_2-1);
        else
            Neighbors_2(1,2) = Sites(y_2-1,x_2-1);
        end
    end
    % снизу слева:
    if x_2+1 > n_site
        if y_2-1 < 1
            Neighbors_2(1,3) = Sites(y_2,x_2+1-n_site);
        else
            Neighbors_2(1,3) = Sites(y_2-1,x_2+1-n_site);
        end
    else
        if y_2-1 < 1
            Neighbors_2(1,3) = Sites(y_2,x_2+1);
        else
            Neighbors_2(1,3) = Sites(y_2-1,x_2+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if x_2+1 > n_site
        Neighbors_2(2,1) = Sites(y_2+1,x_2+1-n_site);
    else
        Neighbors_2(2,1) = Sites(y_2+1,x_2+1);
    end
    % сверху справа:
    if x_2-1 < 1
        Neighbors_2(2,2) = Sites(y_2+1,x_2-1+n_site);
    else
        Neighbors_2(2,2) = Sites(y_2+1,x_2-1);
    end
    % снизу:
    if y_2-1 < 1
        Neighbors_2(2,3) = Sites(y_2,x_2);
    else
        Neighbors_2(2,3) = Sites(y_2-1,x_2);
    end
    
    % 3-я КС:
    % слева:
    if x_2+1 > n_site
        Neighbors_2(3,1) = Sites(y_2,x_2+1-n_site);
    elseif Sites(y_2,x_2+1) ~= 0
        Neighbors_2(3,1) = Sites(y_2,x_2+1);
    end
    % сверху через 2 атома:
    Neighbors_2(3,2) = Sites(y_2+2,x_2);
    % справа:
    if x_2-1 < 1
        Neighbors_2(3,3) = Sites(y_2,x_2-1+n_site);
    else
        Neighbors_2(3,3) = Sites(y_2,x_2-1);
    end
    % снизу через 2 атома:
    if y_2-2 < 1
        Neighbors_2(3,4) = Sites(y_2,x_2);
    else
        Neighbors_2(3,4) = Sites(y_2-2,x_2);
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if x_2+2 > n_site % граничное условие
        Neighbors_2(4,1) = Sites(y_2,x_2+2-n_site);
    else
        Neighbors_2(4,1) = Sites(y_2,x_2+2);
    end
    % сверху через 2 атома слева:
    if x_2+1 > n_site
        Neighbors_2(4,2) = Sites(y_2+2,x_2+1-n_site);
    else
        Neighbors_2(4,2) = Sites(y_2+2,x_2+1);
    end
    % сверху через 2 атома справа:
    if x_2-1 < 1
        Neighbors_2(4,3) = Sites(y_2+2,x_2-1+n_site);
    else
        Neighbors_2(4,3) = Sites(y_2+2,x_2-1);
    end
    % справа через 2 атома:
    if x_2-2 < 1
        Neighbors_2(4,4) = Sites(y_2,x_2-2+n_site);
    else
        Neighbors_2(4,4) = Sites(y_2,x_2-2);
    end
    % снизу через 2 атома справа:
    if x_2-1 < 1
        if y_2-2 < 1
            Neighbors_2(4,5) = Sites(y_2,x_2-1+n_site);
        else
            Neighbors_2(4,5) = Sites(y_2-2,x_2-1+n_site);
        end
    else
        if y_2-2 < 1
            Neighbors_2(4,5) = Sites(y_2,x_2-1);
        else
            Neighbors_2(4,5) = Sites(y_2-2,x_2-1);
        end
    end
    % снизу через 2 атома слева:
    if x_2+1 > n_site
        if y_2-2 < 1
            Neighbors_2(4,6) = Sites(y_2,x_2+1-n_site);
        else
            Neighbors_2(4,6) = Sites(y_2-2,x_2+1-n_site);
        end
    else
        if y_2-2 < 1
            Neighbors_2(4,6) = Sites(y_2,x_2+1);
        else
            Neighbors_2(4,6) = Sites(y_2-2,x_2+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if x_2+2 > n_site
        Neighbors_2(5,1) = Sites(y_2+1,x_2+2-n_site);
    else
        Neighbors_2(5,1) = Sites(y_2+1,x_2+2);
    end
    % сверху через 3 атома слева
    if x_2+1 > n_site
        Neighbors_2(5,2) = Sites(y_2+3,x_2+1-n_site);
    else
        Neighbors_2(5,2) = Sites(y_2+3,x_2+1);
    end
    % сверху через 3 атома справа
    if x_2-1 < 1
        Neighbors_2(5,3) = Sites(y_2+3,x_2-1+n_site);
    else
        Neighbors_2(5,3) = Sites(y_2+3,x_2-1);
    end
    % сверху справа через 2 атома
    if x_2-2 < 1
        Neighbors_2(5,4) = Sites(y_2+1,x_2-2+n_site);
    else
        Neighbors_2(5,4) = Sites(y_2+1,x_2-2);
    end
    % снизу справа через 2 атома
    if x_2-2 < 1
        if y_2-1 < 1
            Neighbors_2(5,5) = Sites(y_2,x_2-2+n_site);
        else
            Neighbors_2(5,5) = Sites(y_2-1,x_2-2+n_site);
        end
    else
        if y_2-1 < 1
            Neighbors_2(5,5) = Sites(y_2,x_2-2);
        else
            Neighbors_2(5,5) = Sites(y_2-1,x_2-2);
        end
    end
    % снизу через 3 атома справа
    if x_2-1 < 1
        if y_2-3 < 1
            Neighbors_2(5,6) = Sites(y_2,x_2-1+n_site);
        else
            Neighbors_2(5,6) = Sites(y_2-3,x_2-1+n_site);
        end
    else
        if y_2-3 < 1
            Neighbors_2(5,6) = Sites(y_2,x_2-1);
        else
            Neighbors_2(5,6) = Sites(y_2-3,x_2-1);
        end
    end
    % снизу через 3 атома слева
    if x_2+1 > n_site
        if y_2-3 < 1
            Neighbors_2(5,7) = Sites(y_2,x_2+1-n_site);
        else
            Neighbors_2(5,7) = Sites(y_2-3,x_2+1-n_site);
        end
    else
        if y_2-3 < 1
            Neighbors_2(5,7) = Sites(y_2,x_2+1);
        else
            Neighbors_2(5,7) = Sites(y_2-3,x_2+1);
        end
    end
    % снизу слева через 2 атома
    if x_2+2 > n_site
        if y_2-1 < 1
            Neighbors_2(5,8) = Sites(y_2,x_2+2-n_site);
        else
            Neighbors_2(5,8) = Sites(y_2-1,x_2+2-n_site);
        end
    else
        if y_2-1 < 1
            Neighbors_2(5,8) = Sites(y_2,x_2+2);
        else
            Neighbors_2(5,8) = Sites(y_2-1,x_2+2);
        end
    end
    % сверху через 3 атома
    Neighbors_2(5,9) = Sites(y_2+3,x_2);
    % снизу через 3 атома:
    if y_2-3 < 1
        Neighbors_2(5,10) = Sites(y_2,x_2);
    else
        Neighbors_2(5,10) = Sites(y_2-3,x_2);
    end
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if x_2+2 > n_site
        Neighbors_2(6,1) = Sites(y_2+2,x_2+2-n_site);
    else
        Neighbors_2(6,1) = Sites(y_2+2,x_2+2);
    end
    % сверху через 2 атома справа через 2 атома
    if x_2-2 < 1
        Neighbors_2(6,2) = Sites(y_2+2,x_2-2+n_site);
    else
        Neighbors_2(6,2) = Sites(y_2+2,x_2-2);
    end
    % снизу через 2 атома справа через 2 атома
    if x_2-2 < 1
        if y_2-2 < 1
            Neighbors_2(6,3) = Sites(y_2,x_2-2+n_site);
        else
            Neighbors_2(6,3) = Sites(y_2-2,x_2-2+n_site);
        end
    else
        if y_2-2 < 1
            Neighbors_2(6,3) = Sites(y_2,x_2-2);
        else
            Neighbors_2(6,3) = Sites(y_2-2,x_2-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if x_2+2 > n_site
        if y_2-2 < 1
            Neighbors_2(6,4) = Sites(y_2,x_2+2-n_site);
        else
            Neighbors_2(6,4) = Sites(y_2-2,x_2+2-n_site);
        end
    else
        if y_2-2 < 1
            Neighbors_2(6,4) = Sites(y_2,x_2+2);
        else
            Neighbors_2(6,4) = Sites(y_2-2,x_2+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if x_2+3 > n_site
    %     Neighbors_2(7,1) = Sites(y_2,x_2+3-n_site);
    % else
    %     Neighbors_2(7,1) = Sites(y_2,x_2+3);
    % end
    % сверху через 4 атома
    if y_2+4 > size(Sites,1)
        Neighbors_2(7,2) = 0;
        Diff(2) = 3;
    else
        Neighbors_2(7,2) = Sites(y_2+4,x_2);
    end
    % % справа через 3 атома
    % if x_2-3 < 1
    %     Neighbors_2(7,3) = Sites(y_2,x_2-3+n_site);
    % else
    %     Neighbors_2(7,3) = Sites(y_2,x_2-3);
    % end
    % снизу через 4 атома:
    if y_2-4 < 1
        Neighbors_2(7,4) = Sites(y_2,x_2);
    else
        Neighbors_2(7,4) = Sites(y_2-4,x_2);
    end
    
    % 3 - СПРАВА СВЕРХУ
    
    Neighbors_3 = zeros(7,10);
    
    if Species(i2,5)-1 < 1
        x_3 = Species(i2,5)-1+n_site;
    else
        x_3 = Species(i2,5)-1;
    end
    y_3 = Species(i2,6)+1;
    
    if Sites(y_3,x_3) == 0 % если позиция не занята
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % если атомы разного типа
        if sp_type ~= round(10*(Sites(y_3,x_3)-fix(Sites(y_3,x_3))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_3,x_3);
            Diff(3) = 2;
            % если одинакового
        else
            if make_pause == 1 % проверим на всякий случай
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_3,x_3)
                pause
            end % и если так и есть, то диффузия в эту позицию невозможна
            Diff(3) = 0;
        end
    end
    
    % 1-я КС:
    % сверху:
    Neighbors_3(1,1) = Sites(y_3+1,x_3); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if x_3-1 < 1
        if y_3-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors_3(1,2) = Sites(y_3,x_3-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors_3(1,2) = Sites(y_3-1,x_3-1+n_site);
        end
    else
        if y_3-1 < 1
            Neighbors_3(1,2) = Sites(y_3,x_3-1);
        else
            Neighbors_3(1,2) = Sites(y_3-1,x_3-1);
        end
    end
    % снизу слева:
    if x_3+1 > n_site
        if y_3-1 < 1
            Neighbors_3(1,3) = Sites(y_3,x_3+1-n_site);
        else
            Neighbors_3(1,3) = Sites(y_3-1,x_3+1-n_site);
        end
    else
        if y_3-1 < 1
            Neighbors_3(1,3) = Sites(y_3,x_3+1);
        else
            Neighbors_3(1,3) = Sites(y_3-1,x_3+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if x_3+1 > n_site
        Neighbors_3(2,1) = Sites(y_3+1,x_3+1-n_site);
    else
        Neighbors_3(2,1) = Sites(y_3+1,x_3+1);
    end
    % сверху справа:
    if x_3-1 < 1
        Neighbors_3(2,2) = Sites(y_3+1,x_3-1+n_site);
    else
        Neighbors_3(2,2) = Sites(y_3+1,x_3-1);
    end
    % снизу:
    if y_3-1 < 1
        Neighbors_3(2,3) = Sites(y_3,x_3);
    else
        Neighbors_3(2,3) = Sites(y_3-1,x_3);
    end
    
    % 3-я КС:
    % слева:
    if x_3+1 > n_site
        Neighbors_3(3,1) = Sites(y_3,x_3+1-n_site);
    elseif Sites(y_3,x_3+1) ~= 0
        Neighbors_3(3,1) = Sites(y_3,x_3+1);
    end
    % сверху через 2 атома:
    Neighbors_3(3,2) = Sites(y_3+2,x_3);
    % справа:
    if x_3-1 < 1
        Neighbors_3(3,3) = Sites(y_3,x_3-1+n_site);
    else
        Neighbors_3(3,3) = Sites(y_3,x_3-1);
    end
    % снизу через 2 атома:
    if y_3-2 < 1
        Neighbors_3(3,4) = Sites(y_3,x_3);
    else
        Neighbors_3(3,4) = Sites(y_3-2,x_3);
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if x_3+2 > n_site % граничное условие
        Neighbors_3(4,1) = Sites(y_3,x_3+2-n_site);
    else
        Neighbors_3(4,1) = Sites(y_3,x_3+2);
    end
    % сверху через 2 атома слева:
    if x_3+1 > n_site
        Neighbors_3(4,2) = Sites(y_3+2,x_3+1-n_site);
    else
        Neighbors_3(4,2) = Sites(y_3+2,x_3+1);
    end
    % сверху через 2 атома справа:
    if x_3-1 < 1
        Neighbors_3(4,3) = Sites(y_3+2,x_3-1+n_site);
    else
        Neighbors_3(4,3) = Sites(y_3+2,x_3-1);
    end
    % справа через 2 атома:
    if x_3-2 < 1
        Neighbors_3(4,4) = Sites(y_3,x_3-2+n_site);
    else
        Neighbors_3(4,4) = Sites(y_3,x_3-2);
    end
    % снизу через 2 атома справа:
    if x_3-1 < 1
        if y_3-2 < 1
            Neighbors_3(4,5) = Sites(y_3,x_3-1+n_site);
        else
            Neighbors_3(4,5) = Sites(y_3-2,x_3-1+n_site);
        end
    else
        if y_3-2 < 1
            Neighbors_3(4,5) = Sites(y_3,x_3-1);
        else
            Neighbors_3(4,5) = Sites(y_3-2,x_3-1);
        end
    end
    % снизу через 2 атома слева:
    if x_3+1 > n_site
        if y_3-2 < 1
            Neighbors_3(4,6) = Sites(y_3,x_3+1-n_site);
        else
            Neighbors_3(4,6) = Sites(y_3-2,x_3+1-n_site);
        end
    else
        if y_3-2 < 1
            Neighbors_3(4,6) = Sites(y_3,x_3+1);
        else
            Neighbors_3(4,6) = Sites(y_3-2,x_3+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if x_3+2 > n_site
        Neighbors_3(5,1) = Sites(y_3+1,x_3+2-n_site);
    else
        Neighbors_3(5,1) = Sites(y_3+1,x_3+2);
    end
    % сверху через 3 атома слева
    if x_3+1 > n_site
        Neighbors_3(5,2) = Sites(y_3+3,x_3+1-n_site);
    else
        Neighbors_3(5,2) = Sites(y_3+3,x_3+1);
    end
    % сверху через 3 атома справа
    if x_3-1 < 1
        Neighbors_3(5,3) = Sites(y_3+3,x_3-1+n_site);
    else
        Neighbors_3(5,3) = Sites(y_3+3,x_3-1);
    end
    % сверху справа через 2 атома
    if x_3-2 < 1
        Neighbors_3(5,4) = Sites(y_3+1,x_3-2+n_site);
    else
        Neighbors_3(5,4) = Sites(y_3+1,x_3-2);
    end
    % снизу справа через 2 атома
    if x_3-2 < 1
        if y_3-1 < 1
            Neighbors_3(5,5) = Sites(y_3,x_3-2+n_site);
        else
            Neighbors_3(5,5) = Sites(y_3-1,x_3-2+n_site);
        end
    else
        if y_3-1 < 1
            Neighbors_3(5,5) = Sites(y_3,x_3-2);
        else
            Neighbors_3(5,5) = Sites(y_3-1,x_3-2);
        end
    end
    % снизу через 3 атома справа
    if x_3-1 < 1
        if y_3-3 < 1
            Neighbors_3(5,6) = Sites(y_3,x_3-1+n_site);
        else
            Neighbors_3(5,6) = Sites(y_3-3,x_3-1+n_site);
        end
    else
        if y_3-3 < 1
            Neighbors_3(5,6) = Sites(y_3,x_3-1);
        else
            Neighbors_3(5,6) = Sites(y_3-3,x_3-1);
        end
    end
    % снизу через 3 атома слева
    if x_3+1 > n_site
        if y_3-3 < 1
            Neighbors_3(5,7) = Sites(y_3,x_3+1-n_site);
        else
            Neighbors_3(5,7) = Sites(y_3-3,x_3+1-n_site);
        end
    else
        if y_3-3 < 1
            Neighbors_3(5,7) = Sites(y_3,x_3+1);
        else
            Neighbors_3(5,7) = Sites(y_3-3,x_3+1);
        end
    end
    % снизу слева через 2 атома
    if x_3+2 > n_site
        if y_3-1 < 1
            Neighbors_3(5,8) = Sites(y_3,x_3+2-n_site);
        else
            Neighbors_3(5,8) = Sites(y_3-1,x_3+2-n_site);
        end
    else
        if y_3-1 < 1
            Neighbors_3(5,8) = Sites(y_3,x_3+2);
        else
            Neighbors_3(5,8) = Sites(y_3-1,x_3+2);
        end
    end
    % сверху через 3 атома
    Neighbors_3(5,9) = Sites(y_3+3,x_3);
    % снизу через 3 атома:
    if y_3-3 < 1
        Neighbors_3(5,10) = Sites(y_3,x_3);
    else
        Neighbors_3(5,10) = Sites(y_3-3,x_3);
    end
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if x_3+2 > n_site
        Neighbors_3(6,1) = Sites(y_3+2,x_3+2-n_site);
    else
        Neighbors_3(6,1) = Sites(y_3+2,x_3+2);
    end
    % сверху через 2 атома справа через 2 атома
    if x_3-2 < 1
        Neighbors_3(6,2) = Sites(y_3+2,x_3-2+n_site);
    else
        Neighbors_3(6,2) = Sites(y_3+2,x_3-2);
    end
    % снизу через 2 атома справа через 2 атома
    if x_3-2 < 1
        if y_3-2 < 1
            Neighbors_3(6,3) = Sites(y_3,x_3-2+n_site);
        else
            Neighbors_3(6,3) = Sites(y_3-2,x_3-2+n_site);
        end
    else
        if y_3-2 < 1
            Neighbors_3(6,3) = Sites(y_3,x_3-2);
        else
            Neighbors_3(6,3) = Sites(y_3-2,x_3-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if x_3+2 > n_site
        if y_3-2 < 1
            Neighbors_3(6,4) = Sites(y_3,x_3+2-n_site);
        else
            Neighbors_3(6,4) = Sites(y_3-2,x_3+2-n_site);
        end
    else
        if y_3-2 < 1
            Neighbors_3(6,4) = Sites(y_3,x_3+2);
        else
            Neighbors_3(6,4) = Sites(y_3-2,x_3+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if x_3+3 > n_site
    %     Neighbors_3(7,1) = Sites(y_3,x_3+3-n_site);
    % else
    %     Neighbors_3(7,1) = Sites(y_3,x_3+3);
    % end
    % сверху через 4 атома
    if y_3+4 > size(Sites,1)
        Neighbors_3(7,2) = 0;
        Diff(3) = 3;
    else
        Neighbors_3(7,2) = Sites(y_3+4,x_3);
    end
    % % справа через 3 атома
    % if x_3-3 < 1
    %     Neighbors_3(7,3) = Sites(y_3,x_3-3+n_site);
    % else
    %     Neighbors_3(7,3) = Sites(y_3,x_3-3);
    % end
    % снизу через 4 атома:
    if y_3-4 < 1
        Neighbors_3(7,4) = Sites(y_3,x_3);
    else
        Neighbors_3(7,4) = Sites(y_3-4,x_3);
    end
    
    % 4 - СПРАВА СНИЗУ
    
    Neighbors_4 = zeros(7,10);
    
    if Species(i2,5)-1 < 1
        x_4 = Species(i2,5)-1+n_site;
    else
        x_4 = Species(i2,5)-1;
    end
    if Species(i2,6)-1 < 1
        y_4 = Species(i2,6);
    else
        y_4 = Species(i2,6)-1;
    end
    
    if Sites(y_4,x_4) == 0 % если позиция не занята
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % если атомы разного типа
        if sp_type ~= round(10*(Sites(y_4,x_4)-fix(Sites(y_4,x_4))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_4,x_4);
            Diff(4) = 2;
            % если одинакового
        else
            if make_pause == 1 % проверим на всякий случай
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_4,x_4)
                pause
            end % и если так и есть, то диффузия в эту позицию невозможна
            Diff(4) = 0;
        end
    end
    
    % 1-я КС:
    % сверху:
    Neighbors_4(1,1) = Sites(y_4+1,x_4); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if x_4-1 < 1
        if y_4-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors_4(1,2) = Sites(y_4,x_4-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors_4(1,2) = Sites(y_4-1,x_4-1+n_site);
        end
    else
        if y_4-1 < 1
            Neighbors_4(1,2) = Sites(y_4,x_4-1);
        else
            Neighbors_4(1,2) = Sites(y_4-1,x_4-1);
        end
    end
    % снизу слева:
    if x_4+1 > n_site
        if y_4-1 < 1
            Neighbors_4(1,3) = Sites(y_4,x_4+1-n_site);
        else
            Neighbors_4(1,3) = Sites(y_4-1,x_4+1-n_site);
        end
    else
        if y_4-1 < 1
            Neighbors_4(1,3) = Sites(y_4,x_4+1);
        else
            Neighbors_4(1,3) = Sites(y_4-1,x_4+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if x_4+1 > n_site
        Neighbors_4(2,1) = Sites(y_4+1,x_4+1-n_site);
    else
        Neighbors_4(2,1) = Sites(y_4+1,x_4+1);
    end
    % сверху справа:
    if x_4-1 < 1
        Neighbors_4(2,2) = Sites(y_4+1,x_4-1+n_site);
    else
        Neighbors_4(2,2) = Sites(y_4+1,x_4-1);
    end
    % снизу:
    if y_4-1 < 1
        Neighbors_4(2,3) = Sites(y_4,x_4);
    else
        Neighbors_4(2,3) = Sites(y_4-1,x_4);
    end
    
    % 3-я КС:
    % слева:
    if x_4+1 > n_site
        Neighbors_4(3,1) = Sites(y_4,x_4+1-n_site);
    elseif Sites(y_4,x_4+1) ~= 0
        Neighbors_4(3,1) = Sites(y_4,x_4+1);
    end
    % сверху через 2 атома:
    Neighbors_4(3,2) = Sites(y_4+2,x_4);
    % справа:
    if x_4-1 < 1
        Neighbors_4(3,3) = Sites(y_4,x_4-1+n_site);
    else
        Neighbors_4(3,3) = Sites(y_4,x_4-1);
    end
    % снизу через 2 атома:
    if y_4-2 < 1
        Neighbors_4(3,4) = Sites(y_4,x_4);
    else
        Neighbors_4(3,4) = Sites(y_4-2,x_4);
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if x_4+2 > n_site % граничное условие
        Neighbors_4(4,1) = Sites(y_4,x_4+2-n_site);
    else
        Neighbors_4(4,1) = Sites(y_4,x_4+2);
    end
    % сверху через 2 атома слева:
    if x_4+1 > n_site
        Neighbors_4(4,2) = Sites(y_4+2,x_4+1-n_site);
    else
        Neighbors_4(4,2) = Sites(y_4+2,x_4+1);
    end
    % сверху через 2 атома справа:
    if x_4-1 < 1
        Neighbors_4(4,3) = Sites(y_4+2,x_4-1+n_site);
    else
        Neighbors_4(4,3) = Sites(y_4+2,x_4-1);
    end
    % справа через 2 атома:
    if x_4-2 < 1
        Neighbors_4(4,4) = Sites(y_4,x_4-2+n_site);
    else
        Neighbors_4(4,4) = Sites(y_4,x_4-2);
    end
    % снизу через 2 атома справа:
    if x_4-1 < 1
        if y_4-2 < 1
            Neighbors_4(4,5) = Sites(y_4,x_4-1+n_site);
        else
            Neighbors_4(4,5) = Sites(y_4-2,x_4-1+n_site);
        end
    else
        if y_4-2 < 1
            Neighbors_4(4,5) = Sites(y_4,x_4-1);
        else
            Neighbors_4(4,5) = Sites(y_4-2,x_4-1);
        end
    end
    % снизу через 2 атома слева:
    if x_4+1 > n_site
        if y_4-2 < 1
            Neighbors_4(4,6) = Sites(y_4,x_4+1-n_site);
        else
            Neighbors_4(4,6) = Sites(y_4-2,x_4+1-n_site);
        end
    else
        if y_4-2 < 1
            Neighbors_4(4,6) = Sites(y_4,x_4+1);
        else
            Neighbors_4(4,6) = Sites(y_4-2,x_4+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if x_4+2 > n_site
        Neighbors_4(5,1) = Sites(y_4+1,x_4+2-n_site);
    else
        Neighbors_4(5,1) = Sites(y_4+1,x_4+2);
    end
    % сверху через 3 атома слева
    if x_4+1 > n_site
        Neighbors_4(5,2) = Sites(y_4+3,x_4+1-n_site);
    else
        Neighbors_4(5,2) = Sites(y_4+3,x_4+1);
    end
    % сверху через 3 атома справа
    if x_4-1 < 1
        Neighbors_4(5,3) = Sites(y_4+3,x_4-1+n_site);
    else
        Neighbors_4(5,3) = Sites(y_4+3,x_4-1);
    end
    % сверху справа через 2 атома
    if x_4-2 < 1
        Neighbors_4(5,4) = Sites(y_4+1,x_4-2+n_site);
    else
        Neighbors_4(5,4) = Sites(y_4+1,x_4-2);
    end
    % снизу справа через 2 атома
    if x_4-2 < 1
        if y_4-1 < 1
            Neighbors_4(5,5) = Sites(y_4,x_4-2+n_site);
        else
            Neighbors_4(5,5) = Sites(y_4-1,x_4-2+n_site);
        end
    else
        if y_4-1 < 1
            Neighbors_4(5,5) = Sites(y_4,x_4-2);
        else
            Neighbors_4(5,5) = Sites(y_4-1,x_4-2);
        end
    end
    % снизу через 3 атома справа
    if x_4-1 < 1
        if y_4-3 < 1
            Neighbors_4(5,6) = Sites(y_4,x_4-1+n_site);
        else
            Neighbors_4(5,6) = Sites(y_4-3,x_4-1+n_site);
        end
    else
        if y_4-3 < 1
            Neighbors_4(5,6) = Sites(y_4,x_4-1);
        else
            Neighbors_4(5,6) = Sites(y_4-3,x_4-1);
        end
    end
    % снизу через 3 атома слева
    if x_4+1 > n_site
        if y_4-3 < 1
            Neighbors_4(5,7) = Sites(y_4,x_4+1-n_site);
        else
            Neighbors_4(5,7) = Sites(y_4-3,x_4+1-n_site);
        end
    else
        if y_4-3 < 1
            Neighbors_4(5,7) = Sites(y_4,x_4+1);
        else
            Neighbors_4(5,7) = Sites(y_4-3,x_4+1);
        end
    end
    % снизу слева через 2 атома
    if x_4+2 > n_site
        if y_4-1 < 1
            Neighbors_4(5,8) = Sites(y_4,x_4+2-n_site);
        else
            Neighbors_4(5,8) = Sites(y_4-1,x_4+2-n_site);
        end
    else
        if y_4-1 < 1
            Neighbors_4(5,8) = Sites(y_4,x_4+2);
        else
            Neighbors_4(5,8) = Sites(y_4-1,x_4+2);
        end
    end
    % сверху через 3 атома
    Neighbors_4(5,9) = Sites(y_4+3,x_4);
    % снизу через 3 атома:
    if y_4-3 < 1
        Neighbors_4(5,10) = Sites(y_4,x_4);
    else
        Neighbors_4(5,10) = Sites(y_4-3,x_4);
    end
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if x_4+2 > n_site
        Neighbors_4(6,1) = Sites(y_4+2,x_4+2-n_site);
    else
        Neighbors_4(6,1) = Sites(y_4+2,x_4+2);
    end
    % сверху через 2 атома справа через 2 атома
    if x_4-2 < 1
        Neighbors_4(6,2) = Sites(y_4+2,x_4-2+n_site);
    else
        Neighbors_4(6,2) = Sites(y_4+2,x_4-2);
    end
    % снизу через 2 атома справа через 2 атома
    if x_4-2 < 1
        if y_4-2 < 1
            Neighbors_4(6,3) = Sites(y_4,x_4-2+n_site);
        else
            Neighbors_4(6,3) = Sites(y_4-2,x_4-2+n_site);
        end
    else
        if y_4-2 < 1
            Neighbors_4(6,3) = Sites(y_4,x_4-2);
        else
            Neighbors_4(6,3) = Sites(y_4-2,x_4-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if x_4+2 > n_site
        if y_4-2 < 1
            Neighbors_4(6,4) = Sites(y_4,x_4+2-n_site);
        else
            Neighbors_4(6,4) = Sites(y_4-2,x_4+2-n_site);
        end
    else
        if y_4-2 < 1
            Neighbors_4(6,4) = Sites(y_4,x_4+2);
        else
            Neighbors_4(6,4) = Sites(y_4-2,x_4+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if x_4+3 > n_site
    %     Neighbors_4(7,1) = Sites(y_4,x_4+3-n_site);
    % else
    %     Neighbors_4(7,1) = Sites(y_4,x_4+3);
    % end
    % сверху через 4 атома
    if y_4+4 > size(Sites,1)
        Neighbors_4(7,2) = 0;
        Diff(4) = 3;
    else
        Neighbors_4(7,2) = Sites(y_4+4,x_4);
    end
    % % справа через 3 атома
    % if x_4-3 < 1
    %     Neighbors_4(7,3) = Sites(y_4,x_4-3+n_site);
    % else
    %     Neighbors_4(7,3) = Sites(y_4,x_4-3);
    % end
    % снизу через 4 атома:
    if y_4-4 < 1
        Neighbors_4(7,4) = Sites(y_4,x_4);
    else
        Neighbors_4(7,4) = Sites(y_4-4,x_4);
    end
    
    % 5 - СНИЗУ
    
    Neighbors_5 = zeros(7,10);
    
    x_5 = Species(i2,5);
    if Species(i2,6)-1 < 1
        y_5 = Species(i2,6);
    else
        y_5 = Species(i2,6)-1;
    end
    
    if Sites(y_5,x_5) == 0 % если позиция не занята
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % если атомы разного типа
        if sp_type ~= round(10*(Sites(y_5,x_5)-fix(Sites(y_5,x_5))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_5,x_5);
            Diff(5) = 2;
            % если одинакового
        else
            if make_pause == 1 % проверим на всякий случай
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_5,x_5)
                pause
            end % и если так и есть, то диффузия в эту позицию невозможна
            Diff(5) = 0;
        end
    end
    
    % 1-я КС:
    % сверху:
    Neighbors_5(1,1) = Sites(y_5+1,x_5); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if x_5-1 < 1
        if y_5-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors_5(1,2) = Sites(y_5,x_5-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors_5(1,2) = Sites(y_5-1,x_5-1+n_site);
        end
    else
        if y_5-1 < 1
            Neighbors_5(1,2) = Sites(y_5,x_5-1);
        else
            Neighbors_5(1,2) = Sites(y_5-1,x_5-1);
        end
    end
    % снизу слева:
    if x_5+1 > n_site
        if y_5-1 < 1
            Neighbors_5(1,3) = Sites(y_5,x_5+1-n_site);
        else
            Neighbors_5(1,3) = Sites(y_5-1,x_5+1-n_site);
        end
    else
        if y_5-1 < 1
            Neighbors_5(1,3) = Sites(y_5,x_5+1);
        else
            Neighbors_5(1,3) = Sites(y_5-1,x_5+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if x_5+1 > n_site
        Neighbors_5(2,1) = Sites(y_5+1,x_5+1-n_site);
    else
        Neighbors_5(2,1) = Sites(y_5+1,x_5+1);
    end
    % сверху справа:
    if x_5-1 < 1
        Neighbors_5(2,2) = Sites(y_5+1,x_5-1+n_site);
    else
        Neighbors_5(2,2) = Sites(y_5+1,x_5-1);
    end
    % снизу:
    if y_5-1 < 1
        Neighbors_5(2,3) = Sites(y_5,x_5);
    else
        Neighbors_5(2,3) = Sites(y_5-1,x_5);
    end
    
    % 3-я КС:
    % слева:
    if x_5+1 > n_site
        Neighbors_5(3,1) = Sites(y_5,x_5+1-n_site);
    elseif Sites(y_5,x_5+1) ~= 0
        Neighbors_5(3,1) = Sites(y_5,x_5+1);
    end
    % сверху через 2 атома:
    Neighbors_5(3,2) = Sites(y_5+2,x_5);
    % справа:
    if x_5-1 < 1
        Neighbors_5(3,3) = Sites(y_5,x_5-1+n_site);
    else
        Neighbors_5(3,3) = Sites(y_5,x_5-1);
    end
    % снизу через 2 атома:
    if y_5-2 < 1
        Neighbors_5(3,4) = Sites(y_5,x_5);
    else
        Neighbors_5(3,4) = Sites(y_5-2,x_5);
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if x_5+2 > n_site % граничное условие
        Neighbors_5(4,1) = Sites(y_5,x_5+2-n_site);
    else
        Neighbors_5(4,1) = Sites(y_5,x_5+2);
    end
    % сверху через 2 атома слева:
    if x_5+1 > n_site
        Neighbors_5(4,2) = Sites(y_5+2,x_5+1-n_site);
    else
        Neighbors_5(4,2) = Sites(y_5+2,x_5+1);
    end
    % сверху через 2 атома справа:
    if x_5-1 < 1
        Neighbors_5(4,3) = Sites(y_5+2,x_5-1+n_site);
    else
        Neighbors_5(4,3) = Sites(y_5+2,x_5-1);
    end
    % справа через 2 атома:
    if x_5-2 < 1
        Neighbors_5(4,4) = Sites(y_5,x_5-2+n_site);
    else
        Neighbors_5(4,4) = Sites(y_5,x_5-2);
    end
    % снизу через 2 атома справа:
    if x_5-1 < 1
        if y_5-2 < 1
            Neighbors_5(4,5) = Sites(y_5,x_5-1+n_site);
        else
            Neighbors_5(4,5) = Sites(y_5-2,x_5-1+n_site);
        end
    else
        if y_5-2 < 1
            Neighbors_5(4,5) = Sites(y_5,x_5-1);
        else
            Neighbors_5(4,5) = Sites(y_5-2,x_5-1);
        end
    end
    % снизу через 2 атома слева:
    if x_5+1 > n_site
        if y_5-2 < 1
            Neighbors_5(4,6) = Sites(y_5,x_5+1-n_site);
        else
            Neighbors_5(4,6) = Sites(y_5-2,x_5+1-n_site);
        end
    else
        if y_5-2 < 1
            Neighbors_5(4,6) = Sites(y_5,x_5+1);
        else
            Neighbors_5(4,6) = Sites(y_5-2,x_5+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if x_5+2 > n_site
        Neighbors_5(5,1) = Sites(y_5+1,x_5+2-n_site);
    else
        Neighbors_5(5,1) = Sites(y_5+1,x_5+2);
    end
    % сверху через 3 атома слева
    if x_5+1 > n_site
        Neighbors_5(5,2) = Sites(y_5+3,x_5+1-n_site);
    else
        Neighbors_5(5,2) = Sites(y_5+3,x_5+1);
    end
    % сверху через 3 атома справа
    if x_5-1 < 1
        Neighbors_5(5,3) = Sites(y_5+3,x_5-1+n_site);
    else
        Neighbors_5(5,3) = Sites(y_5+3,x_5-1);
    end
    % сверху справа через 2 атома
    if x_5-2 < 1
        Neighbors_5(5,4) = Sites(y_5+1,x_5-2+n_site);
    else
        Neighbors_5(5,4) = Sites(y_5+1,x_5-2);
    end
    % снизу справа через 2 атома
    if x_5-2 < 1
        if y_5-1 < 1
            Neighbors_5(5,5) = Sites(y_5,x_5-2+n_site);
        else
            Neighbors_5(5,5) = Sites(y_5-1,x_5-2+n_site);
        end
    else
        if y_5-1 < 1
            Neighbors_5(5,5) = Sites(y_5,x_5-2);
        else
            Neighbors_5(5,5) = Sites(y_5-1,x_5-2);
        end
    end
    % снизу через 3 атома справа
    if x_5-1 < 1
        if y_5-3 < 1
            Neighbors_5(5,6) = Sites(y_5,x_5-1+n_site);
        else
            Neighbors_5(5,6) = Sites(y_5-3,x_5-1+n_site);
        end
    else
        if y_5-3 < 1
            Neighbors_5(5,6) = Sites(y_5,x_5-1);
        else
            Neighbors_5(5,6) = Sites(y_5-3,x_5-1);
        end
    end
    % снизу через 3 атома слева
    if x_5+1 > n_site
        if y_5-3 < 1
            Neighbors_5(5,7) = Sites(y_5,x_5+1-n_site);
        else
            Neighbors_5(5,7) = Sites(y_5-3,x_5+1-n_site);
        end
    else
        if y_5-3 < 1
            Neighbors_5(5,7) = Sites(y_5,x_5+1);
        else
            Neighbors_5(5,7) = Sites(y_5-3,x_5+1);
        end
    end
    % снизу слева через 2 атома
    if x_5+2 > n_site
        if y_5-1 < 1
            Neighbors_5(5,8) = Sites(y_5,x_5+2-n_site);
        else
            Neighbors_5(5,8) = Sites(y_5-1,x_5+2-n_site);
        end
    else
        if y_5-1 < 1
            Neighbors_5(5,8) = Sites(y_5,x_5+2);
        else
            Neighbors_5(5,8) = Sites(y_5-1,x_5+2);
        end
    end
    % сверху через 3 атома
    Neighbors_5(5,9) = Sites(y_5+3,x_5);
    % снизу через 3 атома:
    if y_5-3 < 1
        Neighbors_5(5,10) = Sites(y_5,x_5);
    else
        Neighbors_5(5,10) = Sites(y_5-3,x_5);
    end
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if x_5+2 > n_site
        Neighbors_5(6,1) = Sites(y_5+2,x_5+2-n_site);
    else
        Neighbors_5(6,1) = Sites(y_5+2,x_5+2);
    end
    % сверху через 2 атома справа через 2 атома
    if x_5-2 < 1
        Neighbors_5(6,2) = Sites(y_5+2,x_5-2+n_site);
    else
        Neighbors_5(6,2) = Sites(y_5+2,x_5-2);
    end
    % снизу через 2 атома справа через 2 атома
    if x_5-2 < 1
        if y_5-2 < 1
            Neighbors_5(6,3) = Sites(y_5,x_5-2+n_site);
        else
            Neighbors_5(6,3) = Sites(y_5-2,x_5-2+n_site);
        end
    else
        if y_5-2 < 1
            Neighbors_5(6,3) = Sites(y_5,x_5-2);
        else
            Neighbors_5(6,3) = Sites(y_5-2,x_5-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if x_5+2 > n_site
        if y_5-2 < 1
            Neighbors_5(6,4) = Sites(y_5,x_5+2-n_site);
        else
            Neighbors_5(6,4) = Sites(y_5-2,x_5+2-n_site);
        end
    else
        if y_5-2 < 1
            Neighbors_5(6,4) = Sites(y_5,x_5+2);
        else
            Neighbors_5(6,4) = Sites(y_5-2,x_5+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if x_5+3 > n_site
    %     Neighbors_5(7,1) = Sites(y_5,x_5+3-n_site);
    % else
    %     Neighbors_5(7,1) = Sites(y_5,x_5+3);
    % end
    % сверху через 4 атома
    if y_5+4 > size(Sites,1)
        Neighbors_5(7,2) = 0;
        Diff(5) = 3;
    else
        Neighbors_5(7,2) = Sites(y_5+4,x_5);
    end
    % % справа через 3 атома
    % if x_5-3 < 1
    %     Neighbors_5(7,3) = Sites(y_5,x_5-3+n_site);
    % else
    %     Neighbors_5(7,3) = Sites(y_5,x_5-3);
    % end
    % снизу через 4 атома:
    if y_5-4 < 1
        Neighbors_5(7,4) = Sites(y_5,x_5);
    else
        Neighbors_5(7,4) = Sites(y_5-4,x_5);
    end
    
    % 6 - СЛЕВА СНИЗУ
    
    Neighbors_6 = zeros(7,10);
    
    if Species(i2,5)+1 > n_site
        x_6 = Species(i2,5)+1-n_site;
    else
        x_6 = Species(i2,5)+1;
    end
    if Species(i2,6)-1 < 1
        y_6 = Species(i2,6);
    else
        y_6 = Species(i2,6)-1;
    end
    
    if Sites(y_6,x_6) == 0 % если позиция не занята
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % если атомы разного типа
        if sp_type ~= round(10*(Sites(y_6,x_6)-fix(Sites(y_6,x_6))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_6,x_6);
            Diff(6) = 2;
            % если одинакового
        else
            if make_pause == 1 % проверим на всякий случай
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_6,x_6)
                pause
            end % и если так и есть, то диффузия в эту позицию невозможна
            Diff(6) = 0;
        end
    end
    
    % 1-я КС:
    % сверху:
    Neighbors_6(1,1) = Sites(y_6+1,x_6); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if x_6-1 < 1
        if y_6-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors_6(1,2) = Sites(y_6,x_6-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors_6(1,2) = Sites(y_6-1,x_6-1+n_site);
        end
    else
        if y_6-1 < 1
            Neighbors_6(1,2) = Sites(y_6,x_6-1);
        else
            Neighbors_6(1,2) = Sites(y_6-1,x_6-1);
        end
    end
    % снизу слева:
    if x_6+1 > n_site
        if y_6-1 < 1
            Neighbors_6(1,3) = Sites(y_6,x_6+1-n_site);
        else
            Neighbors_6(1,3) = Sites(y_6-1,x_6+1-n_site);
        end
    else
        if y_6-1 < 1
            Neighbors_6(1,3) = Sites(y_6,x_6+1);
        else
            Neighbors_6(1,3) = Sites(y_6-1,x_6+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if x_6+1 > n_site
        Neighbors_6(2,1) = Sites(y_6+1,x_6+1-n_site);
    else
        Neighbors_6(2,1) = Sites(y_6+1,x_6+1);
    end
    % сверху справа:
    if x_6-1 < 1
        Neighbors_6(2,2) = Sites(y_6+1,x_6-1+n_site);
    else
        Neighbors_6(2,2) = Sites(y_6+1,x_6-1);
    end
    % снизу:
    if y_6-1 < 1
        Neighbors_6(2,3) = Sites(y_6,x_6);
    else
        Neighbors_6(2,3) = Sites(y_6-1,x_6);
    end
    
    % 3-я КС:
    % слева:
    if x_6+1 > n_site
        Neighbors_6(3,1) = Sites(y_6,x_6+1-n_site);
    elseif Sites(y_6,x_6+1) ~= 0
        Neighbors_6(3,1) = Sites(y_6,x_6+1);
    end
    % сверху через 2 атома:
    Neighbors_6(3,2) = Sites(y_6+2,x_6);
    % справа:
    if x_6-1 < 1
        Neighbors_6(3,3) = Sites(y_6,x_6-1+n_site);
    else
        Neighbors_6(3,3) = Sites(y_6,x_6-1);
    end
    % снизу через 2 атома:
    if y_6-2 < 1
        Neighbors_6(3,4) = Sites(y_6,x_6);
    else
        Neighbors_6(3,4) = Sites(y_6-2,x_6);
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if x_6+2 > n_site % граничное условие
        Neighbors_6(4,1) = Sites(y_6,x_6+2-n_site);
    else
        Neighbors_6(4,1) = Sites(y_6,x_6+2);
    end
    % сверху через 2 атома слева:
    if x_6+1 > n_site
        Neighbors_6(4,2) = Sites(y_6+2,x_6+1-n_site);
    else
        Neighbors_6(4,2) = Sites(y_6+2,x_6+1);
    end
    % сверху через 2 атома справа:
    if x_6-1 < 1
        Neighbors_6(4,3) = Sites(y_6+2,x_6-1+n_site);
    else
        Neighbors_6(4,3) = Sites(y_6+2,x_6-1);
    end
    % справа через 2 атома:
    if x_6-2 < 1
        Neighbors_6(4,4) = Sites(y_6,x_6-2+n_site);
    else
        Neighbors_6(4,4) = Sites(y_6,x_6-2);
    end
    % снизу через 2 атома справа:
    if x_6-1 < 1
        if y_6-2 < 1
            Neighbors_6(4,5) = Sites(y_6,x_6-1+n_site);
        else
            Neighbors_6(4,5) = Sites(y_6-2,x_6-1+n_site);
        end
    else
        if y_6-2 < 1
            Neighbors_6(4,5) = Sites(y_6,x_6-1);
        else
            Neighbors_6(4,5) = Sites(y_6-2,x_6-1);
        end
    end
    % снизу через 2 атома слева:
    if x_6+1 > n_site
        if y_6-2 < 1
            Neighbors_6(4,6) = Sites(y_6,x_6+1-n_site);
        else
            Neighbors_6(4,6) = Sites(y_6-2,x_6+1-n_site);
        end
    else
        if y_6-2 < 1
            Neighbors_6(4,6) = Sites(y_6,x_6+1);
        else
            Neighbors_6(4,6) = Sites(y_6-2,x_6+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if x_6+2 > n_site
        Neighbors_6(5,1) = Sites(y_6+1,x_6+2-n_site);
    else
        Neighbors_6(5,1) = Sites(y_6+1,x_6+2);
    end
    % сверху через 3 атома слева
    if x_6+1 > n_site
        Neighbors_6(5,2) = Sites(y_6+3,x_6+1-n_site);
    else
        Neighbors_6(5,2) = Sites(y_6+3,x_6+1);
    end
    % сверху через 3 атома справа
    if x_6-1 < 1
        Neighbors_6(5,3) = Sites(y_6+3,x_6-1+n_site);
    else
        Neighbors_6(5,3) = Sites(y_6+3,x_6-1);
    end
    % сверху справа через 2 атома
    if x_6-2 < 1
        Neighbors_6(5,4) = Sites(y_6+1,x_6-2+n_site);
    else
        Neighbors_6(5,4) = Sites(y_6+1,x_6-2);
    end
    % снизу справа через 2 атома
    if x_6-2 < 1
        if y_6-1 < 1
            Neighbors_6(5,5) = Sites(y_6,x_6-2+n_site);
        else
            Neighbors_6(5,5) = Sites(y_6-1,x_6-2+n_site);
        end
    else
        if y_6-1 < 1
            Neighbors_6(5,5) = Sites(y_6,x_6-2);
        else
            Neighbors_6(5,5) = Sites(y_6-1,x_6-2);
        end
    end
    % снизу через 3 атома справа
    if x_6-1 < 1
        if y_6-3 < 1
            Neighbors_6(5,6) = Sites(y_6,x_6-1+n_site);
        else
            Neighbors_6(5,6) = Sites(y_6-3,x_6-1+n_site);
        end
    else
        if y_6-3 < 1
            Neighbors_6(5,6) = Sites(y_6,x_6-1);
        else
            Neighbors_6(5,6) = Sites(y_6-3,x_6-1);
        end
    end
    % снизу через 3 атома слева
    if x_6+1 > n_site
        if y_6-3 < 1
            Neighbors_6(5,7) = Sites(y_6,x_6+1-n_site);
        else
            Neighbors_6(5,7) = Sites(y_6-3,x_6+1-n_site);
        end
    else
        if y_6-3 < 1
            Neighbors_6(5,7) = Sites(y_6,x_6+1);
        else
            Neighbors_6(5,7) = Sites(y_6-3,x_6+1);
        end
    end
    % снизу слева через 2 атома
    if x_6+2 > n_site
        if y_6-1 < 1
            Neighbors_6(5,8) = Sites(y_6,x_6+2-n_site);
        else
            Neighbors_6(5,8) = Sites(y_6-1,x_6+2-n_site);
        end
    else
        if y_6-1 < 1
            Neighbors_6(5,8) = Sites(y_6,x_6+2);
        else
            Neighbors_6(5,8) = Sites(y_6-1,x_6+2);
        end
    end
    % сверху через 3 атома
    Neighbors_6(5,9) = Sites(y_6+3,x_6);
    % снизу через 3 атома:
    if y_6-3 < 1
        Neighbors_6(5,10) = Sites(y_6,x_6);
    else
        Neighbors_6(5,10) = Sites(y_6-3,x_6);
    end
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if x_6+2 > n_site
        Neighbors_6(6,1) = Sites(y_6+2,x_6+2-n_site);
    else
        Neighbors_6(6,1) = Sites(y_6+2,x_6+2);
    end
    % сверху через 2 атома справа через 2 атома
    if x_6-2 < 1
        Neighbors_6(6,2) = Sites(y_6+2,x_6-2+n_site);
    else
        Neighbors_6(6,2) = Sites(y_6+2,x_6-2);
    end
    % снизу через 2 атома справа через 2 атома
    if x_6-2 < 1
        if y_6-2 < 1
            Neighbors_6(6,3) = Sites(y_6,x_6-2+n_site);
        else
            Neighbors_6(6,3) = Sites(y_6-2,x_6-2+n_site);
        end
    else
        if y_6-2 < 1
            Neighbors_6(6,3) = Sites(y_6,x_6-2);
        else
            Neighbors_6(6,3) = Sites(y_6-2,x_6-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if x_6+2 > n_site
        if y_6-2 < 1
            Neighbors_6(6,4) = Sites(y_6,x_6+2-n_site);
        else
            Neighbors_6(6,4) = Sites(y_6-2,x_6+2-n_site);
        end
    else
        if y_6-2 < 1
            Neighbors_6(6,4) = Sites(y_6,x_6+2);
        else
            Neighbors_6(6,4) = Sites(y_6-2,x_6+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if x_6+3 > n_site
    %     Neighbors_6(7,1) = Sites(y_6,x_6+3-n_site);
    % else
    %     Neighbors_6(7,1) = Sites(y_6,x_6+3);
    % end
    % сверху через 4 атома
    if y_6+4 > size(Sites,1)
        Neighbors_6(7,2) = 0;
        Diff(6) = 3;
    else
        Neighbors_6(7,2) = Sites(y_6+4,x_6);
    end
    % % справа через 3 атома
    % if x_6-3 < 1
    %     Neighbors_6(7,3) = Sites(y_6,x_6-3+n_site);
    % else
    %     Neighbors_6(7,3) = Sites(y_6,x_6-3);
    % end
    % снизу через 4 атома:
    if y_6-4 < 1
        Neighbors_6(7,4) = Sites(y_6,x_6);
    else
        Neighbors_6(7,4) = Sites(y_6-4,x_6);
    end
    
    
    Sites(Species(i2,6),Species(i2,5)) = temp_site; % возвращаем исходное значение узла
end