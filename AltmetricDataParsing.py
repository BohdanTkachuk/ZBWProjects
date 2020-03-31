import mysql.connector
from mysql.connector import Error
import pandas as pd

# TODO seems like the data is broken. It was skipped some of lines because of wrong separotor, Error tokenizing data. C error: Expected 25 fields in line 28, saw 26
#filename = "altmetricsdataset_30journals_test.csv"
#filename = "altmetricsdataset_30journals.csv"
filename = "tbl_altmetrics_top10lowest.csv"
seperator = ","

#TODO I don't like this step. For each symbol we do this check (possible to put this check into one case where we close )
def isEndCheck (prev, cur):
    if prev != '\"' and cur == '\"':
        return True
    else:
        return False
def isLineEmpty (line):
    if not line:
        return True
    else:
        return False

def readcsv(filename, seperator):
    flag_inside_line = False;
    flag_insied_field = False;
    flag_inside_name = False;
    #TODO probably, there is more elegant way to recognise where is ending and starting of each name, field and line, but so far it is nor very requirement for productivity
    flag_end = False;
    buffer_line = str();
    data = pd.DataFrame(columns=['altmetric_score', 'title', 'journal_name', 'print_issn', 'online_issn', 'subjects', 'affiliation', 'publication_date', 'doi', 'news', 'blog', 'policy', 'patent', 'twitter', 'peer_review', 'weibo', 'facebook', 'wikipedia', 'google', 'linkedIn', 'reddit', 'pinterest', 'f1000', 'qa', 'videos', 'syllabi', 'mendeley', 'dimensions_citations', 'details_page', 'badge_url'])
    flag_inside_line = False;
    flag_insied_field = False;
    flag_inside_name = False;
    prev = "";
    row = [];
    i=0;
    with open(filename) as f:
        cnt = 0
        for line in f:
            #print(line);
            for ch in line:

                if ch == '\"' and prev == "\"" and flag_inside_line == True and flag_insied_field == True and flag_inside_name == True:
                    buffer_line = " ";
                    flag_inside_name = False
                elif ch == '\"' and flag_inside_line == True and flag_insied_field == True and flag_inside_name == True:
                    flag_inside_name = False;
                if flag_inside_line == True and flag_insied_field == True and flag_inside_name == True:
                    buffer_line = buffer_line + ch;
                if ch == '\"' and flag_inside_line == False:
                    flag_inside_line = True;
                elif ch == '\"' and flag_inside_line == True and flag_insied_field == False:
                    flag_insied_field = True;
                elif ch == '\"' and flag_inside_line == True and flag_insied_field== True and flag_inside_name == False :
                    if isLineEmpty(buffer_line):
                        flag_inside_name = True;
                    else:
                        flag_inside_name = False
                    #if isEndCheck(prev, ch):
                    #    flag_inside_name = False
                    #else:
                    #    flag_inside_name = True;
                elif ((ch == ',' and prev == '\"') or ch == '\n') and flag_inside_line == True and flag_insied_field == True and flag_inside_name == False:
                    flag_insied_field = False
                    row.append(buffer_line);
                    buffer_line = '';
                if ch == '\n' and prev == ';':
                    flag_inside_line = False;
                prev = ch;

            data.loc[i] = row;
            i = i + 1
            row.clear();





                    # Read data from file 'filename.csv'
    # (in the same directory that your python process is based)
    # Control delimiters, rows, column names with read_csv (see later)

    return data
def readcsvBetterWay (filename):
    data = pd.read_csv(filename, keep_default_na=False);
    return data


def connectiondb(data):
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='ZBW',
                                             user='root',
                                             password='qweqweqwe')
        #  "hey it's me" "it/"s" "" " ""
        if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_Info)


            cursor = connection.cursor()

            cols = "`,`".join([str(i) for i in data.columns.tolist()])

            for i, row in data.iterrows():
                sql = "INSERT INTO `altmetrics_10bottom` (`" + cols + "`) VALUES (" + "%s," * (len(row) - 1) + "%s)"
                cursor.execute(sql, tuple(row))

                # the connection is not autocommitted by default, so we must commit to save our changes
                connection.commit()





    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")


data = readcsvBetterWay(filename)
#print(data.to_string())
# with open(filename) as f:
#    len_csv = sum(1 for line in f)
# number_of_skipped_rows = len_csv - len(data)
#print(data.head())
#data.to_csv('result.csv')
connectiondb(data);
