#!/usr/bin/env python3

from sys import stdin

PERIODIC_TABLE = {'Ac': ('Actinium', 227.0), 'Ag': ('Silver', 107.868),
                  'Al': ('Aluminum', 26.9815), 'Am': ('Americium', 243.0),
                  'Ar': ('Argon', 39.948), 'As': ('Arsenic', 74.9216),
                  'At': ('Astatine', 210.0), 'Au': ('Gold', 196.966),
                  'B': ('Boron', 10.81), 'Ba': ('Barium', 137.0),
                  'Be': ('Beryllium', 9.0122), 'Bi': ('Bismuth', 208.98),
                  'Bk': ('Berkelium', 247.0), 'Br': ('Bromine', 79.904),
                  'C': ('Carbon', 12.011), 'Ca': ('Calcium', 40.08),
                  'Cd': ('Cadmium', 112.4), 'Ce': ('Cerium', 140.12),
                  'Cf': ('Californium', 251.0), 'Cl': ('Chlorine', 35.453),
                  'Cm': ('Curium', 247.0), 'Co': ('Cobalt', 58.9332),
                  'Cr': ('Chromium', 51.996), 'Cs': ('Cesium', 132.9054),
                  'Cu': ('Copper', 63.546), 'Dy': ('Dysprosium', 162.5),
                  'Er': ('Erbium', 167.26), 'Es': ('Einsteinium', 254.0),
                  'Eu': ('Europium', 151.96), 'F': ('Fluorine', 18.9984),
                  'Fe': ('Iron', 55.847), 'Fm': ('Fermium', 257.0),
                  'Fr': ('Francium', 223.0), 'Ga': ('Gallium', 69.72),
                  'Gd': ('Gadolinium', 157.25), 'Ge': ('Germanium', 72.59),
                  'H': ('Hydrogen', 1.0079), 'He': ('Helium', 4.0026),
                  'Hf': ('Hafnium', 178.49), 'Hg': ('Mercury', 200.59),
                  'Ho': ('Holmium', 164.93), 'I': ('Iodine', 126.904),
                  'In': ('Indium', 114.82), 'Ir': ('Iridium', 192.22),
                  'K': ('Potassium', 39.098), 'Kr': ('Krypton', 83.8),
                  'La': ('Lanthanum', 138.905), 'Li': ('Lithium', 6.941),
                  'Lr': ('Lawrencium', 256.0), 'Lu': ('Lutetium', 174.97),
                  'Md': ('Mendelevium', 258.0), 'Mg': ('Magnesium', 24.305),
                  'Mn': ('Manganese', 54.938), 'Mo': ('Molybdenum', 95.94),
                  'N': ('Nitrogen', 14.0067), 'Na': ('Sodium', 22.9898),
                  'Nb': ('Niobium', 92.9064), 'Nd': ('Neodymium', 144.24),
                  'Ne': ('Neon', 20.179), 'Ni': ('Nickel', 58.7),
                  'No': ('Nobelium', 255.0), 'Np': ('Neptunium', 237.048),
                  'O': ('Oxygen', 15.9994), 'Os': ('Osmium', 190.2),
                  'P': ('Phosphorus', 30.9738), 'Pa': ('Protactinium', 231.036),
                  'Pb': ('Lead', 207.2), 'Pd': ('Palladium', 106.4),
                  'Pm': ('Promethium', 147.0), 'Po': ('Polonium', 210.0),
                  'Pr': ('Praseodymium', 140.908), 'Pt': ('Platinum', 195.09),
                  'Pu': ('Plutonium', 244.0), 'Ra': ('Radium', 226.025),
                  'Rb': ('Rubidium', 85.4678), 'Re': ('Rhenium', 186.207),
                  'Rf': ('Rutherfordium', 261.0), 'Rh': ('Rhodium', 102.906),
                  'Rn': ('Radon', 222.0), 'Ru': ('Ruthenium', 101.07),
                  'S': ('Sulfur', 32.06), 'Sb': ('Antimony', 121.75),
                  'Sc': ('Scandium', 44.9559), 'Se': ('Selenium', 78.96),
                  'Si': ('Silicon', 28.086), 'Sm': ('Samarium', 150.4),
                  'Sn': ('Tin', 118.69), 'Sr': ('Strontium', 87.62),
                  'Ta': ('Tantalum', 180.948), 'Tb': ('Terbium', 158.925),
                  'Tc': ('Technetium', 98.9062), 'Te': ('Tellurium', 127.6),
                  'Th': ('Thorium', 232.038), 'Ti': ('Titanium', 47.9),
                  'Tl': ('Thallium', 204.37), 'Tm': ('Thulium', 168.934),
                  'U': ('Uranium', 238.029), 'V': ('Vanadium', 50.9414),
                  'W': ('Tungsten', 183.85), 'Xe': ('Xenon', 131.3),
                  'Y': ('Yttrium', 88.9059), 'Yb': ('Ytterbium', 173.04),
                  'Zn': ('Zinc', 65.38), 'Zr': ('Zirconium', 91.22)}
MEM = {}


def spell(s):
    if s in MEM: return MEM[s]
    if not s: return []

    s, l = s.capitalize(), []
    if len(s) == 1 and s in PERIODIC_TABLE:
        MEM[s] = [(s,)]
        return MEM[s]
    if len(s) == 2:
        if s in PERIODIC_TABLE: l.append((s,))
        t = tuple(s.upper())
        if all(i in PERIODIC_TABLE for i in t): l.append(t)
        MEM[s] = l
        return l

    if s[0] in PERIODIC_TABLE:
        l.extend([(s[0],) + i for i in spell(s[1:])])
    if len(s) > 1 and s[0:2] in PERIODIC_TABLE:
        l.extend([(s[0:2],) + i for i in spell(s[2:])])
    MEM[s] = l
    return l


for i in stdin:
    d = {sum(PERIODIC_TABLE[k][1] for k in j): j for j in spell(i.strip())}
    t = d[max(d)]
    print(''.join(t), '(' + ' '.join(PERIODIC_TABLE[j][0] for j in t) + ')')
