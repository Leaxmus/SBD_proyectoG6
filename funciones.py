
def validar_numero(cadena):
    while not cadena.isdigit():
        cadena = input("Ingrese un número: ")
    return int(cadena)

def validar_direccion(direccion):
    if not direccion.strip():
        raise ValueError("La dirección no puede estar vacía.")
    if direccion.isdigit():
        raise ValueError("La dirección no puede ser solo un número.")
    return direccion


def validar_decimal(cadena):
    while not cadena.replace(".", "", 1).isdigit():
        cadena = input("Ingrese un número decimal: ")
    return float(cadena)

def menu():
    usr1 = 0
    while usr1 < 1 or usr1 > 5:
        print("Desea")
        print("1. Crear registros")
        print("2. Consultar General registros")
        print("3. Actualizar registros")
        print("4. Eliminar registros")
        print("5. Salir")
        usr1 = validar_numero(input("Ingrese el número de la opción deseada: "))
    

    usr2 = 0
    while usr2 < 1 or usr2 > 12:
        print("Para")
        print("1. Productos")
        print("2. Almacenes")
        print("3. Rutas")
        print("4. Entregas")
        print("5. Puntos de Entrega")
        print("6. Clientes")
        print("7. Conductores")
        print("8. Auxiliar")
        print("9. Vehiculo")
        print("10. Unidad de trabajo")
        print("11. Gerente de operaciones")
        print("12. Gerente de ventas")
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

def actualizar_producto():
    id_producto = 0
    while id_producto < 1 or id_producto > 10:
        id_producto = validar_numero(input("Ingrese el ID del producto a actualizar(1-10): "))

    nombre = input("Ingrese el nuevo nombre del producto: ")
    descripcion = input("Ingrese la nueva descripción del producto: ")
    tipo = input("Ingrese el nuevo tipo del producto: ")
    valor = validar_decimal(input("Ingrese el nuevo valor del producto: "))
    id_proveedor = 0
    while id_proveedor < 1 or id_proveedor > 10:
        id_proveedor = validar_numero(input("Ingrese el nuevo ID del proveedor(1-10): "))
    argumentos_producto = (id_producto, nombre, descripcion, tipo, valor, id_proveedor)
    return argumentos_producto

def actualizar_almacen():
    id_almacen = 0
    while id_almacen < 1 or id_almacen > 10:
        id_almacen = validar_numero(input("Ingrese el ID del almacén a actualizar(1-10): "))

    capacidad = validar_decimal(input("Ingrese la nueva capacidad del almacén (m2): "))
    direccion = input("Ingrese la nueva dirección del almacén: ")
    cedula_admin = validar_numero(input("Ingrese la nueva cédula del administrador: "))

    args_almacen = (id_almacen, capacidad, direccion, cedula_admin)

    return args_almacen

def eliminar_producto():
    id_producto = 0
    while id_producto < 1 or id_producto > 10:
        id_producto = validar_numero(input("Ingrese el ID del producto a eliminar(1-10): "))

    return (id_producto,)

def eliminar_almacen():
    id_almacen = 0
    while id_almacen < 1 or id_almacen > 11:
        id_almacen = validar_numero(input("Ingrese el ID del almacén a eliminar: "))

    return (id_almacen,)

#Elkin
#agregar ruta
def agregar_ruta():
    hora_inicio = input("Ingrese la fecha de inicio (YYYY-MM-DD HH:MM:SS): ")
    hora_final = input("Ingrese la fecha de finalización (YYYY-MM-DD HH:MM:SS): ")
    distancia = validar_decimal(input("Ingrese la distancia de la ruta (km): "))
    estado = int(input("Ingrese el estado de la ruta (Activo -- 1 / Inactivo -- 0): "))
    placaVehiculo = input("Ingrese el número de placa: ")
    cedula_operaciones = validar_numero(input("Ingrese la cédula del gerente de operaciones: "))
    query_ruta = """
    CALL InsertarRuta(%s, %s, %s, %s, %s, %s);
    """
    datos_ruta = (hora_inicio, hora_final, placaVehiculo, distancia, estado, cedula_operaciones)
    return query_ruta, datos_ruta
# consultar ruta (ejemplo GENERAL )
def consultar_rutas():
    query = "SELECT * FROM rutas"
    return query

