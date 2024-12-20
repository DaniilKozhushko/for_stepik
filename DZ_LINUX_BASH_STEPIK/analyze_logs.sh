#!/bin/bash
tot_req=$(wc -l < access.log)
uniq_ip=$(awk '{print $1}' access.log | sort | uniq | wc -l)
c_get=$(awk '$6 == "\"GET" {count++} END {print count}' access.log)
c_post=$(awk '$6 == "\"POST" {count++} END {print count}' access.log)
count_url=$(awk '{print $7}' access.log | sort | uniq | wc -l)
tmost_pop_url=$(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)
echo "Отчет о логе веб-сервера" > report.txt
echo "========================" >> report.txt
echo "Общее количество запросов:		$tot_req" >> report.txt
echo "Количество уникальных IP-адресов:		$uniq_ip" >> report.txt
echo >> report.txt
echo "Количество запросов по методам:" >> report.txt
echo "	$c_get GET" >> report.txt
echo "	$c_post POST" >> report.txt
echo >> report.txt
echo "Самый популярный URL:    $tmost_pop_url" >> report.txt
