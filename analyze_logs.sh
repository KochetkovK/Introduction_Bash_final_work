#!/bin/bash

awk 'BEGIN {print "Отчет о логе веб-сервера",\    
    "\n========================"} 
     !U[$1]++{nunique++}
     {methods[substr($6,2)]++}
     {urls[$7]++}
     {for (url in urls) if(max<urls[url]) {max=urls[url]; value=url}}
     END {print "Общее количество запросов:\t"NR
          print "Количество уникальных IP-адресов:\t"nunique
          print "\n"
          print "Количество запросов по методам:"
          for (method in methods) print ("  ", methods[method], method)
          print "\n"
          print "Cамый популярный URL:\t" max, value}' access.log > report.txt

echo "Отчет сохранен в файл report.txt"
