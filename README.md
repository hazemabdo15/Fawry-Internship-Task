# MyGrep

A mini clone of the `grep` command, written as a Bash script! This tool supports case-insensitive searches, optional line numbering, inverted matching, and simple option parsing.


---

## How to Run

Make the script executable:
```bash
chmod +x mygrep.sh
```

Then you can run:

### 1. Basic search (case-insensitive)
```bash
./mygrep.sh hello testfile.txt
```
**Output:**
```
Hello world
HELLO AGAIN
```
<img width="318" alt="fawry-task1 1" src="https://github.com/user-attachments/assets/f211f8e0-e03d-40c9-82c4-30f8d50de261" />

### 2. With line numbers
```bash
./mygrep.sh -n hello testfile.txt
```
**Output:**
```
1:Hello world
4:HELLO AGAIN
```
<img width="300" alt="fawry-task1 2" src="https://github.com/user-attachments/assets/f5e591e7-c73d-46fe-a5e8-b00b7fa702e0" />

### 3. Invert match + line numbers
```bash
./mygrep.sh -vn hello testfile.txt
```
**Output:**
```
2:This is a test
3:another test line
5:Don't match this line
6:Testing one two three
```
<img width="277" alt="fawry-task1 3" src="https://github.com/user-attachments/assets/3b5ca193-effc-41a5-ba36-dcc2e74b5349" />

### 4. Missing search string
```bash
./mygrep.sh -v testfile.txt
```
**Output:**
```
Error: Missing search string or file.
Usage: ./mygrep.sh [-n] [-v] SEARCH_STRING FILE
  -n   Show line numbers for each match
  -v   Invert the match (print non-matching lines)
  --help  Display this help message
```
<img width="257" alt="fawry-task1 4" src="https://github.com/user-attachments/assets/332044c5-8570-4c27-a564-137c9cb361b0" />

### 5. Printing help message
```bash
./mygrep.sh --help
```
**Output:**
```
Usage: ./mygrep.sh [-n] [-v] SEARCH_STRING FILE
  -n   Show line numbers for each match
  -v   Invert the match (print non-matching lines)
  --help  Display this help message
```
<img width="225" alt="fawry-task1 5" src="https://github.com/user-attachments/assets/dad53eea-853f-460a-91d1-fbdd1c0d5498" />

---

## Reflective Section

### Argument & Option Handling
The script first initializes default flags (`show_numbers=false`, `invert=false`). It loops over any arguments that start with `-` to parse options (`-n`, `-v`, `-nv`/`-vn`, `--help`) and shifts them out before validating the presence of `SEARCH_STRING` and `FILE`.

### Extending for Regex and Additional Options
To support full regular expressions, `grep` could be invoked without forcing any fixed-string search. To add options like `-c` (count matches) or `-l` (list filenames), additional flag handling and possibly mutually exclusive logic would be needed. Moving to real `getopts` parsing would improve flexibility.

### Hardest Part
Correctly parsing combined options like `-vn` and ensuring the flow handled missing arguments gracefully were tricky. Mimicking `grep`'s output style also required careful formatting.

---