#actualizar ruta
def actualizar_ruta():
    id_ruta = int(input("Ingrese el ID de la ruta a actualizar: "))
    hora_inicio = input("Ingrese la nueva fecha de inicio (YYYY-MM-DD HH:MM:SS): ")
    hora_final = input("Ingrese la nueva fecha final (YYYY-MM-DD HH:MM:SS): ")
    distancia = validar_decimal(input("Ingrese la nueva distancia de la ruta (km): "))
    estado = int(input("Ingrese el nuevo estado de la ruta (Activo -- 1/Inactivo -- 0): "))
    query_ruta = """
    CALL ActualizarRuta(%s, %s, %s, %s, %s);
    """
    datos_ruta = (id_ruta,hora_inicio, hora_final, distancia, estado)

    return query_ruta, datos_ruta

#eliminar ruta
def eliminar_ruta():
    id_ruta = validar_numero(input("Ingrese el ID de la ruta a eliminar: "))
    query_ruta = """
    CALL EliminarRuta(%s);
    """
    datos_ruta = (id_ruta)
    return query_ruta, datos_ruta


#agregar punto de entrega
def agregar_punto_entrega():
    id_ruta = validar_numero(input("Ingrese el ID de la ruta asociada: "))
    direccion = validar_direccion(input("Ingrese la dirección del punto de entrega: "))
    return id_ruta,direccion

#consultar puntos de entrega
def consultar_puntos_entrega():
    query = "SELECT * FROM puntos_entrega"
    return query

#actualizar putno de entrega
def actualizar_punto_entrega():
    id_punto = validar_numero(input("Ingrese el ID del punto de entrega a actualizar: "))
    direccion = input("Ingrese la nueva dirección del punto de entrega: ")
    query_punto = """
    CALL ActualizarPuntoEntrega(%s, %s, );
    """
    datos_punto = (id_punto,direccion)
    return query_punto, datos_punto

#elimitar punto de entrega
def eliminar_punto_entrega():
    id_punto = validar_numero(input("Ingrese el ID del punto de entrega a eliminar: "))
    return  id_punto

#agregar cliente
def InsertarCliente():
    razon_social = input("Ingrese la razón social del cliente: ")
    telefono = input("Ingrese el teléfono del cliente: ")
    direccion = input("Ingrese la dirección del cliente: ")
    correo = input("Ingrese el correo electrónico del cliente: ")
    cedulaG = validar_numero(input("Ingrese la cédula del Gerente de Ventas: "))
    query_cliente = """
    CALL InsertarCliente(%s, %s, %s, %s, %s);
    """
    datos_cliente = (razon_social, telefono, direccion, correo, cedulaG)
    return query_cliente, datos_cliente

#consultar cliente TOTALES(GENERAL )
def consultar_clientes():
    query = "SELECT * FROM clientes"
    return query

#actualizar cliente
def actualizar_cliente():
    id_cliente = validar_numero(input("Ingrese el ID del cliente a actualizar: "))
    razon_social = input("Ingrese la nueva razón social del cliente: ")
    telefono = input("Ingrese el nuevo teléfono del cliente: ")
    direccion = input("Ingrese la nueva dirección del cliente: ")
    correo = input("Ingrese el nuevo correo electrónico del cliente: ")
    query_cliente = """
    CALL ActualizarCliente(%s, %s, %s, %s, %s);
    """
    datos_cliente = (id_cliente,razon_social, telefono, direccion, correo)
    return query_cliente, datos_cliente

#eliminar cliente
def eliminar_cliente():
    id_cliente = validar_numero(input("Ingrese el ID del cliente a eliminar: "))
    query_cliente = """
    CALL EliminarCliente(%s);
    """
    datos_cliente = (id_cliente,)  
    return datos_cliente

#agregar entrega
def agregar_entrega():
    id_entrega = validar_numero(input("Ingrese el ID de la entrega: "))
    fecha_entrega = input("Ingrese la fecha de entrega (YYYY-MM-DD HH:MM:SS): ")
    estado = validar_numero(input("Ingrese el estado de la entrega (0 - Pendiente, 1 - Completada): "))
    valor_total = validar_decimal(input("Ingrese el valor total de la entrega: "))
    id_ruta = validar_numero(input("Ingrese el ID de la ruta asociada: "))
    id_cliente = validar_numero(input("Ingrese el ID del cliente asociado: "))
    firma = input("Ingrese el nombre de la firma del receptor (dejar vacío si no aplica): ")

    firma = firma if firma else None

    args_entrega = (id_entrega, fecha_entrega, estado, valor_total, id_ruta, id_cliente, firma)
    
    return args_entrega



