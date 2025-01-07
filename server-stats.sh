
  get_cpu_usage() {
   echo "Uso de CPU:"
   mpstat 1 1 | awk '/Average/ {printf "%.2f%% usado\n", 100 - $NF}'
  }


  get_memory_usage(){
    echo "Uso de memoria"
    free -m | awk 'NR==2{printf "Uso de memoria: %s/%sMB(%.2f%%)\n",$3,$2,$3*100/$2}'
  }

  get_disk_usage(){
    echo "Uso de disco"
    df -h --total | awk 'END{print "Uso: "$3", Libre:"$4", Uso:"$5}'
  }

  get_top_cpu_processes(){
    echo "top 5 de procesos con mas uso de memoria"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
  }

  main() {
    echo "estadisticas de rendimiento del servidor"
    echo "========================================="

    get_cpu_usage
    get_memory_usage
    get_disk_usage
    get_top_cpu_processes
  }

  main
