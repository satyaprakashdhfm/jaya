# main.py
import sqlalchemy as sa
import pandas as pd

# Connect to the SQLite DB
engine = sa.create_engine('sqlite:////workspaces/jaya/ultrasound_db.sqlite')

# 1) Inspect which tables actually exist
with engine.connect() as conn:
    result = conn.execute(sa.text("SELECT name FROM sqlite_master WHERE type='table';"))
    tables = [row[0] for row in result]
print("Found tables:", tables)

# 2) Load each table dynamically
dfs = {tbl: pd.read_sql(f"SELECT * FROM \"{tbl}\"", engine) for tbl in tables}

# 3) Now merge only the tables you need (adjust names to match those printed above)
df = (
    dfs['patients']           # if table is lowercase; otherwise use the actual name
    .merge(dfs['appointments'], on='PatientID', how='left')
    .merge(dfs['ultrasound_results'], on=['PatientID', 'AppointmentID'], how='left')
    .merge(dfs['billing'], on=['PatientID', 'AppointmentID'], how='left')
    .merge(dfs['reports'], on=['PatientID', 'AppointmentID'], how='left')
    .merge(dfs['follow_up'], on=['PatientID', 'AppointmentID'], how='left')
)

# 4) Export
df.to_csv('data/consolidated_data.csv', index=False)
