-- Triggers database transporte
use transporte;
-- movimientos
delimiter //
create trigger primer_movimiento
after insert on productos
for each row
begin
	insert into movimientos (fecha, id_producto)
    values (now(), new.id_producto);
end;//
delimiter ;