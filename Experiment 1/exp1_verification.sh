#!/bin/bash
# ==============================================================================
# Experiment 1: Installation of VirtualBox and Ubuntu OS
# Purpose: Environment verification script to check virtualization, kernel,
#          memory, and storage allocations inside the installed Ubuntu VM.
# ==============================================================================

echo "======================================================"
echo "Experiment 1: Ubuntu OS & VirtualBox Verification"
echo "======================================================"

echo -e "\n[1] Linux Kernel & System Architecture:"
uname -a

echo -e "\n[2] Ubuntu OS Distribution Details:"
lsb_release -a 2>/dev/null || cat /etc/os-release

echo -e "\n[3] Virtualization & CPU Hardware Details:"
lscpu | grep -E "Hypervisor|Virtualization|Model name"

echo -e "\n[4] Memory (RAM) Allocation:"
free -h

echo -e "\n[5] Virtual Disk / Storage Allocation:"
df -h /
