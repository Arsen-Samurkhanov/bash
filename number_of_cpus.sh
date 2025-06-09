
CPU_CORES=$( grep -c name /proc/cpuinfo )
echo "There are $CPU_CORES cores in the system"
if ((CPU_CORES < 8)) ;then
    echo "A minimum of 8 cores are required "
    exit 1
fi
