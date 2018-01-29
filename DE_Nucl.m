tic

clear all
close all
clc

sim_num = 801

pause

% ИСХОДНЫЕ ДАННЫЕ
for fold=1:1
    
    % Переменные с частями имён файлов
    % Для обозначения расширений файлов
    ext_mat = '.mat';
    ext_xls = '.xls';
    ext_fig = '.fig';
    ext_jpg = '.jpg';
    ext_tif = '.tif';
    ext_png = '.png';
    % Для обозначения характеристик
    Crys_n = 'Crys';
    Ga_gr_n = 'Ga_gr';
    As_gr_n = 'As_gr';
    In_gr_n = 'In_gr';
    Al_gr_n = 'Al_gr';
    % Для обозначения величин и единиц измерения
    u_n = '_'; % u - underscore
    cr_n = 'x'; % cr - cross
    th_n = 'ML'; % th - theta
    T_n = '_T';
    v_n = '_v';
    r_n = '_ratio'; % r - ratio
    t_n = 's'; % t - time
    % Для обозначения примечаний
    crit_n = '_crit'; % crit - critical regions
    
    % Параметры отображения:
    make_pause = 0; % 0 - без пауз, 1 - проверяем, действительно ли типы частиц одинаковы, 2 - отображаем параметры диффузии для каждой из позиций
    visual = 1; % 0 - выводится только итоговая конфигурация, 1 - конфигурация выводится на каждом шаге, 2 - на каждом шаге с сохранением конфигураций в заданные моменты времени
    xlsout = 0; % 0 - xls-файлы не выводятся, 1 - xls-файлы выводятся
    figout = 0; % 0 - fig-файлы не выводятся, 1 - fig-файлы выводятся
    energy_plot = 0; % график с энергиями: 0 - не выводится, 1 - выводится
    des_plot = 0; % график с десорбцией: 0 - не выводится, 1 - выводится, 2 - выводится для каждого шага
    
    % Параметры моделирования:
    n_trial = 1; % число реализаций метода Монте-Карло
    completed = 0; % процент выполнения программы
    
    % Коэффициенты:
    kE1 = -0.00; % поправка к энергии активации
    kE2 = -0.00; % --=--
    kE3 = -0.00; % --=--
    khop = 10^-3; % 10^-3 % коэффициент, устраняющий лишние скачки
    kv = 10^0; % коэффициент, увеличивающий скорость роста, для ускорения вычислительного эксперимента
    k_enh = 1; % коэффициент усиления диффузии по направлению к островку
    
    % Константы:
    k_B = 1.38e-23; % постоянная Больцмана, Дж*К(-1)
    nu = 1e13; % частота Дебая, частота колебаний атомов решётки, с^(-1)
    nu2 = 1e13; % частота колебаний атома в свободном пространстве, с^(-1)
    
    % Параметры решётки:
    l0 = 0.56534e-9; % период решётки GaAs, м
    a = l0*sqrt(2)/2; % расстояние между атомами подложки по горизонтали, м
    sigma = l0^2/2; % площадь, занимаемая одним атомом решётки, м^2
    at_per_lat = 0.25; % 0.375 % число атомов (индия), приходящихся на единицу решётки модели
%     Vm = 15.7*10^-6; % молярный объём In, м^3/моль
    
    % Параметры термодинамической теории нуклеации:
%     gamma_d_s = 0.8*10^-23; % удельная свободная поверхностная энергия на границе капля-подложка, Дж/м^2
%     gamma_d_v = 0.8*10^-23 * 1.5; % удельная свободная поверхностная энергия на границе капля-пар, Дж/м^2
%     gamma_s_v = 0.8*10^-23; % удельная свободная поверхностная энергия на границе подложка-пар, Дж/м^2
    gam_vl = 570 * 10^-3; % Н/м = Дж/м^2 [ссылка [47] супер-обзора]
    Tc = 846; % критическая температура, К | 2200 для GaAs
    phi = 70 * pi/180; % контактный угол, задающий форму локальной области пересыщения ( = краевой угол смачивания (контактный угол), в радианах)
    
    % Параметры ростовой площадки:
    m_site = 201; % высота подложки (20 нм, т.е. 20 нм / 0.1413325 нм = 142 элемента матрицы)
    n_site = 500; % длина ростовой площадки (1 мкм = 10000 нм / 0.1999 нм = 5000 элементов матрицы) = удвоенное число атомов, занимающих 1 монослой
    % n_site=1280 ~ 256 нм: есть РЭМ-изображение с такой длиной площадки: 2 капли In при 150 градусах
    % 1970 ~ 394 нм: 2-3 капли
    % 5100 ~ 1,02 мкм: 5 капель
    sub = 1; % тип подложки: 1 - GaAs, 2 - InAs
    des = 0; % наличие десорбции
    hop = 0; % наличие скачков туда-сюда
    
    % Технологические параметры:
    T = 350 + 273.15; % температура подложки, К
    T_ann = 150 + 273.15; % температура подложки при отжиге, К
    h_dep = 5; % толщина осаждения, МС
    v_gr = 0.5 * kv; % скорость роста, МС/с
    t_ann = 0; % время отжига, с
    t_gr = h_dep/v_gr + t_ann; % общее время роста, с
    
    % Выводим технологические параметры
    T_degC = T - 273.15
    v_ML_s = v_gr
    time_s = t_gr;
    thickness_ML = h_dep
    number_at = h_dep*(n_site/2)
    pause
    
    % Номинальные расстояния и энергии
    Lennard_Jones
    
    tau_dif = 0; % пока понадобилось здесь
    
    % Вероятности осуществления событий в единицу времени, с^(-1)    
    % p_Ga_dep = v_gr*(n_site/2);
    p_In_dep = v_gr*(n_site/2);
    n_In = 0;
    frac_In = 0;
    n_In_des = 0;
    
    % Периоды осуществления каждого события, с    
    % tau0_Ga_dep = 1/p_Ga_dep;
    tau0_In_dep = 1/p_In_dep;
    
end

