use transporte;

delimiter //
create procedure agregar_nuevo_producto(in in_nombre varchar(255), in in_descripcion varchar(255), in_tipo varchar(255), in in_valor double(255,2) , in in_id_proveedor int, in in_cantidad int, in in_id_almacen int)
begin
	declare id_producto int default 0;
	INSERT INTO productos (nombre, descripcion, tipo, valor, id_proveedor) VALUES (in_nombre, in_descripcion, in_tipo, in_valor, in_id_proveedor);
    
    set id_producto = last_insert_id();
    
    insert into inventario values (in_id_almacen, id_producto, 0);
    
    insert into movimientos (fecha, cantidad, salida, id_almacen, id_producto) values (now(), in_cantidad, 0, in_id_almacen, id_producto);
end ;
// delimiter ;