for fold=1:1
    
    % �������� �������� �������:
    Neighbors(:,:,2) = zeros(7,10);
    
    % ���������� ������� ����� ����� �� ����� ����������:
    
    % ��������������� ����
    
    % ���� Ga
    if sp_type == 0.1
        for i6=1:size(Neighbors(:,:,1),1)
            for j6=1:size(Neighbors(:,:,1),2)
                
                if Neighbors(i6,j6,1) ~= 0
                    neigh_type = Neighbors(i6,j6,1)-fix(Neighbors(i6,j6,1)); % ���������� ��� ����������� �����-������
                    % ������������ �� ������, ���� ����� ����� �����
                    % �����������
                    if neigh_type > 0.09 && neigh_type < 0.11
                        neigh_type = 0.1;
                    elseif neigh_type > 0.19 && neigh_type < 0.21
                        neigh_type = 0.2;
                    elseif neigh_type > 0.29 && neigh_type < 0.31
                        neigh_type = 0.3;
                    elseif neigh_type > 0.39 && neigh_type < 0.41
                        neigh_type = 0.4;
                    else
                        error('������ ���� ������ �� ����������')
                    end
                end
                
                if Neighbors(i6,j6,1) ~= 0 % ������ ���� ����� �������, � �� ������ ����
                    if i6 == 1 % 1-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_111; % ��������������� �������� �������� ������� �����������
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_112;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_113;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_114;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 2 % 2-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_121;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_122;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_123;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_124;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 3 % 3-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_131;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_132;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_133;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_134;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 4 % 4-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_141;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_142;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_143;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_144;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 5 % 5-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_151;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_152;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_153;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_154;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 6 % 6-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_161;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_162;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_163;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_164;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 7 % 7-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_171;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_172;%����� ����� Ga_As
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_173;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_174;%����� ����� Ga_Al
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    else
                        error('����� ��������������� ����� �����, � � ���� ������ ������')
                    end
                end
            end
        end
    end
    
    % ���� As
    if sp_type == 0.2
        for i6=1:size(Neighbors(:,:,1),1)
            for j6=1:size(Neighbors(:,:,1),2)
                
                if Neighbors(i6,j6,1) ~= 0
                    neigh_type = Neighbors(i6,j6,1)-fix(Neighbors(i6,j6,1)); % ���������� ��� ����������� �����-������
                    % ������������ �� ������, ���� ����� ����� �����
                    % �����������
                    if neigh_type > 0.09 && neigh_type < 0.11
                        neigh_type = 0.1;
                    elseif neigh_type > 0.19 && neigh_type < 0.21
                        neigh_type = 0.2;
                    elseif neigh_type > 0.29 && neigh_type < 0.31
                        neigh_type = 0.3;
                    elseif neigh_type > 0.39 && neigh_type < 0.41
                        neigh_type = 0.4;
                    else
                        error('������ ���� ������ �� ����������')
                    end
                end
                
                if Neighbors(i6,j6,1) ~= 0 % ������ ���� ����� �������, � �� ������ ����
                    if i6 == 1 % 1-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_211; % ��������������� �������� �������� ������� �����������
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_212;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_213;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_214;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 2 % 2-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_221;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_222;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_223;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_224;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 3 % 3-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_231;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_232;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_233;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_234;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 4 % 4-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_241;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_242;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_243;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_244;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 5 % 5-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_251;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_252;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_253;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_254;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 6 % 6-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_261;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_262;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_263;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_264;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 7 % 7-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_271;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_272;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_273;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_274;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    else
                        error('����� ��������������� ����� �����, � � ���� ������ ������')
                    end
                end
            end
        end
    end
    
    % ���� In
    if sp_type == 0.3
        for i6=1:size(Neighbors(:,:,1),1)
            for j6=1:size(Neighbors(:,:,1),2)
                
                if Neighbors(i6,j6,1) ~= 0
                    neigh_type = Neighbors(i6,j6,1)-fix(Neighbors(i6,j6,1)); % ���������� ��� ����������� �����-������
                    % ������������ �� ������, ���� ����� ����� �����
                    % �����������
                    if neigh_type > 0.09 && neigh_type < 0.11
                        neigh_type = 0.1;
                    elseif neigh_type > 0.19 && neigh_type < 0.21
                        neigh_type = 0.2;
                    elseif neigh_type > 0.29 && neigh_type < 0.31
                        neigh_type = 0.3;
                    elseif neigh_type > 0.39 && neigh_type < 0.41
                        neigh_type = 0.4;
                    else
                        error('������ ���� ������ �� ����������')
                    end
                end
                
                if Neighbors(i6,j6,1) ~= 0 % ������ ���� ����� �������, � �� ������ ����
                    if i6 == 1 % 1-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_311; % ��������������� �������� �������� ������� �����������
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_312;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_313;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_314;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 2 % 2-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_321;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_322;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_323;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_324;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 3 % 3-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_331;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_332;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_333;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_334;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 4 % 4-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_341;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_342;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_343;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_344;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 5 % 5-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_351;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_352;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_353;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_354;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 6 % 6-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_361;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_362;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_363;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_364;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 7 % 7-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_371;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_372;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_373;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_374;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    else
                        error('����� ��������������� ����� �����, � � ���� ������ ������')
                    end
                end
            end
        end
    end
    
    % ���� Al
    if sp_type == 0.4
        for i6=1:size(Neighbors(:,:,1),1)
            for j6=1:size(Neighbors(:,:,1),2)
                
                if Neighbors(i6,j6,1) ~= 0
                    neigh_type = Neighbors(i6,j6,1)-fix(Neighbors(i6,j6,1)); % ���������� ��� ����������� �����-������
                    % ������������ �� ������, ���� ����� ����� �����
                    % �����������
                    if neigh_type > 0.09 && neigh_type < 0.11
                        neigh_type = 0.1;
                    elseif neigh_type > 0.19 && neigh_type < 0.21
                        neigh_type = 0.2;
                    elseif neigh_type > 0.29 && neigh_type < 0.31
                        neigh_type = 0.3;
                    elseif neigh_type > 0.39 && neigh_type < 0.41
                        neigh_type = 0.4;
                    else
                        error('������ ���� ������ �� ����������')
                    end
                end
                
                if Neighbors(i6,j6,1) ~= 0 % ������ ���� ����� �������, � �� ������ ����
                    if i6 == 1 % 1-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_411; % ��������������� �������� �������� ������� �����������
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_412;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_413;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_414;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 2 % 2-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_421;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_422;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_423;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_424;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 3 % 3-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_431;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_432;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_433;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_434;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 4 % 4-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_441;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_442;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_443;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_444;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 5 % 5-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_451;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_452;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_453;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_454;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 6 % 6-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_461;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_462;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_463;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_464;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    elseif i6 == 7 % 7-� ��
                        switch neigh_type % ���� �����
                            case 0.1 % Ga
                                Neighbors(i6,j6,2) = E_471;
                            case 0.2 % As
                                Neighbors(i6,j6,2) = E_472;
                            case 0.3 % In
                                Neighbors(i6,j6,2) = E_473;
                            case 0.4 % Al
                                Neighbors(i6,j6,2) = E_474;
                            otherwise
                                error('������ ���� ������ �� ����������')
                        end
                    else
                        error('����� ��������������� ����� �����, � � ���� ������ ������')
                    end
                end
            end
        end
    end
    
    E_bind = sum(sum(Neighbors(:,:,2)));
    if E_bind == 0
        nu = nu2; % ������� ��������� ���������� �����
        des = 0; % 0 - ������ ���������, 0.5 - ������������ ���������, 1 - ����������� ��������� (�� ���������)
    end
    
end