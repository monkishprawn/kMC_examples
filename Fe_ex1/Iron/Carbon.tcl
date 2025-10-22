param set type=arrhenius key=Iron/Carbon/C(migration) value="1.44e-3 0.91"
param set type=arrhenius key=Iron/Carbon/C(formation) value="1 0"

#param set type=arrhenius key=Iron/Carbon/CI(migration) value="0 5"
#param set type=arrhenius key=Iron/Carbon/CI(formation) value="1 0"

param set type=arrhenius key=Iron/Carbon/CV(migration) value="0 5"
# Formation energy of CV = Ef(V) - Eb(C to V) = 2.0 - 0.6 = 1.4 [M4F-Malerba2021]
param set type=arrhenius key=Iron/Carbon/CV(formation)   value="1e-3 1.4"

param set type=map<string,float> key=Gas_Iron/Carbon/desorption.high value={ C 0 }
param set type=map<string,float> key=Gas_Iron/Carbon/barrier.right value={ C 0 }

