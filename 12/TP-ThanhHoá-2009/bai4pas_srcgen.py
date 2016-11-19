#!/usr/bin/env python3

from bai4 import libai4


with open("BAI4.PAS", "w") as f:
    f.write("const\n  m: array[1..9] of byte = (")
    l = [libai4(i) for i in range(1, 10)]
    f.write(", ".join([str(len(i)) for i in l]))
    f.write(");\n  equa: array[1..9] of ansistring = (\n");
    l0 = []
    for i in l:
        s = "    #10" + "".join(["'" + j.replace("\n", "'#10") for j in i])
        l0.append(s)
    f.write(",\n".join(l0))
    f.write("\n  );\n\nvar\n  n: byte;\n  f: text;\n\nbegin\n")
    f.write("  assign(f, 'BAI4.INP');\n  reset(f);\n  read(f, n);\n")
    f.write("  close(f);\n\n  assign(f, 'BAI4.OUT');\n  rewrite(f);\n")
    f.write("  write(f, m[n], equa[n]);\n  close(f)\nend.\n")
