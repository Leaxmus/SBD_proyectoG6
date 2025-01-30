import mysql.connector
from mysql.connector import errorcode
import funciones as f

try:
    cnx = mysql.connector.connect(user='root', password='1234', host='localhost', database='transporte')
    cursor = cnx.cursor()
    
    opcion = 0
    while opcion != 5:
        opcion, tabla = f.menu()
        
        # Producto
        if tabla == 1:
            if opcion == 1:
                argumentos_producto = f.agregar_producto()
                cursor.callproc("agregar_nuevo_producto", argumentos_producto)
            elif opcion == 2:
                cursor.callproc("mostrar_productos", (0,))
                for resultado in cursor.stored_results():
                    for producto in resultado:
                        print(producto)
            elif opcion == 3:
                argumentos_producto = f.actualizar_producto()
                cursor.callproc("actualizar_producto", argumentos_producto)
            elif opcion == 4:
                id_producto = f.eliminar_producto()
                cursor.callproc("eliminar_producto", id_producto)
        
        # Almacén
        elif tabla == 2:
            if opcion == 1:
                cedulas = [cedula[0] for cedula in cursor.execute("SELECT cedula FROM gerentes_almacen")]
                q_almacen, d_almacen = f.agregar_almacen(cedulas)
                cursor.execute(q_almacen, d_almacen)
            elif opcion == 2:
                cursor.execute("SELECT * FROM almacenes")
                for almacen in cursor:
                    print(almacen)
            elif opcion == 3:
                argumentos_almacen = f.actualizar_almacen()
                cursor.callproc("actualizar_almacen", argumentos_almacen)
            elif opcion == 4:
                id_almacen = f.eliminar_almacen()
                cursor.callproc("eliminar_almacen", id_almacen)

        # Ruta
        elif tabla == 3:
                if opcion == 1:
                    query_ruta, datos_ruta = f.agregar_ruta()  
                    cursor.callproc("InsertarRuta", datos_ruta)  
                elif opcion == 2:
                    cursor.execute(f.consultar_rutas())
                    for ruta in cursor:
                        print(ruta)
                elif opcion == 3:
                    query_ruta, datos_ruta = f.actualizar_ruta()  
                    cursor.callproc("ActualizarRuta", datos_ruta) 
                elif opcion == 4:
                    query_ruta, datos_ruta = f.eliminar_ruta()  
                    cursor.callproc("EliminarRuta", datos_ruta)  

        #Entrega
        # Entrega
        elif tabla == 4:
            if opcion == 1:
                argumentos_entrega = f.agregar_entrega()
                resultado = cursor.callproc("InsertarEntrega", argumentos_entrega)    
            elif opcion == 2:
                cursor.execute(f.consultar_entregas())
                for entrega in cursor:
                    print(entrega)
            elif opcion == 3:
                query_entrega, datos_entrega = f.actualizar_entrega()
                cursor.callproc("ActualizarEntrega",datos_entrega )
            elif opcion== 4:
                id_entrega = f.eliminar_entrega()
                cursor.callproc("EliminarEntrega",id_entrega)

        #cliente
        elif tabla == 6:
            if opcion == 1:
                query_cliente, datos_cliente = f.InsertarCliente()  
                cursor.callproc("InsertarCliente", datos_cliente) 
            elif opcion == 2:
                query = f.consultar_clientes() 
                cursor.execute(query)
                for cliente in cursor:
                    print(cliente)
            elif opcion == 3:
                query_cliente, datos_cliente = f.actualizar_cliente()  
                cursor.callproc("ActualizarCliente", datos_cliente)  
            elif opcion == 4:
                id_cliente = f.eliminar_cliente()
                cursor.callproc("EliminarCliente", id_cliente)  
        
       #Conductores
        elif tabla == 7:
            if opcion == 1:
                query_conductor, datos_conductor = f.agregar_conductor()
                cursor.execute(query_conductor, datos_conductor)
            elif opcion == 2:
                cursor.execute(f.consultar_conductores())
                for conductores in cursor:
                    print(conductores)
            elif opcion == 3:
                query_conductor, datos_conductor = f.actualizar_conductor()
                cursor.execute(query_conductor, datos_conductor)
            elif opcion == 4:
                query_conductor, datos_conductor = f.eliminar_conductor()
                cursor.execute(query_conductor,datos_conductor)
 
        #Auxiliar 
        elif tabla ==8:
            if opcion == 1:
                query_auxiliar, datos_auxiliar = f.agregar_auxiliar()
                cursor.execute(query_conductor, datos_conductor)
            elif opcion == 2:
                cursor.execute(f.consultar_auxiliares())
                for auxiliares in cursor:
                    print(auxiliares)
            elif opcion == 3:
                query_auxiliar, datos_auxiliar = f.actualizar_auxiliar()
                cursor.execute(query_auxiliar, datos_auxiliar)
            elif opcion == 4:
                query_auxiliar, datos_auxiliar = f.eliminar_auxiliar()
                cursor.execute(query_auxiliar,datos_auxiliar)

        #vehiculos 
        elif tabla == 9:
            if opcion == 1:
                query_vehicular, datos_vehicular = f.agregar_vehiculo()
                cursor.execute(query_vehicular, datos_vehicular)
            elif opcion == 2:
                cursor.execute(f.consultar_vehiculos())
                for vehiculares in cursor:
                    print(vehiculares)
            elif opcion == 3:
                query_vehicular, datos_vehicular = f.actualizar_vehiculo()
                cursor.execute(query_vehicular, datos_vehicular)
            elif opcion == 4:
                query_vehicular, datos_vehicular = f.eliminar_vehiculo()
                cursor.execute(query_vehicular,datos_vehicular)
        
        
        #Unidad de trabajo 
        elif tabla == 10:
            if opcion == 1:
                query_trabajo, datos_trabajo = f.agregar_auxiliar()
                cursor.execute(query_trabajo, datos_trabajo)
            elif opcion == 2:
                cursor.execute(f.consultar_auxiliares())
                for trabajos in cursor:
                    print(trabajos)
            elif opcion == 3:
                query_trabajo, datos_trabajo= f.actualizar_auxiliar()
                cursor.execute(query_trabajo, datos_trabajo)
            elif opcion == 4:
                query_trabajo, datos_trabajo= f.eliminar_auxiliar()
                cursor.execute(query_trabajo,datos_trabajo)

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
