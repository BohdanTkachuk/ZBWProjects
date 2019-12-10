import mysql.connector
from mysql.connector import Error
import pandas as pd

#filename = "tbl_doi_mendeley.csv"

#filename = "tbl_reader_count_academic_status_mendeley.csv"

#filename = "tbl_reader_count_country_mendeley.csv"

#filename = "tbl_reader_count_discipline_mendeley.csv"

#for file below, we have indecies inside csv, so we need to delete field "header" and also we use another seperator ";"
#filename = "handelsblattranking-bwl-2018.csv"

#for file below, we have indecies inside csv, so we need to delete field "header" and also we use another seperator ";"
#filename = "handelsblattranking-vwl-2017.csv"

filename = "journalinfos_build.csv"

#filename = "journalinfos_citec.csv"

#filename = "vhb_jourqual3.csv"

def readFromCsv(filename):
    #Read csv but sometimes we have ',' in name and this reader couldn't recognize difference between ',' in name and ',' as separator
    data = pd.read_csv(filename, header = None, error_bad_lines=False, sep = ';', encoding='utf-8')
    #Calculate number of skipped lines
    with open(filename) as f:
       len_csv = sum(1 for line in f)
    number_of_skipped_rows = len_csv - len(data)
    print(number_of_skipped_rows)
    return data

data = readFromCsv(filename)
print(data.head())


