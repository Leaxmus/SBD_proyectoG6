import mysql.connector
from mysql.connector import errorcode

try:
  cnx = mysql.connector.connect(user='root', password = '1234', host='localhost', database='transporte')
  
  cursor = cnx.cursor()
  
  query = ("SELECT primer_nombre, primer_apellido "
           "from conductores where cedula in (select cedula_c from rutas where estado = 1)")
  
  cursor.execute(query)
  
  print("Los conductores que se encuentran en ruta son:")
  for primer_nombre, primer_apellido in cursor:
    print(primer_nombre, primer_apellido)
  
  print()
  query = ("SELECT c.razon_social, e.fecha_entrega, e.valor_total "
           "FROM Clientes c "
           "JOIN Entregas e using(ID_cliente) "
           "WHERE e.valor_total > 1000 AND e.fecha_entrega > '2024-06-04' "
           "ORDER BY e.fecha_entrega")
  
  cursor.execute(query)
  print("Los clientes que pagarón más de 1000 después del 2024-06-04:")
  for razon, fecha, valor in cursor:
    print(razon, fecha, valor)

except mysql.connector.Error as err:
  if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Something is wrong with your user name or password")
  elif err.errno == errorcode.ER_BAD_DB_ERROR:
    print("Database does not exist")
  else:
    print(err)
else:
  cnx.close()