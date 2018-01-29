for fold=1:1
    % Энергия активации диффузии в позицию №6
    
    % Перенос страницы энергий из массива текущих соседей в массив потенциальных соседей:
    Neighbors_6(:,:,2) = Neighbors(:,:,2);
    
    
    % Ищем совпадения:
    
    for i9=1:size(Neighbors(:,:,1),2)
        
        for j9=1:size(Neighbors_6(:,:,1),2)
            
            
            if Neighbors(i6,j6,1) ~= 0
                neigh_type = Neighbors(i6,j6,1)-fix(Neighbors(i6,j6,1)); % сокращение для обозначения атома-соседа
                % Подстраховка на случай, если числа будут плохо
                % округляться
                if neigh_type > 0.09 && neigh_type < 0.11
                    neigh_type = 0.1;
                elseif neigh_type > 0.19 && neigh_type < 0.21
                    neigh_type = 0.2;
                elseif neigh_type > 0.29 && neigh_type < 0.31
                    neigh_type = 0.3;
                elseif neigh_type > 0.39 && neigh_type < 0.41
                    neigh_type = 0.4;
                else error('Другие типы частиц не задавались')
                end
            end
            
            
            % Переход из 1-й КС:
            if Neighbors(1,i9,1) ~= 0
                % 1-->1: если сосед из 1-й КС остался в 1-й КС:
                if Neighbors(1,i9,1) == Neighbors_6(1,j9,1)
                    Neighbors_6(1,i9,2) = 0; % значит разрыва с данным атомом нет, т.е. энергетический вклад удаляется
                end
                % 1-->2:
                if Neighbors(1,i9,1) == Neighbors_6(2,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_111-E_121);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_112-E_122);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_113-E_123);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_114-E_124);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_311-E_321);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_312-E_322);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_313-E_323);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_314-E_324);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_411-E_421);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_412-E_422);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_413-E_423);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_414-E_424);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 1-->3:
                if Neighbors(1,i9,1) == Neighbors_6(3,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_111-E_131);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_112-E_132);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_113-E_133);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_114-E_134);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_311-E_331);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_312-E_332);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_313-E_333);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_314-E_334);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_411-E_431);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_412-E_432);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_413-E_433);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_414-E_434);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 1-->4:
                if Neighbors(1,i9,1) == Neighbors_6(4,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_111-E_141);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_112-E_142);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_113-E_143);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_114-E_144);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_311-E_341);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_312-E_342);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_313-E_343);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_314-E_344);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_411-E_441);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_412-E_442);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_413-E_443);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_414-E_444);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 1-->5:
                if Neighbors(1,i9,1) == Neighbors_6(5,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_111-E_151);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_112-E_152);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_113-E_153);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_114-E_154);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_311-E_351);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_312-E_352);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_313-E_353);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_314-E_354);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_411-E_451);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_412-E_452);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_413-E_453);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_414-E_454);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 1-->6:
                if Neighbors(1,i9,1) == Neighbors_6(6,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_111-E_161);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_112-E_162);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_113-E_163);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_114-E_164);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_311-E_361);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_312-E_362);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_313-E_363);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_314-E_364);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_411-E_461);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_412-E_462);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_413-E_463);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_414-E_464);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 1-->7:
                if Neighbors(1,i9,1) == Neighbors_6(7,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_111-E_171);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_112-E_172);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_113-E_173);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_114-E_174);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_311-E_371);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_312-E_372);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_313-E_373);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_314-E_374);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(1,i9,2) = subplus(E_411-E_471);
                                case 0.2
                                    Neighbors_6(1,i9,2) = subplus(E_412-E_472);
                                case 0.3
                                    Neighbors_6(1,i9,2) = subplus(E_413-E_473);
                                case 0.4
                                    Neighbors_6(1,i9,2) = subplus(E_414-E_474);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
            end
            
            
            % Переход из 2-й КС:
            if Neighbors(2,i9,1) ~= 0
                % 2-->1: если сосед из 2-й КС попал в 1-ю КС:
                if Neighbors(2,i9,1) == Neighbors_6(1,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_121-E_111);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_122-E_112);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_123-E_113);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_124-E_114);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_321-E_311);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_322-E_312);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_323-E_313);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_324-E_314);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_421-E_411);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_422-E_412);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_423-E_413);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_424-E_414);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 2-->2:
                if Neighbors(2,i9,1) == Neighbors_6(2,j9,1)
                    Neighbors_6(2,i9,2) = 0;
                end
                % 2-->3:
                if Neighbors(2,i9,1) == Neighbors_6(3,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_121-E_131);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_122-E_132);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_123-E_133);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_124-E_134);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_321-E_331);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_322-E_332);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_323-E_333);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_324-E_334);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_421-E_431);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_422-E_432);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_423-E_433);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_424-E_434);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 2-->4:
                if Neighbors(2,i9,1) == Neighbors_6(4,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_121-E_141);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_122-E_142);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_123-E_143);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_124-E_144);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_321-E_341);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_322-E_342);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_323-E_343);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_324-E_344);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_421-E_441);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_422-E_442);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_423-E_443);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_424-E_444);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 2-->5:
                if Neighbors(2,i9,1) == Neighbors_6(5,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_121-E_151);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_122-E_152);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_123-E_153);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_124-E_154);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_321-E_351);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_322-E_352);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_323-E_353);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_324-E_354);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_421-E_451);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_422-E_452);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_423-E_453);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_424-E_454);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 2-->6:
                if Neighbors(2,i9,1) == Neighbors_6(6,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_121-E_161);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_122-E_162);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_123-E_163);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_124-E_164);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_321-E_361);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_322-E_362);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_323-E_363);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_324-E_364);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_421-E_461);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_422-E_462);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_423-E_463);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_424-E_464);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 2-->7:
                if Neighbors(2,i9,1) == Neighbors_6(7,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_121-E_171);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_122-E_172);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_123-E_173);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_124-E_174);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_321-E_371);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_322-E_372);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_323-E_373);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_324-E_374);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(2,i9,2) = subplus(E_421-E_471);
                                case 0.2
                                    Neighbors_6(2,i9,2) = subplus(E_422-E_472);
                                case 0.3
                                    Neighbors_6(2,i9,2) = subplus(E_423-E_473);
                                case 0.4
                                    Neighbors_6(2,i9,2) = subplus(E_424-E_474);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
            end
            
            
            % Переход из 3-й КС:
            if Neighbors(3,i9,1) ~= 0
                % 3-->1:
                if Neighbors(3,i9,1) == Neighbors_6(1,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_131-E_111);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_132-E_112);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_133-E_113);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_134-E_114);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_331-E_311);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_332-E_312);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_333-E_313);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_334-E_314);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_431-E_411);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_432-E_412);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_433-E_413);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_434-E_414);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 3-->2:
                if Neighbors(3,i9,1) == Neighbors_6(2,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_131-E_121);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_132-E_122);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_133-E_123);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_134-E_124);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_331-E_321);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_332-E_322);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_333-E_323);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_334-E_324);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_431-E_421);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_432-E_422);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_433-E_423);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_434-E_424);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 3-->3:
                if Neighbors(3,i9,1) == Neighbors_6(3,j9,1)
                    Neighbors_6(3,i9,2) = 0;
                end
                % 3-->4:
                if Neighbors(3,i9,1) == Neighbors_6(4,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_131-E_141);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_132-E_142);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_133-E_143);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_134-E_144);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_331-E_341);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_332-E_342);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_333-E_343);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_334-E_344);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_431-E_441);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_432-E_442);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_433-E_443);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_434-E_444);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 3-->5:
                if Neighbors(3,i9,1) == Neighbors_6(5,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_131-E_151);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_132-E_152);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_133-E_153);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_134-E_154);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_331-E_351);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_332-E_352);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_333-E_353);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_334-E_354);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_431-E_451);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_432-E_452);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_433-E_453);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_434-E_454);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 3-->6:
                if Neighbors(3,i9,1) == Neighbors_6(6,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_131-E_161);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_132-E_162);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_133-E_163);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_134-E_164);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_331-E_361);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_332-E_362);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_333-E_363);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_334-E_364);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_431-E_461);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_432-E_462);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_433-E_463);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_434-E_464);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 3-->7:
                if Neighbors(3,i9,1) == Neighbors_6(7,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_131-E_171);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_132-E_172);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_133-E_173);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_134-E_174);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_331-E_371);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_332-E_372);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_333-E_373);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_334-E_374);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(3,i9,2) = subplus(E_431-E_471);
                                case 0.2
                                    Neighbors_6(3,i9,2) = subplus(E_432-E_472);
                                case 0.3
                                    Neighbors_6(3,i9,2) = subplus(E_433-E_473);
                                case 0.4
                                    Neighbors_6(3,i9,2) = subplus(E_434-E_474);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
            end
            
            
            % Переход из 4-й КС:
            if Neighbors(4,i9,1) ~= 0
                % 4-->1:
                if Neighbors(4,i9,1) == Neighbors_6(1,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_141-E_111);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_142-E_112);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_143-E_113);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_144-E_114);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_341-E_311);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_342-E_312);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_343-E_313);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_344-E_314);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_441-E_411);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_442-E_412);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_443-E_413);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_444-E_414);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 4-->2:
                if Neighbors(4,i9,1) == Neighbors_6(2,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_141-E_121);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_142-E_122);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_143-E_123);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_144-E_124);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_341-E_321);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_342-E_322);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_343-E_323);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_344-E_324);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_441-E_421);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_442-E_422);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_443-E_423);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_444-E_424);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 4-->3:
                if Neighbors(4,i9,1) == Neighbors_6(3,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_141-E_131);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_142-E_132);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_143-E_133);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_144-E_134);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_341-E_331);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_342-E_332);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_343-E_333);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_344-E_334);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_441-E_431);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_442-E_432);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_443-E_433);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_444-E_434);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 4-->4:
                if Neighbors(4,i9,1) == Neighbors_6(4,j9,1)
                    Neighbors_6(4,i9,2) = 0;
                end
                % 4-->5:
                if Neighbors(4,i9,1) == Neighbors_6(5,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_141-E_151);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_142-E_152);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_143-E_153);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_144-E_154);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_341-E_351);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_342-E_352);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_343-E_353);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_344-E_354);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_441-E_451);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_442-E_452);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_443-E_453);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_444-E_454);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 4-->6:
                if Neighbors(4,i9,1) == Neighbors_6(6,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_141-E_161);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_142-E_162);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_143-E_163);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_144-E_164);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_341-E_361);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_342-E_362);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_343-E_363);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_344-E_364);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_441-E_461);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_442-E_462);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_443-E_463);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_444-E_464);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 4-->7:
                if Neighbors(4,i9,1) == Neighbors_6(7,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_141-E_171);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_142-E_172);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_143-E_173);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_144-E_174);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_341-E_371);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_342-E_372);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_343-E_373);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_344-E_374);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(4,i9,2) = subplus(E_441-E_471);
                                case 0.2
                                    Neighbors_6(4,i9,2) = subplus(E_442-E_472);
                                case 0.3
                                    Neighbors_6(4,i9,2) = subplus(E_443-E_473);
                                case 0.4
                                    Neighbors_6(4,i9,2) = subplus(E_444-E_474);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
            end
            
            
            % Переход из 5-й КС:
            if Neighbors(5,i9,1) ~= 0
                % 5-->1:
                if Neighbors(5,i9,1) == Neighbors_6(1,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_151-E_111);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_152-E_112);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_153-E_113);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_154-E_114);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_351-E_311);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_352-E_312);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_353-E_313);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_354-E_314);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_451-E_411);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_452-E_412);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_453-E_413);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_454-E_414);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 5-->2:
                if Neighbors(5,i9,1) == Neighbors_6(2,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_151-E_121);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_152-E_122);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_153-E_123);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_154-E_124);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_351-E_321);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_352-E_322);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_353-E_323);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_354-E_324);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_451-E_421);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_452-E_422);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_453-E_423);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_454-E_424);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 5-->3:
                if Neighbors(5,i9,1) == Neighbors_6(3,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_151-E_131);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_152-E_132);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_153-E_133);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_154-E_134);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_351-E_331);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_352-E_332);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_353-E_333);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_354-E_334);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_451-E_431);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_452-E_432);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_453-E_433);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_454-E_434);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 5-->4:
                if Neighbors(5,i9,1) == Neighbors_6(4,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_151-E_141);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_152-E_142);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_153-E_143);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_154-E_144);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_351-E_341);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_352-E_342);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_353-E_343);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_354-E_344);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_451-E_441);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_452-E_442);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_453-E_443);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_454-E_444);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 5-->5:
                if Neighbors(5,i9,1) == Neighbors_6(5,j9,1)
                    Neighbors_6(5,i9,2) = 0;
                end
                % 5-->6:
                if Neighbors(5,i9,1) == Neighbors_6(6,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_151-E_161);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_152-E_162);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_153-E_163);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_154-E_164);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_351-E_361);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_352-E_362);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_353-E_363);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_354-E_364);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_451-E_461);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_452-E_462);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_453-E_463);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_454-E_464);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 5-->7:
                if Neighbors(5,i9,1) == Neighbors_6(7,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_151-E_171);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_152-E_172);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_153-E_173);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_154-E_174);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_351-E_371);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_352-E_372);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_353-E_373);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_354-E_374);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(5,i9,2) = subplus(E_451-E_471);
                                case 0.2
                                    Neighbors_6(5,i9,2) = subplus(E_452-E_472);
                                case 0.3
                                    Neighbors_6(5,i9,2) = subplus(E_453-E_473);
                                case 0.4
                                    Neighbors_6(5,i9,2) = subplus(E_454-E_474);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
            end
            
            
            % Переход из 6-й КС:
            if Neighbors(6,i9,1) ~= 0
                % 6-->1:
                if Neighbors(6,i9,1) == Neighbors_6(1,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_161-E_111);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_162-E_112);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_163-E_113);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_164-E_114);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_361-E_311);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_362-E_312);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_363-E_313);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_364-E_314);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_461-E_411);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_462-E_412);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_463-E_413);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_464-E_414);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 6-->2:
                if Neighbors(6,i9,1) == Neighbors_6(2,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_161-E_121);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_162-E_122);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_163-E_123);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_164-E_124);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_361-E_321);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_362-E_322);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_363-E_323);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_364-E_324);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_461-E_421);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_462-E_422);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_463-E_423);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_464-E_424);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 6-->3:
                if Neighbors(6,i9,1) == Neighbors_6(3,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_161-E_131);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_162-E_132);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_163-E_133);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_164-E_134);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_361-E_331);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_362-E_332);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_363-E_333);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_364-E_334);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_461-E_431);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_462-E_432);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_463-E_433);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_464-E_434);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 6-->4:
                if Neighbors(6,i9,1) == Neighbors_6(4,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_161-E_141);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_162-E_142);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_163-E_143);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_164-E_144);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_361-E_341);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_362-E_342);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_363-E_343);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_364-E_344);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_461-E_441);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_462-E_442);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_463-E_443);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_464-E_444);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 6-->5:
                if Neighbors(6,i9,1) == Neighbors_6(5,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_161-E_151);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_162-E_152);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_163-E_153);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_164-E_154);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_361-E_351);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_362-E_352);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_363-E_353);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_364-E_354);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_461-E_451);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_462-E_452);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_463-E_453);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_464-E_454);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 6-->6:
                if Neighbors(6,i9,1) == Neighbors_6(6,j9,1)
                    Neighbors_6(6,i9,2) = 0;
                end
                % 6-->7:
                if Neighbors(6,i9,1) == Neighbors_6(7,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_161-E_171);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_162-E_172);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_163-E_173);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_164-E_174);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_361-E_371);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_362-E_372);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_363-E_373);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_364-E_374);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(6,i9,2) = subplus(E_461-E_471);
                                case 0.2
                                    Neighbors_6(6,i9,2) = subplus(E_462-E_472);
                                case 0.3
                                    Neighbors_6(6,i9,2) = subplus(E_463-E_473);
                                case 0.4
                                    Neighbors_6(6,i9,2) = subplus(E_464-E_474);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
            end
            
            
            % Переход из 7-й КС:
            if Neighbors(7,i9,1) ~= 0
                % 7-->1:
                if Neighbors(7,i9,1) == Neighbors_6(1,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_171-E_111);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_172-E_112);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_173-E_113);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_174-E_114);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_371-E_311);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_372-E_312);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_373-E_313);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_374-E_314);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_471-E_411);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_472-E_412);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_473-E_413);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_474-E_414);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 7-->2:
                if Neighbors(7,i9,1) == Neighbors_6(2,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_171-E_121);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_172-E_122);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_173-E_123);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_174-E_124);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_371-E_321);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_372-E_322);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_373-E_323);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_374-E_324);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_471-E_421);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_472-E_422);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_473-E_423);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_474-E_424);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 7-->3:
                if Neighbors(7,i9,1) == Neighbors_6(3,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_171-E_131);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_172-E_132);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_173-E_133);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_174-E_134);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_371-E_331);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_372-E_332);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_373-E_333);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_374-E_334);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_471-E_431);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_472-E_432);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_473-E_433);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_474-E_434);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 7-->4:
                if Neighbors(7,i9,1) == Neighbors_6(4,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_171-E_141);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_172-E_142);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_173-E_143);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_174-E_144);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_371-E_341);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_372-E_342);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_373-E_343);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_374-E_344);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_471-E_441);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_472-E_442);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_473-E_443);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_474-E_444);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 7-->5:
                if Neighbors(7,i9,1) == Neighbors_6(5,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_171-E_151);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_172-E_352);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_173-E_153);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_174-E_154);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_371-E_351);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_372-E_352);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_373-E_353);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_374-E_354);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_471-E_451);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_472-E_452);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_473-E_453);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_474-E_454);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 7-->6:
                if Neighbors(7,i9,1) == Neighbors_6(6,j9,1)
                    switch sp_type
                        case 0.1
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_171-E_161);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_172-E_162);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_173-E_163);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_174-E_164);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.2
                            error('Рано вводить As')
                        case 0.3
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_371-E_361);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_372-E_362);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_373-E_363);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_374-E_364);
                                otherwise error('Другого остатка быть не должно')
                            end
                        case 0.4
                            switch neigh_type
                                case 0.1
                                    Neighbors_6(7,i9,2) = subplus(E_471-E_461);
                                case 0.2
                                    Neighbors_6(7,i9,2) = subplus(E_472-E_462);
                                case 0.3
                                    Neighbors_6(7,i9,2) = subplus(E_473-E_463);
                                case 0.4
                                    Neighbors_6(7,i9,2) = subplus(E_474-E_464);
                                otherwise error('Другого остатка быть не должно')
                            end
                        otherwise error('Другого остатка быть не должно')
                    end
                end
                % 7-->7:
                if Neighbors(7,i9,1) == Neighbors_6(7,j9,1)
                    Neighbors_6(7,i9,2) = 0;
                end
            end
            
            
        end
    end
    
    % % Чтобы устранить сильную связь Ga-In, введём такое условие:
    % if Neighbors_6(4,:,1) ~= zeros(1,size(Neighbors_6,2)) % если в 4-й КС есть хоть атом,
    %     Neighbors_6(5,:,2) == zeros(1,size(Neighbors_6,2)); % то энергию в 5-й можно не учитывать, так как связи атомов 5-й КС уже как бы компенсированы атомами 4-й
    % end
    
    % Удалим 6-ю и 7-ю КС:
    % Neighbors_6(6,:,1) = zeros(1,10);
    % Neighbors_6(6,:,2) = zeros(1,10);
    % Neighbors_6(7,:,1) = zeros(1,10);
    % Neighbors_6(7,:,2) = zeros(1,10);
    
    E_dif_6 = sum(sum(Neighbors_6(:,:,2)));
    P_dif_6 = nu*exp(-E_dif_6/(k_B*T));
    En_dif(6) = E_dif_6;
    Prob_dif(6) = P_dif_6;
end