def agregar_detalle_entrega(id_entrega):
    id_producto = validar_numero(input("Ingrese el ID del producto asociado: "))
    cantidad = validar_numero(input("Ingrese la cantidad de productos: "))
    args_detalle = (id_entrega, id_producto, cantidad)
    return args_detalle

#consultar entregas TOTALES(GENERAL )
def consultar_entregas():
    query = "SELECT * FROM entregas"
    return query

#actualizar entrega
def actualizar_entrega():
    id_entrega = validar_numero(input("Ingrese el ID de la entrega a actualizar: "))
    fecha_entrega = input("Ingrese la nueva fecha de entrega (YYYY-MM-DD HH:MM:SS): ")
    estado = validar_numero(input("Ingrese el nuevo estado de la entrega (0 - Pendiente, 1 - Completada): "))
    valor_total = validar_decimal(input("Ingrese el nuevo valor total de la entrega: "))
    firma = input("Ingrese el nombre del receptor que firma la entrega (dejar vacío si no aplica): ")
    query_actualizar_entrega = """
    CALL ActualizarEntrega(%s, %s, %s, %s, %s);
    """
    args_entrega = (id_entrega, fecha_entrega, estado, valor_total, firma if firma else None)
    return query_actualizar_entrega, args_entrega

#eliminar entrega por medio ID
def eliminar_entrega():
    id_entrega = validar_numero(input("Ingrese el ID de la entrega a eliminar: "))
    query_entrega = """
    CALL EliminarEntrega(%s);
    """
    datos_entrega = (id_entrega,)
    return query_entrega, datos_entrega
#Francis
def agregar_conductor():
    cedula = validar_numero(input("Ingrese la cédula del conductor: "))
    primer_nombre = input("Ingrese el primer nombre del conductor: ")
    segundo_nombre = input("Ingrese el segundo nombre del conductor: ")
    primer_apellido = input("Ingrese el primer apellido del conductor: ")
    segundo_apellido = input("Ingrese el segundo apellido del conductor: ")
    telefono = input("Ingrese el teléfono del conductor: ")
    correo = input("Ingrese el correo del conductor: ")
    licencia = input("Ingrese el número de licencia: ")
    experiencia = input("Ingrese la experiencia del conductor: ")

    query_conductor = """
    CALL AddConductor(%s, %s, %s, %s, %s, %s, %s, %s);
    """
    datos_conductor = (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo, licencia, experiencia)
    
    return query_conductor, datos_conductor


def consultar_conductores():
    query = "SELECT * FROM Conductores"
    return query


def actualizar_conductor():
    cedula = validar_numero(input("Ingrese la cédula del conductor a actualizar: "))
    primer_nombre = input("Ingrese el nuevo primer nombre: ")
    segundo_nombre = input("Ingrese el nuevo segundo nombre: ")
    primer_apellido = input("Ingrese el nuevo primer apellido: ")
    segundo_apellido = input("Ingrese el nuevo segundo apellido: ")
    telefono = input("Ingrese el nuevo teléfono: ")
    correo = input("Ingrese el nuevo correo: ")
    licencia = input("Ingrese el nuevo número de licencia: ")
    experiencia = input("Ingrese la nueva experiencia: ")

    query_conductor = """
    CALL UpdateConductor(%s, %s, %s, %s, %s, %s, %s, %s, %s);
    """
    datos_conductor = (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo, licencia, experiencia)
    
    return query_conductor, datos_conductor


def eliminar_conductor():
    cedula = validar_numero(input("Ingrese la cédula del conductor a eliminar: "))

    query_conductor = """
    CALL DeleteConductor(%s);
    """
    datos_conductor = (cedula,)
    
    return query_conductor, datos_conductor



def agregar_auxiliar():
    cedula = validar_numero(input("Ingrese la cédula del auxiliar: "))
    primer_nombre = input("Ingrese el primer nombre del auxiliar: ")
    segundo_nombre = input("Ingrese el segundo nombre del auxiliar: ")
    primer_apellido = input("Ingrese el primer apellido del auxiliar: ")
    segundo_apellido = input("Ingrese el segundo apellido del auxiliar: ")
    telefono = input("Ingrese el teléfono del auxiliar: ")
    correo = input("Ingrese el correo del auxiliar: ")

    query_auxiliar = """
    CALL AddAuxiliar(%s, %s, %s, %s, %s, %s, %s);
    """
    datos_auxiliar = (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo)
    
    return query_auxiliar, datos_auxiliar


