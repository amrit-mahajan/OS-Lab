#!/bin/bash
# ==============================================================================
# Experiment 2(b): Flowchart-based Directory Management
# Creates the academic directory structure under Sem_3
# ==============================================================================

echo "======================================================"
echo "Experiment 2(b): Flowchart-Based Directory Hierarchy"
echo "======================================================"

# Create parent and sub-directories as per flowchart
mkdir -p Sem_3/OS/Theory Sem_3/OS/Lab
mkdir -p Sem_3/COA/Theory Sem_3/COA/Practical
mkdir -p Sem_3/cyber/Theory Sem_3/cyber/Lab
mkdir -p Sem_3/HSMC/Book Sem_3/HSMC/Class

echo -e "\nDirectory structure created successfully under Sem_3/:"
ls -R Sem_3
