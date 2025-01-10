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