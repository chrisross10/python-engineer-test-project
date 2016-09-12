from sqlalchemy import create_engine
from sqlalchemy.sql import text
from settings import SQL_URL

ENGINE = create_engine(SQL_URL, encoding='utf8')

def get_records(table_name):
    sql = text('SELECT * FROM ' + table_name)
    return ENGINE.execute(sql).fetchall()

def clear_all_tables():
    all_tables = [
        'team',
        'member',
        'company'
    ]

    sql = '; '.join(('TRUNCATE TABLE ' + table for table in all_tables))
    ENGINE.execute(text(sql))
