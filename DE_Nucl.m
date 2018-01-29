tic

clear all
close all
clc

sim_num = 801

pause

% �������� ������
for fold=1:1
    
    % ���������� � ������� ��� ������
    % ��� ����������� ���������� ������
    ext_mat = '.mat';
    ext_xls = '.xls';
    ext_fig = '.fig';
    ext_jpg = '.jpg';
    ext_tif = '.tif';
    ext_png = '.png';
    % ��� ����������� �������������
    Crys_n = 'Crys';
    Ga_gr_n = 'Ga_gr';
    As_gr_n = 'As_gr';
    In_gr_n = 'In_gr';
    Al_gr_n = 'Al_gr';
    % ��� ����������� ������� � ������ ���������
    u_n = '_'; % u - underscore
    cr_n = 'x'; % cr - cross
    th_n = 'ML'; % th - theta
    T_n = '_T';
    v_n = '_v';
    r_n = '_ratio'; % r - ratio
    t_n = 's'; % t - time
    % ��� ����������� ����������
    crit_n = '_crit'; % crit - critical regions
    
    % ��������� �����������:
    make_pause = 0; % 0 - ��� ����, 1 - ���������, ������������� �� ���� ������ ���������, 2 - ���������� ��������� �������� ��� ������ �� �������
    visual = 1; % 0 - ��������� ������ �������� ������������, 1 - ������������ ��������� �� ������ ����, 2 - �� ������ ���� � ����������� ������������ � �������� ������� �������
    xlsout = 0; % 0 - xls-����� �� ���������, 1 - xls-����� ���������
    figout = 0; % 0 - fig-����� �� ���������, 1 - fig-����� ���������
    energy_plot = 0; % ������ � ���������: 0 - �� ���������, 1 - ���������
    des_plot = 0; % ������ � ����������: 0 - �� ���������, 1 - ���������, 2 - ��������� ��� ������� ����
    
    % ��������� �������������:
    n_trial = 1; % ����� ���������� ������ �����-�����
    completed = 0; % ������� ���������� ���������
    
    % ������������:
    kE1 = -0.00; % �������� � ������� ���������
    kE2 = -0.00; % --=--
    kE3 = -0.00; % --=--
    khop = 10^-3; % 10^-3 % �����������, ����������� ������ ������
    kv = 10^0; % �����������, ������������� �������� �����, ��� ��������� ��������������� ������������
    k_enh = 1; % ����������� �������� �������� �� ����������� � ��������
    
    % ���������:
    k_B = 1.38e-23; % ���������� ���������, ��*�(-1)
    nu = 1e13; % ������� �����, ������� ��������� ������ �������, �^(-1)
    nu2 = 1e13; % ������� ��������� ����� � ��������� ������������, �^(-1)
    
    % ��������� �������:
    l0 = 0.56534e-9; % ������ ������� GaAs, �
    a = l0*sqrt(2)/2; % ���������� ����� ������� �������� �� �����������, �
    sigma = l0^2/2; % �������, ���������� ����� ������ �������, �^2
    at_per_lat = 0.25; % 0.375 % ����� ������ (�����), ������������ �� ������� ������� ������
%     Vm = 15.7*10^-6; % �������� ����� In, �^3/����
    
    % ��������� ����������������� ������ ���������:
%     gamma_d_s = 0.8*10^-23; % �������� ��������� ������������� ������� �� ������� �����-��������, ��/�^2
%     gamma_d_v = 0.8*10^-23 * 1.5; % �������� ��������� ������������� ������� �� ������� �����-���, ��/�^2
%     gamma_s_v = 0.8*10^-23; % �������� ��������� ������������� ������� �� ������� ��������-���, ��/�^2
    gam_vl = 570 * 10^-3; % �/� = ��/�^2 [������ [47] �����-������]
    Tc = 846; % ����������� �����������, � | 2200 ��� GaAs
    phi = 70 * pi/180; % ���������� ����, �������� ����� ��������� ������� ����������� ( = ������� ���� ���������� (���������� ����), � ��������)
    
    % ��������� �������� ��������:
    m_site = 201; % ������ �������� (20 ��, �.�. 20 �� / 0.1413325 �� = 142 �������� �������)
    n_site = 500; % ����� �������� �������� (1 ��� = 10000 �� / 0.1999 �� = 5000 ��������� �������) = ��������� ����� ������, ���������� 1 ��������
    % n_site=1280 ~ 256 ��: ���� ���-����������� � ����� ������ ��������: 2 ����� In ��� 150 ��������
    % 1970 ~ 394 ��: 2-3 �����
    % 5100 ~ 1,02 ���: 5 ������
    sub = 1; % ��� ��������: 1 - GaAs, 2 - InAs
    des = 0; % ������� ���������
    hop = 0; % ������� ������� ����-����
    
    % ��������������� ���������:
    T = 350 + 273.15; % ����������� ��������, �
    T_ann = 150 + 273.15; % ����������� �������� ��� ������, �
    h_dep = 5; % ������� ���������, ��
    v_gr = 0.5 * kv; % �������� �����, ��/�
    t_ann = 0; % ����� ������, �
    t_gr = h_dep/v_gr + t_ann; % ����� ����� �����, �
    
    % ������� ��������������� ���������
    T_degC = T - 273.15
    v_ML_s = v_gr
    time_s = t_gr;
    thickness_ML = h_dep
    number_at = h_dep*(n_site/2)
    pause
    
    % ����������� ���������� � �������
    Lennard_Jones
    
    tau_dif = 0; % ���� ������������ �����
    
    % ����������� ������������� ������� � ������� �������, �^(-1)    
    % p_Ga_dep = v_gr*(n_site/2);
    p_In_dep = v_gr*(n_site/2);
    n_In = 0;
    frac_In = 0;
    n_In_des = 0;
    
    % ������� ������������� ������� �������, �    
    % tau0_Ga_dep = 1/p_Ga_dep;
    tau0_In_dep = 1/p_In_dep;
    
