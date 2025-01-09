% Car Fault Diagnosis Expert System 
% Define basic symptoms and their corresponding causes

symptom(blue_smoke, burning_oil).
symptom(knocking_sound, worn_engine_bearings).
symptom(overheating, coolant_leak).
symptom(squealing_brakes, worn_brake_pads).
symptom(dim_headlights, weak_battery).

% Car Fault Diagnosis Expert System 
% Define solutions for the causes

cause(burning_oil, replace_piston_rings).
cause(worn_engine_bearings, check_engine_bearings).
cause(coolant_leak, replace_coolant_hose).
cause(worn_brake_pads, replace_brake_pads).
cause(weak_battery, recharge_or_replace_battery).


% Rule to diagnose a car problem based on a given symptom
diagnose(Symptom, Cause, Solution) :-
    symptom(Symptom, Cause),
    cause(Cause, Solution).

    % Interactive diagnosis procedure
start_diagnosis :-
    write('Welcome to the Car Fault Diagnosis Expert System!'), nl,
    write('Please enter the symptom you are experiencing (e.g., blue_smoke, knocking_sound): '), nl,
    read(UserSymptom),
    ( diagnose(UserSymptom, Cause, Solution) ->
        write('Diagnosis: '), write(Cause), nl,
        write('Recommended Solution: '), write(Solution), nl
    ;
        write('Sorry, no diagnosis found for the given symptom.'), nl
    ),
    write('Thank you for using the Car Fault Diagnosis Expert System!'), nl.

% List of known symptoms for validation
known_symptom(blue_smoke).
known_symptom(knocking_sound).
known_symptom(overheating).
known_symptom(squealing_brakes).
known_symptom(dim_headlights).

% Enhanced interactive diagnosis procedure with input validation
start_diagnosis :-
    write('Welcome to the Car Fault Diagnosis Expert System!'), nl,
    write('Please enter the symptom you are experiencing (e.g., blue_smoke, knocking_sound): '), nl,
    read(UserSymptom),
    ( known_symptom(UserSymptom) ->
        ( diagnose(UserSymptom, Cause, Solution) ->
            write('Diagnosis: '), write(Cause), nl,
            write('Recommended Solution: '), write(Solution), nl
        ;
            write('Sorry, no diagnosis found for the given symptom.'), nl
        )
    ;
        write('Unknown symptom. Please enter a valid symptom.'), nl,
        write('Known symptoms are: blue_smoke, knocking_sound, overheating, squealing_brakes, dim_headlights.'), nl,
        start_diagnosis
    ),
    write('Thank you for using the Car Fault Diagnosis Expert System!'), nl.
