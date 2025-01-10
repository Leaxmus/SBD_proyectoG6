import mysql.connector
from mysql.connector import errorcode
import funciones as f

try:
    cnx = mysql.connector.connect(user='root', password = '1234', host='localhost', database='transporte')
    
    cursor = cnx.cursor()
    opcion, tabla = f.menu()

    if opcion == 1 and tabla == 1:
        argumentos_producto = f.agregar_producto()
        cursor.callproc("agregar_nuevo_producto", argumentos_producto)
    
    elif opcion == 1 and tabla == 2:
        cedulas = []
        cursor.execute("SELECT cedula FROM gerentes_almacen")
        for cedula in cursor:
            cedulas.append(cedula[0])
        
        q_almacen, d_almacen = f.agregar_almacen(cedulas)
        cursor.execute(q_almacen, d_almacen)
    
    elif opcion == 2 and tabla == 1:
        pass

    elif opcion == 2 and tabla == 2:
        pass

    elif opcion == 3 and tabla == 1:
        pass

    elif opcion == 3 and tabla == 2:
        pass

    elif opcion == 4 and tabla == 1:
        pass

    elif opcion == 4 and tabla == 2:
        pass

    
    # Asegurarse de que se guarden los cambios
    cnx.commit()

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Algo está mal con tu usuario o contraseña")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("La base de datos no existe")
    else:
        print(err)
else:
    cnx.close()
