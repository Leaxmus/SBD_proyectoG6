use transporte;

delimiter //
create procedure agregar_nuevo_producto(in in_nombre varchar(255), in in_descripcion varchar(255), in_tipo varchar(255), in in_valor double(255,2) , in in_id_proveedor int, in in_cantidad int, in in_id_almacen int)
begin
	declare id_producto int default 0;
    start transaction;
	INSERT INTO productos (nombre, descripcion, tipo, valor, id_proveedor) VALUES (in_nombre, in_descripcion, in_tipo, in_valor, in_id_proveedor);
    
    set id_producto = last_insert_id();
    
    insert into inventario values (in_id_almacen, id_producto, 0);
    
    insert into movimientos (fecha, cantidad, salida, id_almacen, id_producto) values (now(), in_cantidad, 0, in_id_almacen, id_producto);
	commit;
end ;
// delimiter ;

delimiter //
create procedure mostrar_productos(in in_almacen int)
begin
	if in_almacen = 0 then
		select nombre, descripcion, tipo, valor, razon_social, sum(cantidad) as cantidad_disponible
		from productos join inventario using(id_producto) join proveedores using (id_proveedor)
		group by id_producto;
	else
		select nombre, descripcion, tipo, valor, razon_social, sum(cantidad) as cantidad_disponible
		from productos join inventario using(id_producto) join proveedores using (id_proveedor)
        where id_almacen = in_almacen
		group by id_producto;
	end if;
end;
// delimiter ;

delimiter //
create procedure actualizar_producto(in in_producto int, in in_nombre varchar(255), in in_descripcion varchar(255), in in_tipo varchar(255), in_valor double(255, 2), in in_proveedor int)
begin
	start transaction;
	update productos
    set  nombre = in_nombre, descripcion = in_descripcion, tipo = in_tipo, valor = in_valor, id_proveedor = in_proveedor
    where id_producto = in_producto;
    commit;
end;
// delimiter ;

delimiter //
create procedure eliminar_producto(in in_producto int)
begin
    delete from productos where id_producto = in_producto;
end;
// delimiter ;

delimiter //
create procedure actualizar_almacen(in in_almacen int, in_capacidad double, in in_direccion varchar(255), in in_cedula int)
begin
    update almacenes
    set  capacidad = in_capacidad, direccion = in_direccion, cedula = in_cedula
    where id_almacen = in_almacen;
end;
// delimiter ;

delimiter //
create procedure eliminar_almacen(in in_almacen int)
begin
    delete from almacenes where id_almacen = in_almacen;
end;
// delimiter ;

delimiter //
create procedure registrar_entrega(in in_cliente int, in in_punto_entrega int, in in_ruta int, out out_id_entrega int)
begin
    insert into entregas (cliente, punto_entrega, ruta) values (in_cliente, in_punto_entrega, in_ruta);
    set out_id_entrega = last_insert_id();
end;
// delimiter ;

delimiter //
create procedure registrar_detalle_entrega(in in_entrega int, in in_producto int, in in_cantidad int)
begin
    declare cantidad_disponible int default 0;
    declare id_almacen_temp int default 0;
    select max(cantidad), id_almacen into cantidad_disponible, id_almacen_temp
    from inventario where id_producto = in_producto group by id_almacen;
    if cantidad_disponible < in_cantidad then
        signal sqlstate '45000'
        set message_text = 'No hay suficiente cantidad del producto en un almacen';
    else
        insert into detalle_entregas (id_entrega, id_producto, cantidad) values (in_entrega, in_producto, in_cantidad);
        insert into movimientos (fecha, cantidad, salida, id_almacen, id_producto) values (now(), in_cantidad, 1, id_almacen_temp, in_producto);
    end if;
end;
// delimiter ;

delimiter //
create procedure actualizar_valor_total_entrega(in in_entrega int)
begin
    declare total double default 0;
    select sum(valor * cantidad) into total
    from detalle_entregas join productos using(id_producto)
    where id_entrega = in_entrega;
    update entregas
    set valor_total = total
    where id_entrega = in_entrega;
end;
// delimiter ;

