
# act as a bridge between the python and SQL written in python but executed on SQL and result is displayed in python.
import mysql.connector

# connect to the database
# try is added as the connection is between the server and python if the server gets down or have any issue to avoid any issue with the
try:
    conn = mysql.connector.connect(
        host = '127.0.0.1',
        user = 'root',
        database = 'indigo'
    )
    mycursor =  conn.cursor()
    print('Connection Established')
#mycursor is main object to write query
except:
    print('Connection Error')

#to perform any query we write mycursor.exceute followed by the command and to make it run need to add commit alwasy added when read changes is performed.
# mycursor.execute('CREATE DATABASE indigo')
# conn.commit()

#create table
#airportid-> airport_id|code|name
mycursor.execute('''  
CREATE TABLE IF NOT EXISTS airport(
airport_id INTEGER PRIMARY KEY,
code VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
name VARCHAR(255) NOT NULL
)''')
conn.commit()

#insert data to te table
#mycursor.execute('''
#INSERT INTO airport VALUES
#(1,'DEL','New Delhi','IGIA'),
#(2,'CCU','Kolkata','NSCA'),
#(3,'BOM','Mumbai','CSMA')
#''')
#conn.commit()

# Serach/Retrieve
mycursor.execute("SELECT * FROM airport WHERE airport_id>1")
data = mycursor.fetchall()  # fetchone when the ouput data from above code line is one single and when multiple row is the output will use fetchall
print(data)

for i in data:
    print(i[3])

#Upadte
mycursor.execute('''
UPDATE airport
SET city = 'Bombay'
Where airport_id=3
''')
conn.commit()
mycursor.execute("SELECT * FROM airport")
data = mycursor.fetchall()  # fetchone when the ouput data from above code line is one single and when multiple row is the output will use fetchall
print(data)

#Delete
mycursor.execute('DELETE FROM airport WHERE airport_id = 3')
mycursor.execute('SELECT * FROM airport')
data = mycursor.fetchall()
print(data)



