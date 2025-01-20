use transporte;

create view reporteProductosAlmacen as
select nombre as producto, descripcion, tipo, valor, cantidad, direccion as almacen, cedula as cedula_gerente, primer_nombre, primer_apellido
from almacenes join inventario using (id_almacen) join productos using (id_producto) join gerentes_almacen using(cedula);

create view ReporteMovimientosProductos as
select  nombre as producto, fecha, m.cantidad as cantidad_movida, if(m.salida=0, 'entrada', 'salida') as movimiento, i.cantidad as en_inventario, direccion as almacen
from almacenes as a join inventario as i using (id_almacen) join productos as p using (id_producto) join movimientos as m on (a.id_almacen = m.id_almacen and p.id_producto = m.id_producto);

create view ReporteTotalProductos as
select nombre, descripcion, tipo, valor, sum(cantidad) as total_producto, razon_social, direccion, telefono, correo
from productos join inventario using(id_producto) join proveedores using(id_proveedor)
group by id_producto;

create view ReporteProductosEntrega as
select id_entrega, nombre as producto, valor, cantidad, razon_social
from entregas join detalles_entrega using (id_entrega) join productos using (id_producto) join clientes using (id_cliente);