DELIMITER //
CREATE PROCEDURE AddConductor (IN p_cedula INT, IN p_primer_nombre VARCHAR(50), IN p_segundo_nombre VARCHAR(50), IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50), IN p_telefono VARCHAR(15), IN p_correo VARCHAR(100), IN p_licencia VARCHAR(50), IN p_experiencia VARCHAR(50)
)
BEGIN
    INSERT INTO Conductores 
    VALUES (p_cedula, p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_telefono, p_correo, p_licencia, p_experiencia);
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetConductor (IN p_cedula INT)
BEGIN
    SELECT * FROM Conductores WHERE cedula = p_cedula;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateConductor (IN p_cedula INT, IN p_primer_nombre VARCHAR(50), IN p_segundo_nombre VARCHAR(50), IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50), IN p_telefono VARCHAR(15), IN p_correo VARCHAR(100), IN p_licencia VARCHAR(50), IN p_experiencia VARCHAR(50)
)
BEGIN
    UPDATE Conductores
    SET primer_nombre = p_primer_nombre,
        segundo_nombre = p_segundo_nombre,
        primer_apellido = p_primer_apellido,
        segundo_apellido = p_segundo_apellido,
        telefono = p_telefono,
        correo = p_correo,
        licencia = p_licencia,
        experiencia = p_experiencia
    WHERE cedula = p_cedula;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteConductor (IN p_cedula INT)
BEGIN
    DELETE FROM Conductores WHERE cedula = p_cedula;
END;
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE AddAuxiliar (IN p_cedula INT, IN p_primer_nombre VARCHAR(50), IN p_segundo_nombre VARCHAR(50), IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50), IN p_telefono VARCHAR(15), IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO Auxiliares 
    VALUES (p_cedula, p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_telefono, p_correo);
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetAuxiliar (IN p_cedula INT)
BEGIN
    SELECT * FROM Auxiliares WHERE cedula = p_cedula;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateAuxiliar (IN p_cedula INT, IN p_primer_nombre VARCHAR(50), IN p_segundo_nombre VARCHAR(50), IN p_primer_apellido VARCHAR(50),
    IN p_segundo_apellido VARCHAR(50), IN p_telefono VARCHAR(15), IN p_correo VARCHAR(100)
)
BEGIN
    UPDATE Auxiliares
    SET primer_nombre = p_primer_nombre,
        segundo_nombre = p_segundo_nombre,
        primer_apellido = p_primer_apellido,
        segundo_apellido = p_segundo_apellido,
        telefono = p_telefono,
        correo = p_correo
    WHERE cedula = p_cedula;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteAuxiliar (IN p_cedula INT)
BEGIN
    DELETE FROM Auxiliares WHERE cedula = p_cedula;
END;
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE AddVehiculo (IN p_placa VARCHAR(10), IN p_capacidad DOUBLE, IN p_datalogger VARCHAR(50),
    IN p_F_U_Mantenimiento DATETIME, IN p_ID_seguro INT
)
BEGIN
    INSERT INTO Vehículos 
    VALUES (p_placa, p_capacidad, p_datalogger, p_F_U_Mantenimiento, p_ID_seguro);
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetVehiculo (IN p_placa VARCHAR(10))
BEGIN
    SELECT * FROM Vehículos WHERE placa = p_placa;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateVehiculo (IN p_placa VARCHAR(10), IN p_capacidad DOUBLE, IN p_datalogger VARCHAR(50),
    IN p_F_U_Mantenimiento DATETIME, IN p_ID_seguro INT
)
BEGIN
    UPDATE Vehículos
    SET capacidad = p_capacidad,
        datalogger = p_datalogger,
        F_U_Mantenimiento = p_F_U_Mantenimiento,
        ID_seguro = p_ID_seguro
    WHERE placa = p_placa;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteVehiculo (IN p_placa VARCHAR(10))
BEGIN
    DELETE FROM Vehículos WHERE placa = p_placa;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE AddUnidadTrabajo (
    IN p_cedula_c INT,
    IN p_cedula_a INT,
    IN p_placa VARCHAR(10),
    IN p_placa_r VARCHAR(10)
)
BEGIN
    INSERT INTO unidades_trabajo 
    VALUES (p_cedula_c, p_cedula_a, p_placa, p_placa_r);
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetUnidadTrabajo (
    IN p_cedula_c INT,
    IN p_cedula_a INT
)
BEGIN
    SELECT * FROM unidades_trabajo 
    WHERE cedula_c = p_cedula_c AND cedula_a = p_cedula_a;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateUnidadTrabajo ( 
    IN p_cedula_c INT,
    IN p_cedula_a INT,
    IN p_placa VARCHAR(10),
    IN p_placa_r VARCHAR(10)
)
BEGIN
    UPDATE unidades_trabajo
    SET placa = p_placa,
        placa_r = p_placa_r
    WHERE cedula_c = p_cedula_c AND cedula_a = p_cedula_a;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteUnidadTrabajo (
    IN p_cedula_c INT,
    IN p_cedula_a INT
)
BEGIN
    DELETE FROM unidades_trabajo 
    WHERE cedula_c = p_cedula_c AND cedula_a = p_cedula_a;
