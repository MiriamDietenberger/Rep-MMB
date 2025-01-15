import os

def update_stoch_simul(directory):
    
    
    old_line = "stoch_simul (order=1, noprint, nograph, nocorr, nodecomposition, nofunctions, nomoments, nomodelsummary);"
    oldline = "stoch_simul(order=1, noprint, nograph, nocorr, nodecomposition, nofunctions, nomoments, nomodelsummary);"
    new_line = "stoch_simul (AR=0, IRF=0, order=1, noprint, nograph, nocorr, nodecomposition, nofunctions, nomoments, nomodelsummary);"

    # modify .mod files
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".mod"):
                filepath = os.path.join(root, file)
                with open(filepath, 'r', encoding="utf8") as f:
                    print(file)
                    lines = f.readlines()
                
                # replacing old line
                modified = False
                with open(filepath, 'w', encoding="utf8") as f:
                    for line in lines:
                        if old_line in line:
                            f.write(line.replace(old_line, new_line))
                            modified = True
                        elif oldline in line:
                            f.write(line.replace(oldline, new_line))
                            modified = True
                        else:
                            f.write(line)
                
                if modified:
                    print(f"Modified: {filepath}")

#  root directory of the repository
repo_directory = "C:\\Users\\hp\\Desktop\\Rep-MMB\\Rep-MMB"  # Adjust the path if necessary
update_stoch_simul(repo_directory)

