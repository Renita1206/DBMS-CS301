import mysql.connector 

mydb = mysql.connector.connect(host="localhost", user="root", password="", database="RailwaySystem_331")
c = mydb.cursor()

def create_table(): 
    c.execute('CREATE TABLE IF NOT EXISTS TRAIN_331(TrainNo int, TrainName TEXT, TrainType TEXT, Source TEXT, Destination TEXT, Availability TEXT, PRIMARY KEY(TrainNo))')

def add_data(train_no, train_name, train_type, source, dest, avail): 
    print(train_no)
    c.execute('INSERT INTO TRAIN_331 VALUES (%s, %s, %s, %s, %s, %s)',(train_no, train_name, train_type, source, dest, avail)) 
    mydb.commit()

def view_all_data(): 
    c.execute('SELECT * FROM TRAIN_331') 
    data = c.fetchall()
    return data

def view_only_train_no(): 
    c.execute('SELECT TrainNo FROM TRAIN_331') 
    data = c.fetchall()
    return data

def get_train(train_no): 
    c.execute('SELECT * FROM TRAIN_331 WHERE TrainNo="{}"'.format(train_no)) 
    data = c.fetchall()
    return data

def edit_train_data(new_train_no, new_train_name, new_train_type, new_source, new_dest, new_avail, train_no, train_name): 
    print(new_avail, type(train_no))
    c.execute('UPDATE TRAIN_331 SET TrainNo = %d, TrainName = %s, TrainType = %s, Source = %s, Destination = %s, Availability = %s WHERE TrainNo = %d', (new_train_no, new_train_name, new_train_type, new_source, new_dest,new_avail, train_no)) 
    mydb.commit()
    c.execute('SELECT * FROM TRAIN_331')
    data = c.fetchall()
    return data

def delete_data(train_no): 
    c.execute('DELETE FROM TRAIN_331 WHERE trainNo="{}"'.format(train_no)) 
    mydb.commit()