% РОСТ
format bank
for i1=1:n_trial
    
    close all
    clc
    
    % Векторы для построения графиков
    for  fold=1:1
        
        Cnt = 0; % вектор главного счётчика cnt
        
        % Энергии активации диффузии в каждое направление (для построения графика)
        cnt_en = 0;
        Cnt_en = 0;
        En_dif_gr_1 = 0;
        En_dif_gr_2 = 0;
        En_dif_gr_3 = 0;
        En_dif_gr_4 = 0;
        En_dif_gr_5 = 0;
        En_dif_gr_6 = 0;
        
        % Вектор доли десорбированных атомов
        Cnt_des = 0;
        Fr_In_des = 0;
        
        % Вектор степеней пересыщения
        
        
        % Вектор центров критических областей
        X_At_cr = []; % массив пар координата X -- критическое число атомов в островке
        
    end
    
    % Подложка (начальная конфигурация системы):
    for fold=1:1
        if round(h_dep*sqrt(n_site/pi)/2)+10 > 70
            disp('Может быть, стоит растянуть ростовую площадку')
            pause
        end
        Sites = zeros(m_site+200,n_site);
        Sites_cr = Sites; % параллельная площадка для обозначения критических областей
        Sites_sat = Sites_cr;
        switch sub
            case 1 % подложка GaAs
                for i3=1:m_site
                    for j3=1:round(n_site/2)
                        if rem(i3,4)==1 % Ga в 1-м, 5-м и т.д. ряду
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.1;
                        elseif rem(i3,4)==2 % As во 2-м, 6-м и т.д. ряду
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.2;
                        elseif rem(i3,4)==3 % Ga в 3-м, 7-м и т.д. ряду
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.1;
                        elseif rem(i3,4)==0 % As в 4-м, 8-м и т.д. ряду
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.2;
                        else
                            error('Другого остатка быть не должно')
                        end
                    end
                end
            case 2 % подложка InAs
                for i3=1:m_site
                    for j3=1:round(n_site/2)
                        if rem(i3,4)==1 % In в 1-м, 5-м и т.д. ряду
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.3;
                        elseif rem(i3,4)==2 % As во 2-м, 6-м и т.д. ряду
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.2;
                        elseif rem(i3,4)==3 % In в 3-м, 7-м и т.д. ряду
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.3;
                        elseif rem(i3,4)==0 % As в 4-м, 8-м и т.д. ряду
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.2;
                        else
                            error('Другого остатка быть не должно')
                        end
                    end
                end
        end
    end
    
    % Модификация поверхности:
    for fold=1:1
        r_hole = 250; % 50 % 100 % расстояние между центрами углублений в единицах n_site
        d_hole = 50; % 40 % диаметр углубления в единицах n_site
        dep_hole = 40; % 10 % глубина углубления в единицах m_site
        n_hole = floor(n_site/r_hole); % количество углублений
        X_hole = []; % массив координат X краёв углублений
        for i24=1:n_hole
            X_hole(i24) = round(r_hole/2-d_hole/2+(i24-1)*r_hole);
        end
        sh_hole = 22; % код формы углубления: 0 - горизонтальный срез под (001), 1 - вертикальный срез под (110), 2 - косой срез под (111), 3 - округлый срез. Например, 202 -- трапециедальный срез
        switch sh_hole
            case 101
                for i27=1:n_hole
                    for i25=1:dep_hole
                        for i26=1:d_hole
                            Sites(m_site+1-i25,X_hole(i27)-1+i26) = 0;
                        end
                    end
                end
            case 22 % угол примерно 55+55 градусов, т.е. около 110, но точное значение получить проблематично
                for i27=1:n_hole
                    for i26=1:round(d_hole/2) % первый срез
                        for i28=1:i26
                            Sites(m_site+1-(2*i28-1),X_hole(i27)-1+i26+1) = 0;
                            Sites(m_site+1-(2*i28),X_hole(i27)-1+i26+1) = 0;
                            dep2 = i28; % последняя i28 будет давать максимальную глубину
                        end
                    end
                end
                dep1_hole = 2*dep2; % но эту глубину надо умножить на 2
                for i27=1:n_hole
                    for i26=1:round(d_hole/2) % второй срез
                        for i28=1:(dep1_hole-2*i26)
                            Sites(m_site+1-(i28-1),X_hole(i27)-1+i26+1+round(d_hole/2)) = 0;
                            Sites(m_site+1-(i28),X_hole(i27)-1+i26+1+round(d_hole/2)) = 0;
                        end
                    end
                end
        end
        for i37=1:n_site
            for i38=1:size(Sites,1)
                if Sites(i38,i37) == 0 && Sites(i38+1,i37) == 0 && Sites(i38+2,i37) == 0
                    m_site_Mod(i37) = i38-1;
                    break
                end
            end
        end
    end
    
    % Временная шкала:
    for fold=1:1
        % Столбцы отражают соответственно:
        % уникальный номер частицы - событие - время ожидания (конкретный этап) - время оседлости (общее время) - координата X - координата Y
        Species = [0 0 0 0 0 0];
        % Буфер координат: время оседлости (для синхронной сортировки) - координата X - координата Y
        Buff_XY = [0 0 0];
        % Время оседлости
        t_cur = 0; % время, которое зафиксируется во временной шкале после совершения выбранного события. Для каждого потенциального события t_cur разное. Но необязательно совершится то, у которого t_cur меньше.
        t_cur_t = 0; % момент времени, в который осуществилось событие. Относительно этого времени отсчитывается время ожидания следующего события. Поэтому оно всегда меньше t_cur
    end
    
    % Начальный график:
    for fold=1:1
        if visual == 1
            X_GaAsInAl = zeros((size(Sites,1)*size(Sites,2)),1);
            X_cr = zeros((size(Sites,1)*size(Sites,2)),1);
            Y_Ga = zeros((size(Sites,1)*size(Sites,2)),1);
            Y_As = zeros((size(Sites,1)*size(Sites,2)),1);
            Y_In = zeros((size(Sites,1)*size(Sites,2)),1);
            Y_Al = zeros((size(Sites,1)*size(Sites,2)),1);
            Y_ncr = zeros((size(Sites_cr,1)*size(Sites_cr,2)),1);
            Y_cr = zeros((size(Sites_cr,1)*size(Sites_cr,2)),1);
            for i11=1:size(Sites,1)
                for j11=1:size(Sites,2)
                    if Sites(i11,j11) ~= 0
                        sp_type = round(10*(Sites(i11,j11)-fix(Sites(i11,j11))))/10; % сокращение для обозначения типа рассматриваемой частицы: 0.1 -- галлий, 0.2 -- мышьяк, 0.3 -- индий, 0.4 -- алюминий.
                        if sp_type > 0.09 && sp_type < 0.11
                            sp_type = 0.1;
                        elseif sp_type > 0.19 && sp_type < 0.21
                            sp_type = 0.2;
                        elseif sp_type > 0.29 && sp_type < 0.31
                            sp_type = 0.3;
                        elseif sp_type > 0.39 && sp_type < 0.41
                            sp_type = 0.4;
                        else
                            error('Другие типы частиц не задавались')
                        end
                        X_GaAsInAl((i11-1)*size(Sites,2)+j11)=j11;
                        switch sp_type
                            case 0.1
                                Y_Ga((i11-1)*size(Sites,2)+j11)=i11;
                            case 0.2
                                Y_As((i11-1)*size(Sites,2)+j11)=i11;
                            case 0.3
                                Y_In((i11-1)*size(Sites,2)+j11)=i11;
                            case 0.4
                                Y_Al((i11-1)*size(Sites,2)+j11)=i11;
                        end
                    end
                    if Sites_sat(i11,j11) ~= 0
                        X_cr((i11-1)*size(Sites,2)+j11)=j11;
                        Y_ncr((i11-1)*size(Sites,2)+j11)=i11;
                    end
                    if Sites_cr(i11,j11) ~= 0
                        X_cr((i11-1)*size(Sites,2)+j11)=j11;
                        Y_cr((i11-1)*size(Sites,2)+j11)=i11;
                    end
                end
            end
            % Отображаем ростовую площадку
            config1 = figure('Units', 'normalized', 'OuterPosition', [0.5 0 0.5 1]); % отображение на правую половину экрана
            hL1 = plot(X_GaAsInAl, Y_Ga, '.k', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Ga'); % точки, чёрные
            hold on
            hL2 = plot(X_GaAsInAl, Y_As, 'ok', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_As'); % пустые кружки, чёрные
            hold on
            hL3 = plot(X_GaAsInAl, Y_In, '.r', 'MarkerSize',20, 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_In'); % точки, красные
            hold on
            hL4 = plot(X_GaAsInAl, Y_Al, '.g', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Al'); % точки, зелёные
            hold on
            hL5 = plot(X_cr, Y_ncr, '^c', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_ncr'); % галочки вверх, голубые
            hold on
            hL6 = plot(X_cr, Y_cr, '^b', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_cr'); % галочки вниз, фиолетовые
            axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
            set(gca,'DataAspectRatio',[1 sqrt(2) 1])
            drawnow
            % График с энергиями в каждое направление
            if energy_plot == 1
                config_en = figure('Units', 'normalized', 'OuterPosition', [0 0.5 1 0.5]); % отображение на верхнюю половину экрана
                hL_en1 = plot(Cnt_en, En_dif_gr_1, '-k', 'XDataSource', 'Cnt_en', 'YDataSource', 'En_dif_gr_1');
                hold on
                hL_en2 = plot(Cnt_en, En_dif_gr_2, '-r', 'XDataSource', 'Cnt_en', 'YDataSource', 'En_dif_gr_2');
                hold on
                hL_en3 = plot(Cnt_en, En_dif_gr_3, '-g', 'XDataSource', 'Cnt_en', 'YDataSource', 'En_dif_gr_3');
                hold on
                hL_en4 = plot(Cnt_en, En_dif_gr_4, '-c', 'XDataSource', 'Cnt_en', 'YDataSource', 'En_dif_gr_4');
                hold on
                hL_en5 = plot(Cnt_en, En_dif_gr_5, '-b', 'XDataSource', 'Cnt_en', 'YDataSource', 'En_dif_gr_5');
                hold on
                hL_en6 = plot(Cnt_en, En_dif_gr_6, '-y', 'XDataSource', 'Cnt_en', 'YDataSource', 'En_dif_gr_6');
                axis([0 50 0 3]) % диапазоны координат
                drawnow
            end
            % График с долей десорбированных атомов
            if des_plot == 1 || des_plot == 2
                config_des = figure('Units', 'normalized', 'OuterPosition', [0 0 0.5 0.5]); % отображение на нижнюю левую четверть экрана
                if des_plot == 1
                    hL_des = plot(Cnt_des, Fr_In_des, '-k', 'XDataSource', 'Cnt_des', 'YDataSource', 'Fr_In_des');
                elseif des_plot == 2
                    hL_des = plot(Cnt, Fr_In_des, '-k', 'XDataSource', 'Cnt', 'YDataSource', 'Fr_In_des');
                end
                ylim([0 1])
                drawnow
            end
        end
    end
    
    % События:
    cnt = 0; % счётчик
    y = 0;
    while t_cur_t <= t_gr
        
        cnt = cnt+1;
        Cnt = [Cnt, cnt];
        if des_plot == 2
            if n_In > 0
                Fr_In_des = [Fr_In_des, n_In_des/n_In];
            else
                Fr_In_des = [Fr_In_des, 0];
            end
        end
        
        % Вывод промежуточных результатов:
        for fold=1:1
            clc
            format long
            completed = t_cur_t/(t_gr-t_ann)*100
%             t_cur_t
%             n_In
%             frac_In
%             n_In_des
            fr_In_des = n_In_des/n_In
%             diam_cr
%             h_cr
        end
        
        % Отжиг:
        for fold=1:1
            if t_cur_t > t_gr - t_ann
                p_In_dep = 0;
                T = T_ann;
                completed_annealing = (t_cur_t-(t_gr-t_ann))/t_ann*100
                disp('Отжиг')
            end
        end
        
        % Выбор события:
        % 1 - осаждение, 2 - диффузия, 3 - обмен, 4 - десорбция, 5 - реадсорбция
        for i2=1:size(Species,1) % для всех частиц, имеющихся в массиве            
            
            % x = Species(i2,5);
            % y = Species(i2,6);
            x = fix(Species(i2,1)/10^4);
            y = fix(Species(i2,1))-x*10^4;
            
            if Species(i2,2) == 0 && Species(i2,3) == 0 % только для частиц, для которых ещё не выбрано событие
                
                if Species(i2,:) == zeros(1,size(Species,2)) % если вся строка нулевая, то выбирается осаждение
                    
                    % осаждение
                    for fold=1:1
                        
                        if p_In_dep ~= 0 % и если в то же время открыта заслонка
                            
                            Species(i2,2) = 1; % для данной частицы выбирается событие "осаждение"
                            tau_In_dep = -tau0_In_dep*log(rand); % рассчитывается время ожидания осаждения In
                            Species(i2,3) = tau_In_dep;  % массив заполняется временем ожидания
                            t_cur = t_cur_t + tau_In_dep; % время оседлости увеличивается
                            Species(i2,4) = t_cur;
                            Buff_XY(i2,1) = t_cur;
                            
                        else % если осаждение уже невозможно в связи с началом отжига
                            
                            Species(i2,2) = 1; % пусть будет осаждением, но спустя время роста (вместе с отжигом) -- главное, чтобы нулевая строка из временной шкалы исчезла
                            Species(i2,3) = t_gr+3; % неважно, +3 или +0.1 или +709 -- главное, чтобы за пределами временной шкалы, иначе строка останется нулевой, первой и будет выполняться нулевое событие
                            Species(i2,4) = t_gr+3;
                            Buff_XY(i2,1) = t_gr+3;
                            
                        end
                        
                    end
                    
                else % если же в строке есть хоть один ненулевой элемент, значит частица уже была осаждена, т.е. для неё выбирается другое событие
                    
                    % тип частицы
                    for fold=1:1
                        
                        sp_type = round(10*(Species(i2,1)-fix(Species(i2,1))))/10; % сокращение для обозначения типа рассматриваемой частицы: 0.1 -- галлий, 0.2 -- мышьяк, 0.3 -- индий, 0.4 -- алюминий.
                        
                        % Подстраховка на случай, если числа будут плохо
                        % округляться
                        if sp_type > 0.09 && sp_type < 0.11
                            sp_type = 0.1;
                        elseif sp_type > 0.19 && sp_type < 0.21
                            sp_type = 0.2;
                        elseif sp_type > 0.29 && sp_type < 0.31
                            sp_type = 0.3;
                        elseif sp_type > 0.39 && sp_type < 0.41
                            sp_type = 0.4;
                        else error('Другие типы частиц не задавались')
                        end
                        
                    end
                    
                    % Critical_Size
                    for fold=1:1
                        
                        % Параметры локальной области пересыщения (ЛОП)
                        R_sat = d_hole/2; % радиус ЛОП
                        S_sat_cr = 0.5*R_sat^2*(2*phi-sin(2*phi)); % площадь ЛОП, т.е. число атомов в ЛОП
                        sat_int = ceil(R_sat); % интервал, через который прогоняются ЛОП
                        
                        % Равновесная степень заполнения
%                         % из Дубровского:
%                         theta_eq = exp(-2*Tc/T);  % равновесная степень заполнения
%                         at_in_sat_eq = theta_eq*S_sat_cr*at_per_lat; % равновесная концентрация адатомов в ЛОП
                        % из [Surface line tension], с элементами [Dynamics of crystal steps]:
                        theta0_eq = exp(-2*Tc/T); % равновесная степень заполнения (взяли по Дубровскому)
                        E = 0; % 2*k_B*Tc % 0.1931 % вообще должна быть, но непонятно, каким боком её сюда пихать
                        % Из условия theta_eq=n_eq*sigma=1 для T=250 (что соответствует покрытию поверхности 1 монослоем In), которая в [Observation] являлась критической толщиной формирования капель
                        n0_eq250 = exp(-2*Tc/250)*S_sat_cr;
                        theta_eq250 = 2*R_sat*sin(phi) / S_sat_cr; % длина хорды сегмента / площадь сегмента, т.е. 1 МС металла на подложке в пределах ЛОП
                        n_eq250 = theta_eq250*S_sat_cr;
                        mu = E + k_B*T*log(n_eq250/n0_eq250);
                        % Решается система уравнений, основывающихся на наших экспериментах:
                        % theta_eq300 = 1 % при T=300 критическая толщина составляет 1 МС и считается равной равновесной
                        % theta_eq230 = 1.75 % при T=230 -- 1.75 МС
%                         mu = 0.3087*10^-19;
                        n0_eq = theta0_eq * S_sat_cr;
                        n_eq = n0_eq * exp(-E/(k_B*T)) * exp(mu/(k_B*T)); % равновесная концентрация адатомов в ЛОП
                        theta_eq = n_eq / S_sat_cr; % раньше мы делили на число узлов, доступных на поверхности GaAs, а сейчас -- на число узлов в ЛОП
                        at_in_sat_eq = n_eq;
                        
                        cnt_sat = 0;
                        for i33=ceil(R_sat)+1:sat_int:n_site-ceil(R_sat)-1
                            cnt_sat = cnt_sat+1;
                            
                            % смещение центра круга по оси X
                            x_bias = i33;
                            % смещение центра круга по оси Y
                            % (для модифицированных поверхностей)
                            for i44 = m_site_Mod(i33)-ceil(R_sat*sqrt(2)) : m_site_Mod(i33)+ceil(R_sat*sqrt(2))
                                S_sat = 0; % площадь участка ЛОП за пределами подложки
                                for i45=ceil(i33-R_sat):ceil(i33+R_sat)
                                    for i46=ceil(i44-R_sat*sqrt(2)):ceil(i44+R_sat*sqrt(2))
                                        x_cr = i45-i33;
                                        y_cr = i46-i44;
                                        if x_cr^2/R_sat^2 + y_cr^2/(R_sat*sqrt(2))^2 <= 1 && i46 > m_site_Mod(i45)
                                            S_sat = S_sat+1;
                                        end
                                    end
                                end
                                if S_sat >= S_sat_cr
                                    break
                                end
                            end
                            y_bias = i44;
                            
                            % подсчёт числа атомов в локальной области пересыщения
                            at_in_sat = 0;
                            for i40=ceil(x_bias-R_sat):ceil(x_bias+R_sat)
                                for i41=ceil(y_bias-R_sat*sqrt(2)):ceil(y_bias+R_sat*sqrt(2))
                                    if Sites_cr(i41,i40) ~= 1 % считаем только в области за пределами критической области
                                        x_cr = i40-x_bias;
                                        y_cr = i41-y_bias;
                                        if x_cr^2/R_sat^2 + y_cr^2/(R_sat*sqrt(2))^2 <= 1
                                            if round(10*(Sites(i41,i40)-fix(Sites(i41,i40))))/10 > 0.29 && round(10*(Sites(i41,i40)-fix(Sites(i41,i40))))/10 < 0.31
                                                at_in_sat = at_in_sat+1;
                                            end
                                        end
                                    end
                                end
                            end
                            
                            % расчёт степени пересыщения и удельной объёмной энергии
                            zeta = at_in_sat/at_in_sat_eq;
                            Vm = rmin_In_In^3; % объём, приходящийся на атом In, м^3
                            g_V = k_B*T*log(zeta)/Vm;
                            
                            % расчёт критического размера
                            R_cr = 2*gam_vl/g_V / (a/2); % критический радиус закругления островка, в единицах латеральных межатомных расстояний, т.е. по 0.2 нм
                            R_cr = 0.8*R_sat;
                            r_cr = R_cr*sin(phi); % критический радиус основания островка
                            diam_cr = 2*r_cr; % критический диаметр основания островка
                            h_cr = R_cr*(1-cos(phi))*sqrt(2); % высота критического островка (умножается на sqrt(2) потому, что в единицах количества узлов квадратной решётки высота будет больше, так как вертикальное межатомное расстояние 0.14, а не 0.2, т.е. при том же радиусе будет захвачено больше узлов)
                            S_cr = 0.5*R_cr^2*(2*phi-sin(2*phi)); % площадь среза критического островка
                            i_cr = S_cr*at_per_lat; % число атомов в критическом островке
                            
                            % создание околокритической и критической области
                            if at_in_sat >= i_cr && i_cr > 0
                                X_At_cr = [X_At_cr; i33 at_in_sat];
                                for i40=ceil(x_bias-R_sat):ceil(x_bias+R_sat)
                                    for i41=ceil(y_bias-R_sat*sqrt(2)):ceil(y_bias+R_sat*sqrt(2))
                                        x_cr = i40-x_bias;
                                        y_cr = i41-y_bias;
                                        if x_cr^2/R_sat^2 + y_cr^2/(R_sat*sqrt(2))^2 <= 1
                                            Sites_sat(i41,i40) = 1;
                                        end
                                        if x_cr^2/R_cr^2 + y_cr^2/(R_cr*sqrt(2))^2 <= 1
                                            Sites_cr(i41,i40) = 1;
                                        end
                                    end
                                end
                            end
                        end
                        
                    end
                    
                    % Соседи и энергии
                    for fold=1:1
                        
                        Neighbors_0
                                                
                        % Энергия связи атома со своим текущим окружением
                        Energy_Position_0
                                                
                        % Соседи относительно новой позиции
                        Neighbors_New
                                                
                        % Вектор энергий диффузии в каждую из позиций
                        En_dif = zeros(1,6);
                        Prob_dif = zeros(1,6);
                        Tau_dif = zeros(1,6);
                        
                        % Энергия активации диффузии атома в соответствующую позицию
                        Energy_Position_1
                        Energy_Position_2
                        Energy_Position_3
                        Energy_Position_4
                        Energy_Position_5
                        Energy_Position_6
                        
                    end
                    
                    
                    % Десорбция
                    for fold=1:1
                        
                        if des == 0 % тогда диффузия в верхние узлы запрещена
                            Prob_dif(1) = 0;
                            Prob_dif(2) = 0;
                            Prob_dif(3) = 0;
                        elseif des == 0.5
                            rnd_des = rand;
                            if rnd_des <= 0.5 % десорбция
                                Species(i2,2) = 3;
                                Species(i2,3) = 0; % время ожидания минимальное
                                t_cur = t_cur_t + tau_dif;
                                Species(i2,4) = t_cur;
                                Buff_XY(i2,1) = t_cur;
                            end % иначе атом не десорбируется и продолжит диффундировать
                        elseif des == 1 % раньше можно было и не вводить этот elseif, но сейчас нужен доп. барьер для десорбции
                            if Species(i2,5) < n_site && Species(i2,5) > 1 % пока просто отбросим ГУ
                                if Sites(Species(i2,6)-1,Species(i2,5)-1) == 0 &&...
                                        Sites(Species(i2,6)-1,Species(i2,5)) == 0 &&...
                                        Sites(Species(i2,6)-1,Species(i2,5)+1) == 0 &&...
                                        Sites(Species(i2,6)+1,Species(i2,5)-1) == 0 &&...
                                        Sites(Species(i2,6)+1,Species(i2,5)) == 0 &&...
                                        Sites(Species(i2,6)+1,Species(i2,5)+1) == 0 % пока просто: если свободна вся 1-я КС
%                                 if size(nonzeros(Neighbors),1) < 1 % если нет ни одного соседа во всех КС
                                    Prob_dif(1) = nu*exp(-(E_dif_1+E_des)/(k_B*T));
                                    Prob_dif(2) = nu*exp(-(E_dif_2+E_des)/(k_B*T));
                                    Prob_dif(3) = nu*exp(-(E_dif_3+E_des)/(k_B*T));
                                    % Если частица уже оторвалась достаточно далеко от подложки, она
                                    % десорбируется:
                                    detach = 1; % оторвался ли атом от подложки? 1 - да, 2 - нет
                                    for i36=1:7
                                        if Sites(Species(i2,6)-i36,Species(i2,5)) ~= 0 % если под атомом есть хоть один ненулевой элемент,
                                            detach = 2;
                                            break % пусть остаётся
                                        end
                                    end
                                    if detach == 1 % иначе десорбируется
                                        Species(i2,2) = 3;
                                        Species(i2,3) = 0; % время ожидания минимальное
                                        t_cur = t_cur_t + tau_dif;
                                        Species(i2,4) = t_cur;
                                        Buff_XY(i2,1) = t_cur;
                                    end
                                end
                            end
                        end
                        des = 0;
                        
                    end
                    
                    % Усиление диффузии в направлении зародыша
                    for fold=1:1
                        if size(X_At_cr,1) > 0 % если сформировался хотя бы один критический островок
                            At_isl_dist = []; % вектор расстояний между рассматриваемым атомом и центрами островков
                            for i47=1:size(X_At_cr,1)
                                At_isl_dist = [At_isl_dist; abs(Species(i2,5)-X_At_cr(i47,1))];
                            end
                            for i48=1:size(At_isl_dist,1)
                                if At_isl_dist(i48) == min(At_isl_dist) % когда попадаем на минимальную разницу, значит островок ближайший -- записываем координату его центра
                                    dir_to_isl = X_At_cr(i48,1); % координата X центра островка, к которому будет стремиться атом
                                end
                            end
                            if size(nonzeros(Sites_cr(:,Species(i2,5))),1) == 0 % если координата X не на уровне критического островка
%                                 diff_enh = exp(n_site/(min(At_isl_dist)+1)); % коэффициент усиления диффузии: условно, чем ближе к островку, тем сильнее адатом к нему притягивается (+1 нужно для случая, когда расстояние нулевое)
                                diff_enh = n_site/(min(At_isl_dist)+1) * k_enh;
                            else
%                                 diff_enh = n_site/(min(At_isl_dist)+1); % в рамках критического островка притяжение не должно быть слишком сильным, чтобы не формировался стержень в центре
%                                 diff_enh = log(n_site/(min(At_isl_dist)+1));
                                diff_enh = 1;
                            end
                            if Species(i2,5) >= dir_to_isl % если атом справа от островка
                                Prob_dif(3) = diff_enh * Prob_dif(3);
                                Prob_dif(4) = diff_enh * Prob_dif(4);
                            else % если атом слева от островка
                                Prob_dif(1) = diff_enh * Prob_dif(1);
                                Prob_dif(6) = diff_enh * Prob_dif(6);
                            end
                        end
                    end
                    
                    % Диффузия в занятые узлы
                    for i17=1:size(Diff,2)
                        if Diff(i17) == 0 % если диффузия в этот узел невозможна
                            Prob_dif(i17) = 0;
                            % elseif Diff(i17) == 1 % если узел свободен и возможен скачок в него
                            %
                        elseif Diff(i17) == 2 % если узел занят атомом другого типа и возможен обмен
                            Prob_dif(i17) = 0; % пока так
                            % Но позже надо обращаться к тому атому, с
                            % которым может произойти обмен, и определить
                            % его энергию разрыва и ослабления со своим
                            % окружением. Далее просуммировать эти энергии
                            % -- это и будет энергия активации обмена.
                            %                         else
                            %                             error('Другие типы диффузии не задавались')
                        elseif Diff(i17) == 3 % если атом дошёл до границы ростовой площадки
                            Species(i2,2) = 3;
                            Species(i2,3) = 0; % время ожидания минимальное
                            t_cur = t_cur_t + tau_dif;
                            Species(i2,4) = t_cur;
                            Buff_XY(i2,1) = t_cur;
                        end
                    end
                    
                    % Запрет на выход из критической области
                    for fold=1:1
                        if Sites_cr(Species(i2,6),Species(i2,5)) ~= 0
                            if Sites_cr(y_1,x_1) == 0
                                Prob_dif(1) = 0;
                            end
                            if Sites_cr(y_2,x_2) == 0
                                Prob_dif(2) = 0;
                            end
                            if Sites_cr(y_3,x_3) == 0
                                Prob_dif(3) = 0;
                            end
                            if Sites_cr(y_4,x_4) == 0
                                Prob_dif(4) = 0;
                            end
                            if Sites_cr(y_5,x_5) == 0
                                Prob_dif(5) = 0;
                            end
                            if Sites_cr(y_6,x_6) == 0
                                Prob_dif(6) = 0;
                            end
                        end
                    end
                    
                    % Вывод энергий активации для диффузии в каждое направление
                    En_dif_gr_1 = [En_dif_gr_1, En_dif(1)/(1.6*10^-19)];
                    En_dif_gr_2 = [En_dif_gr_2, En_dif(2)/(1.6*10^-19)];
                    En_dif_gr_3 = [En_dif_gr_3, En_dif(3)/(1.6*10^-19)];
                    En_dif_gr_4 = [En_dif_gr_4, En_dif(4)/(1.6*10^-19)];
                    En_dif_gr_5 = [En_dif_gr_5, En_dif(5)/(1.6*10^-19)];
                    En_dif_gr_6 = [En_dif_gr_6, En_dif(6)/(1.6*10^-19)];
                    cnt_en = cnt_en+1;
                    Cnt_en = [Cnt_en, cnt_en];
                    
                    % Расчёт времени ожидания
                    for fold=1:1
                        
                        if Species(i2,2) ~= 3 % если ранее уже не была определена десорбция
                            
                            direct = 0;
                            ev = rand * sum(Prob_dif);
                            if ev < Prob_dif(1)
                                direct = 1;
                                Buff_XY(i2,2) = x_1;
                                Buff_XY(i2,3) = y_1;
                            elseif ev >= Prob_dif(1) && ev < Prob_dif(1)+Prob_dif(2)
                                direct = 2;
                                Buff_XY(i2,2) = x_2;
                                Buff_XY(i2,3) = y_2;
                            elseif ev >= Prob_dif(1)+Prob_dif(2) && ev < Prob_dif(1)+Prob_dif(2)+Prob_dif(3)
                                direct = 3;
                                Buff_XY(i2,2) = x_3;
                                Buff_XY(i2,3) = y_3;
                            elseif ev >= Prob_dif(1)+Prob_dif(2)+Prob_dif(3) && ev < Prob_dif(1)+Prob_dif(2)+Prob_dif(3)+Prob_dif(4)
                                direct = 4;
                                Buff_XY(i2,2) = x_4;
                                Buff_XY(i2,3) = y_4;
                            elseif ev >= Prob_dif(1)+Prob_dif(2)+Prob_dif(3)+Prob_dif(4) && ev < Prob_dif(1)+Prob_dif(2)+Prob_dif(3)+Prob_dif(4)+Prob_dif(5)
                                direct = 5;
                                Buff_XY(i2,2) = x_5;
                                Buff_XY(i2,3) = y_5;
                            elseif ev >= Prob_dif(1)+Prob_dif(2)+Prob_dif(3)+Prob_dif(4)+Prob_dif(5) && ev <= sum(Prob_dif)
                                direct = 6;
                                Buff_XY(i2,2) = x_6;
                                Buff_XY(i2,3) = y_6;
                            else
                                disp('Откуда мог взяться этот вариант? По идее, все были перечислены в elseif')
                                pause
                            end
                            
                            % Prob_dif_nz = nonzeros(Prob_dif); % оставляем в векторе только ненулевые элементы
                            % Prob_dif_nz = Prob_dif_nz'; % транспонируем из столбца в строку
                            % tau_dif_eff = 1/mean(Prob_dif_nz); % эффективное время ожидания диффузии
                            
                            % Время ожидания события становится ненулевым только
                            % для одного направления
                            for i18=1:size(Tau_dif,2)
                                if i18 == direct
                                    % Tau_dif(i18) = -tau_dif_eff * log(rand);
                                    Tau_dif(i18) = -1/Prob_dif(i18)*log(rand);
                                end
                            end
                            
                            tau_dif = nonzeros(Tau_dif);
                            if size(tau_dif,1)>1 || size(tau_dif,2)>1
                                error('Время ожидания должно быть ненулевым только для одного направления')
                            end
                        
                            % Обновление временной шкалы
                            for fold=1:1
                                Species(i2,2) = 2;
                                Species(i2,3) = tau_dif; % время ожидания
                                t_cur = t_cur_t + tau_dif;
                                Species(i2,4) = t_cur;
                                Buff_XY(i2,1) = t_cur;
                            end
                            
%                         else
%                             
%                             disp('Будет ошибка?')
%                             pause
                            
                        end
                        
                        % Промежуточный вывод конфигурации
                        for fold=1:1
                            if make_pause == 2
                                Neighbors(:,:,1)
                                Neighbors_eV = Neighbors(:,:,2)./(1.6*10^-19);
                                Neighbors_eV
                                Neighbors_1_eV = Neighbors_1(:,:,2)./(1.6*10^-19);
                                Neighbors_1_eV
                                Neighbors_2_eV = Neighbors_2(:,:,2)./(1.6*10^-19);
                                Neighbors_2_eV
                                Neighbors_3_eV = Neighbors_3(:,:,2)./(1.6*10^-19);
                                Neighbors_3_eV
                                Neighbors_4_eV = Neighbors_4(:,:,2)./(1.6*10^-19);
                                Neighbors_4_eV
                                Neighbors_5_eV = Neighbors_5(:,:,2)./(1.6*10^-19);
                                Neighbors_5_eV
                                Neighbors_6_eV = Neighbors_6(:,:,2)./(1.6*10^-19);
                                Neighbors_6_eV
                                En_dif_eV = En_dif / (1.6*10^-19);
                                En_dif_eV
                                Prob_dif
                                Tau_dif
                                pause
                            end
                        end
                        
                        % Запрет на скачки туда-сюда
                        for fold=1:1
                            if hop == 1
                                Species(i2,3) = khop;
                                t_cur = t_cur_t + khop;
                                Species(i2,4) = t_cur;
                                Buff_XY(i2,1) = t_cur;
                            end
                            hop = 0;
                        end
                        
                    end
                    
                end
                
            end
            
        end
        
        % Сортировка временной шкалы:
        Species = sortrows(Species,4);
        Buff_XY = sortrows(Buff_XY,1);
        
        % Действие:
        for fold=1:1
            
            t_cur_t = Species(1,4); % точка отсчёта времён ожидания
            
            switch Species(1,2) % выполняем ближайшее событие, т.е. то, которое теперь стоит в верхней строке
                
                case 1 % осаждение
                    
                    for fold=1:1
                        
                        x_add = floor(n_site*rand(1)+1);
                        
%                         rand_hole = rand(1);
%                         rand_in_h = 0.5^(-2)*(rand(1)-0.5)^(3)+0.5;
%                         if rand_hole > 0 && rand_hole <= 0.38
%                             x_add = floor(X_hole(1)-3+(d_hole+3)*rand_in_h+1);
%                         elseif rand_hole > 0.38 && rand_hole <= 0.76
%                             x_add = floor(X_hole(2)-3+(d_hole+3)*rand_in_h+1);
%                         elseif rand_hole > 0.76 && rand_hole <= 0.93
%                             x_add = floor(X_hole(1)+2.2*d_hole+(0.6*d_hole)*rand_in_h+1);
%                         elseif rand_hole > 0.93 && rand_hole <= 1
%                             x_add = floor(n_site*rand(1)+1);
%                         end
                        
                        % с учётом граничных условий, что x_add должна быть в пределах [1,n_site-1]
                        if x_add-1 < 1
                            x_add = x_add-1+n_site-1;
                        end
                        if x_add+1 > n_site
                            x_add = x_add+1-n_site+1;
                        end
                        for i4=1:size(Sites,1)
                            if Sites(i4,x_add) == 0 && Sites(i4,x_add+1) == 0 && Sites(i4,x_add-1) == 0 && Sites(i4+1,x_add) == 0 && Sites(i4+1,x_add+1) == 0 && Sites(i4+1,x_add-1) == 0 % если свободна группа из 6 узлов, значит это не промежуток в подложке или капле, а приповерхностный слой
                                y_add = i4+1; % координата Y занимает верхнее положение на подложке в столбце, определённом координатой X (можно поставить i4+1)
                                break
                            end
                        end
                        Species(1,1) = x_add*10^4 + y_add + 0.3; % выбранный узел = XXXXYYYY.T, где XXXX -- координата X, YYYY -- координата Y вместе с нулями, T - тип частицы: 1 -- Ga, 2 -- As, 3 - In, 4 - Al
                        Species(1,5) = x_add;
                        Species(1,6) = y_add;
                        
                        Sites(Species(1,6),Species(1,5)) = Species(1,5)*10^4 + Species(1,6) + 0.3; % выбранный узел = XXXXYYYY, где XXXX -- координата X, YYYY -- координата Y вместе с нулями
                        Sites(Species(1,6)+1,Species(1,5)) = 0; % по идее, в таком случае сверху должна появиться одна и
                        Sites(Species(1,6)+2,Species(1,5)) = 0; % вторая нулевые строки. Если они там уже были, то ничего страшного: модель у нас solid-on-solid, т.е. атомы выстраиваются как кирпичики, т.е. над осаждённой частицей других частиц быть не могло и ничего лишнего не занулится
                        Sites(Species(1,6)+3,Species(1,5)) = 0; % Ну, и третья -- для того чтобы при заскакивании атома на соседа тоже успешно осуществлялась проверка соседей из 2-й КС сверху.
                        Species(1,2) = 0;
                        Species(1,3) = 0;
                        Species(1,4) = 0;
                        Buff_XY(1,1) = 0;
                        Species = [Species; 0 0 0 0 0 0]; % добавляется нулевая строка, для которой на ближайшем этапе выбора событий определится время ожидания осаждения
                        Buff_XY = [Buff_XY; 0 0 0]; % массивы Species и Buff_XY должны быть соразмерны по числу строк
                        
                        n_In = n_In + 1;
                        frac_In = n_In/number_at;
                        
                    end
                    
                case 2 % диффузия
                    
                    for fold=1:1
                        
                        Species_t = Species;
                        
                        if Sites(Buff_XY(1,3),Buff_XY(1,2)) == 0 % была проблема: узлы для диффузии уже определились, но за это время в свободный на тот момент узел попал атом. Пока нет обмена, можно просто определить, свободен ли узел в данный момент
                            Sites(Species(1,6),Species(1,5)) = 0;
                            Sites(Buff_XY(1,3),Buff_XY(1,2)) = Buff_XY(1,2)*10^4 + Buff_XY(1,3) + 0.3;
                            Species(1,1) = Sites(Buff_XY(1,3),Buff_XY(1,2));
                            Species(1,5) = Buff_XY(1,2);
                            Species(1,6) = Buff_XY(1,3);
                            Species(1,2) = 0;
                            Species(1,3) = 0;
                            Species(1,4) = 0;
                            Buff_XY(1,1) = 0;
%                             Species(1,2) = 0;
%                             Species(1,3) = 0;
%                             Species(1,4) = 0;
                        else
                            Species(1,2) = 0;
                            Species(1,3) = 0;
                            Species(1,4) = 0;
                        end
                        
%                         % Не потерялись ли атомы?
%                         n_In_after = 0;
%                         for i19=m_site+1:size(Sites,1)
%                             for j19=1:n_site
%                                 if Sites(i19,j19) ~= 0
%                                     n_In_after = n_In_after+1;
%                                 end
%                             end
%                         end
%                         if n_In ~= n_In_after + n_In_des
%                             n_In
%                             n_In_after
%                             n_In_des
%                             disp('Какой-то атом потерялся')
%                         end
                        
                    end
                    
                case 3 % десорбция
                    
                    for fold=1:1
                        
                        Sites(Species(1,6),Species(1,5)) = 0;
                        Species(1,:)=[];
                        Buff_XY(1,:)=[];
                        
                        n_In_des = n_In_des+1;
                        Cnt_des = [Cnt_des, n_In_des];
                        if des_plot == 1
                            Fr_In_des = [Fr_In_des, n_In_des/n_In];
                        end
                        
                    end
                    
                case 5 % реадсорбция
                    
                    for fold=1:1
                        
                        error('Реадсорбция -- частный случай диффузии, поэтому задавать её отдельно нет смысла')
                        
                        x_add = floor(n_site*rand(1)+1); % случайный выбор координаты x
                        y_add = floor(m_site*rand(1)+1); % случайный выбор координаты y
                        Sites(y_add,x_add) = Species(1,1); % выбранный узел = ID частицы
                        Species(1,5) = x_add; % у частицы снова появляется ненулевая координата X
                        Species(1,6) = y_add; % у частицы снова появляется ненулевая координата Y
                        
                    end
            end
        end
        
        % Промежуточный график:
        for fold=1:1
            
            if visual == 1 || visual == 2
                
                X_GaAsInAl = zeros((size(Sites,1)*size(Sites,2)),1);
                X_cr = zeros((size(Sites,1)*size(Sites,2)),1);
                Y_Ga = zeros((size(Sites,1)*size(Sites,2)),1);
                Y_As = zeros((size(Sites,1)*size(Sites,2)),1);
                Y_In = zeros((size(Sites,1)*size(Sites,2)),1);
                Y_Al = zeros((size(Sites,1)*size(Sites,2)),1);
                Y_ncr = zeros((size(Sites_cr,1)*size(Sites_cr,2)),1);
                Y_cr = zeros((size(Sites_cr,1)*size(Sites_cr,2)),1);
                for i11=1:size(Sites,1)
                    for j11=1:size(Sites,2)
                        if Sites(i11,j11) ~= 0
                            sp_type = round(10*(Sites(i11,j11)-fix(Sites(i11,j11))))/10; % сокращение для обозначения типа рассматриваемой частицы: 0.1 -- галлий, 0.2 -- мышьяк, 0.3 -- индий, 0.4 -- алюминий.
                            if sp_type > 0.09 && sp_type < 0.11
                                sp_type = 0.1;
                            elseif sp_type > 0.19 && sp_type < 0.21
                                sp_type = 0.2;
                            elseif sp_type > 0.29 && sp_type < 0.31
                                sp_type = 0.3;
                            elseif sp_type > 0.39 && sp_type < 0.41
                                sp_type = 0.4;
                            else
                                error('Другие типы частиц не задавались')
                            end
                            X_GaAsInAl((i11-1)*size(Sites,2)+j11)=j11;
                            switch sp_type
                                case 0.1
                                    Y_Ga((i11-1)*size(Sites,2)+j11)=i11;
                                case 0.2
                                    Y_As((i11-1)*size(Sites,2)+j11)=i11;
                                case 0.3
                                    Y_In((i11-1)*size(Sites,2)+j11)=i11;
                                case 0.4
                                    Y_Al((i11-1)*size(Sites,2)+j11)=i11;
                            end
                        end
                        if Sites_sat(i11,j11) ~= 0
                            X_cr((i11-1)*size(Sites,2)+j11)=j11;
                            Y_ncr((i11-1)*size(Sites,2)+j11)=i11;
                        end
                        if Sites_cr(i11,j11) ~= 0
                            X_cr((i11-1)*size(Sites,2)+j11)=j11;
                            Y_cr((i11-1)*size(Sites,2)+j11)=i11;
                        end
                    end
                end
                %refreshdata(hL, 'caller')
                refreshdata(hL1)
                hold on
                refreshdata(hL2)
                hold on
                refreshdata(hL3)
                hold on
                refreshdata(hL4)
                hold on
                refreshdata(hL5)
                hold on
                refreshdata(hL6)
                drawnow
                if energy_plot == 1
                    refreshdata(hL_en1)
                    hold on
                    refreshdata(hL_en2)
                    hold on
                    refreshdata(hL_en3)
                    hold on
                    refreshdata(hL_en4)
                    hold on
                    refreshdata(hL_en5)
                    hold on
                    refreshdata(hL_en6)
                    if cnt_en > 50
                        axis([cnt_en-50 cnt_en 0 3])
                    end
                    drawnow
                end
                if des_plot == 1
                    refreshdata(hL_des)
                    drawnow
                end
                
            end
            
            if visual == 2
                
                % Графики в заданный момент времени:
                
                % ОДНА ТРЕТЬ
                if round(100000*t_cur_t/t_gr) == 33333 % когда прошла треть времени роста
                    config_int2 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % отображение на весь экран
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % точки, чёрные; точки, красные
                    axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
                    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
                    if figout > 0
                        Morph_int_fig_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_fig];
                        saveas(config_int2, Morph_int_fig_name)
                    end
                    Morph_int_png_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_png];
                    saveas(config_int2, Morph_int_png_name)
                    In_gr_int_name = [num2str(sim_num) u_n In_gr_n u_n num2str(round(100*t_cur_t)/100) t_n ext_xls];
                    if xlsout > 0 && n_site < 500
                        xlswrite(In_gr_int_name,Y_In)
                    end
                    close(config_int2)
                elseif round(10000*t_cur_t/t_gr) == 3333
                    config_int2 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % отображение на весь экран
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % точки, чёрные; точки, красные
                    axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
                    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
                    if figout > 0
                        Morph_int_fig_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_fig];
                        saveas(config_int2, Morph_int_fig_name)
                    end
                    Morph_int_png_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_png];
                    saveas(config_int2, Morph_int_png_name)
                    In_gr_int_name = [num2str(sim_num) u_n In_gr_n u_n num2str(round(100*t_cur_t)/100) t_n ext_xls];
                    if xlsout > 0 && n_site < 500
                        xlswrite(In_gr_int_name,Y_In)
                    end
                    close(config_int2)
                end
                
                % ДВЕ ТРЕТИ
                if round(100000*t_cur_t/t_gr) == 66667
                    config_int3 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % отображение на весь экран
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % точки, чёрные; точки, красные
                    axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
                    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
                    if figout > 0
                        Morph_int_fig_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_fig];
                        saveas(config_int3, Morph_int_fig_name)
                    end
                    Morph_int_png_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_png];
                    saveas(config_int3, Morph_int_png_name)
                    In_gr_int_name = [num2str(sim_num) u_n In_gr_n u_n num2str(round(100*t_cur_t)/100) t_n ext_xls];
                    if xlsout > 0 && n_site < 500
                        xlswrite(In_gr_int_name,Y_In)
                    end
                    close(config_int3)
                elseif round(10000*t_cur_t/t_gr) == 6667
                    config_int3 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % отображение на весь экран
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % точки, чёрные; точки, красные
                    axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
                    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
                    if figout > 0
                        Morph_int_fig_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_fig];
                        saveas(config_int3, Morph_int_fig_name)
                    end
                    Morph_int_png_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(round(100*h_dep/(t_gr/t_cur_t))/100) th_n T_n num2str(T-273.15) v_n num2str(v_gr) u_n num2str(round(100*t_cur_t)/100) t_n ext_png];
                    saveas(config_int3, Morph_int_png_name)
                    In_gr_int_name = [num2str(sim_num) u_n In_gr_n u_n num2str(round(100*t_cur_t)/100) t_n ext_xls];
                    if xlsout > 0 && n_site < 500
                        xlswrite(In_gr_int_name,Y_In)
                    end
                    close(config_int3)
                end
                
            end
            
        end
        
        % Проверка на наличие скачков туда-сюда:
        for fold=1:1
            if rem(cnt,5) == 1 % 1-я, 6-я, 11-я и т.д. итерация
                Site1 = Species(1,1);
            elseif rem(cnt,5) == 3 % 3-я, 8-я, 13-я и т.д. итерация
                Site3 = Species(1,1);
            elseif rem(cnt,5) == 0 % 5-я, 10-я, 15-я и т.д. итерация
                Site5 = Species(1,1);
            end
            if cnt >= 5
                if Site1 == Site3 && Site3 == Site5 % т.е. если узел поскакал, то мы запрещаем его дальнейшую диффузию
                    hop = 1;
                end
            end
        end
        
    end
    
