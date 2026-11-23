#!/bin/bash
# ==============================================================================
# Experiment 3(a): Sequential Command Execution & Output Redirection
# Command: date; w | cat > who.txt
# Displays date on screen, and redirects 'w' output to file who.txt
# ==============================================================================

echo "======================================================"
echo "Experiment 3(a): Sequential Execution & Redirection"
echo "======================================================"

echo -e "\nExecuting: date; w | cat > who.txt\n"
date; w | cat > who.txt

echo -e "\nResulting output stored in who.txt:"
cat who.txt
