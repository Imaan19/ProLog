% Car Fault Diagnosis Expert System 
% Define basic symptoms and their corresponding causes

symptom(blue_smoke, burning_oil).
symptom(knocking_sound, worn_engine_bearings).
symptom(overheating, coolant_leak).
symptom(squealing_brakes, worn_brake_pads).
symptom(dim_headlights, weak_battery).

% Rule to diagnose a car problem based on a given symptom
diagnose(Symptom, Cause, Solution) :-
    symptom(Symptom, Cause),
    cause(Cause, Solution).
