-- Triggers database transporte
use transporte;
-- movimientos
delimiter //
create trigger actualizar_inventario
after insert on movimientos
for each row
begin
	declare multiplicador int default 1;
    if new.salida = 1 then set multiplicador = -1;
    end if;
    
    update inventario
    set cantidad = cantidad + (new.cantidad * multiplicador)
    where id_almacen = new.id_almacen and id_producto = new.id_producto;
end; //
delimiter ;