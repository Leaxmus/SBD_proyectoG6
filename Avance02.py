import mysql.connector
from mysql.connector import errorcode
import funciones as f

try:
    cnx = mysql.connector.connect(user='root', password = '1234', host='localhost', database='transporte')
    
    cursor = cnx.cursor()
    
    opcion = 0
    while opcion != 5:
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
        
        # consultar productos
        elif opcion == 2 and tabla == 1:
            print("Lista de todos los productos:")
            cursor.callproc("mostrar_productos", (0,))

            for resultado in cursor.stored_results():
                for producto in resultado:
                    print(producto)
        
        # consultar almacenes
        elif opcion == 2 and tabla == 2:
            print("Lista de todos los almacenes:")
            # lista
            cursor.execute("SELECT * FROM almacenes")

            for almacen in cursor:
                print(almacen)

        elif opcion == 3 and tabla == 1:
            argumentos_producto = f.actualizar_producto()
            cursor.callproc("actualizar_producto", argumentos_producto)

        elif opcion == 3 and tabla == 2:
            argumentos_almacen = f.actualizar_almacen()
            cursor.callproc("actualizar_almacen", argumentos_almacen)

        elif opcion == 4 and tabla == 1:
            id_producto = f.eliminar_producto()
            cursor.callproc("eliminar_producto", (id_producto))

        elif opcion == 4 and tabla == 2:
            id_almacen = f.eliminar_almacen()
            cursor.callproc("eliminar_almacen", (id_almacen))

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
