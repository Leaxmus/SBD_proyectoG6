def mostrar_menu():
  print("\n--- Manual de Usuario ---")
  print("1. Crear un nuevo registro")
  print("2. Consultar un registro")
  print("3. Editar un registro")
  print("4. Eliminar un registro")
  print("5. Salir")
  
  def crear_registro():
    print("\n--- Manual de Usuario - Añadir registros ---")
    print("Esta opción permite agregar nuevos registros a las tablas de la base de datos.")
    print("Las tablas disponibles para agregar registros son:")
    print("- **Conductores**: Añadir información sobre conductores, como nombre, teléfono, licencia, etc.")
    print("- **Clientes**: Añadir información sobre clientes, como nombre de la empresa, dirección, etc.")
    print("- **Vehículos**: Añadir información sobre vehículos, incluyendo placa, capacidad, y seguro.")
    print("\nPasos:")
    print("1. Elija la tabla a la que desea añadir un registro.")
    print("2. Ingrese los datos solicitados de manera correcta (por ejemplo, nombres, teléfono, etc.).")
    print("3. El sistema almacenará el nuevo registro en la base de datos.")

  def ver_registros():
    print("\n--- Manual de Usuario - Consultar registros ---")
    print("Esta opción permite consultar los registros existentes en las tablas de la base de datos.")
    print("Las tablas disponibles para consultar son:")
    print("- **Conductores**: Ver información sobre los conductores registrados.")
    print("- **Clientes**: Ver la lista de clientes y sus datos de contacto.")
    print("- **Vehículos**: Consultar los vehículos registrados en la base de datos.")
    print("\nPasos:")
    print("1. Elija la tabla que desea consultar.")
    print("2. Ingrese un filtro de búsqueda (por ejemplo, un nombre o ID) si es necesario.")
    print("3. El sistema mostrará los registros encontrados según su criterio de búsqueda.")
  

  def consultar_registro():
    print("\nOpción 3: Consultar un registro")
    print("Para consultar un registro, se debe proporcionar un identificador único.")
    print("Este identificador es utilizado para buscar y mostrar el registro correspondiente.")

  def editar_registro():
    print("\n--- Manual de Usuario - Editar registros ---")
    print("Esta opción permite modificar los registros existentes en las tablas de la base de datos.")
    print("Las tablas disponibles para editar registros son:")
    print("- **Conductores**: Modificar los datos de un conductor ya registrado.")
    print("- **Clientes**: Editar la información de un cliente registrado.")
    print("- **Vehículos**: Cambiar los datos de un vehículo existente.")
    print("\nPasos:")
    print("1. Elija la tabla en la que desea realizar cambios.")
    print("2. Ingrese el **ID** del registro que desea editar.")
    print("3. Modifique los datos que desea cambiar y confirme los cambios.")
    print("4. El sistema actualizará el registro con los nuevos datos.")

  def eliminar_registro():
    print("\n--- Manual de Usuario - Eliminar registros ---")
    print("Esta opción permite eliminar registros de la base de datos.")
    print("Las tablas disponibles para eliminar registros son:")
    print("- **Conductores**: Eliminar un conductor registrado.")
    print("- **Clientes**: Eliminar un cliente de la base de datos.")
    print("- **Vehículos**: Eliminar un vehículo registrado.")
    print("\nPasos:")
    print("1. Elija la tabla de la que desea eliminar un registro.")
    print("2. Ingrese el **ID** del registro que desea eliminar.")
    print("3. El sistema confirmará si desea proceder con la eliminación. Si confirma, el registro será eliminado permanentemente.")
   

  def manual_usuario():
    while True:
        mostrar_menu()
        opcion = input("Elige una opción (1-6): ")

        if opcion == "1":
            crear_registro()
        elif opcion == "2":
            ver_registros()
        elif opcion == "3":
            editar_registro()
        elif opcion == "4":
            eliminar_registro()
        elif opcion == "5":
            print("Saliendo del manual de usuario.")
            break
        else:
            print("Opción no válida, por favor ingresa una opción del 1 al 6.")