END;
// DELIMITER ;


-- Elkin 
-- Ruta
DELIMITER //
CREATE PROCEDURE InsertarRuta(IN p_hora_inicio DATETIME,IN p_hora_final DATETIME,IN p_placa_vehiculo VARCHAR(10),IN p_distancia INT,IN p_estado INT,  IN p_cedula_operaciones INT)
BEGIN
    DECLARE placa_existente INT;
    START TRANSACTION;

    SELECT COUNT(*) INTO placa_existente
    FROM Rutas
    WHERE placa = p_placa_vehiculo AND estado = 1;  -- 1 indica que la ruta está activa

    IF placa_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La placa del vehículo ya está asignada a una ruta activa.';
    END IF;

    INSERT INTO Rutas (hora_inicio, hora_final, distancia, estado, placa,cedula_operaciones)
    VALUES (p_hora_inicio, p_hora_final, p_distancia, p_estado, p_placa_vehiculo, p_);
    
    COMMIT;
END;
// DELIMITER ;


-- actualizar ruta 
DELIMITER //
CREATE PROCEDURE ActualizarRuta(IN p_id_ruta INT, IN p_hora_inicio DATETIME, IN p_hora_final DATETIME, IN p_distancia DOUBLE, IN p_estado BIT)
BEGIN
    DECLARE ruta_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO ruta_existente
    FROM Rutas
    WHERE ID_ruta = p_id_ruta;
    IF ruta_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La ruta no existe.';
    END IF;
    UPDATE Rutas
    SET hora_inicio = p_hora_inicio, hora_final = p_hora_final, distancia = p_distancia, estado=p_estado
    WHERE ID_ruta = p_id_ruta;
    COMMIT;
END;
// DELIMITER ;


-- elimiar ruta
DELIMITER //
CREATE PROCEDURE EliminarRuta(IN p_id_ruta INT)
BEGIN
    DECLARE entregas_existentes INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO entregas_existentes
    FROM Entregas
    WHERE ID_ruta = p_id_ruta;
    IF entregas_existentes > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar la ruta porque tiene entregas asociadas.';
    END IF;
    DELETE FROM Rutas
    WHERE ID_ruta = p_id_ruta;
    COMMIT;
END ;
// DELIMITER ;


-- nueva entrega 
DELIMITER //
CREATE PROCEDURE InsertarEntrega(IN p_id_entrega INT, IN p_fecha_entrega DATETIME, IN p_estado INT, IN p_valor_total DECIMAL(10,2), IN p_id_ruta INT, IN p_id_cliente INT, IN p_firma VARCHAR(255))
BEGIN
    START TRANSACTION;
    IF p_estado = 1 AND p_firma IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Las entregas completadas deben tener una firma.';
    END IF;
    INSERT INTO Entregas (ID_entrega, fecha_entrega, estado, valor_total, ID_ruta, ID_cliente, firma)
    VALUES (p_id_entrega, p_fecha_entrega, p_estado, p_valor_total, p_id_ruta, p_id_cliente, p_firma);
    COMMIT;
END ;
// DELIMITER ;

-- actualizar entrega 
DELIMITER //
CREATE PROCEDURE ActualizarEntrega(IN p_id_entrega INT,IN p_fecha_entrega DATETIME,IN p_estado INT,IN p_valor_total DECIMAL(10,2),IN p_firma VARCHAR(255))
BEGIN
    START TRANSACTION;
    IF p_estado = 1 AND p_firma IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Las entregas completadas deben tener una firma.';
    END IF;
    -- Actualizar la entrega
    UPDATE Entregas
    SET fecha_entrega = p_fecha_entrega,
        estado = p_estado,
        valor_total = p_valor_total,
        firma = p_firma
    WHERE ID_entrega = p_id_entrega;
    COMMIT;
END ;
// DELIMITER ;


