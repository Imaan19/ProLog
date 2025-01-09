% Car Fault Diagnosis Expert System
% Define basic symptoms, their corresponding causes, and solutions

% Define symptoms and corresponding causes
symptom(blue_smoke, burning_oil).
symptom(knocking_sound, worn_engine_bearings).
symptom(overheating, coolant_leak).
symptom(squealing_brakes, worn_brake_pads).
symptom(dim_headlights, weak_battery).
symptom(engine_wont_start, dead_battery).
symptom(engine_wont_start, faulty_starter).
symptom(white_smoke, blown_head_gasket).
symptom(high_engine_temperature, failed_thermostat).
symptom(oil_leak, damaged_oil_seal).
symptom(low_oil_pressure, worn_out_oil_pump).
symptom(grinding_noise, worn_out_brakes).
symptom(car_pulling_left, misaligned_wheels).
symptom(car_pulling_right, misaligned_wheels).
symptom(stiff_steering, low_power_steering_fluid).
symptom(soft_brake_pedal, air_in_brake_lines).
symptom(hard_brake_pedal, faulty_brake_booster).
symptom(rough_idle, dirty_air_filter).
symptom(engine_misfire, faulty_spark_plugs).
symptom(battery_discharging, faulty_alternator).
symptom(no_ac_cooling, low_refrigerant).
symptom(no_ac_cooling, faulty_ac_compressor).
symptom(uneven_tire_wear, unbalanced_tires).
symptom(vibration_at_high_speed, unbalanced_tires).
symptom(check_engine_light, sensor_failure).
symptom(check_engine_light, exhaust_leak).
symptom(fuel_smell, leaking_fuel_injector).
symptom(hissing_sound, vacuum_leak).
symptom(low_fuel_efficiency, clogged_fuel_filter).
symptom(engine_backfire, incorrect_ignition_timing).

% Define solutions for the causes
cause(burning_oil, replace_piston_rings).
cause(worn_engine_bearings, check_engine_bearings).
cause(coolant_leak, replace_coolant_hose).
cause(worn_brake_pads, replace_brake_pads).
cause(weak_battery, recharge_or_replace_battery).
cause(dead_battery, recharge_or_replace_battery).
cause(faulty_starter, replace_starter_motor).
cause(blown_head_gasket, replace_head_gasket).
cause(failed_thermostat, replace_thermostat).
cause(damaged_oil_seal, replace_oil_seal).
cause(worn_out_oil_pump, replace_oil_pump).
cause(worn_out_brakes, replace_brake_rotors_and_pads).
cause(misaligned_wheels, perform_wheel_alignment).
cause(low_power_steering_fluid, refill_power_steering_fluid).
cause(air_in_brake_lines, bleed_brake_lines).
cause(faulty_brake_booster, replace_brake_booster).
cause(dirty_air_filter, replace_air_filter).
cause(faulty_spark_plugs, replace_spark_plugs).
cause(faulty_alternator, replace_alternator).
cause(low_refrigerant, recharge_ac_system).
cause(faulty_ac_compressor, replace_ac_compressor).
cause(unbalanced_tires, balance_tires).
cause(sensor_failure, diagnose_and_replace_sensor).
cause(exhaust_leak, repair_exhaust_leak).
cause(leaking_fuel_injector, replace_fuel_injector).
cause(vacuum_leak, repair_vacuum_leak).
cause(clogged_fuel_filter, replace_fuel_filter).
cause(incorrect_ignition_timing, adjust_ignition_timing).

% Rule to diagnose a car problem based on a given symptom
diagnose(Symptom, Cause, Solution) :-
    symptom(Symptom, Cause),
    cause(Cause, Solution).

% List of known symptoms for validation
known_symptom(blue_smoke).
known_symptom(knocking_sound).
known_symptom(overheating).
known_symptom(squealing_brakes).
known_symptom(dim_headlights).
known_symptom(engine_wont_start).
known_symptom(white_smoke).
known_symptom(high_engine_temperature).
known_symptom(oil_leak).
known_symptom(low_oil_pressure).
known_symptom(grinding_noise).
known_symptom(car_pulling_left).
known_symptom(car_pulling_right).
known_symptom(stiff_steering).
known_symptom(soft_brake_pedal).
known_symptom(hard_brake_pedal).
known_symptom(rough_idle).
known_symptom(engine_misfire).
known_symptom(battery_discharging).
known_symptom(no_ac_cooling).
known_symptom(uneven_tire_wear).
known_symptom(vibration_at_high_speed).
known_symptom(check_engine_light).
known_symptom(fuel_smell).
known_symptom(hissing_sound).
known_symptom(low_fuel_efficiency).
known_symptom(engine_backfire).

% Unified interactive diagnosis procedure for single or multiple symptoms
start_diagnosis :-
    write('Welcome to the Car Fault Diagnosis Expert System!'), nl,
    write('Please enter the symptoms you are experiencing, separated by commas (e.g., blue_smoke, knocking_sound): '), nl,
    read_line_to_string(user_input, Input),
    split_string(Input, ", ", ",", SymptomStrings),
    diagnose_multiple(SymptomStrings).

% Helper predicate to handle multiple symptoms
diagnose_multiple(SymptomStrings) :-
    findall((Cause, Solution), (member(SymptomString, SymptomStrings),
                                atom_string(Symptom, SymptomString),
                                known_symptom(Symptom),
                                diagnose(Symptom, Cause, Solution)), Results),
    ( Results \= [] ->
        write('Diagnoses and recommended solutions based on your symptoms:'), nl,
        display_results(Results)
    ;
        write('Sorry, no diagnosis found for the given symptoms.'), nl
    ),
    write('Thank you for using the Car Fault Diagnosis Expert System!'), nl.

% Helper predicate to display results
display_results([]).
display_results([(Cause, Solution)|Rest]) :-
    write('Cause: '), write(Cause), nl,
    write('Recommended Solution: '), write(Solution), nl, nl,
    display_results(Rest).
