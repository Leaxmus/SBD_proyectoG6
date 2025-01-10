def validar_numero(cadena):
    while not cadena.isdigit():
        cadena = input("Ingrese un número: ")
    return int(cadena)

def validar_decimal(cadena):
    while not cadena.replace(".", "", 1).isdigit():
        cadena = input("Ingrese un número decimal: ")
    return float(cadena)

def menu():
    usr1 = 0
    while usr1 < 1 or usr1 > 4:
        print("Desea")
        print("1. Crear registros")
        print("2. Consultar registros")
        print("3. Actualizar registros")
        print("4. Eliminar registros")
        usr1 = validar_numero(input("Ingrese el número de la opción deseada: "))

    usr2 = 0
    while usr2 < 1 or usr2 > 2:
        print("Para")
        print("1. Productos")
        print("2. Almacenes")
        usr2 = validar_numero(input("Ingrese el número de la opción deseada: "))
        
    return usr1, usr2

def agregar_producto():
    nombre = input("Ingrese el nombre del producto: ")
    descripcion = input("Ingrese la descripción del producto: ")
    tipo = input("Ingrese el tipo del producto: ")
    valor = validar_decimal(input("Ingrese el valor del producto: "))

    id_proveedor = 0
    while id_proveedor < 1 or id_proveedor > 10:
        id_proveedor = validar_numero(input("Ingrese el ID del proveedor(1-10): "))
    
    cantidad = validar_numero(input("Ingrese la cantidad de productos: "))
    id_almacen = 0
    while id_almacen < 1 or id_almacen > 10:
        id_almacen = validar_numero(input("Ingrese el ID del almacén(1-10): "))
    
    args_productos = (nombre, descripcion, tipo, valor, id_proveedor, cantidad, id_almacen)

    return args_productos

def agregar_almacen(cedulas):
    capacidad = validar_decimal(input("Ingrese la capacidad del almacén (m2): "))
    direccion = input("Ingrese la dirección del almacén: ")
    cedula_admin = 0
    while cedula_admin not in cedulas:
        cedula_admin = validar_numero(input("Ingrese una cédula válida: "))

    query_almacen = ("INSERT INTO almacenes (capacidad, direccion, cedula) VALUES (%s, %s, %s)")
    datos_almacen = (capacidad, direccion, cedula_admin)

    return query_almacen, datos_almacen

def mostrar_productos():
    pass