-- eliminar entrega
DELIMITER //
CREATE PROCEDURE EliminarEntrega(IN p_id_entrega INT)
BEGIN
    DECLARE firma_null INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO firma_null
    FROM Entregas
    WHERE ID_entrega = p_id_entrega AND firma_entrega IS NOT NULL;
    IF firma_null = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La entrega no existe o no tiene firma de recepción.';
    END IF;
    DELETE FROM Entregas WHERE ID_entrega = p_id_entrega;
    COMMIT;
END ;
// DELIMITER ;


--Ruta alternas
DElimiter //
CREATE PROCEDURE InsertarRutaAlternativa(IN p_id_ruta INT,IN p_id_ruta_a INT)
BEGIN
    DECLARE ruta_existente INT;
    START TRANSACTION;
    -- Validar que las rutas existan
    SELECT COUNT(*) INTO ruta_existente
    FROM Rutas
    WHERE ID_ruta IN (p_id_ruta, p_id_ruta_a);
    IF ruta_existente < 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una o ambas rutas no existen.';
    END IF;
    -- Insertar la ruta alternativa
    INSERT INTO Rutas_alternativas (ID_ruta, ID_ruta_a) VALUES (p_id_ruta, p_id_ruta_a);
    COMMIT;
END ;
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE ActualizarRutaAlternativa(IN p_id_ruta INT,IN p_id_ruta_a INT)
BEGIN
    DECLARE ruta_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO ruta_existente
    FROM Rutas
    WHERE ID_ruta IN (p_id_ruta, p_id_ruta_a);
    IF ruta_existente < 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una o ambas rutas no existen.';
    END IF;
    UPDATE Rutas_alternativas 
    SET ID_ruta_a = p_id_ruta_a 
    WHERE ID_ruta = p_id_ruta;
    COMMIT;
END ;
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE EliminarRutaAlternativa(IN p_id_ruta INT,IN p_id_ruta_a INT)
BEGIN
    DELETE FROM Rutas_alternativas 
    WHERE ID_ruta = p_id_ruta AND ID_ruta_a = p_id_ruta_a;
END ;
// DELIMITER ;


DELIMITER //
-- Insertar en Gerentes_Operaciones
CREATE PROCEDURE insertar_gerente_operaciones(IN p_cedula INT,IN primer_nombre VARCHAR(50),IN segundo_nombre VARCHAR(50),IN primer_apellido VARCHAR(50),IN segundo_apellido VARCHAR(50),IN telefono VARCHAR(15),IN correo VARCHAR(100))
BEGIN
    DECLARE gerente_existente INT;
    START TRANSACTION;
    -- Validar que no exista un gerente con la misma cédula
    SELECT COUNT(*) INTO gerente_existente
    FROM Gerentes_operaciones
    WHERE cedula = p_cedula;
    IF gerente_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un gerente con esta cédula.';
    END IF;
    INSERT INTO Gerentes_Operaciones(cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo)
    VALUES(cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo);
    COMMIT;
END ;
// DELIMITER ;


DElimiter //
CREATE PROCEDURE actualizar_gerente_operaciones(IN cedula INT,IN primer_nombre VARCHAR(50),IN segundo_nombre VARCHAR(50),IN primer_apellido VARCHAR(50),IN segundo_apellido VARCHAR(50),IN telefono VARCHAR(15),IN correo VARCHAR(100))
BEGIN
    START TRANSACTION;
    UPDATE Gerentes_Operaciones
    SET primer_nombre = primer_nombre,
        segundo_nombre = segundo_nombre,
        primer_apellido = primer_apellido,
        segundo_apellido = segundo_apellido,
        telefono = telefono,
        correo = correo
    WHERE cedula = cedula;
    COMMIT;
END ;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE eliminar_gerente_operaciones(IN p_cedula INT)
BEGIN
    DELETE FROM Gerentes_Operaciones
    WHERE cedula = p_cedula;
END;
// DELIMITER ;

-- Puntos de entrega
DELIMITER //
CREATE PROCEDURE InsertarPuntoEntrega(IN p_id_punto INT , IN p_direccion VARCHAR(255))
BEGIN
    START TRANSACTION;
    INSERT INTO Puntos_entrega 
    VALUES (p_id_punto, p_direccion);
    COMMIT;
END ;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarPuntoEntrega(IN p_id_punto INT,IN p_direccion VARCHAR(255))
BEGIN
    START TRANSACTION;
    UPDATE Puntos_entrega 
    SET dirección = p_direccion
    WHERE ID_p_entrega = p_id_punto;
    COMMIT;
