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

-- Elkin  
DELIMITER //
CREATE TRIGGER prevenir_eliminar_rutas
BEFORE DELETE ON Rutas
FOR EACH ROW
BEGIN
    DECLARE entregas_activas INT;
    SELECT COUNT(*) INTO entregas_activas
    FROM Entregas
    WHERE ID_ruta = OLD.ID_ruta AND estado = 1; 
    -- Impedir la eliminación si hay entregas activas
    IF entregas_activas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No se puede eliminar la ruta porque tiene entregas activas asociadas.';
    END IF;
END;
DELIMITER //

DELIMITER //
CREATE TRIGGER prevenir_eliminar_punto_entrega
BEFORE DELETE ON Puntos_entrega
FOR EACH ROW
BEGIN
    DECLARE entregas_asociadas INT;
    -- Verificar si existen entregas asociadas al punto de entrega
    SELECT COUNT(*) INTO entregas_asociadas
    FROM Entregas
    WHERE ID_p_entrega = OLD.ID_p_entrega;
    -- Si existen entregas asociadas, impedir la eliminación
    IF entregas_asociadas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un punto de entrega con entregas asociadas.';
    END IF;
END;
DELIMITER //

CREATE TRIGGER actualizar_cedula_cliente_punto_entrega
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    -- Actualizar la cédula del cliente en los puntos de entrega asociados
    UPDATE Puntos_entrega
    SET cedula = NEW.cedula
    WHERE cedula = OLD.cedula;
END;


CREATE TRIGGER mantener_estado_entrega_pendiente
AFTER UPDATE ON Rutas
FOR EACH ROW
BEGIN
    -- Verificar si la ruta se ha desactivado
    IF NEW.estado = 0 THEN
        UPDATE Entregas
        SET estado = 0 -- pendiente o inactivo
        WHERE ID_ruta = NEW.ID_ruta;
    END IF;
END;


DELIMITER //

CREATE TRIGGER VerificarPlacaRuta
BEFORE INSERT ON Rutas
FOR EACH ROW
BEGIN
    DECLARE placa_existe INT;
    -- Verificar si la placa del vehículo ya está registrada en otra ruta
    SELECT COUNT(*) INTO placa_existe
    FROM Rutas
    WHERE placa_vehiculo = NEW.placa_vehiculo;

    IF placa_existe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La placa del vehículo ya está registrada en otra ruta.';
    END IF;
END;
DELIMITER //


DELIMITER //
CREATE TRIGGER VerificarFirmaEntrega
BEFORE INSERT ON Entregas
FOR EACH ROW
BEGIN
    -- Verificar si la firma de la entrega es NULL
    IF NEW.firma IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La entrega no ha sido firmada por cliente.';
    END IF;
END $$

DELIMITER //


-- dudoso este trigger 
DELIMITER //
CREATE TRIGGER VerificarGerentesDistintos
BEFORE INSERT ON Gerentes_operaciones
FOR EACH ROW
BEGIN
    DECLARE cedulaRepetida INT;
    -- Verificar si la cédula del gerente de operaciones ya está registrada como gerente de ventas
    SELECT COUNT(*) INTO cedulaRepetida
    FROM Gerentes_ventas
    WHERE cedula = NEW.cedula;

    IF cedulaRepetida > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Un mismo gerente no puede ser asignado a ambos roles (Operaciones y Ventas).';
    END IF;
END;
DELIMITER //