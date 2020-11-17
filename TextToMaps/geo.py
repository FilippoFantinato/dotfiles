import sys

maps = "https://www.google.it/maps/dir/"

for location in sys.argv[1].split("-"):
	maps += location.replace("P.N.", "") + "/"

print(maps)