end

% ВЫВОД РЕЗУЛЬТАТОВ
for fold=1:1
    
    % ИТОГОВЫЙ ГРАФИК
    X_GaAsInAl = zeros((size(Sites,1)*size(Sites,2)),1);
    X_cr = zeros((size(Sites,1)*size(Sites,2)),1);
    Y_Ga = zeros((size(Sites,1)*size(Sites,2)),1);
    Y_As = zeros((size(Sites,1)*size(Sites,2)),1);
    Y_In = zeros((size(Sites,1)*size(Sites,2)),1);
    Y_Al = zeros((size(Sites,1)*size(Sites,2)),1);
    Y_ncr = zeros((size(Sites_cr,1)*size(Sites_cr,2)),1);
    Y_cr = zeros((size(Sites_cr,1)*size(Sites_cr,2)),1);
    for i11=1:size(Sites,1)
        for j11=1:size(Sites,2)
            if Sites(i11,j11) ~= 0
                sp_type = round(10*(Sites(i11,j11)-fix(Sites(i11,j11))))/10; % сокращение для обозначения типа рассматриваемой частицы: 0.1 -- галлий, 0.2 -- мышьяк, 0.3 -- индий, 0.4 -- алюминий.
                if sp_type > 0.09 && sp_type < 0.11
                    sp_type = 0.1;
                elseif sp_type > 0.19 && sp_type < 0.21
                    sp_type = 0.2;
                elseif sp_type > 0.29 && sp_type < 0.31
                    sp_type = 0.3;
                elseif sp_type > 0.39 && sp_type < 0.41
                    sp_type = 0.4;
                else
                    error('Другие типы частиц не задавались')
                end
                X_GaAsInAl((i11-1)*size(Sites,2)+j11)=j11;
                switch sp_type
                    case 0.1
                        Y_Ga((i11-1)*size(Sites,2)+j11)=i11;
                    case 0.2
                        Y_As((i11-1)*size(Sites,2)+j11)=i11;
                    case 0.3
                        Y_In((i11-1)*size(Sites,2)+j11)=i11;
                    case 0.4
                        Y_Al((i11-1)*size(Sites,2)+j11)=i11;
                end
            end
            if Sites_sat(i11,j11) ~= 0
                X_cr((i11-1)*size(Sites,2)+j11)=j11;
                Y_ncr((i11-1)*size(Sites,2)+j11)=i11;
            end
            if Sites_cr(i11,j11) ~= 0
                X_cr((i11-1)*size(Sites,2)+j11)=j11;
                Y_cr((i11-1)*size(Sites,2)+j11)=i11;
            end
        end
    end
    % Отображаем ростовую площадку
    % с критическими областями
    config2 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % отображение на весь экран
    plot(X_GaAsInAl, Y_Ga, '.k', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Ga'); % точки, чёрные
    hold on
    plot(X_GaAsInAl, Y_As, 'ok', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_As'); % пустые кружки, чёрные
    hold on
    plot(X_GaAsInAl, Y_In, '.r', 'MarkerSize',20, 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_In'); % точки, красные
    hold on
    plot(X_GaAsInAl, Y_Al, '.g', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Al'); % точки, зелёные
    hold on
    plot(X_cr, Y_ncr, '^c', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_ncr'); % галочки вверх, голубые
    hold on
    plot(X_cr, Y_cr, '^b', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_cr'); % галочки вниз, фиолетовые
    axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
    % и сохраняем
    if figout > 0
        Morph_fig_name_cr = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) crit_n ext_fig];
        saveas(config2, Morph_fig_name_cr)
    end
    Morph_png_name_cr = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) crit_n ext_png];
    saveas(config2, Morph_png_name_cr)
    % и без критических областей
    config3 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % отображение на весь экран
    plot(X_GaAsInAl, Y_Ga, '.k', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Ga'); % точки, чёрные
    hold on
    plot(X_GaAsInAl, Y_As, 'ok', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_As'); % пустые кружки, чёрные
    hold on
    plot(X_GaAsInAl, Y_In, '.r', 'MarkerSize',20, 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_In'); % точки, красные
    hold on
    plot(X_GaAsInAl, Y_Al, '.g', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Al'); % точки, зелёные    
    axis([0 n_site+1 0 size(Sites,1)+1]) % диапазоны координат
    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
    % и тоже сохраняем
    if figout > 0
        Morph_fig_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) ext_fig];
        saveas(config3, Morph_fig_name)
    end
    Morph_png_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) ext_png];
    saveas(config3, Morph_png_name)
    
    if xlsout > 0 && n_site < 500
        Crys_name = [num2str(sim_num) u_n Crys_n ext_xls];
        xlswrite(Crys_name,X_GaAsInAl)
        Ga_gr_name = [num2str(sim_num) u_n Ga_gr_n ext_xls];
        xlswrite(Ga_gr_name,Y_Ga)
        As_gr_name = [num2str(sim_num) u_n As_gr_n ext_xls];
        xlswrite(As_gr_name,Y_As)
        In_gr_name = [num2str(sim_num) u_n In_gr_n ext_xls];
        xlswrite(In_gr_name,Y_In)
        Al_gr_name = [num2str(sim_num) u_n Al_gr_n ext_xls];
        xlswrite(Al_gr_name,Y_Al)
    end
    
    % ВРЕМЯ
    
    clc
    format bank
    completed = 100 % ни капли смысловой нагрузки: просто для красоты :)
    
    w_time = toc/60 % время, затраченное на вычисления, мин
    
end

% СОХРАНЕНИЕ
for fold=1:1
    file_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) ext_mat];
    save(file_name, '-mat')
end