END ;
// DELIMITER ;
DROP PROCEDURE EliminarPuntoEntrega;
DELIMITER //
CREATE PROCEDURE EliminarPuntoEntrega(IN p_id_punto INT)
BEGIN
    DELETE FROM Puntos_entrega WHERE ID_p_entrega = p_id_punto;
END ;
// DELIMITER ;

-- Cliente 
DELIMITER //
CREATE PROCEDURE InsertarCliente(IN p_razon_social VARCHAR(255), IN p_telefono VARCHAR(20), IN p_direccion VARCHAR(255), IN p_correo VARCHAR(100), IN p_cedulaG INT)
BEGIN
    DECLARE cliente_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO cliente_existente
    FROM Clientes
    WHERE razon_social = p_razon_social;
    IF cliente_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un cliente con esta cédula.';
    END IF;
    -- Insertar el nuevo cliente
    INSERT INTO Clientes (razon_social, telefono, direccion, correo, cedulaG) 
    VALUES (p_razon_social, p_telefono, p_direccion, p_correo, p_cedulaG);
    COMMIT;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarCliente(IN p_id_cliente INT, IN p_razon_social VARCHAR(255), IN p_telefono VARCHAR(20), IN p_direccion VARCHAR(255),IN p_correo VARCHAR(100))
BEGIN
    DECLARE cliente_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO cliente_existente
    FROM Clientes
    WHERE ID_cliente = p_id_cliente;
    IF cliente_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe.';
    END IF;
    -- Actualizar los datos del cliente
    UPDATE Clientes
    SET razon_social = p_razon_social, telefono = p_telefono, direccion = p_direccion, correo = p_correo
    WHERE ID_cliente = p_id_cliente;
    COMMIT;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarCliente(IN p_id_cliente INT)
BEGIN
    DECLARE cliente_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO cliente_existente
    FROM Clientes
    WHERE ID_cliente = p_id_cliente;
    IF cliente_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe.';
    END IF;
    DELETE FROM Clientes WHERE ID_cliente = p_id_cliente;
    COMMIT;
END;
// DELIMITER ;


-- gerente de ventas 
DELIMITER //
CREATE PROCEDURE InsertarGerenteVentas(IN p_cedula INT, IN p_primer_nombre VARCHAR(50), IN p_segundo_nombre VARCHAR(50), IN p_primer_apellido VARCHAR(50), IN p_segundo_apellido VARCHAR(50), IN p_telefono VARCHAR(15), IN p_correo VARCHAR(100))
BEGIN
    DECLARE gerente_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO gerente_existente
    FROM Gerentes_ventas
    WHERE cedula = p_cedula;
    IF gerente_existente > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe un gerente de ventas con esta cédula.';
    END IF;
    INSERT INTO Gerentes_ventas (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo) 
    VALUES (p_cedula, p_primer_nombre, p_segundo_nombre, p_primer_apellido, p_segundo_apellido, p_telefono, p_correo);
    COMMIT;
END;
// DELIMITER ;


DELIMITER //
CREATE PROCEDURE ActualizarGerenteVentas(IN p_cedula INT, IN p_primer_nombre VARCHAR(50), IN p_segundo_nombre VARCHAR(50),IN p_primer_apellido VARCHAR(50), IN p_segundo_apellido VARCHAR(50), IN p_telefono VARCHAR(15), IN p_correo VARCHAR(100))
BEGIN
    DECLARE gerente_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO gerente_existente
    FROM Gerentes_ventas
    WHERE cedula = p_cedula;
    IF gerente_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El gerente de ventas no existe.';
    END IF;
    -- Actualizar los datos del gerente
    UPDATE Gerentes_ventas
    SET primer_nombre = p_primer_nombre, segundo_nombre = p_segundo_nombre, primer_apellido = p_primer_apellido,
        segundo_apellido = p_segundo_apellido, telefono = p_telefono, correo = p_correo
    WHERE cedula = p_cedula;
    COMMIT;
END;
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarGerenteVentas(IN p_cedula INT)
BEGIN
    DECLARE gerente_existente INT;
    START TRANSACTION;
    SELECT COUNT(*) INTO gerente_existente
    FROM Gerentes_ventas
    WHERE cedula = p_cedula;
    IF gerente_existente = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El gerente de ventas no existe.';
    END IF;
    DELETE FROM Gerentes_ventas WHERE cedula = p_cedula;
    COMMIT;
END;
// DELIMITER ;
