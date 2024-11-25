% Car Fault Diagnosis Expert System

% Define symptoms, causes, and solutions
symptom(blue_smoke, burning_oil).
symptom(knocking_sound, worn_engine_bearings).
symptom(overheating, coolant_leak).
symptom(squealing_brakes, worn_brake_pads).
symptom(dim_headlights, weak_battery).

% Causes: Link symptoms to potential causes
cause(burning_oil, replace_piston_rings).
cause(worn_engine_bearings, check_engine_bearings).
cause(coolant_leak, replace_coolant_hose).
cause(worn_brake_pads, replace_brake_pads).
cause(weak_battery, recharge_or_replace_battery).

% Rule: Diagnose the problem based on a symptom
diagnose(Symptom, Cause, Solution) :-
    symptom(Symptom, Cause),
    cause(Cause, Solution).

% Example query:
% ?- diagnose(blue_smoke, Cause, Solution).
% ?- diagnose(knocking_sound, Cause, Solution).
