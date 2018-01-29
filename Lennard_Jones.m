for fold=1:1
    
    % Дистанция между рассматриваемыми атомами
    r1 = 0.245 * 10^-9; % атом-сосед находится в 1-й КС относительно рассматриваемого атома и т.д.
    r2 = 0.245 * 10^-9;
    r3 = 0.283 * 10^-9;
    r4 = 0.400 * 10^-9;
    r5 = (0.2*0.424 + 0.8*0.469) * 10^-9; % 0.424 % добавил весовые кэфы, т.к. ошибся, но по факту в 5-й КС 2 атома с р-ем 0.424 и 8 атомов - с 0.469
    r6 = 0.490 * 10^-9; % 0.469
    r7 = 0.565 * 10^-9; % 0.49
    
    % Наиболее оптимальное расстояние между атомами конкретной пары
    rmin_Ga_Ga = 0.556 * 10^-9; % м
    rmin_Ga_As = 0.245 * 10^-9; % м
    rmin_Ga_In = 0.443 * 10^-9; % м
    rmin_Ga_Al = 0.421 * 10^-9; % м
    rmin_As_As = 0.412 * 10^-9; % м
    rmin_As_In = 0.262 * 10^-9; % м
    rmin_As_Al = 0.245 * 10^-9; % м
    rmin_In_In = 0.330 * 10^-9; % м
    rmin_In_Al = 0.308 * 10^-9; % м
    rmin_Al_Al = 0.286 * 10^-9; % м
    
    % sigma
    sigma_Ga_Ga = rmin_Ga_Ga / nthroot(2,6);
    sigma_Ga_As = rmin_Ga_As / nthroot(2,6);
    sigma_Ga_In = rmin_Ga_In / nthroot(2,6);
    sigma_Ga_Al = rmin_Ga_Al / nthroot(2,6);
    sigma_As_As = rmin_As_As / nthroot(2,6);
    sigma_As_In = rmin_As_In / nthroot(2,6);
    sigma_As_Al = rmin_As_Al / nthroot(2,6);
    sigma_In_In = rmin_In_In / nthroot(2,6);
    sigma_In_Al = rmin_In_Al / nthroot(2,6);
    sigma_Al_Al = rmin_Al_Al / nthroot(2,6);
    
    % Энергия - глубина потенциальной ямы
    eps_Ga_Ga = (0.30+kE1) * 1.6*10^-19; % 0.3
    eps_Ga_As = (0.30+kE1) * 1.6*10^-19; % 0.3
    eps_Ga_In = (0.33+kE1) * 1.6*10^-19; % 0.03 % 0.33
    eps_Ga_Al = (0.30+kE1) * 1.6*10^-19; % 0.3
    eps_As_As = (0.30+kE1) * 1.6*10^-19; % 0.3
    eps_As_In = (0.41+kE1) * 1.6*10^-19; % 0.1 % 0.41 % 2.3 (было норм, но десорбция большая) % 2.3 % 2.3 % 1.8 % 1.7 % 2.0 (отлично, слабая десорбция)
    eps_As_Al = (0.30+kE1) * 1.6*10^-19; % 0.3
    eps_In_In = (0.06+kE1) * 1.6*10^-19; % 0.2 % 0.36 % 0.3 (было норм, но десорбция большая) % 1.3 % 1.0 % 1.3 % 1.2 % 1.5 (отлично, слабая десорбция)
    eps_In_Al = (0.30+kE1) * 1.6*10^-19; % 0.3
    eps_Al_Al = (0.30+kE1) * 1.6*10^-19; % 0.3
    
    % Энергия связи атомов в паре
    % Ga-Ga
    U1_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r1)^12-(sigma_Ga_Ga/r1)^6);
    U2_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r2)^12-(sigma_Ga_Ga/r2)^6);
    U3_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r3)^12-(sigma_Ga_Ga/r3)^6);
    U4_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r4)^12-(sigma_Ga_Ga/r4)^6);
    U5_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r5)^12-(sigma_Ga_Ga/r5)^6);
    U6_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r6)^12-(sigma_Ga_Ga/r6)^6);
    U7_Ga_Ga = 4*eps_Ga_Ga*((sigma_Ga_Ga/r7)^12-(sigma_Ga_Ga/r7)^6);
    % Ga-As
    U1_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r1)^12-(sigma_Ga_As/r1)^6);
    U2_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r2)^12-(sigma_Ga_As/r2)^6);
    U3_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r3)^12-(sigma_Ga_As/r3)^6);
    U4_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r4)^12-(sigma_Ga_As/r4)^6);
    U5_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r5)^12-(sigma_Ga_As/r5)^6);
    U6_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r6)^12-(sigma_Ga_As/r6)^6);
    U7_Ga_As = 4*eps_Ga_As*((sigma_Ga_As/r7)^12-(sigma_Ga_As/r7)^6);
    % Ga-In
    U1_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r1)^12-(sigma_Ga_In/r1)^6);
    U2_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r2)^12-(sigma_Ga_In/r2)^6);
    U3_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r3)^12-(sigma_Ga_In/r3)^6);
    U4_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r4)^12-(sigma_Ga_In/r4)^6);
    U5_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r5)^12-(sigma_Ga_In/r5)^6);
    U6_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r6)^12-(sigma_Ga_In/r6)^6);
    U7_Ga_In = 4*eps_Ga_In*((sigma_Ga_In/r7)^12-(sigma_Ga_In/r7)^6);
    % Ga-Al
    U1_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r1)^12-(sigma_Ga_Al/r1)^6);
    U2_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r2)^12-(sigma_Ga_Al/r2)^6);
    U3_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r3)^12-(sigma_Ga_Al/r3)^6);
    U4_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r4)^12-(sigma_Ga_Al/r4)^6);
    U5_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r5)^12-(sigma_Ga_Al/r5)^6);
    U6_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r6)^12-(sigma_Ga_Al/r6)^6);
    U7_Ga_Al = 4*eps_Ga_Al*((sigma_Ga_Al/r7)^12-(sigma_Ga_Al/r7)^6);
    % As-As
    U1_As_As = 4*eps_As_As*((sigma_As_As/r1)^12-(sigma_As_As/r1)^6);
    U2_As_As = 4*eps_As_As*((sigma_As_As/r2)^12-(sigma_As_As/r2)^6);
    U3_As_As = 4*eps_As_As*((sigma_As_As/r3)^12-(sigma_As_As/r3)^6);
    U4_As_As = 4*eps_As_As*((sigma_As_As/r4)^12-(sigma_As_As/r4)^6);
    U5_As_As = 4*eps_As_As*((sigma_As_As/r5)^12-(sigma_As_As/r5)^6);
    U6_As_As = 4*eps_As_As*((sigma_As_As/r6)^12-(sigma_As_As/r6)^6);
    U7_As_As = 4*eps_As_As*((sigma_As_As/r7)^12-(sigma_As_As/r7)^6);
    % As-In
    U1_As_In = 4*eps_As_In*((sigma_As_In/r1)^12-(sigma_As_In/r1)^6);
    U2_As_In = 4*eps_As_In*((sigma_As_In/r2)^12-(sigma_As_In/r2)^6);
    U3_As_In = 4*eps_As_In*((sigma_As_In/r3)^12-(sigma_As_In/r3)^6);
    U4_As_In = 4*eps_As_In*((sigma_As_In/r4)^12-(sigma_As_In/r4)^6);
    U5_As_In = 4*eps_As_In*((sigma_As_In/r5)^12-(sigma_As_In/r5)^6);
    U6_As_In = 4*eps_As_In*((sigma_As_In/r6)^12-(sigma_As_In/r6)^6);
    U7_As_In = 4*eps_As_In*((sigma_As_In/r7)^12-(sigma_As_In/r7)^6);
    % As-Al
    U1_As_Al = 4*eps_As_Al*((sigma_As_Al/r1)^12-(sigma_As_Al/r1)^6);
    U2_As_Al = 4*eps_As_Al*((sigma_As_Al/r2)^12-(sigma_As_Al/r2)^6);
    U3_As_Al = 4*eps_As_Al*((sigma_As_Al/r3)^12-(sigma_As_Al/r3)^6);
    U4_As_Al = 4*eps_As_Al*((sigma_As_Al/r4)^12-(sigma_As_Al/r4)^6);
    U5_As_Al = 4*eps_As_Al*((sigma_As_Al/r5)^12-(sigma_As_Al/r5)^6);
    U6_As_Al = 4*eps_As_Al*((sigma_As_Al/r6)^12-(sigma_As_Al/r6)^6);
    U7_As_Al = 4*eps_As_Al*((sigma_As_Al/r7)^12-(sigma_As_Al/r7)^6);
    % In-In
    U1_In_In = 4*eps_In_In*((sigma_In_In/r1)^12-(sigma_In_In/r1)^6);
    U2_In_In = 4*eps_In_In*((sigma_In_In/r2)^12-(sigma_In_In/r2)^6);
    U3_In_In = 4*eps_In_In*((sigma_In_In/r3)^12-(sigma_In_In/r3)^6);
    U4_In_In = 4*eps_In_In*((sigma_In_In/r4)^12-(sigma_In_In/r4)^6);
    U5_In_In = 4*eps_In_In*((sigma_In_In/r5)^12-(sigma_In_In/r5)^6);
    U6_In_In = 4*eps_In_In*((sigma_In_In/r6)^12-(sigma_In_In/r6)^6);
    U7_In_In = 4*eps_In_In*((sigma_In_In/r7)^12-(sigma_In_In/r7)^6);
    % In-Al
    U1_In_Al = 4*eps_In_Al*((sigma_In_Al/r1)^12-(sigma_In_Al/r1)^6);
    U2_In_Al = 4*eps_In_Al*((sigma_In_Al/r2)^12-(sigma_In_Al/r2)^6);
    U3_In_Al = 4*eps_In_Al*((sigma_In_Al/r3)^12-(sigma_In_Al/r3)^6);
    U4_In_Al = 4*eps_In_Al*((sigma_In_Al/r4)^12-(sigma_In_Al/r4)^6);
    U5_In_Al = 4*eps_In_Al*((sigma_In_Al/r5)^12-(sigma_In_Al/r5)^6);
    U6_In_Al = 4*eps_In_Al*((sigma_In_Al/r6)^12-(sigma_In_Al/r6)^6);
    U7_In_Al = 4*eps_In_Al*((sigma_In_Al/r7)^12-(sigma_In_Al/r7)^6);
    % Al-Al
    U1_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r1)^12-(sigma_Al_Al/r1)^6);
    U2_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r2)^12-(sigma_Al_Al/r2)^6);
    U3_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r3)^12-(sigma_Al_Al/r3)^6);
    U4_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r4)^12-(sigma_Al_Al/r4)^6);
    U5_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r5)^12-(sigma_Al_Al/r5)^6);
    U6_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r6)^12-(sigma_Al_Al/r6)^6);
    U7_Al_Al = 4*eps_Al_Al*((sigma_Al_Al/r7)^12-(sigma_Al_Al/r7)^6);
    
    % Ga-Ga
    E_111 = -U1_Ga_Ga;
    E_121 = -U2_Ga_Ga;
    E_131 = -U3_Ga_Ga;
    E_141 = -U4_Ga_Ga;
    E_151 = -U5_Ga_Ga;
    E_161 = -U6_Ga_Ga;
    E_171 = -U7_Ga_Ga;
    % Ga-As
    E_112 = -U1_Ga_As;
    E_122 = -U2_Ga_As;
    E_132 = -U3_Ga_Ga;
    E_142 = -U4_Ga_Ga;
    E_152 = -U5_Ga_Ga;
    E_162 = -U6_Ga_Ga;
    E_172 = -U7_Ga_Ga;
    E_211 = E_112;
    E_221 = E_122;
    E_231 = E_132;
    E_241 = E_142;
    E_251 = E_152;
    E_261 = E_162;
    E_271 = E_172;
    % Ga-In
    E_113 = -U1_Ga_In;
    E_123 = -U2_Ga_In;
    E_133 = -U3_Ga_In;
    E_143 = -U4_Ga_In;
    E_153 = -U5_Ga_In;
    E_163 = -U6_Ga_In;
    E_173 = -U7_Ga_In;
    E_311 = E_113;
    E_321 = E_123;
    E_331 = E_133;
    E_341 = E_143;
    E_351 = E_153;
    E_361 = E_163;
    E_371 = E_173;
    % Ga-Al
    E_114 = -U1_Ga_Al;
    E_124 = -U2_Ga_Al;
    E_134 = -U3_Ga_Al;
    E_144 = -U4_Ga_Al;
    E_154 = -U5_Ga_Al;
    E_164 = -U6_Ga_Al;
    E_174 = -U7_Ga_Al;
    E_411 = E_114;
    E_421 = E_124;
    E_431 = E_134;
    E_441 = E_144;
    E_451 = E_154;
    E_461 = E_164;
    E_471 = E_174;
    % As-As
    E_212 = -U1_As_As;
    E_222 = -U2_As_As;
    E_232 = -U3_As_As;
    E_242 = -U4_As_As;
    E_252 = -U5_As_As;
    E_262 = -U6_As_As;
    E_272 = -U7_As_As;
    % As-In
    E_213 = -U1_As_In;
    E_223 = -U2_As_In;
    E_233 = -U3_As_In;
    E_243 = -U4_As_In;
    E_253 = -U5_As_In;
    E_263 = -U6_As_In;
    E_273 = -U7_As_In;
    E_312 = E_213;
    E_322 = E_223;
    E_332 = E_233;
    E_342 = E_243;
    E_352 = E_253;
    E_362 = E_263;
    E_372 = E_273;
    % As-Al
    E_214 = -U1_As_Al;
    E_224 = -U2_As_Al;
    E_234 = -U3_As_Al;
    E_244 = -U4_As_Al;
    E_254 = -U5_As_Al;
    E_264 = -U6_As_Al;
    E_274 = -U7_As_Al;
    E_412 = E_214;
    E_422 = E_224;
    E_432 = E_234;
    E_442 = E_244;
    E_452 = E_254;
    E_462 = E_264;
    E_472 = E_274;
    % In-In
    E_313 = -U1_In_In;
    E_323 = -U2_In_In;
    E_333 = -U3_In_In;
    E_343 = -U4_In_In;
    E_353 = -U5_In_In;
    E_363 = -U6_In_In;
    E_373 = -U7_In_In;
    % In-Al
    E_314 = -U1_In_Al;
    E_324 = -U2_In_Al;
    E_334 = -U3_In_Al;
    E_344 = -U4_In_Al;
    E_354 = -U5_In_Al;
    E_364 = -U6_In_Al;
    E_374 = -U7_In_Al;
    E_413 = E_314;
    E_423 = E_324;
    E_433 = E_334;
    E_443 = E_344;
    E_453 = E_354;
    E_463 = E_364;
    E_473 = E_374;
    % Al-Al
    E_414 = -U1_Al_Al;
    E_424 = -U2_Al_Al;
    E_434 = -U3_Al_Al;
    E_444 = -U4_Al_Al;
    E_454 = -U5_Al_Al;
    E_464 = -U6_Al_Al;
    E_474 = -U7_Al_Al;
    
    E_des = 0.3 * 1.6*10^-19; % дополнительный барьер для десорбции, Дж
    
end