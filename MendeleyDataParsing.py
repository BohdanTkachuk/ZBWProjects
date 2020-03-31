import mysql.connector
from mysql.connector import Error
import pandas as pd

from sqlalchemy import create_engine

#filename = "tbl_doi_top10lowest.csv"
# names = ['id', 'doi', 'count', 'year', 'issn', 'title', 'publisher', 'discipline', 'electronic']

#filename = "tbl_reader_count_academic_status_mendeley_top_10_lowest.csv"
# names = ['id', 'id_doi', 'status', 'count_status', 'id_from_doi', 'doi', 'count_doi', 'year', 'issn', 'title', 'publisher', 'discipline', 'electronic']

#filename = "tbl_reader_count_country_mendeley.csv"
# names = ['id', 'id_doi', 'country', 'count', 'id_from_doi', 'doi', 'count_doi', 'year', 'issn', 'title', 'publisher', 'discipline', 'electronic']

#filename = "tbl_reader_count_discipline_mendeley_top_10_lowest.csv"
# names = ['id', 'id_doi', 'category', 'discipline', 'number_1', 'number_2', 'link', 'number_3', 'years', 'online_issn', 'article_name', 'publisher', 'bwl']


#for file below, we have indecies inside csv, so we need to delete field "header" and also we use another seperator ";"
#filename = "handelsblattranking-bwl-2018.csv"

#for file below, we have indecies inside csv, so we need to delete field "header" and also we use another seperator ";"
#filename = "handelsblattranking-vwl-2017.csv"

filename = "journalinfos_build.csv"
# names=['RePEc_Handle', 'Year', 'Cites', 'IF', 'IF 5 years', 'Documents published', 'H-index', 'Type', 'print_issn', 'online_issn', 'Type2', 'Year2', 'shimago_source_id', 'SJR', 'Type4', 'Year5', 'journal_category', 'Type6', 'Year7', 'Class BWL', 'Type8', 'Year9', 'Class VWL'],

#filename = "journalinfos_citec.csv" names=['']

#filename = "vhb_jourqual3.csv"


def readFromCsv(filename):
    #Read csv but sometimes we have ',' in name and this reader couldn't recognize difference between ',' in name and ',' as separator
    data = pd.read_csv(filename, names=['RePEc_Handle', 'Year', 'Cites', 'IF', 'IF 5 years', 'Documents published', 'H-index', 'Type', 'print_issn', 'online_issn', 'Type2', 'Year2', 'shimago_source_id', 'SJR', 'Type4', 'Year5', 'journal_category', 'Type6', 'Year7', 'Class BWL', 'Type8', 'Year9', 'Class VWL'],
 header = None, error_bad_lines=False, sep = ';', index_col= False, encoding='utf-8')
    #Calculate number of skipped lines
    #with open(filename) as f:
    #  len_csv = sum(1 for line in f)
    #number_of_skipped_rows = len_csv - len(data)
    #print(number_of_skipped_rows)
    return data

def connectiondb(data):
    #connection = mysql.connector.connect(host='localhost', database='ZBW', user='root', password='qweqweqwe')
    engine = create_engine("mysql+pymysql://{user}:{pw}@localhost/{db}"
                           .format(user="root",
                                   pw="qweqweqwe",
                                   db="ZBW"))
    data.to_sql(name='journal_info', index=False, con=engine, if_exists='append')


print(readFromCsv(filename).head());

connectiondb(readFromCsv(filename))


