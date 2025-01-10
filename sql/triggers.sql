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