def consultar_auxiliares():
    query = "SELECT * FROM Auxiliares"
    return query


def actualizar_auxiliar():
    cedula = validar_numero(input("Ingrese la cédula del auxiliar a actualizar: "))
    primer_nombre = input("Ingrese el nuevo primer nombre: ")
    segundo_nombre = input("Ingrese el nuevo segundo nombre: ")
    primer_apellido = input("Ingrese el nuevo primer apellido: ")
    segundo_apellido = input("Ingrese el nuevo segundo apellido: ")
    telefono = input("Ingrese el nuevo teléfono: ")
    correo = input("Ingrese el nuevo correo: ")

    query_auxiliar = """
    CALL UpdateAuxiliar(%s, %s, %s, %s, %s, %s, %s, %s);
    """
    datos_auxiliar = (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo)
    
    return query_auxiliar, datos_auxiliar


def eliminar_auxiliar():
    cedula = validar_numero(input("Ingrese la cédula del auxiliar a eliminar: "))

    query_auxiliar = """
    CALL DeleteAuxiliar(%s);
    """
    datos_auxiliar = (cedula,)
    
    return query_auxiliar, datos_auxiliar



def agregar_vehiculo():
    placa = input("Ingrese la placa del vehículo: ")
    capacidad = validar_decimal(input("Ingrese la capacidad del vehículo (en toneladas): "))
    datalogger = input("Ingrese el número de datalogger: ")
    fecha_mantenimiento = input("Ingrese la fecha de mantenimiento (YYYY-MM-DD): ")
    id_seguro = validar_numero(input("Ingrese el ID del seguro: "))

    query_vehiculo = """
    CALL AddVehiculo(%s, %s, %s, %s, %s);
    """
    datos_vehiculo = (placa, capacidad, datalogger, fecha_mantenimiento, id_seguro)
    
    return query_vehiculo, datos_vehiculo


def consultar_vehiculos():
    query = "SELECT * FROM Vehículos"
    return query


def actualizar_vehiculo():
    placa = input("Ingrese la placa del vehículo a actualizar: ")
    capacidad = validar_decimal(input("Ingrese la nueva capacidad del vehículo (en toneladas): "))
    datalogger = input("Ingrese el nuevo número de datalogger: ")
    fecha_mantenimiento = input("Ingrese la nueva fecha de mantenimiento (YYYY-MM-DD): ")
    id_seguro = validar_numero(input("Ingrese el nuevo ID del seguro: "))

    query_vehiculo = """
    CALL UpdateVehiculo(%s, %s, %s, %s, %s);
    """
    datos_vehiculo = (placa, capacidad, datalogger, fecha_mantenimiento, id_seguro)
    
    return query_vehiculo, datos_vehiculo


def eliminar_vehiculo():
    placa = input("Ingrese la placa del vehículo a eliminar: ")

    query_vehiculo = """
    CALL DeleteVehiculo(%s);
    """
    datos_vehiculo = (placa,)
    
    return query_vehiculo, datos_vehiculo



def agregar_unidad_trabajo():
    cedula_conductor = validar_numero(input("Ingrese la cédula del conductor: "))
    cedula_auxiliar = validar_numero(input("Ingrese la cédula del auxiliar: "))
    placa_vehiculo = input("Ingrese la placa del vehículo: ")
    placa_vehiculo_refrigerado = input("Ingrese la placa del vehículo refrigerado (opcional): ")

    query_unidad_trabajo = """
    CALL AddUnidadTrabajo(%s, %s, %s, %s);
    """
    datos_unidad_trabajo = (cedula_conductor, cedula_auxiliar, placa_vehiculo, placa_vehiculo_refrigerado)
    
    return query_unidad_trabajo, datos_unidad_trabajo


def consultar_unidades_trabajo():
    query = "SELECT * FROM unidades_trabajo"
    return query


def actualizar_unidad_trabajo():
    cedula_conductor = validar_numero(input("Ingrese la cédula del conductor: "))
    cedula_auxiliar = validar_numero(input("Ingrese la cédula del auxiliar: "))
    placa_vehiculo = input("Ingrese la nueva placa del vehículo: ")
    placa_vehiculo_refrigerado = input("Ingrese la nueva placa del vehículo refrigerado (opcional): ")

    query_unidad_trabajo = """
    CALL UpdateUnidadTrabajo(%s, %s, %s, %s);
    """
    datos_unidad_trabajo = (cedula_conductor, cedula_auxiliar, placa_vehiculo, placa_vehiculo_refrigerado)
    
    return query_unidad_trabajo, datos_unidad_trabajo


