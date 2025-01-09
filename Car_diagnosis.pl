% Car Fault Diagnosis Expert System 
% Define basic symptoms and their corresponding causes

symptom(blue_smoke, burning_oil).
symptom(knocking_sound, worn_engine_bearings).
symptom(overheating, coolant_leak).
symptom(squealing_brakes, worn_brake_pads).
symptom(dim_headlights, weak_battery).

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
        

    
    % Enhanced interactive diagnosis for multiple symptoms
start_diagnosis :-
    write('Welcome to the Car Fault Diagnosis Expert System!'), nl,
    write('Please enter the symptoms you are experiencing, separated by commas (e.g., blue_smoke, knocking_sound): '), nl,
    read_line_to_string(user_input, Input),
    split_string(Input, ", ", ",", SymptomStrings),
    findall((Cause, Solution), (member(SymptomString, SymptomStrings),
                                atom_string(Symptom, SymptomString),
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
