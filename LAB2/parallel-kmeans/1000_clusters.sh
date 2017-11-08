truncate mytime.txt --size 0
for sched in  "static" "dynamic, 1" "dynamic, 4" "dynamic, 8" "dynamic, 16" "guided, 1","guided, 4" "guided", "guided, 16" 
do
  export OMP_SCHEDULE=$sched
  for numOfThreads in 1 2 4 8 16 28 32 56
  do
    export OMP_NUM_THREADS=$numOfThreads
    echo "sched:"$sched" and threads:"$numOfThreads >> mytime.txt
    for ((i = 0; i < 12; i++))
    do
      ./seq_main -i Image_data/texture17695.bin -o -b -n 1000
    done
  done
done

