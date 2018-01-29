for fold=1:1
    
    % ������ ����������� ��������� �������. ������� �
    % ������ ����� ����������� ������������� ������
    % ��������������� ����� �� ������� �������. ��������
    % ������ �������, � ������� ����� �� 3 ���������
    % ��������� � 1-� ������ (�.�. 1-� ��), �� 3 -- ��
    % ������, �� 4 -- � �������, �� 6 -- � ��������,
    % �� 10 -- � �����, �� 4 -- � ������, �� 4 -- � �������.
    
    Neighbors = zeros(7,10);
    
    % 1-� ��:
    % ������:
    Neighbors(1,1) = Sites(Species(i2,6)+1,Species(i2,5)); % ��� ��������� �������, ��� ��� ������ �� ������ ������ ����� �����
    % ����� ������:
    if Species(i2,5)-1 < 1
        if Species(i2,6)-1 < 1  % ���� ���� �� �� ����� �� "���" ��������
            Neighbors(1,2) = Sites(Species(i2,6),Species(i2,5)-1+n_site); % �� ������ ��� �����: ����� ������� ����� ����� ����� ��������� �� ���
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
    % ����� �����:
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
    
    % 2-� ��:
    % ������ �����:
    if Species(i2,5)+1 > n_site
        Neighbors(2,1) = Sites(Species(i2,6)+1,Species(i2,5)+1-n_site);
    else
        Neighbors(2,1) = Sites(Species(i2,6)+1,Species(i2,5)+1);
    end
    % ������ ������:
    if Species(i2,5)-1 < 1
        Neighbors(2,2) = Sites(Species(i2,6)+1,Species(i2,5)-1+n_site);
    else
        Neighbors(2,2) = Sites(Species(i2,6)+1,Species(i2,5)-1);
    end
    % �����:
    if Species(i2,6)-1 < 1
        Neighbors(2,3) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(2,3) = Sites(Species(i2,6)-1,Species(i2,5));
    end
    
    % 3-� ��:
    % �����:
    if Species(i2,5)+1 > n_site
        Neighbors(3,1) = Sites(Species(i2,6),Species(i2,5)+1-n_site);
    elseif Sites(Species(i2,6),Species(i2,5)+1) ~= 0
        Neighbors(3,1) = Sites(Species(i2,6),Species(i2,5)+1);
    end
    % ������ ����� 2 �����:
    Neighbors(3,2) = Sites(Species(i2,6)+2,Species(i2,5));
    % ������:
    if Species(i2,5)-1 < 1
        Neighbors(3,3) = Sites(Species(i2,6),Species(i2,5)-1+n_site);
    else
        Neighbors(3,3) = Sites(Species(i2,6),Species(i2,5)-1);
    end
    % ����� ����� 2 �����:
    if Species(i2,6)-2 < 1
        Neighbors(3,4) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(3,4) = Sites(Species(i2,6)-2,Species(i2,5));
    end
    
    % 4-� ��:
    % ����� ����� 2 �����:
    if Species(i2,5)+2 > n_site % ��������� �������
        Neighbors(4,1) = Sites(Species(i2,6),Species(i2,5)+2-n_site);
    else
        Neighbors(4,1) = Sites(Species(i2,6),Species(i2,5)+2);
    end
    % ������ ����� 2 ����� �����:
    if Species(i2,5)+1 > n_site
        Neighbors(4,2) = Sites(Species(i2,6)+2,Species(i2,5)+1-n_site);
    else
        Neighbors(4,2) = Sites(Species(i2,6)+2,Species(i2,5)+1);
    end
    % ������ ����� 2 ����� ������:
    if Species(i2,5)-1 < 1
        Neighbors(4,3) = Sites(Species(i2,6)+2,Species(i2,5)-1+n_site);
    else
        Neighbors(4,3) = Sites(Species(i2,6)+2,Species(i2,5)-1);
    end
    % ������ ����� 2 �����:
    if Species(i2,5)-2 < 1
        Neighbors(4,4) = Sites(Species(i2,6),Species(i2,5)-2+n_site);
    else
        Neighbors(4,4) = Sites(Species(i2,6),Species(i2,5)-2);
    end
    % ����� ����� 2 ����� ������:
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
    % ����� ����� 2 ����� �����:
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
    
    % 5-� ��
    % ������ ����� ����� 2 �����
    if Species(i2,5)+2 > n_site
        Neighbors(5,1) = Sites(Species(i2,6)+1,Species(i2,5)+2-n_site);
    else
        Neighbors(5,1) = Sites(Species(i2,6)+1,Species(i2,5)+2);
    end
    % ������ ����� 3 ����� �����
    if Species(i2,5)+1 > n_site
        Neighbors(5,2) = Sites(Species(i2,6)+3,Species(i2,5)+1-n_site);
    else
        Neighbors(5,2) = Sites(Species(i2,6)+3,Species(i2,5)+1);
    end
    % ������ ����� 3 ����� ������
    if Species(i2,5)-1 < 1
        Neighbors(5,3) = Sites(Species(i2,6)+3,Species(i2,5)-1+n_site);
    else
        Neighbors(5,3) = Sites(Species(i2,6)+3,Species(i2,5)-1);
    end
    % ������ ������ ����� 2 �����
    if Species(i2,5)-2 < 1
        Neighbors(5,4) = Sites(Species(i2,6)+1,Species(i2,5)-2+n_site);
    else
        Neighbors(5,4) = Sites(Species(i2,6)+1,Species(i2,5)-2);
    end
    % ����� ������ ����� 2 �����
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
    % ����� ����� 3 ����� ������
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
    % ����� ����� 3 ����� �����
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
    % ����� ����� ����� 2 �����
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
    % ������ ����� 3 �����
    Neighbors(5,9) = Sites(Species(i2,6)+3,Species(i2,5));
    % ����� ����� 3 �����:
    if Species(i2,6)-3 < 1
        Neighbors(5,10) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(5,10) = Sites(Species(i2,6)-3,Species(i2,5));
    end
    
    
    % 6-� ��
    % ������ ����� 2 ����� ����� ����� 2 �����
    if Species(i2,5)+2 > n_site
        Neighbors(6,1) = Sites(Species(i2,6)+2,Species(i2,5)+2-n_site);
    else
        Neighbors(6,1) = Sites(Species(i2,6)+2,Species(i2,5)+2);
    end
    % ������ ����� 2 ����� ������ ����� 2 �����
    if Species(i2,5)-2 < 1
        Neighbors(6,2) = Sites(Species(i2,6)+2,Species(i2,5)-2+n_site);
    else
        Neighbors(6,2) = Sites(Species(i2,6)+2,Species(i2,5)-2);
    end
    % ����� ����� 2 ����� ������ ����� 2 �����
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
    % ����� ����� 2 ����� ����� ����� 2 �����
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
    
    % 7-� ��
    % % ����� ����� 3 �����
    % if Species(i2,5)+3 > n_site
    %     Neighbors(7,1) = Sites(Species(i2,6),Species(i2,5)+3-n_site);
    % else
    %     Neighbors(7,1) = Sites(Species(i2,6),Species(i2,5)+3);
    % end
    % ������ ����� 4 �����
    Neighbors(7,2) = Sites(Species(i2,6)+4,Species(i2,5));
    % % ������ ����� 3 �����
    % if Species(i2,5)-3 < 1
    %     Neighbors(7,3) = Sites(Species(i2,6),Species(i2,5)-3+n_site);
    % else
    %     Neighbors(7,3) = Sites(Species(i2,6),Species(i2,5)-3);
    % end
    % ����� ����� 4 �����:
    if Species(i2,6)-4 < 1
        Neighbors(7,4) = Sites(Species(i2,6),Species(i2,5));
    else
        Neighbors(7,4) = Sites(Species(i2,6)-4,Species(i2,5));
    end
    
end