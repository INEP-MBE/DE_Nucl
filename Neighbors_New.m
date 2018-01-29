for fold=1:1
    
    temp_site = Sites(Species(i2,6),Species(i2,5)); % �������� ���������������� ����
    
    Diff = ones(1,6); % 0 - ��� ��������, 1 - ������� ������, 2 - �����, 3 - ���������
    
    % 1 - ����� ������
    
    Neighbors_1 = zeros(7,10);
    
    if Species(i2,5)+1 > n_site
        x_1 = Species(i2,5)+1-n_site;
    else
        x_1 = Species(i2,5)+1;
    end
    y_1 = Species(i2,6)+1; % ������� ������ �� �� ���������, ��� ��� ������ ������ �������� ����
    
    if Sites(y_1,x_1) == 0 % ���� ������� �� ������, �� ��� ������� ��������
        Sites(Species(i2,6),Species(i2,5)) = 0; % ���� ����������, ����� ������������ ��������, ����� �� ������������
    else
        % ���� ����� ������� ����, �� ��� �����
        if sp_type ~= round(10*(Sites(y_1,x_1)-fix(Sites(y_1,x_1))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_1,x_1); % �� ����� �������� ���� ���������� ����-�����
            Diff(1) = 2;
            % ���� �����������
        else
            if make_pause == 1 % �������� �� ������ ������
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_1,x_1)
                pause
            end % � ���� ��� � ����, �� �������� � ��� ������� ����������
            Diff(1) = 0;
        end
    end
    
    % 1-� ��:
    % ������:
    Neighbors_1(1,1) = Sites(y_1+1,x_1); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if x_1-1 < 1
        if y_1-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors_1(1,2) = Sites(y_1,x_1-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if x_1+1 > n_site
        Neighbors_1(2,1) = Sites(y_1+1,x_1+1-n_site);
    else
        Neighbors_1(2,1) = Sites(y_1+1,x_1+1);
    end
    % ������ ������:
    if x_1-1 < 1
        Neighbors_1(2,2) = Sites(y_1+1,x_1-1+n_site);
    else
        Neighbors_1(2,2) = Sites(y_1+1,x_1-1);
    end
    % �����:
    if y_1-1 < 1
        Neighbors_1(2,3) = Sites(y_1,x_1);
    else
        Neighbors_1(2,3) = Sites(y_1-1,x_1);
    end
    
    % 3-� ��:
    % �����:
    if x_1+1 > n_site
        Neighbors_1(3,1) = Sites(y_1,x_1+1-n_site);
    elseif Sites(y_1,x_1+1) ~= 0
        Neighbors_1(3,1) = Sites(y_1,x_1+1);
    end
    % ������ ����� 2 �����:
    Neighbors_1(3,2) = Sites(y_1+2,x_1);
    % ������:
    if x_1-1 < 1
        Neighbors_1(3,3) = Sites(y_1,x_1-1+n_site);
    else
        Neighbors_1(3,3) = Sites(y_1,x_1-1);
    end
    % ����� ����� 2 �����:
    if y_1-2 < 1
        Neighbors_1(3,4) = Sites(y_1,x_1);
    else
        Neighbors_1(3,4) = Sites(y_1-2,x_1);
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if x_1+2 > n_site % ��������� �������
        Neighbors_1(4,1) = Sites(y_1,x_1+2-n_site);
    else
        Neighbors_1(4,1) = Sites(y_1,x_1+2);
    end
    % ������ ����� 2 ����� �����:
    if x_1+1 > n_site
        Neighbors_1(4,2) = Sites(y_1+2,x_1+1-n_site);
    else
        Neighbors_1(4,2) = Sites(y_1+2,x_1+1);
    end
    % ������ ����� 2 ����� ������:
    if x_1-1 < 1
        Neighbors_1(4,3) = Sites(y_1+2,x_1-1+n_site);
    else
        Neighbors_1(4,3) = Sites(y_1+2,x_1-1);
    end
    % ������ ����� 2 �����:
    if x_1-2 < 1
        Neighbors_1(4,4) = Sites(y_1,x_1-2+n_site);
    else
        Neighbors_1(4,4) = Sites(y_1,x_1-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if x_1+2 > n_site
        Neighbors_1(5,1) = Sites(y_1+1,x_1+2-n_site);
    else
        Neighbors_1(5,1) = Sites(y_1+1,x_1+2);
    end
    % ������ ����� 3 ����� �����
    if x_1+1 > n_site
        Neighbors_1(5,2) = Sites(y_1+3,x_1+1-n_site);
    else
        Neighbors_1(5,2) = Sites(y_1+3,x_1+1);
    end
    % ������ ����� 3 ����� ������
    if x_1-1 < 1
        Neighbors_1(5,3) = Sites(y_1+3,x_1-1+n_site);
    else
        Neighbors_1(5,3) = Sites(y_1+3,x_1-1);
    end
    % ������ ������ ����� 2 �����
    if x_1-2 < 1
        Neighbors_1(5,4) = Sites(y_1+1,x_1-2+n_site);
    else
        Neighbors_1(5,4) = Sites(y_1+1,x_1-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors_1(5,9) = Sites(y_1+3,x_1);
    % ����� ����� 3 �����:
    if y_1-3 < 1
        Neighbors_1(5,10) = Sites(y_1,x_1);
    else
        Neighbors_1(5,10) = Sites(y_1-3,x_1);
    end
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if x_1+2 > n_site
        Neighbors_1(6,1) = Sites(y_1+2,x_1+2-n_site);
    else
        Neighbors_1(6,1) = Sites(y_1+2,x_1+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if x_1-2 < 1
        Neighbors_1(6,2) = Sites(y_1+2,x_1-2+n_site);
    else
        Neighbors_1(6,2) = Sites(y_1+2,x_1-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if x_1+3 > n_site
    %     Neighbors_1(7,1) = Sites(y_1,x_1+3-n_site);
    % else
    %     Neighbors_1(7,1) = Sites(y_1,x_1+3);
    % end
    % ������ ����� 4 �����
    if y_1+4 > size(Sites,1)
        Neighbors_1(7,2) = 0;
        Diff(1) = 3;
    else
        Neighbors_1(7,2) = Sites(y_1+4,x_1);
    end
    % % ������ ����� 3 �����
    % if x_1-3 < 1
    %     Neighbors_1(7,3) = Sites(y_1,x_1-3+n_site);
    % else
    %     Neighbors_1(7,3) = Sites(y_1,x_1-3);
    % end
    % ����� ����� 4 �����:
    if y_1-4 < 1
        Neighbors_1(7,4) = Sites(y_1,x_1);
    else
        Neighbors_1(7,4) = Sites(y_1-4,x_1);
    end
    
    % 2 - ������
    
    Neighbors_2 = zeros(7,10);
    
    x_2 = Species(i2,5);
    y_2 = Species(i2,6)+1;
    
    if Sites(y_2,x_2) == 0 % ���� ������� �� ������
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % ���� ����� ������� ����
        if sp_type ~= round(10*(Sites(y_2,x_2)-fix(Sites(y_2,x_2))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_2,x_2);
            Diff(2) = 2;
            % ���� �����������
        else
            if make_pause == 1 % �������� �� ������ ������
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_2,x_2)
                pause
            end % � ���� ��� � ����, �� �������� � ��� ������� ����������
            Diff(2) = 0;
        end
    end
    
    % 1-� ��:
    % ������:
    Neighbors_2(1,1) = Sites(y_2+1,x_2); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if x_2-1 < 1
        if y_2-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors_2(1,2) = Sites(y_2,x_2-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if x_2+1 > n_site
        Neighbors_2(2,1) = Sites(y_2+1,x_2+1-n_site);
    else
        Neighbors_2(2,1) = Sites(y_2+1,x_2+1);
    end
    % ������ ������:
    if x_2-1 < 1
        Neighbors_2(2,2) = Sites(y_2+1,x_2-1+n_site);
    else
        Neighbors_2(2,2) = Sites(y_2+1,x_2-1);
    end
    % �����:
    if y_2-1 < 1
        Neighbors_2(2,3) = Sites(y_2,x_2);
    else
        Neighbors_2(2,3) = Sites(y_2-1,x_2);
    end
    
    % 3-� ��:
    % �����:
    if x_2+1 > n_site
        Neighbors_2(3,1) = Sites(y_2,x_2+1-n_site);
    elseif Sites(y_2,x_2+1) ~= 0
        Neighbors_2(3,1) = Sites(y_2,x_2+1);
    end
    % ������ ����� 2 �����:
    Neighbors_2(3,2) = Sites(y_2+2,x_2);
    % ������:
    if x_2-1 < 1
        Neighbors_2(3,3) = Sites(y_2,x_2-1+n_site);
    else
        Neighbors_2(3,3) = Sites(y_2,x_2-1);
    end
    % ����� ����� 2 �����:
    if y_2-2 < 1
        Neighbors_2(3,4) = Sites(y_2,x_2);
    else
        Neighbors_2(3,4) = Sites(y_2-2,x_2);
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if x_2+2 > n_site % ��������� �������
        Neighbors_2(4,1) = Sites(y_2,x_2+2-n_site);
    else
        Neighbors_2(4,1) = Sites(y_2,x_2+2);
    end
    % ������ ����� 2 ����� �����:
    if x_2+1 > n_site
        Neighbors_2(4,2) = Sites(y_2+2,x_2+1-n_site);
    else
        Neighbors_2(4,2) = Sites(y_2+2,x_2+1);
    end
    % ������ ����� 2 ����� ������:
    if x_2-1 < 1
        Neighbors_2(4,3) = Sites(y_2+2,x_2-1+n_site);
    else
        Neighbors_2(4,3) = Sites(y_2+2,x_2-1);
    end
    % ������ ����� 2 �����:
    if x_2-2 < 1
        Neighbors_2(4,4) = Sites(y_2,x_2-2+n_site);
    else
        Neighbors_2(4,4) = Sites(y_2,x_2-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if x_2+2 > n_site
        Neighbors_2(5,1) = Sites(y_2+1,x_2+2-n_site);
    else
        Neighbors_2(5,1) = Sites(y_2+1,x_2+2);
    end
    % ������ ����� 3 ����� �����
    if x_2+1 > n_site
        Neighbors_2(5,2) = Sites(y_2+3,x_2+1-n_site);
    else
        Neighbors_2(5,2) = Sites(y_2+3,x_2+1);
    end
    % ������ ����� 3 ����� ������
    if x_2-1 < 1
        Neighbors_2(5,3) = Sites(y_2+3,x_2-1+n_site);
    else
        Neighbors_2(5,3) = Sites(y_2+3,x_2-1);
    end
    % ������ ������ ����� 2 �����
    if x_2-2 < 1
        Neighbors_2(5,4) = Sites(y_2+1,x_2-2+n_site);
    else
        Neighbors_2(5,4) = Sites(y_2+1,x_2-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors_2(5,9) = Sites(y_2+3,x_2);
    % ����� ����� 3 �����:
    if y_2-3 < 1
        Neighbors_2(5,10) = Sites(y_2,x_2);
    else
        Neighbors_2(5,10) = Sites(y_2-3,x_2);
    end
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if x_2+2 > n_site
        Neighbors_2(6,1) = Sites(y_2+2,x_2+2-n_site);
    else
        Neighbors_2(6,1) = Sites(y_2+2,x_2+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if x_2-2 < 1
        Neighbors_2(6,2) = Sites(y_2+2,x_2-2+n_site);
    else
        Neighbors_2(6,2) = Sites(y_2+2,x_2-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if x_2+3 > n_site
    %     Neighbors_2(7,1) = Sites(y_2,x_2+3-n_site);
    % else
    %     Neighbors_2(7,1) = Sites(y_2,x_2+3);
    % end
    % ������ ����� 4 �����
    if y_2+4 > size(Sites,1)
        Neighbors_2(7,2) = 0;
        Diff(2) = 3;
    else
        Neighbors_2(7,2) = Sites(y_2+4,x_2);
    end
    % % ������ ����� 3 �����
    % if x_2-3 < 1
    %     Neighbors_2(7,3) = Sites(y_2,x_2-3+n_site);
    % else
    %     Neighbors_2(7,3) = Sites(y_2,x_2-3);
    % end
    % ����� ����� 4 �����:
    if y_2-4 < 1
        Neighbors_2(7,4) = Sites(y_2,x_2);
    else
        Neighbors_2(7,4) = Sites(y_2-4,x_2);
    end
    
    % 3 - ������ ������
    
    Neighbors_3 = zeros(7,10);
    
    if Species(i2,5)-1 < 1
        x_3 = Species(i2,5)-1+n_site;
    else
        x_3 = Species(i2,5)-1;
    end
    y_3 = Species(i2,6)+1;
    
    if Sites(y_3,x_3) == 0 % ���� ������� �� ������
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % ���� ����� ������� ����
        if sp_type ~= round(10*(Sites(y_3,x_3)-fix(Sites(y_3,x_3))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_3,x_3);
            Diff(3) = 2;
            % ���� �����������
        else
            if make_pause == 1 % �������� �� ������ ������
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_3,x_3)
                pause
            end % � ���� ��� � ����, �� �������� � ��� ������� ����������
            Diff(3) = 0;
        end
    end
    
    % 1-� ��:
    % ������:
    Neighbors_3(1,1) = Sites(y_3+1,x_3); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if x_3-1 < 1
        if y_3-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors_3(1,2) = Sites(y_3,x_3-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if x_3+1 > n_site
        Neighbors_3(2,1) = Sites(y_3+1,x_3+1-n_site);
    else
        Neighbors_3(2,1) = Sites(y_3+1,x_3+1);
    end
    % ������ ������:
    if x_3-1 < 1
        Neighbors_3(2,2) = Sites(y_3+1,x_3-1+n_site);
    else
        Neighbors_3(2,2) = Sites(y_3+1,x_3-1);
    end
    % �����:
    if y_3-1 < 1
        Neighbors_3(2,3) = Sites(y_3,x_3);
    else
        Neighbors_3(2,3) = Sites(y_3-1,x_3);
    end
    
    % 3-� ��:
    % �����:
    if x_3+1 > n_site
        Neighbors_3(3,1) = Sites(y_3,x_3+1-n_site);
    elseif Sites(y_3,x_3+1) ~= 0
        Neighbors_3(3,1) = Sites(y_3,x_3+1);
    end
    % ������ ����� 2 �����:
    Neighbors_3(3,2) = Sites(y_3+2,x_3);
    % ������:
    if x_3-1 < 1
        Neighbors_3(3,3) = Sites(y_3,x_3-1+n_site);
    else
        Neighbors_3(3,3) = Sites(y_3,x_3-1);
    end
    % ����� ����� 2 �����:
    if y_3-2 < 1
        Neighbors_3(3,4) = Sites(y_3,x_3);
    else
        Neighbors_3(3,4) = Sites(y_3-2,x_3);
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if x_3+2 > n_site % ��������� �������
        Neighbors_3(4,1) = Sites(y_3,x_3+2-n_site);
    else
        Neighbors_3(4,1) = Sites(y_3,x_3+2);
    end
    % ������ ����� 2 ����� �����:
    if x_3+1 > n_site
        Neighbors_3(4,2) = Sites(y_3+2,x_3+1-n_site);
    else
        Neighbors_3(4,2) = Sites(y_3+2,x_3+1);
    end
    % ������ ����� 2 ����� ������:
    if x_3-1 < 1
        Neighbors_3(4,3) = Sites(y_3+2,x_3-1+n_site);
    else
        Neighbors_3(4,3) = Sites(y_3+2,x_3-1);
    end
    % ������ ����� 2 �����:
    if x_3-2 < 1
        Neighbors_3(4,4) = Sites(y_3,x_3-2+n_site);
    else
        Neighbors_3(4,4) = Sites(y_3,x_3-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if x_3+2 > n_site
        Neighbors_3(5,1) = Sites(y_3+1,x_3+2-n_site);
    else
        Neighbors_3(5,1) = Sites(y_3+1,x_3+2);
    end
    % ������ ����� 3 ����� �����
    if x_3+1 > n_site
        Neighbors_3(5,2) = Sites(y_3+3,x_3+1-n_site);
    else
        Neighbors_3(5,2) = Sites(y_3+3,x_3+1);
    end
    % ������ ����� 3 ����� ������
    if x_3-1 < 1
        Neighbors_3(5,3) = Sites(y_3+3,x_3-1+n_site);
    else
        Neighbors_3(5,3) = Sites(y_3+3,x_3-1);
    end
    % ������ ������ ����� 2 �����
    if x_3-2 < 1
        Neighbors_3(5,4) = Sites(y_3+1,x_3-2+n_site);
    else
        Neighbors_3(5,4) = Sites(y_3+1,x_3-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors_3(5,9) = Sites(y_3+3,x_3);
    % ����� ����� 3 �����:
    if y_3-3 < 1
        Neighbors_3(5,10) = Sites(y_3,x_3);
    else
        Neighbors_3(5,10) = Sites(y_3-3,x_3);
    end
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if x_3+2 > n_site
        Neighbors_3(6,1) = Sites(y_3+2,x_3+2-n_site);
    else
        Neighbors_3(6,1) = Sites(y_3+2,x_3+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if x_3-2 < 1
        Neighbors_3(6,2) = Sites(y_3+2,x_3-2+n_site);
    else
        Neighbors_3(6,2) = Sites(y_3+2,x_3-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if x_3+3 > n_site
    %     Neighbors_3(7,1) = Sites(y_3,x_3+3-n_site);
    % else
    %     Neighbors_3(7,1) = Sites(y_3,x_3+3);
    % end
    % ������ ����� 4 �����
    if y_3+4 > size(Sites,1)
        Neighbors_3(7,2) = 0;
        Diff(3) = 3;
    else
        Neighbors_3(7,2) = Sites(y_3+4,x_3);
    end
    % % ������ ����� 3 �����
    % if x_3-3 < 1
    %     Neighbors_3(7,3) = Sites(y_3,x_3-3+n_site);
    % else
    %     Neighbors_3(7,3) = Sites(y_3,x_3-3);
    % end
    % ����� ����� 4 �����:
    if y_3-4 < 1
        Neighbors_3(7,4) = Sites(y_3,x_3);
    else
        Neighbors_3(7,4) = Sites(y_3-4,x_3);
    end
    
    % 4 - ������ �����
    
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
    
    if Sites(y_4,x_4) == 0 % ���� ������� �� ������
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % ���� ����� ������� ����
        if sp_type ~= round(10*(Sites(y_4,x_4)-fix(Sites(y_4,x_4))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_4,x_4);
            Diff(4) = 2;
            % ���� �����������
        else
            if make_pause == 1 % �������� �� ������ ������
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_4,x_4)
                pause
            end % � ���� ��� � ����, �� �������� � ��� ������� ����������
            Diff(4) = 0;
        end
    end
    
    % 1-� ��:
    % ������:
    Neighbors_4(1,1) = Sites(y_4+1,x_4); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if x_4-1 < 1
        if y_4-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors_4(1,2) = Sites(y_4,x_4-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if x_4+1 > n_site
        Neighbors_4(2,1) = Sites(y_4+1,x_4+1-n_site);
    else
        Neighbors_4(2,1) = Sites(y_4+1,x_4+1);
    end
    % ������ ������:
    if x_4-1 < 1
        Neighbors_4(2,2) = Sites(y_4+1,x_4-1+n_site);
    else
        Neighbors_4(2,2) = Sites(y_4+1,x_4-1);
    end
    % �����:
    if y_4-1 < 1
        Neighbors_4(2,3) = Sites(y_4,x_4);
    else
        Neighbors_4(2,3) = Sites(y_4-1,x_4);
    end
    
    % 3-� ��:
    % �����:
    if x_4+1 > n_site
        Neighbors_4(3,1) = Sites(y_4,x_4+1-n_site);
    elseif Sites(y_4,x_4+1) ~= 0
        Neighbors_4(3,1) = Sites(y_4,x_4+1);
    end
    % ������ ����� 2 �����:
    Neighbors_4(3,2) = Sites(y_4+2,x_4);
    % ������:
    if x_4-1 < 1
        Neighbors_4(3,3) = Sites(y_4,x_4-1+n_site);
    else
        Neighbors_4(3,3) = Sites(y_4,x_4-1);
    end
    % ����� ����� 2 �����:
    if y_4-2 < 1
        Neighbors_4(3,4) = Sites(y_4,x_4);
    else
        Neighbors_4(3,4) = Sites(y_4-2,x_4);
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if x_4+2 > n_site % ��������� �������
        Neighbors_4(4,1) = Sites(y_4,x_4+2-n_site);
    else
        Neighbors_4(4,1) = Sites(y_4,x_4+2);
    end
    % ������ ����� 2 ����� �����:
    if x_4+1 > n_site
        Neighbors_4(4,2) = Sites(y_4+2,x_4+1-n_site);
    else
        Neighbors_4(4,2) = Sites(y_4+2,x_4+1);
    end
    % ������ ����� 2 ����� ������:
    if x_4-1 < 1
        Neighbors_4(4,3) = Sites(y_4+2,x_4-1+n_site);
    else
        Neighbors_4(4,3) = Sites(y_4+2,x_4-1);
    end
    % ������ ����� 2 �����:
    if x_4-2 < 1
        Neighbors_4(4,4) = Sites(y_4,x_4-2+n_site);
    else
        Neighbors_4(4,4) = Sites(y_4,x_4-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if x_4+2 > n_site
        Neighbors_4(5,1) = Sites(y_4+1,x_4+2-n_site);
    else
        Neighbors_4(5,1) = Sites(y_4+1,x_4+2);
    end
    % ������ ����� 3 ����� �����
    if x_4+1 > n_site
        Neighbors_4(5,2) = Sites(y_4+3,x_4+1-n_site);
    else
        Neighbors_4(5,2) = Sites(y_4+3,x_4+1);
    end
    % ������ ����� 3 ����� ������
    if x_4-1 < 1
        Neighbors_4(5,3) = Sites(y_4+3,x_4-1+n_site);
    else
        Neighbors_4(5,3) = Sites(y_4+3,x_4-1);
    end
    % ������ ������ ����� 2 �����
    if x_4-2 < 1
        Neighbors_4(5,4) = Sites(y_4+1,x_4-2+n_site);
    else
        Neighbors_4(5,4) = Sites(y_4+1,x_4-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors_4(5,9) = Sites(y_4+3,x_4);
    % ����� ����� 3 �����:
    if y_4-3 < 1
        Neighbors_4(5,10) = Sites(y_4,x_4);
    else
        Neighbors_4(5,10) = Sites(y_4-3,x_4);
    end
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if x_4+2 > n_site
        Neighbors_4(6,1) = Sites(y_4+2,x_4+2-n_site);
    else
        Neighbors_4(6,1) = Sites(y_4+2,x_4+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if x_4-2 < 1
        Neighbors_4(6,2) = Sites(y_4+2,x_4-2+n_site);
    else
        Neighbors_4(6,2) = Sites(y_4+2,x_4-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if x_4+3 > n_site
    %     Neighbors_4(7,1) = Sites(y_4,x_4+3-n_site);
    % else
    %     Neighbors_4(7,1) = Sites(y_4,x_4+3);
    % end
    % ������ ����� 4 �����
    if y_4+4 > size(Sites,1)
        Neighbors_4(7,2) = 0;
        Diff(4) = 3;
    else
        Neighbors_4(7,2) = Sites(y_4+4,x_4);
    end
    % % ������ ����� 3 �����
    % if x_4-3 < 1
    %     Neighbors_4(7,3) = Sites(y_4,x_4-3+n_site);
    % else
    %     Neighbors_4(7,3) = Sites(y_4,x_4-3);
    % end
    % ����� ����� 4 �����:
    if y_4-4 < 1
        Neighbors_4(7,4) = Sites(y_4,x_4);
    else
        Neighbors_4(7,4) = Sites(y_4-4,x_4);
    end
    
    % 5 - �����
    
    Neighbors_5 = zeros(7,10);
    
    x_5 = Species(i2,5);
    if Species(i2,6)-1 < 1
        y_5 = Species(i2,6);
    else
        y_5 = Species(i2,6)-1;
    end
    
    if Sites(y_5,x_5) == 0 % ���� ������� �� ������
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % ���� ����� ������� ����
        if sp_type ~= round(10*(Sites(y_5,x_5)-fix(Sites(y_5,x_5))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_5,x_5);
            Diff(5) = 2;
            % ���� �����������
        else
            if make_pause == 1 % �������� �� ������ ������
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_5,x_5)
                pause
            end % � ���� ��� � ����, �� �������� � ��� ������� ����������
            Diff(5) = 0;
        end
    end
    
    % 1-� ��:
    % ������:
    Neighbors_5(1,1) = Sites(y_5+1,x_5); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if x_5-1 < 1
        if y_5-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors_5(1,2) = Sites(y_5,x_5-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if x_5+1 > n_site
        Neighbors_5(2,1) = Sites(y_5+1,x_5+1-n_site);
    else
        Neighbors_5(2,1) = Sites(y_5+1,x_5+1);
    end
    % ������ ������:
    if x_5-1 < 1
        Neighbors_5(2,2) = Sites(y_5+1,x_5-1+n_site);
    else
        Neighbors_5(2,2) = Sites(y_5+1,x_5-1);
    end
    % �����:
    if y_5-1 < 1
        Neighbors_5(2,3) = Sites(y_5,x_5);
    else
        Neighbors_5(2,3) = Sites(y_5-1,x_5);
    end
    
    % 3-� ��:
    % �����:
    if x_5+1 > n_site
        Neighbors_5(3,1) = Sites(y_5,x_5+1-n_site);
    elseif Sites(y_5,x_5+1) ~= 0
        Neighbors_5(3,1) = Sites(y_5,x_5+1);
    end
    % ������ ����� 2 �����:
    Neighbors_5(3,2) = Sites(y_5+2,x_5);
    % ������:
    if x_5-1 < 1
        Neighbors_5(3,3) = Sites(y_5,x_5-1+n_site);
    else
        Neighbors_5(3,3) = Sites(y_5,x_5-1);
    end
    % ����� ����� 2 �����:
    if y_5-2 < 1
        Neighbors_5(3,4) = Sites(y_5,x_5);
    else
        Neighbors_5(3,4) = Sites(y_5-2,x_5);
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if x_5+2 > n_site % ��������� �������
        Neighbors_5(4,1) = Sites(y_5,x_5+2-n_site);
    else
        Neighbors_5(4,1) = Sites(y_5,x_5+2);
    end
    % ������ ����� 2 ����� �����:
    if x_5+1 > n_site
        Neighbors_5(4,2) = Sites(y_5+2,x_5+1-n_site);
    else
        Neighbors_5(4,2) = Sites(y_5+2,x_5+1);
    end
    % ������ ����� 2 ����� ������:
    if x_5-1 < 1
        Neighbors_5(4,3) = Sites(y_5+2,x_5-1+n_site);
    else
        Neighbors_5(4,3) = Sites(y_5+2,x_5-1);
    end
    % ������ ����� 2 �����:
    if x_5-2 < 1
        Neighbors_5(4,4) = Sites(y_5,x_5-2+n_site);
    else
        Neighbors_5(4,4) = Sites(y_5,x_5-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if x_5+2 > n_site
        Neighbors_5(5,1) = Sites(y_5+1,x_5+2-n_site);
    else
        Neighbors_5(5,1) = Sites(y_5+1,x_5+2);
    end
    % ������ ����� 3 ����� �����
    if x_5+1 > n_site
        Neighbors_5(5,2) = Sites(y_5+3,x_5+1-n_site);
    else
        Neighbors_5(5,2) = Sites(y_5+3,x_5+1);
    end
    % ������ ����� 3 ����� ������
    if x_5-1 < 1
        Neighbors_5(5,3) = Sites(y_5+3,x_5-1+n_site);
    else
        Neighbors_5(5,3) = Sites(y_5+3,x_5-1);
    end
    % ������ ������ ����� 2 �����
    if x_5-2 < 1
        Neighbors_5(5,4) = Sites(y_5+1,x_5-2+n_site);
    else
        Neighbors_5(5,4) = Sites(y_5+1,x_5-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors_5(5,9) = Sites(y_5+3,x_5);
    % ����� ����� 3 �����:
    if y_5-3 < 1
        Neighbors_5(5,10) = Sites(y_5,x_5);
    else
        Neighbors_5(5,10) = Sites(y_5-3,x_5);
    end
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if x_5+2 > n_site
        Neighbors_5(6,1) = Sites(y_5+2,x_5+2-n_site);
    else
        Neighbors_5(6,1) = Sites(y_5+2,x_5+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if x_5-2 < 1
        Neighbors_5(6,2) = Sites(y_5+2,x_5-2+n_site);
    else
        Neighbors_5(6,2) = Sites(y_5+2,x_5-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if x_5+3 > n_site
    %     Neighbors_5(7,1) = Sites(y_5,x_5+3-n_site);
    % else
    %     Neighbors_5(7,1) = Sites(y_5,x_5+3);
    % end
    % ������ ����� 4 �����
    if y_5+4 > size(Sites,1)
        Neighbors_5(7,2) = 0;
        Diff(5) = 3;
    else
        Neighbors_5(7,2) = Sites(y_5+4,x_5);
    end
    % % ������ ����� 3 �����
    % if x_5-3 < 1
    %     Neighbors_5(7,3) = Sites(y_5,x_5-3+n_site);
    % else
    %     Neighbors_5(7,3) = Sites(y_5,x_5-3);
    % end
    % ����� ����� 4 �����:
    if y_5-4 < 1
        Neighbors_5(7,4) = Sites(y_5,x_5);
    else
        Neighbors_5(7,4) = Sites(y_5-4,x_5);
    end
    
    % 6 - ����� �����
    
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
    
    if Sites(y_6,x_6) == 0 % ���� ������� �� ������
        Sites(Species(i2,6),Species(i2,5)) = 0;
    else
        % ���� ����� ������� ����
        if sp_type ~= round(10*(Sites(y_6,x_6)-fix(Sites(y_6,x_6))))/10
            Sites(Species(i2,6),Species(i2,5)) = Sites(y_6,x_6);
            Diff(6) = 2;
            % ���� �����������
        else
            if make_pause == 1 % �������� �� ������ ������
                Sites(Species(i2,6),Species(i2,5))
                Sites(y_6,x_6)
                pause
            end % � ���� ��� � ����, �� �������� � ��� ������� ����������
            Diff(6) = 0;
        end
    end
    
    % 1-� ��:
    % ������:
    Neighbors_6(1,1) = Sites(y_6+1,x_6); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if x_6-1 < 1
        if y_6-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors_6(1,2) = Sites(y_6,x_6-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if x_6+1 > n_site
        Neighbors_6(2,1) = Sites(y_6+1,x_6+1-n_site);
    else
        Neighbors_6(2,1) = Sites(y_6+1,x_6+1);
    end
    % ������ ������:
    if x_6-1 < 1
        Neighbors_6(2,2) = Sites(y_6+1,x_6-1+n_site);
    else
        Neighbors_6(2,2) = Sites(y_6+1,x_6-1);
    end
    % �����:
    if y_6-1 < 1
        Neighbors_6(2,3) = Sites(y_6,x_6);
    else
        Neighbors_6(2,3) = Sites(y_6-1,x_6);
    end
    
    % 3-� ��:
    % �����:
    if x_6+1 > n_site
        Neighbors_6(3,1) = Sites(y_6,x_6+1-n_site);
    elseif Sites(y_6,x_6+1) ~= 0
        Neighbors_6(3,1) = Sites(y_6,x_6+1);
    end
    % ������ ����� 2 �����:
    Neighbors_6(3,2) = Sites(y_6+2,x_6);
    % ������:
    if x_6-1 < 1
        Neighbors_6(3,3) = Sites(y_6,x_6-1+n_site);
    else
        Neighbors_6(3,3) = Sites(y_6,x_6-1);
    end
    % ����� ����� 2 �����:
    if y_6-2 < 1
        Neighbors_6(3,4) = Sites(y_6,x_6);
    else
        Neighbors_6(3,4) = Sites(y_6-2,x_6);
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if x_6+2 > n_site % ��������� �������
        Neighbors_6(4,1) = Sites(y_6,x_6+2-n_site);
    else
        Neighbors_6(4,1) = Sites(y_6,x_6+2);
    end
    % ������ ����� 2 ����� �����:
    if x_6+1 > n_site
        Neighbors_6(4,2) = Sites(y_6+2,x_6+1-n_site);
    else
        Neighbors_6(4,2) = Sites(y_6+2,x_6+1);
    end
    % ������ ����� 2 ����� ������:
    if x_6-1 < 1
        Neighbors_6(4,3) = Sites(y_6+2,x_6-1+n_site);
    else
        Neighbors_6(4,3) = Sites(y_6+2,x_6-1);
    end
    % ������ ����� 2 �����:
    if x_6-2 < 1
        Neighbors_6(4,4) = Sites(y_6,x_6-2+n_site);
    else
        Neighbors_6(4,4) = Sites(y_6,x_6-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if x_6+2 > n_site
        Neighbors_6(5,1) = Sites(y_6+1,x_6+2-n_site);
    else
        Neighbors_6(5,1) = Sites(y_6+1,x_6+2);
    end
    % ������ ����� 3 ����� �����
    if x_6+1 > n_site
        Neighbors_6(5,2) = Sites(y_6+3,x_6+1-n_site);
    else
        Neighbors_6(5,2) = Sites(y_6+3,x_6+1);
    end
    % ������ ����� 3 ����� ������
    if x_6-1 < 1
        Neighbors_6(5,3) = Sites(y_6+3,x_6-1+n_site);
    else
        Neighbors_6(5,3) = Sites(y_6+3,x_6-1);
    end
    % ������ ������ ����� 2 �����
    if x_6-2 < 1
        Neighbors_6(5,4) = Sites(y_6+1,x_6-2+n_site);
    else
        Neighbors_6(5,4) = Sites(y_6+1,x_6-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors_6(5,9) = Sites(y_6+3,x_6);
    % ����� ����� 3 �����:
    if y_6-3 < 1
        Neighbors_6(5,10) = Sites(y_6,x_6);
    else
        Neighbors_6(5,10) = Sites(y_6-3,x_6);
    end
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if x_6+2 > n_site
        Neighbors_6(6,1) = Sites(y_6+2,x_6+2-n_site);
    else
        Neighbors_6(6,1) = Sites(y_6+2,x_6+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if x_6-2 < 1
        Neighbors_6(6,2) = Sites(y_6+2,x_6-2+n_site);
    else
        Neighbors_6(6,2) = Sites(y_6+2,x_6-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if x_6+3 > n_site
    %     Neighbors_6(7,1) = Sites(y_6,x_6+3-n_site);
    % else
    %     Neighbors_6(7,1) = Sites(y_6,x_6+3);
    % end
    % ������ ����� 4 �����
    if y_6+4 > size(Sites,1)
        Neighbors_6(7,2) = 0;
        Diff(6) = 3;
    else
        Neighbors_6(7,2) = Sites(y_6+4,x_6);
    end
    % % ������ ����� 3 �����
    % if x_6-3 < 1
    %     Neighbors_6(7,3) = Sites(y_6,x_6-3+n_site);
    % else
    %     Neighbors_6(7,3) = Sites(y_6,x_6-3);
    % end
    % ����� ����� 4 �����:
    if y_6-4 < 1
        Neighbors_6(7,4) = Sites(y_6,x_6);
    else
        Neighbors_6(7,4) = Sites(y_6-4,x_6);
    end
    
    
    Sites(Species(i2,6),Species(i2,5)) = temp_site; % ���������� �������� �������� ����
end