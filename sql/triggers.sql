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

delimiter //
create trigger antes_eliminar_producto
before delete on productos
for each row
begin
    declare num_movimientos int default 0;
    select count(*) into num_movimientos
    from movimientos
    where id_producto = old.id_producto;
    
    if num_movimientos <> 1 then
        signal sqlstate '45000'
        set message_text = 'No se puede eliminar el producto, tiene movimientos asociados';
    else
        delete from inventario where id_producto = old.id_producto;
        delete from movimientos where id_producto = old.id_producto;
    end if;
end; //
// delimiter ;

delimiter //
create trigger antes_eliminar_almacen
before delete on almacenes
for each row
begin
    declare num_productos int default 0;
    select count(*) into num_productos
    from inventario
    where id_almacen = old.id_almacen;
    
    if num_productos <> 0 then
        signal sqlstate '45000'
        set message_text = 'No se puede eliminar el almacen, tiene productos asociados';
    else
        delete from almacenes where id_almacen = old.id_almacen;
    end if;
end;
// delimiter ;

DELIMITER //
CREATE TRIGGER BeforeInsertConductor
BEFORE INSERT ON Conductores
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Conductores WHERE cedula = NEW.cedula) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cédula duplicada en tabla Conductores';
    END IF;
END;
// DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertAuxiliar
BEFORE INSERT ON Auxiliares
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Auxiliares WHERE cedula = NEW.cedula) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cédula duplicada en tabla Auxiliares';
    END IF;
END;
// DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertVehiculo
BEFORE INSERT ON Vehículos
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Vehículos WHERE placa = NEW.placa) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Placa duplicada en tabla Vehículos';
    END IF;
END;
// DELIMITER ;

DELIMITER //
CREATE TRIGGER BeforeInsertUnidadTrabajo
BEFORE INSERT ON unidades_trabajo
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM unidades_trabajo 
        WHERE cedula_c = NEW.cedula_c 
          AND cedula_a = NEW.cedula_a 
          AND (placa = NEW.placa OR placa_r = NEW.placa_r)
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Registro duplicado en tabla unidades_trabajo';
    END IF;
END;
// DELIMITER ;