def eliminar_unidad_trabajo():
    cedula_conductor = validar_numero(input("Ingrese la cédula del conductor: "))
    cedula_auxiliar = validar_numero(input("Ingrese la cédula del auxiliar: "))

    query_unidad_trabajo = """
    CALL DeleteUnidadTrabajo(%s, %s);
    """
    datos_unidad_trabajo = (cedula_conductor, cedula_auxiliar)
    
    return query_unidad_trabajo, datos_unidad_trabajo


def insertar_gerente_operaciones():
    cedula = validar_numero(input("Ingrese la cédula del gerente: "))
    primer_nombre = input("Ingrese el primer nombre del gerente: ")
    segundo_nombre = input("Ingrese el segundo nombre del gerente (opcional): ")
    primer_apellido = input("Ingrese el primer apellido del gerente: ")
    segundo_apellido = input("Ingrese el segundo apellido del gerente (opcional): ")
    telefono = input("Ingrese el teléfono del gerente: ")
    correo = input("Ingrese el correo del gerente: ")
    query_gerente = """
    CALL insertar_gerente_operaciones(%s, %s, %s, %s, %s, %s, %s);
    """
    datos_gerente = (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo)
    return query_gerente, datos_gerente

def actualizar_gerente_operaciones():
    cedula = validar_numero(input("Ingrese la cédula del gerente a actualizar: "))
    primer_nombre = input("Ingrese el nuevo primer nombre del gerente: ")
    segundo_nombre = input("Ingrese el nuevo segundo nombre del gerente (opcional): ")
    primer_apellido = input("Ingrese el nuevo primer apellido del gerente: ")
    segundo_apellido = input("Ingrese el nuevo segundo apellido del gerente (opcional): ")
    telefono = input("Ingrese el nuevo teléfono del gerente: ")
    correo = input("Ingrese el nuevo correo del gerente: ")
    query_gerente = """
    CALL actualizar_gerente_operaciones(%s, %s, %s, %s, %s, %s, %s);
    """
    datos_gerente = (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo)
    
    return query_gerente, datos_gerente

def eliminar_gerente_operaciones():
    cedula = validar_numero(input("Ingrese la cédula del gerente a eliminar: "))
    query_gerente = """
    CALL eliminar_gerente_operaciones(%s);
    """
    datos_gerente = (cedula,)
    return datos_gerente

def insertar_gerente_ventas():
    p_cedula = int(input("Ingrese la cédula del gerente de ventas: "))
    p_primer_nombre = input("Ingrese el primer nombre del gerente: ")
    p_segundo_nombre = input("Ingrese el segundo nombre del gerente: ")
    p_primer_apellido = input("Ingrese el primer apellido del gerente: ")
    p_segundo_apellido = input("Ingrese el segundo apellido del gerente: ")
    p_telefono = input("Ingrese el teléfono del gerente: ")
    p_correo = input("Ingrese el correo electrónico del gerente: ")

    query_gerente = """
    CALL InsertarGerenteVentas(%s, %s, %s, %s, %s, %s, %s);
    """
    datos_gerente = (p_cedula, p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_telefono, p_correo)
    
    return query_gerente, datos_gerente

def actualizar_gerente_ventas():
    p_cedula = int(input("Ingrese la cédula del gerente de ventas a actualizar: "))
    p_primer_nombre = input("Ingrese el nuevo primer nombre del gerente: ")
    p_segundo_nombre = input("Ingrese el nuevo segundo nombre del gerente: ")
    p_primer_apellido = input("Ingrese el nuevo primer apellido del gerente: ")
    p_segundo_apellido = input("Ingrese el nuevo segundo apellido del gerente: ")
    p_telefono = input("Ingrese el nuevo teléfono del gerente: ")
    p_correo = input("Ingrese el nuevo correo electrónico del gerente: ")

    query_gerente = """
    CALL ActualizarGerenteVentas(%s, %s, %s, %s, %s, %s, %s);
    """
    datos_gerente = (p_cedula, p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_telefono, p_correo)
    
    return query_gerente, datos_gerente


def eliminar_gerente_ventas():
    p_cedula = int(input("Ingrese la cédula del gerente de ventas a eliminar: "))
    
    query_gerente = """
    CALL EliminarGerenteVentas(%s);
    """
    datos_gerente = (p_cedula,)
    
    return datos_gerente
