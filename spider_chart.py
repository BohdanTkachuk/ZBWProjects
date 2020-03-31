import mysql.connector
from mysql.connector import Error
import pandas as pd


def connectiondb(sql):
    try:
        connection = mysql.connector.connect(host='localhost',
                                             database='ZBW',
                                             user='root',
                                             password='qweqweqwe')
        if connection.is_connected():
            db_Info = connection.get_server_info()
            print("Connected to MySQL Server version ", db_Info)
            data = pd.read_sql_query(sql, connection)
            connection.commit()
    except Error as e:
        print("Error while connecting to MySQL", e)
    finally:
        if connection.is_connected():
            connection.close()
            print("MySQL connection is closed")
    return data


def joinDataRating(referenceTable, dataFrame):
    df_outer = pd.merge(references_data, dataFrame, on='id', how='outer')
    return


def insertingIntoDb(data):
    # Connect to the database
    connection = mysql.connector.connect(host='localhost',
                                         database='ZBW',
                                         user='root',
                                         password='qweqweqwe')
    # create cursor
    cursor = connection.cursor()
    cols = "`,`".join([str(i) for i in data.columns.tolist()])
    # Insert DataFrame recrds one by one.
    for i, row in data.iterrows():
        sql = "INSERT INTO `spider_final` (`" + cols + "`) VALUES (" + "%s," * (len(row) - 1) + "%s)"
        cursor.execute(sql, tuple(row))
        # the connection is not autocommitted by default, so we must commit to save our changes
        connection.commit()
    connection.close()


def setValueNewFromat(new_format_data, old_format_data, ref_table, issn, dimension):
    value = old_format_data.loc[old_format_data['print_issn'] == issn][dimension].iloc[0]
    forComp = ref_table['IdRank'].values
    if value in forComp:
        value = ref_table.loc[ref_table['IdRank'] == value]['NumRank'].values
        maxValue = 1
    else:
        if value is None:
            value = 0
            maxValue = 1
        else:
            maxValue = old_format_data.max()[dimension]
    new_format_data.loc[
        (new_format_data['print_issn'] == issn) & (new_format_data['dim'] == dimension), 'value'] = value / maxValue
    return new_format_data


sql = "select * from final_united"
old_format_data = connectiondb(sql)
references_data = connectiondb("select * from ranknumber")
new_format_data = pd.DataFrame(columns=['print_issn', 'name', 'dim', 'value'])
list(old_format_data.columns)
data_test = old_format_data[['name', 'print_issn']]
concat = pd.concat([new_format_data, data_test], sort=False)
for i in range(1, 10):
    concat = pd.concat([concat, data_test], sort=False)
concat = concat.sort_values(by=['print_issn'])
dim = list(old_format_data.columns)[3:]
for i in range(1, 23):
    dim.extend(list(old_format_data.columns)[3:])
concat['dim'] = dim
s = 0
for row in concat.itertuples():
    concat = setValueNewFromat(concat, old_format_data, references_data, row.print_issn, row.dim)
concat = concat.astype(object).where(pd.notnull(concat), None)

insertingIntoDb(concat)
