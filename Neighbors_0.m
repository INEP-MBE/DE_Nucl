for fold=1:1
    
    % Соседи формируются следующим образом. Начиная с
    % левого атома проверяется заполненность каждой
    % координационной сферы по часовой стрелке. Создаётся
    % массив соседей, в котором будет до 3 ненулевых
    % элементов в 1-й строке (т.е. 1-я КС), до 3 -- во
    % второй, до 4 -- в третьей, до 6 -- в четвёртой,
    % до 10 -- в пятой, до 4 -- в шестой, до 4 -- в седьмой.
    
    Neighbors = zeros(7,10);
    
    % 1-я КС:
    % сверху:
    Neighbors(1,1) = Sites(Species(i2,6)+1,Species(i2,5)); % нет граничных условий, так как сверху мы всегда делаем запас строк
    % снизу справа:
    if Species(i2,5)-1 < 1
        if Species(i2,6)-1 < 1  % хотя вряд ли мы дойдём до "дна" подложки
            Neighbors(1,2) = Sites(Species(i2,6),Species(i2,5)-1+n_site); % но учесть это стоит: тогда соседом атома снизу будет считаться он сам
        else
            Neighbors(1,2) = Sites(Species(i2,6)-1,Species(i2,5)-1+n_site);
        end
    else
        if Species(i2,6)-1 < 1
            Neighbors(1,2) = Sites(Species(i2,6),Species(i2,5)-1);
        else
            Neighbors(1,2) = Sites(Species(i2,6)-1,Species(i2,5)-1);
        end
    end
    % снизу слева:
    if Species(i2,5)+1 > n_site
        if Species(i2,6)-1 < 1
            Neighbors(1,3) = Sites(Species(i2,6),Species(i2,5)+1-n_site);
        else
            Neighbors(1,3) = Sites(Species(i2,6)-1,Species(i2,5)+1-n_site);
        end
    else
        if Species(i2,6)-1 < 1
            Neighbors(1,3) = Sites(Species(i2,6),Species(i2,5)+1);
        else
            Neighbors(1,3) = Sites(Species(i2,6)-1,Species(i2,5)+1);
        end
    end
    
    % 2-я КС:
    % сверху слева:
    if Species(i2,5)+1 > n_site
        Neighbors(2,1) = Sites(Species(i2,6)+1,Species(i2,5)+1-n_site);
    else
        Neighbors(2,1) = Sites(Species(i2,6)+1,Species(i2,5)+1);
    end
    % сверху справа:
    if Species(i2,5)-1 < 1
        Neighbors(2,2) = Sites(Species(i2,6)+1,Species(i2,5)-1+n_site);
    else
        Neighbors(2,2) = Sites(Species(i2,6)+1,Species(i2,5)-1);
    end
    % снизу:
    if Species(i2,6)-1 < 1
        Neighbors(2,3) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(2,3) = Sites(Species(i2,6)-1,Species(i2,5));
    end
    
    % 3-я КС:
    % слева:
    if Species(i2,5)+1 > n_site
        Neighbors(3,1) = Sites(Species(i2,6),Species(i2,5)+1-n_site);
    elseif Sites(Species(i2,6),Species(i2,5)+1) ~= 0
        Neighbors(3,1) = Sites(Species(i2,6),Species(i2,5)+1);
    end
    % сверху через 2 атома:
    Neighbors(3,2) = Sites(Species(i2,6)+2,Species(i2,5));
    % справа:
    if Species(i2,5)-1 < 1
        Neighbors(3,3) = Sites(Species(i2,6),Species(i2,5)-1+n_site);
    else
        Neighbors(3,3) = Sites(Species(i2,6),Species(i2,5)-1);
    end
    % снизу через 2 атома:
    if Species(i2,6)-2 < 1
        Neighbors(3,4) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(3,4) = Sites(Species(i2,6)-2,Species(i2,5));
    end
    
    % 4-я КС:
    % слева через 2 атома:
    if Species(i2,5)+2 > n_site % граничное условие
        Neighbors(4,1) = Sites(Species(i2,6),Species(i2,5)+2-n_site);
    else
        Neighbors(4,1) = Sites(Species(i2,6),Species(i2,5)+2);
    end
    % сверху через 2 атома слева:
    if Species(i2,5)+1 > n_site
        Neighbors(4,2) = Sites(Species(i2,6)+2,Species(i2,5)+1-n_site);
    else
        Neighbors(4,2) = Sites(Species(i2,6)+2,Species(i2,5)+1);
    end
    % сверху через 2 атома справа:
    if Species(i2,5)-1 < 1
        Neighbors(4,3) = Sites(Species(i2,6)+2,Species(i2,5)-1+n_site);
    else
        Neighbors(4,3) = Sites(Species(i2,6)+2,Species(i2,5)-1);
    end
    % справа через 2 атома:
    if Species(i2,5)-2 < 1
        Neighbors(4,4) = Sites(Species(i2,6),Species(i2,5)-2+n_site);
    else
        Neighbors(4,4) = Sites(Species(i2,6),Species(i2,5)-2);
    end
    % снизу через 2 атома справа:
    if Species(i2,5)-1 < 1
        if Species(i2,6)-2 < 1
            Neighbors(4,5) = Sites(Species(i2,6),Species(i2,5)-1+n_site);
        else
            Neighbors(4,5) = Sites(Species(i2,6)-2,Species(i2,5)-1+n_site);
        end
    else
        if Species(i2,6)-2 < 1
            Neighbors(4,5) = Sites(Species(i2,6),Species(i2,5)-1);
        else
            Neighbors(4,5) = Sites(Species(i2,6)-2,Species(i2,5)-1);
        end
    end
    % снизу через 2 атома слева:
    if Species(i2,5)+1 > n_site
        if Species(i2,6)-2 < 1
            Neighbors(4,6) = Sites(Species(i2,6),Species(i2,5)+1-n_site);
        else
            Neighbors(4,6) = Sites(Species(i2,6)-2,Species(i2,5)+1-n_site);
        end
    else
        if Species(i2,6)-2 < 1
            Neighbors(4,6) = Sites(Species(i2,6),Species(i2,5)+1);
        else
            Neighbors(4,6) = Sites(Species(i2,6)-2,Species(i2,5)+1);
        end
    end
    
    % 5-я КС
    % сверху слева через 2 атома
    if Species(i2,5)+2 > n_site
        Neighbors(5,1) = Sites(Species(i2,6)+1,Species(i2,5)+2-n_site);
    else
        Neighbors(5,1) = Sites(Species(i2,6)+1,Species(i2,5)+2);
    end
    % сверху через 3 атома слева
    if Species(i2,5)+1 > n_site
        Neighbors(5,2) = Sites(Species(i2,6)+3,Species(i2,5)+1-n_site);
    else
        Neighbors(5,2) = Sites(Species(i2,6)+3,Species(i2,5)+1);
    end
    % сверху через 3 атома справа
    if Species(i2,5)-1 < 1
        Neighbors(5,3) = Sites(Species(i2,6)+3,Species(i2,5)-1+n_site);
    else
        Neighbors(5,3) = Sites(Species(i2,6)+3,Species(i2,5)-1);
    end
    % сверху справа через 2 атома
    if Species(i2,5)-2 < 1
        Neighbors(5,4) = Sites(Species(i2,6)+1,Species(i2,5)-2+n_site);
    else
        Neighbors(5,4) = Sites(Species(i2,6)+1,Species(i2,5)-2);
    end
    % снизу справа через 2 атома
    if Species(i2,5)-2 < 1
        if Species(i2,6)-1 < 1
            Neighbors(5,5) = Sites(Species(i2,6),Species(i2,5)-2+n_site);
        else
            Neighbors(5,5) = Sites(Species(i2,6)-1,Species(i2,5)-2+n_site);
        end
    else
        if Species(i2,6)-1 < 1
            Neighbors(5,5) = Sites(Species(i2,6),Species(i2,5)-2);
        else
            Neighbors(5,5) = Sites(Species(i2,6)-1,Species(i2,5)-2);
        end
    end
    % снизу через 3 атома справа
    if Species(i2,5)-1 < 1
        if Species(i2,6)-3 < 1
            Neighbors(5,6) = Sites(Species(i2,6),Species(i2,5)-1+n_site);
        else
            Neighbors(5,6) = Sites(Species(i2,6)-3,Species(i2,5)-1+n_site);
        end
    else
        if Species(i2,6)-3 < 1
            Neighbors(5,6) = Sites(Species(i2,6),Species(i2,5)-1);
        else
            Neighbors(5,6) = Sites(Species(i2,6)-3,Species(i2,5)-1);
        end
    end
    % снизу через 3 атома слева
    if Species(i2,5)+1 > n_site
        if Species(i2,6)-3 < 1
            Neighbors(5,7) = Sites(Species(i2,6),Species(i2,5)+1-n_site);
        else
            Neighbors(5,7) = Sites(Species(i2,6)-3,Species(i2,5)+1-n_site);
        end
    else
        if Species(i2,6)-3 < 1
            Neighbors(5,7) = Sites(Species(i2,6),Species(i2,5)+1);
        else
            Neighbors(5,7) = Sites(Species(i2,6)-3,Species(i2,5)+1);
        end
    end
    % снизу слева через 2 атома
    if Species(i2,5)+2 > n_site
        if Species(i2,6)-1 < 1
            Neighbors(5,8) = Sites(Species(i2,6),Species(i2,5)+2-n_site);
        else
            Neighbors(5,8) = Sites(Species(i2,6)-1,Species(i2,5)+2-n_site);
        end
    else
        if Species(i2,6)-1 < 1
            Neighbors(5,8) = Sites(Species(i2,6),Species(i2,5)+2);
        else
            Neighbors(5,8) = Sites(Species(i2,6)-1,Species(i2,5)+2);
        end
    end
    % сверху через 3 атома
    Neighbors(5,9) = Sites(Species(i2,6)+3,Species(i2,5));
    % снизу через 3 атома:
    if Species(i2,6)-3 < 1
        Neighbors(5,10) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(5,10) = Sites(Species(i2,6)-3,Species(i2,5));
    end
    
    
    % 6-я КС
    % сверху через 2 атома слева через 2 атома
    if Species(i2,5)+2 > n_site
        Neighbors(6,1) = Sites(Species(i2,6)+2,Species(i2,5)+2-n_site);
    else
        Neighbors(6,1) = Sites(Species(i2,6)+2,Species(i2,5)+2);
    end
    % сверху через 2 атома справа через 2 атома
    if Species(i2,5)-2 < 1
        Neighbors(6,2) = Sites(Species(i2,6)+2,Species(i2,5)-2+n_site);
    else
        Neighbors(6,2) = Sites(Species(i2,6)+2,Species(i2,5)-2);
    end
    % снизу через 2 атома справа через 2 атома
    if Species(i2,5)-2 < 1
        if Species(i2,6)-2 < 1
            Neighbors(6,3) = Sites(Species(i2,6),Species(i2,5)-2+n_site);
        else
            Neighbors(6,3) = Sites(Species(i2,6)-2,Species(i2,5)-2+n_site);
        end
    else
        if Species(i2,6)-2 < 1
            Neighbors(6,3) = Sites(Species(i2,6),Species(i2,5)-2);
        else
            Neighbors(6,3) = Sites(Species(i2,6)-2,Species(i2,5)-2);
        end
    end
    % снизу через 2 атома слева через 2 атома
    if Species(i2,5)+2 > n_site
        if Species(i2,6)-2 < 1
            Neighbors(6,4) = Sites(Species(i2,6),Species(i2,5)+2-n_site);
        else
            Neighbors(6,4) = Sites(Species(i2,6)-2,Species(i2,5)+2-n_site);
        end
    else
        if Species(i2,6)-2 < 1
            Neighbors(6,4) = Sites(Species(i2,6),Species(i2,5)+2);
        else
            Neighbors(6,4) = Sites(Species(i2,6)-2,Species(i2,5)+2);
        end
    end
    
    % 7-я КС
    % % слева через 3 атома
    % if Species(i2,5)+3 > n_site
    %     Neighbors(7,1) = Sites(Species(i2,6),Species(i2,5)+3-n_site);
    % else
    %     Neighbors(7,1) = Sites(Species(i2,6),Species(i2,5)+3);
    % end
    % сверху через 4 атома
    Neighbors(7,2) = Sites(Species(i2,6)+4,Species(i2,5));
    % % справа через 3 атома
    % if Species(i2,5)-3 < 1
    %     Neighbors(7,3) = Sites(Species(i2,6),Species(i2,5)-3+n_site);
    % else
    %     Neighbors(7,3) = Sites(Species(i2,6),Species(i2,5)-3);
    % end
    % снизу через 4 атома:
    if Species(i2,6)-4 < 1
        Neighbors(7,4) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(7,4) = Sites(Species(i2,6)-4,Species(i2,5));
    end
    
end