end

% ����
format bank
for i1=1:n_trial
    
    close all
    clc
    
    % ������� ��� ���������� ��������
    for  fold=1:1
        
        Cnt = 0; % ������ �������� �������� cnt
        
        % ������� ��������� �������� � ������ ����������� (��� ���������� �������)
        cnt_en = 0;
        Cnt_en = 0;
        En_dif_gr_1 = 0;
        En_dif_gr_2 = 0;
        En_dif_gr_3 = 0;
        En_dif_gr_4 = 0;
        En_dif_gr_5 = 0;
        En_dif_gr_6 = 0;
        
        % ������ ���� ��������������� ������
        Cnt_des = 0;
        Fr_In_des = 0;
        
        % ������ �������� �����������
        
        
        % ������ ������� ����������� ��������
        X_At_cr = []; % ������ ��� ���������� X -- ����������� ����� ������ � ��������
        
    end
    
    % �������� (��������� ������������ �������):
    for fold=1:1
        if round(h_dep*sqrt(n_site/pi)/2)+10 > 70
            disp('����� ����, ����� ��������� �������� ��������')
            pause
        end
        Sites = zeros(m_site+200,n_site);
        Sites_cr = Sites; % ������������ �������� ��� ����������� ����������� ��������
        Sites_sat = Sites_cr;
        switch sub
            case 1 % �������� GaAs
                for i3=1:m_site
                    for j3=1:round(n_site/2)
                        if rem(i3,4)==1 % Ga � 1-�, 5-� � �.�. ����
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.1;
                        elseif rem(i3,4)==2 % As �� 2-�, 6-� � �.�. ����
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.2;
                        elseif rem(i3,4)==3 % Ga � 3-�, 7-� � �.�. ����
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.1;
                        elseif rem(i3,4)==0 % As � 4-�, 8-� � �.�. ����
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.2;
                        else
                            error('������� ������� ���� �� ������')
                        end
                    end
                end
            case 2 % �������� InAs
                for i3=1:m_site
                    for j3=1:round(n_site/2)
                        if rem(i3,4)==1 % In � 1-�, 5-� � �.�. ����
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.3;
                        elseif rem(i3,4)==2 % As �� 2-�, 6-� � �.�. ����
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.2;
                        elseif rem(i3,4)==3 % In � 3-�, 7-� � �.�. ����
                            Sites(i3,2*j3) = i3+2*j3*10^4+0.3;
                        elseif rem(i3,4)==0 % As � 4-�, 8-� � �.�. ����
                            Sites(i3,2*j3-1) = i3+(2*j3-1)*10^4+0.2;
                        else
                            error('������� ������� ���� �� ������')
                        end
                    end
                end
        end
    end
    
    % ����������� �����������:
    for fold=1:1
        r_hole = 250; % 50 % 100 % ���������� ����� �������� ���������� � �������� n_site
        d_hole = 50; % 40 % ������� ���������� � �������� n_site
        dep_hole = 40; % 10 % ������� ���������� � �������� m_site
        n_hole = floor(n_site/r_hole); % ���������� ����������
        X_hole = []; % ������ ��������� X ���� ����������
        for i24=1:n_hole
            X_hole(i24) = round(r_hole/2-d_hole/2+(i24-1)*r_hole);
        end
        sh_hole = 22; % ��� ����� ����������: 0 - �������������� ���� ��� (001), 1 - ������������ ���� ��� (110), 2 - ����� ���� ��� (111), 3 - �������� ����. ��������, 202 -- ��������������� ����
        switch sh_hole
            case 101
                for i27=1:n_hole
                    for i25=1:dep_hole
                        for i26=1:d_hole
                            Sites(m_site+1-i25,X_hole(i27)-1+i26) = 0;
                        end
                    end
                end
            case 22 % ���� �������� 55+55 ��������, �.�. ����� 110, �� ������ �������� �������� �������������
                for i27=1:n_hole
                    for i26=1:round(d_hole/2) % ������ ����
                        for i28=1:i26
                            Sites(m_site+1-(2*i28-1),X_hole(i27)-1+i26+1) = 0;
                            Sites(m_site+1-(2*i28),X_hole(i27)-1+i26+1) = 0;
                            dep2 = i28; % ��������� i28 ����� ������ ������������ �������
                        end
                    end
                end
                dep1_hole = 2*dep2; % �� ��� ������� ���� �������� �� 2
                for i27=1:n_hole
                    for i26=1:round(d_hole/2) % ������ ����
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
    
    % ��������� �����:
    for fold=1:1
        % ������� �������� ��������������:
        % ���������� ����� ������� - ������� - ����� �������� (���������� ����) - ����� ��������� (����� �����) - ���������� X - ���������� Y
        Species = [0 0 0 0 0 0];
        % ����� ���������: ����� ��������� (��� ���������� ����������) - ���������� X - ���������� Y
        Buff_XY = [0 0 0];
        % ����� ���������
        t_cur = 0; % �����, ������� ������������� �� ��������� ����� ����� ���������� ���������� �������. ��� ������� �������������� ������� t_cur ������. �� ������������� ���������� ��, � �������� t_cur ������.
        t_cur_t = 0; % ������ �������, � ������� ������������� �������. ������������ ����� ������� ������������� ����� �������� ���������� �������. ������� ��� ������ ������ t_cur
    end
    
    % ��������� ������:
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
                        sp_type = round(10*(Sites(i11,j11)-fix(Sites(i11,j11))))/10; % ���������� ��� ����������� ���� ��������������� �������: 0.1 -- ������, 0.2 -- ������, 0.3 -- �����, 0.4 -- ��������.
                        if sp_type > 0.09 && sp_type < 0.11
                            sp_type = 0.1;
                        elseif sp_type > 0.19 && sp_type < 0.21
                            sp_type = 0.2;
                        elseif sp_type > 0.29 && sp_type < 0.31
                            sp_type = 0.3;
                        elseif sp_type > 0.39 && sp_type < 0.41
                            sp_type = 0.4;
                        else
                            error('������ ���� ������ �� ����������')
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
            % ���������� �������� ��������
            config1 = figure('Units', 'normalized', 'OuterPosition', [0.5 0 0.5 1]); % ����������� �� ������ �������� ������
            hL1 = plot(X_GaAsInAl, Y_Ga, '.k', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Ga'); % �����, ������
            hold on
            hL2 = plot(X_GaAsInAl, Y_As, 'ok', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_As'); % ������ ������, ������
            hold on
            hL3 = plot(X_GaAsInAl, Y_In, '.r', 'MarkerSize',20, 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_In'); % �����, �������
            hold on
            hL4 = plot(X_GaAsInAl, Y_Al, '.g', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Al'); % �����, ������
            hold on
            hL5 = plot(X_cr, Y_ncr, '^c', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_ncr'); % ������� �����, �������
            hold on
            hL6 = plot(X_cr, Y_cr, '^b', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_cr'); % ������� ����, ����������
            axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
            set(gca,'DataAspectRatio',[1 sqrt(2) 1])
            drawnow
            % ������ � ��������� � ������ �����������
            if energy_plot == 1
                config_en = figure('Units', 'normalized', 'OuterPosition', [0 0.5 1 0.5]); % ����������� �� ������� �������� ������
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
                axis([0 50 0 3]) % ��������� ���������
                drawnow
            end
            % ������ � ����� ��������������� ������
            if des_plot == 1 || des_plot == 2
                config_des = figure('Units', 'normalized', 'OuterPosition', [0 0 0.5 0.5]); % ����������� �� ������ ����� �������� ������
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
    
    % �������:
    cnt = 0; % �������
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
        
        % ����� ������������� �����������:
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
        
        % �����:
        for fold=1:1
            if t_cur_t > t_gr - t_ann
                p_In_dep = 0;
                T = T_ann;
                completed_annealing = (t_cur_t-(t_gr-t_ann))/t_ann*100
                disp('�����')
            end
        end
        
        % ����� �������:
        % 1 - ���������, 2 - ��������, 3 - �����, 4 - ���������, 5 - �����������
        for i2=1:size(Species,1) % ��� ���� ������, ��������� � �������            
            
            % x = Species(i2,5);
            % y = Species(i2,6);
            x = fix(Species(i2,1)/10^4);
            y = fix(Species(i2,1))-x*10^4;
            
            if Species(i2,2) == 0 && Species(i2,3) == 0 % ������ ��� ������, ��� ������� ��� �� ������� �������
                
                if Species(i2,:) == zeros(1,size(Species,2)) % ���� ��� ������ �������, �� ���������� ���������
                    
                    % ���������
                    for fold=1:1
                        
                        if p_In_dep ~= 0 % � ���� � �� �� ����� ������� ��������
                            
                            Species(i2,2) = 1; % ��� ������ ������� ���������� ������� "���������"
                            tau_In_dep = -tau0_In_dep*log(rand); % �������������� ����� �������� ��������� In
                            Species(i2,3) = tau_In_dep;  % ������ ����������� �������� ��������
                            t_cur = t_cur_t + tau_In_dep; % ����� ��������� �������������
                            Species(i2,4) = t_cur;
                            Buff_XY(i2,1) = t_cur;
                            
                        else % ���� ��������� ��� ���������� � ����� � ������� ������
                            
                            Species(i2,2) = 1; % ����� ����� ����������, �� ������ ����� ����� (������ � �������) -- �������, ����� ������� ������ �� ��������� ����� �������
                            Species(i2,3) = t_gr+3; % �������, +3 ��� +0.1 ��� +709 -- �������, ����� �� ��������� ��������� �����, ����� ������ ��������� �������, ������ � ����� ����������� ������� �������
                            Species(i2,4) = t_gr+3;
                            Buff_XY(i2,1) = t_gr+3;
                            
                        end
                        
                    end
                    
                else % ���� �� � ������ ���� ���� ���� ��������� �������, ������ ������� ��� ���� ��������, �.�. ��� �� ���������� ������ �������
                    
                    % ��� �������
                    for fold=1:1
                        
                        sp_type = round(10*(Species(i2,1)-fix(Species(i2,1))))/10; % ���������� ��� ����������� ���� ��������������� �������: 0.1 -- ������, 0.2 -- ������, 0.3 -- �����, 0.4 -- ��������.
                        
                        % ������������ �� ������, ���� ����� ����� �����
                        % �����������
                        if sp_type > 0.09 && sp_type < 0.11
                            sp_type = 0.1;
                        elseif sp_type > 0.19 && sp_type < 0.21
                            sp_type = 0.2;
                        elseif sp_type > 0.29 && sp_type < 0.31
                            sp_type = 0.3;
                        elseif sp_type > 0.39 && sp_type < 0.41
                            sp_type = 0.4;
                        else error('������ ���� ������ �� ����������')
                        end
                        
                    end
                    
                    % Critical_Size
                    for fold=1:1
                        
                        % ��������� ��������� ������� ����������� (���)
                        R_sat = d_hole/2; % ������ ���
                        S_sat_cr = 0.5*R_sat^2*(2*phi-sin(2*phi)); % ������� ���, �.�. ����� ������ � ���
                        sat_int = ceil(R_sat); % ��������, ����� ������� ����������� ���
                        
                        % ����������� ������� ����������
%                         % �� �����������:
%                         theta_eq = exp(-2*Tc/T);  % ����������� ������� ����������
%                         at_in_sat_eq = theta_eq*S_sat_cr*at_per_lat; % ����������� ������������ �������� � ���
                        % �� [Surface line tension], � ���������� [Dynamics of crystal steps]:
                        theta0_eq = exp(-2*Tc/T); % ����������� ������� ���������� (����� �� �����������)
                        E = 0; % 2*k_B*Tc % 0.1931 % ������ ������ ����, �� ���������, ����� ����� � ���� ������
                        % �� ������� theta_eq=n_eq*sigma=1 ��� T=250 (��� ������������� �������� ����������� 1 ��������� In), ������� � [Observation] �������� ����������� �������� ������������ ������
                        n0_eq250 = exp(-2*Tc/250)*S_sat_cr;
                        theta_eq250 = 2*R_sat*sin(phi) / S_sat_cr; % ����� ����� �������� / ������� ��������, �.�. 1 �� ������� �� �������� � �������� ���
                        n_eq250 = theta_eq250*S_sat_cr;
                        mu = E + k_B*T*log(n_eq250/n0_eq250);
                        % �������� ������� ���������, �������������� �� ����� �������������:
                        % theta_eq300 = 1 % ��� T=300 ����������� ������� ���������� 1 �� � ��������� ������ �����������
                        % theta_eq230 = 1.75 % ��� T=230 -- 1.75 ��
%                         mu = 0.3087*10^-19;
                        n0_eq = theta0_eq * S_sat_cr;
                        n_eq = n0_eq * exp(-E/(k_B*T)) * exp(mu/(k_B*T)); % ����������� ������������ �������� � ���
                        theta_eq = n_eq / S_sat_cr; % ������ �� ������ �� ����� �����, ��������� �� ����������� GaAs, � ������ -- �� ����� ����� � ���
                        at_in_sat_eq = n_eq;
                        
                        cnt_sat = 0;
                        for i33=ceil(R_sat)+1:sat_int:n_site-ceil(R_sat)-1
                            cnt_sat = cnt_sat+1;
                            
                            % �������� ������ ����� �� ��� X
                            x_bias = i33;
                            % �������� ������ ����� �� ��� Y
                            % (��� ���������������� ������������)
                            for i44 = m_site_Mod(i33)-ceil(R_sat*sqrt(2)) : m_site_Mod(i33)+ceil(R_sat*sqrt(2))
                                S_sat = 0; % ������� ������� ��� �� ��������� ��������
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
                            
                            % ������� ����� ������ � ��������� ������� �����������
                            at_in_sat = 0;
                            for i40=ceil(x_bias-R_sat):ceil(x_bias+R_sat)
                                for i41=ceil(y_bias-R_sat*sqrt(2)):ceil(y_bias+R_sat*sqrt(2))
                                    if Sites_cr(i41,i40) ~= 1 % ������� ������ � ������� �� ��������� ����������� �������
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
                            
                            % ������ ������� ����������� � �������� �������� �������
                            zeta = at_in_sat/at_in_sat_eq;
                            Vm = rmin_In_In^3; % �����, ������������ �� ���� In, �^3
                            g_V = k_B*T*log(zeta)/Vm;
                            
                            % ������ ������������ �������
                            R_cr = 2*gam_vl/g_V / (a/2); % ����������� ������ ����������� ��������, � �������� ����������� ���������� ����������, �.�. �� 0.2 ��
                            R_cr = 0.8*R_sat;
                            r_cr = R_cr*sin(phi); % ����������� ������ ��������� ��������
                            diam_cr = 2*r_cr; % ����������� ������� ��������� ��������
                            h_cr = R_cr*(1-cos(phi))*sqrt(2); % ������ ������������ �������� (���������� �� sqrt(2) ������, ��� � �������� ���������� ����� ���������� ������� ������ ����� ������, ��� ��� ������������ ���������� ���������� 0.14, � �� 0.2, �.�. ��� ��� �� ������� ����� ��������� ������ �����)
                            S_cr = 0.5*R_cr^2*(2*phi-sin(2*phi)); % ������� ����� ������������ ��������
                            i_cr = S_cr*at_per_lat; % ����� ������ � ����������� ��������
                            
                            % �������� ���������������� � ����������� �������
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
                    
                    % ������ � �������
                    for fold=1:1
                        
                        Neighbors_0
                                                
                        % ������� ����� ����� �� ����� ������� ����������
                        Energy_Position_0
                                                
                        % ������ ������������ ����� �������
                        Neighbors_New
                                                
                        % ������ ������� �������� � ������ �� �������
                        En_dif = zeros(1,6);
                        Prob_dif = zeros(1,6);
                        Tau_dif = zeros(1,6);
                        
                        % ������� ��������� �������� ����� � ��������������� �������
                        Energy_Position_1
                        Energy_Position_2
                        Energy_Position_3
                        Energy_Position_4
                        Energy_Position_5
                        Energy_Position_6
                        
                    end
                    
                    
                    % ���������
                    for fold=1:1
                        
                        if des == 0 % ����� �������� � ������� ���� ���������
                            Prob_dif(1) = 0;
                            Prob_dif(2) = 0;
                            Prob_dif(3) = 0;
                        elseif des == 0.5
                            rnd_des = rand;
                            if rnd_des <= 0.5 % ���������
                                Species(i2,2) = 3;
                                Species(i2,3) = 0; % ����� �������� �����������
                                t_cur = t_cur_t + tau_dif;
                                Species(i2,4) = t_cur;
                                Buff_XY(i2,1) = t_cur;
                            end % ����� ���� �� ������������� � ��������� ��������������
                        elseif des == 1 % ������ ����� ���� � �� ������� ���� elseif, �� ������ ����� ���. ������ ��� ���������
                            if Species(i2,5) < n_site && Species(i2,5) > 1 % ���� ������ �������� ��
                                if Sites(Species(i2,6)-1,Species(i2,5)-1) == 0 &&...
                                        Sites(Species(i2,6)-1,Species(i2,5)) == 0 &&...
                                        Sites(Species(i2,6)-1,Species(i2,5)+1) == 0 &&...
                                        Sites(Species(i2,6)+1,Species(i2,5)-1) == 0 &&...
                                        Sites(Species(i2,6)+1,Species(i2,5)) == 0 &&...
                                        Sites(Species(i2,6)+1,Species(i2,5)+1) == 0 % ���� ������: ���� �������� ��� 1-� ��
%                                 if size(nonzeros(Neighbors),1) < 1 % ���� ��� �� ������ ������ �� ���� ��
                                    Prob_dif(1) = nu*exp(-(E_dif_1+E_des)/(k_B*T));
                                    Prob_dif(2) = nu*exp(-(E_dif_2+E_des)/(k_B*T));
                                    Prob_dif(3) = nu*exp(-(E_dif_3+E_des)/(k_B*T));
                                    % ���� ������� ��� ���������� ���������� ������ �� ��������, ���
                                    % �������������:
                                    detach = 1; % ��������� �� ���� �� ��������? 1 - ��, 2 - ���
                                    for i36=1:7
                                        if Sites(Species(i2,6)-i36,Species(i2,5)) ~= 0 % ���� ��� ������ ���� ���� ���� ��������� �������,
                                            detach = 2;
                                            break % ����� �������
                                        end
                                    end
                                    if detach == 1 % ����� �������������
                                        Species(i2,2) = 3;
                                        Species(i2,3) = 0; % ����� �������� �����������
                                        t_cur = t_cur_t + tau_dif;
                                        Species(i2,4) = t_cur;
                                        Buff_XY(i2,1) = t_cur;
                                    end
                                end
                            end
                        end
                        des = 0;
                        
                    end
                    
                    % �������� �������� � ����������� ��������
                    for fold=1:1
                        if size(X_At_cr,1) > 0 % ���� ������������� ���� �� ���� ����������� ��������
                            At_isl_dist = []; % ������ ���������� ����� ��������������� ������ � �������� ���������
                            for i47=1:size(X_At_cr,1)
                                At_isl_dist = [At_isl_dist; abs(Species(i2,5)-X_At_cr(i47,1))];
                            end
                            for i48=1:size(At_isl_dist,1)
                                if At_isl_dist(i48) == min(At_isl_dist) % ����� �������� �� ����������� �������, ������ �������� ��������� -- ���������� ���������� ��� ������
                                    dir_to_isl = X_At_cr(i48,1); % ���������� X ������ ��������, � �������� ����� ���������� ����
                                end
                            end
                            if size(nonzeros(Sites_cr(:,Species(i2,5))),1) == 0 % ���� ���������� X �� �� ������ ������������ ��������
%                                 diff_enh = exp(n_site/(min(At_isl_dist)+1)); % ����������� �������� ��������: �������, ��� ����� � ��������, ��� ������� ������ � ���� ������������� (+1 ����� ��� ������, ����� ���������� �������)
                                diff_enh = n_site/(min(At_isl_dist)+1) * k_enh;
                            else
%                                 diff_enh = n_site/(min(At_isl_dist)+1); % � ������ ������������ �������� ���������� �� ������ ���� ������� �������, ����� �� ������������ �������� � ������
%                                 diff_enh = log(n_site/(min(At_isl_dist)+1));
                                diff_enh = 1;
                            end
                            if Species(i2,5) >= dir_to_isl % ���� ���� ������ �� ��������
                                Prob_dif(3) = diff_enh * Prob_dif(3);
                                Prob_dif(4) = diff_enh * Prob_dif(4);
                            else % ���� ���� ����� �� ��������
                                Prob_dif(1) = diff_enh * Prob_dif(1);
                                Prob_dif(6) = diff_enh * Prob_dif(6);
                            end
                        end
                    end
                    
                    % �������� � ������� ����
                    for i17=1:size(Diff,2)
                        if Diff(i17) == 0 % ���� �������� � ���� ���� ����������
                            Prob_dif(i17) = 0;
                            % elseif Diff(i17) == 1 % ���� ���� �������� � �������� ������ � ����
                            %
                        elseif Diff(i17) == 2 % ���� ���� ����� ������ ������� ���� � �������� �����
                            Prob_dif(i17) = 0; % ���� ���
                            % �� ����� ���� ���������� � ���� �����, �
                            % ������� ����� ��������� �����, � ����������
                            % ��� ������� ������� � ���������� �� �����
                            % ����������. ����� �������������� ��� �������
                            % -- ��� � ����� ������� ��������� ������.
                            %                         else
                            %                             error('������ ���� �������� �� ����������')
                        elseif Diff(i17) == 3 % ���� ���� ����� �� ������� �������� ��������
                            Species(i2,2) = 3;
                            Species(i2,3) = 0; % ����� �������� �����������
                            t_cur = t_cur_t + tau_dif;
                            Species(i2,4) = t_cur;
                            Buff_XY(i2,1) = t_cur;
                        end
                    end
                    
                    % ������ �� ����� �� ����������� �������
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
                    
                    % ����� ������� ��������� ��� �������� � ������ �����������
                    En_dif_gr_1 = [En_dif_gr_1, En_dif(1)/(1.6*10^-19)];
                    En_dif_gr_2 = [En_dif_gr_2, En_dif(2)/(1.6*10^-19)];
                    En_dif_gr_3 = [En_dif_gr_3, En_dif(3)/(1.6*10^-19)];
                    En_dif_gr_4 = [En_dif_gr_4, En_dif(4)/(1.6*10^-19)];
                    En_dif_gr_5 = [En_dif_gr_5, En_dif(5)/(1.6*10^-19)];
                    En_dif_gr_6 = [En_dif_gr_6, En_dif(6)/(1.6*10^-19)];
                    cnt_en = cnt_en+1;
                    Cnt_en = [Cnt_en, cnt_en];
                    
                    % ������ ������� ��������
                    for fold=1:1
                        
                        if Species(i2,2) ~= 3 % ���� ����� ��� �� ���� ���������� ���������
                            
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
                                disp('������ ��� ������� ���� �������? �� ����, ��� ���� ����������� � elseif')
                                pause
                            end
                            
                            % Prob_dif_nz = nonzeros(Prob_dif); % ��������� � ������� ������ ��������� ��������
                            % Prob_dif_nz = Prob_dif_nz'; % ������������� �� ������� � ������
                            % tau_dif_eff = 1/mean(Prob_dif_nz); % ����������� ����� �������� ��������
                            
                            % ����� �������� ������� ���������� ��������� ������
                            % ��� ������ �����������
                            for i18=1:size(Tau_dif,2)
                                if i18 == direct
                                    % Tau_dif(i18) = -tau_dif_eff * log(rand);
                                    Tau_dif(i18) = -1/Prob_dif(i18)*log(rand);
                                end
                            end
                            
                            tau_dif = nonzeros(Tau_dif);
                            if size(tau_dif,1)>1 || size(tau_dif,2)>1
                                error('����� �������� ������ ���� ��������� ������ ��� ������ �����������')
                            end
                        
                            % ���������� ��������� �����
                            for fold=1:1
                                Species(i2,2) = 2;
                                Species(i2,3) = tau_dif; % ����� ��������
                                t_cur = t_cur_t + tau_dif;
                                Species(i2,4) = t_cur;
                                Buff_XY(i2,1) = t_cur;
                            end
                            
%                         else
%                             
%                             disp('����� ������?')
%                             pause
                            
                        end
                        
                        % ������������� ����� ������������
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
                        
                        % ������ �� ������ ����-����
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
        
        % ���������� ��������� �����:
        Species = sortrows(Species,4);
        Buff_XY = sortrows(Buff_XY,1);
        
        % ��������:
        for fold=1:1
            
            t_cur_t = Species(1,4); % ����� ������� ����� ��������
            
            switch Species(1,2) % ��������� ��������� �������, �.�. ��, ������� ������ ����� � ������� ������
                
                case 1 % ���������
                    
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
                        
                        % � ������ ��������� �������, ��� x_add ������ ���� � �������� [1,n_site-1]
                        if x_add-1 < 1
                            x_add = x_add-1+n_site-1;
                        end
                        if x_add+1 > n_site
                            x_add = x_add+1-n_site+1;
                        end
                        for i4=1:size(Sites,1)
                            if Sites(i4,x_add) == 0 && Sites(i4,x_add+1) == 0 && Sites(i4,x_add-1) == 0 && Sites(i4+1,x_add) == 0 && Sites(i4+1,x_add+1) == 0 && Sites(i4+1,x_add-1) == 0 % ���� �������� ������ �� 6 �����, ������ ��� �� ���������� � �������� ��� �����, � ���������������� ����
                                y_add = i4+1; % ���������� Y �������� ������� ��������� �� �������� � �������, ����������� ����������� X (����� ��������� i4+1)
                                break
                            end
                        end
                        Species(1,1) = x_add*10^4 + y_add + 0.3; % ��������� ���� = XXXXYYYY.T, ��� XXXX -- ���������� X, YYYY -- ���������� Y ������ � ������, T - ��� �������: 1 -- Ga, 2 -- As, 3 - In, 4 - Al
                        Species(1,5) = x_add;
                        Species(1,6) = y_add;
                        
                        Sites(Species(1,6),Species(1,5)) = Species(1,5)*10^4 + Species(1,6) + 0.3; % ��������� ���� = XXXXYYYY, ��� XXXX -- ���������� X, YYYY -- ���������� Y ������ � ������
                        Sites(Species(1,6)+1,Species(1,5)) = 0; % �� ����, � ����� ������ ������ ������ ��������� ���� �
                        Sites(Species(1,6)+2,Species(1,5)) = 0; % ������ ������� ������. ���� ��� ��� ��� ����, �� ������ ���������: ������ � ��� solid-on-solid, �.�. ����� ������������� ��� ���������, �.�. ��� ��������� �������� ������ ������ ���� �� ����� � ������ ������� �� ���������
                        Sites(Species(1,6)+3,Species(1,5)) = 0; % ��, � ������ -- ��� ���� ����� ��� ������������ ����� �� ������ ���� ������� �������������� �������� ������� �� 2-� �� ������.
                        Species(1,2) = 0;
                        Species(1,3) = 0;
                        Species(1,4) = 0;
                        Buff_XY(1,1) = 0;
                        Species = [Species; 0 0 0 0 0 0]; % ����������� ������� ������, ��� ������� �� ��������� ����� ������ ������� ����������� ����� �������� ���������
                        Buff_XY = [Buff_XY; 0 0 0]; % ������� Species � Buff_XY ������ ���� ���������� �� ����� �����
                        
                        n_In = n_In + 1;
                        frac_In = n_In/number_at;
                        
                    end
                    
                case 2 % ��������
                    
                    for fold=1:1
                        
                        Species_t = Species;
                        
                        if Sites(Buff_XY(1,3),Buff_XY(1,2)) == 0 % ���� ��������: ���� ��� �������� ��� ������������, �� �� ��� ����� � ��������� �� ��� ������ ���� ����� ����. ���� ��� ������, ����� ������ ����������, �������� �� ���� � ������ ������
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
                        
%                         % �� ���������� �� �����?
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
%                             disp('�����-�� ���� ���������')
%                         end
                        
                    end
                    
                case 3 % ���������
                    
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
                    
                case 5 % �����������
                    
                    for fold=1:1
                        
                        error('����������� -- ������� ������ ��������, ������� �������� � �������� ��� ������')
                        
                        x_add = floor(n_site*rand(1)+1); % ��������� ����� ���������� x
                        y_add = floor(m_site*rand(1)+1); % ��������� ����� ���������� y
                        Sites(y_add,x_add) = Species(1,1); % ��������� ���� = ID �������
                        Species(1,5) = x_add; % � ������� ����� ���������� ��������� ���������� X
                        Species(1,6) = y_add; % � ������� ����� ���������� ��������� ���������� Y
                        
                    end
            end
        end
        
        % ������������� ������:
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
                            sp_type = round(10*(Sites(i11,j11)-fix(Sites(i11,j11))))/10; % ���������� ��� ����������� ���� ��������������� �������: 0.1 -- ������, 0.2 -- ������, 0.3 -- �����, 0.4 -- ��������.
                            if sp_type > 0.09 && sp_type < 0.11
                                sp_type = 0.1;
                            elseif sp_type > 0.19 && sp_type < 0.21
                                sp_type = 0.2;
                            elseif sp_type > 0.29 && sp_type < 0.31
                                sp_type = 0.3;
                            elseif sp_type > 0.39 && sp_type < 0.41
                                sp_type = 0.4;
                            else
                                error('������ ���� ������ �� ����������')
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
                
                % ������� � �������� ������ �������:
                
                % ���� �����
                if round(100000*t_cur_t/t_gr) == 33333 % ����� ������ ����� ������� �����
                    config_int2 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % ����������� �� ���� �����
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % �����, ������; �����, �������
                    axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
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
                    config_int2 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % ����������� �� ���� �����
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % �����, ������; �����, �������
                    axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
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
                
                % ��� �����
                if round(100000*t_cur_t/t_gr) == 66667
                    config_int3 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % ����������� �� ���� �����
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % �����, ������; �����, �������
                    axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
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
                    config_int3 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % ����������� �� ���� �����
                    plot(X_GaAsInAl,Y_Ga,'.k',X_GaAsInAl,Y_As,'ok',X_GaAsInAl,Y_In,'.r') % �����, ������; �����, �������
                    axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
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
        
        % �������� �� ������� ������� ����-����:
        for fold=1:1
            if rem(cnt,5) == 1 % 1-�, 6-�, 11-� � �.�. ��������
                Site1 = Species(1,1);
            elseif rem(cnt,5) == 3 % 3-�, 8-�, 13-� � �.�. ��������
                Site3 = Species(1,1);
            elseif rem(cnt,5) == 0 % 5-�, 10-�, 15-� � �.�. ��������
                Site5 = Species(1,1);
            end
            if cnt >= 5
                if Site1 == Site3 && Site3 == Site5 % �.�. ���� ���� ��������, �� �� ��������� ��� ���������� ��������
                    hop = 1;
                end
            end
        end
        
    end
    
end

% ����� �����������
for fold=1:1
    
    % �������� ������
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
                sp_type = round(10*(Sites(i11,j11)-fix(Sites(i11,j11))))/10; % ���������� ��� ����������� ���� ��������������� �������: 0.1 -- ������, 0.2 -- ������, 0.3 -- �����, 0.4 -- ��������.
                if sp_type > 0.09 && sp_type < 0.11
                    sp_type = 0.1;
                elseif sp_type > 0.19 && sp_type < 0.21
                    sp_type = 0.2;
                elseif sp_type > 0.29 && sp_type < 0.31
                    sp_type = 0.3;
                elseif sp_type > 0.39 && sp_type < 0.41
                    sp_type = 0.4;
                else
                    error('������ ���� ������ �� ����������')
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
    % ���������� �������� ��������
    % � ������������ ���������
    config2 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % ����������� �� ���� �����
    plot(X_GaAsInAl, Y_Ga, '.k', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Ga'); % �����, ������
    hold on
    plot(X_GaAsInAl, Y_As, 'ok', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_As'); % ������ ������, ������
    hold on
    plot(X_GaAsInAl, Y_In, '.r', 'MarkerSize',20, 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_In'); % �����, �������
    hold on
    plot(X_GaAsInAl, Y_Al, '.g', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Al'); % �����, ������
    hold on
    plot(X_cr, Y_ncr, '^c', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_ncr'); % ������� �����, �������
    hold on
    plot(X_cr, Y_cr, '^b', 'MarkerSize',3, 'XDataSource', 'X_cr', 'YDataSource', 'Y_cr'); % ������� ����, ����������
    axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
    % � ���������
    if figout > 0
        Morph_fig_name_cr = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) crit_n ext_fig];
        saveas(config2, Morph_fig_name_cr)
    end
    Morph_png_name_cr = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) crit_n ext_png];
    saveas(config2, Morph_png_name_cr)
    % � ��� ����������� ��������
    config3 = figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]); % ����������� �� ���� �����
    plot(X_GaAsInAl, Y_Ga, '.k', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Ga'); % �����, ������
    hold on
    plot(X_GaAsInAl, Y_As, 'ok', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_As'); % ������ ������, ������
    hold on
    plot(X_GaAsInAl, Y_In, '.r', 'MarkerSize',20, 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_In'); % �����, �������
    hold on
    plot(X_GaAsInAl, Y_Al, '.g', 'XDataSource', 'X_GaAsInAl', 'YDataSource', 'Y_Al'); % �����, ������    
    axis([0 n_site+1 0 size(Sites,1)+1]) % ��������� ���������
    set(gca,'DataAspectRatio',[1 sqrt(2) 1])
    % � ���� ���������
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
    
    % �����
    
    clc
    format bank
    completed = 100 % �� ����� ��������� ��������: ������ ��� ������� :)
    
    w_time = toc/60 % �����, ����������� �� ����������, ���
    
end

% ����������
for fold=1:1
    file_name = [num2str(sim_num) u_n num2str(m_site) cr_n num2str(n_site) u_n num2str(h_dep) th_n T_n num2str(T-273.15) v_n num2str(v_gr) ext_mat];
    save(file_name, '-mat')
end