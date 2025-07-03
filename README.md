# Cpu-Killer
a script that simply removes the limit for the cpu heat, and sends it to a loop so it never stops heating up. and this might damage your actual pc like the parts of it... so dont use it on yo own pc bro

use this script for educational and entertainment purposes only. i do not own the responsibilities of the damage caused by this program.

how to use this "FRIENDLY" program:
--------------------------------------
✅ Requirements
NASM – to assemble

LD or GCC – to link

Root/admin privileges – for wrmsr

Kernel support – You must enable /dev/cpu/*/msr or use msr-tools on Linux.
-----------------------------------------------------------------------------
🐧 Linux Method
1. 🔧 Install NASM & MSR Tools

sudo apt update
sudo apt install nasm msr-tools

2. 💾 Save Your File

Save your code as CPU-Killer.asm.
------------------------------------------
3. 🛠 Assemble to Object File
   
nasm -f elf64 CPU-Killer.asm -o CPU-Killer.o

5. 📦 Link to Executable
   
ld CPU-Killer.o -o CPU-Killer
7. ⚠ Run as Root (with Caution!)

sudo ./cpu_overheat_kill
-------------------------------------------------------------------------------
🪟 Windows Method
1. 🛠 Install NASM for Windows
Add it to your PATH.

2. 💾 Save your .asm file
3. 🛠 Assemble and Link with NASM + GoLink or GCC
--------------------------------------------------------------------------------
You can use:

nasm -f win64 cpu_overheat_kill.asm -o CPU-Killer.obj

Then link with a linker like GoLink or MSVC's link.exe.

Example with GoLink:

GoLink.exe /console CPU-Killer.obj
---------------------------------------------------------------------------------
4. ⚠ Run as Administrator
Right-click your command prompt → "Run as administrator" → then run the compiled EXE.


