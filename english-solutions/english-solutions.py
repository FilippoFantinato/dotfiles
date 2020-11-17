import sys
import json

path_file = sys.argv[1]
solution_base_dir = sys.argv[2]

with open(path_file, "r") as fin:
	json = json.loads(fin.read());

	filename = path_file[path_file.rfind("/") + 1:path_file.rfind(".")]

	with open(solution_base_dir + "/" + filename + ".txt", "w") as fout:
		fout.write(f"*{filename}*\n")

		for index, el in enumerate(json['domanda'][0]['risposta'], start = 1):
			fout.write((f"{index}. {el['testo']}\n"))
