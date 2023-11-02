# Code related to database is written in separte file and genral code is written sepratly
import mysql.connector

class DB:
    def __init__(self):
        #connect to the database
        try:
            self.conn = mysql.connector.connect(
                host='127.0.0.1',
                user='root',
                database='indigo'
            )
            self.mycursor = self.conn.cursor()
            print('Connection Established')

    # mycursor is main object to write query
        except:
            print('Connection Error')

    def fetch_city_names(self):
        city = []
        self.mycursor.execute("""
        SELECT DISTINCT(Destination) FROM flight.group
        UNION
        SELECT DISTINCT(Source) FROM flight.group
        """)

        data = self.mycursor.fetchall()
        print(data) #data is in tuple so to get data doing necxt step

        for item in data:
            city.append(item[0])

        return city

