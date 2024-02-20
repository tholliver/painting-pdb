import pandas as pd
from sqlalchemy import create_engine
from credentials import PASSWORD, HOST, USERNAME, PORT


conn_str = f'postgresql+psycopg2://{USERNAME}:{PASSWORD}@{HOST}:{PORT}/painting'
db = create_engine(conn_str)
conn = db.connect()

files = ['artist', 'canvas_size', 'image_link',
         'museum_hours', 'museum', 'product_size', 'subject', 'work']


# Files are inside this directory/repo and dir for cvs's its 'csv_files'
for file in files:
    df = pd.read_csv(f'./csv_files/{file}.csv')
    df.to_sql(file, con=conn, if_exists='replace', index=False)
