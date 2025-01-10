use transporte;

-- INSERTAR DATOS
insert into gerentes_almacen(cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo) values
(0987755321, 'Maria', 'José', 'Ascencio', 'Solis', 0991472581, 'maria.ascencio.solis@gmail.com'),
(0987755322, 'Marco', 'Diego', 'Polo', 'Vinueza', 0991472582, 'marco.polo.vinueza@hotmail.com'),
(0987755323, 'Juan', 'Gabriel', 'Peña', 'Garcia', 0991472583, 'juan.gabriel.pena@yahoo.com'),
(0987755324, 'Alba', 'Maria', 'Solis', 'Rodriguez', 0991472584, 'alba.solis.rodriguez@outlook.com'),
(0987755325, 'Anthony', 'Abundio', 'Meza', 'Gonzáles', 0991472585, 'anthony.meza.gonzales@gmail.com'),
(0987755326, 'Lucas', 'Cristóbal', 'Alvarez', 'Chavez', 0991472586, 'lucas.alvarez.chavez@protonmail.com'),
(0987755327, 'Ángel', 'Albano', 'Diaz', 'Fernandez', 0991472587, 'angel.diaz.fernandez@gmail.com'),
(0987755328, 'Sebastián', 'Anthony', 'Perez', 'Ramirez', 0991472588, 'sebastian.perez.ramirez@hotmail.com'),
(0987755329, 'Julián', 'Santiago', 'Torres', 'Gómez', 0991472589, 'julian.torres.gomez@yahoo.com'),
(0987755320, 'Angela', 'Emperatriz', 'Reyes', 'Flores', 0991472580, 'angela.reyes.flores@outlook.com');

-- Insertando Datos de gerente_oraciones
INSERT INTO Gerentes_operaciones VALUES
(0930786798, 'Luis', 'Fernando', 'Lopez', 'Ruiz', '0977558321', 'luis.lopez@gmail.com'),
(0941015903, 'Jordan', 'Joel', 'Garcia', 'Martínez', '0992642321', 'jordan.garcia@outlook.com'),
(0979342662, 'Andres', 'Alberto', 'Campi', 'Gonzalez', '0987654325', 'andres.campi@gmail.com'),
(0935728939, 'Alexander', 'Felipe', 'Gomez', 'Vargas', '0992756228', 'alexander.gomez@live.com'),
(0953382539, 'Nathaly', 'Hellen', 'Zambrano', 'Rugel', '0997554729', 'nathaly.hellen@outlook.com'),
(0924643731, 'Maria', 'Isabel', 'Torres', 'Paredes', '0975664225', 'lucia.torres@gmail.com'),
(0989076668, 'Pedro', NULL, 'Sánchez', 'Mendoza', '0991655316', 'pedro.sanchez@outlook.com'),
(0998130330, 'Sofía', 'Camila', 'García', 'Ríos', '0981651123', 'sofia.garcia@live.com'),
(0956769327, 'Manuel', 'Javier', 'Fernández', 'Salas', '0987852322', 'manuel.fernandez@outlook.com'),
(0933125189, 'Carolina', 'Andrea', 'Vega', 'Lozano', '0997755310', 'carolina.vega@outlook.com');

INSERT INTO Gerentes_ventas (cedula, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono, correo) VALUES
(1723456789, 'Juan', 'Carlos', 'Perez', 'Lopez', '0991234567', 'juan.perez@gmail.com'),
(1729876543, 'Maria', 'Isabel', 'Gomez', 'Martinez', '0987654321', 'maria.gomez@hotmail.com'),
(1712345678, 'Luis', 'Alberto', 'Lopez', 'Garcia', '0976543210', 'luis.lopez@hotmail.com'),
(1798765432, 'Ana', 'Lucia', 'Ramirez', 'Torres', '0965432109', 'ana.ramirez@gmail.com'),
(1709876541, 'Carlos', 'Eduardo', 'Torres', 'Perez', '0954321098', 'carlos.torres@outlook.com'),
(1734567812, 'Sofia', 'Andrea', 'Hernandez', 'Diaz', '0943210987', 'sofia.hernandez@gmail.com'),
(1729871234, 'Pedro', 'Manuel', 'Castro', 'Ruiz', '0932109876', 'pedro.castro@outlook.com'),
(1745678901, 'Elena', 'Patricia', 'Sanchez', 'Mendoza', '0998765432', 'elena.sanchez@hotmail.com'),
(1756789012, 'David', 'Miguel', 'Diaz', 'Fernandez', '0987651234', 'david.diaz@gmail.com'),
(1767890123, 'Carla', 'Beatriz', 'Reyes', 'Navarro', '0976547890', 'carla.reyes@gmail.com');

insert into proveedores(ID_proveedor, razon_social, direccion, telefono, correo) values
(1, 'BioPharma Salud Integral S.A. de C.V.', 'Calle Roble Blanco 321, Colonia Arboledas, Ciudad Luz, CP 10234', 251460, 'contacto@biopharmasalud.com'),
(2, 'Laboratorios Vitales del Futuro S.A.', 'Avenida del Trébol 567, Fraccionamiento El Prado, Villa Serena, CP 20345', 251461, 'info@labvitales.com'),
(3, 'Farmacéutica NovaCare Internacional S.A. de C.V.', 'Camino del Cedro 200, Sector Bosques, Municipio Horizonte, CP 40567', 251462, 'soporte@novacarepharma.com'),
(4, 'Distribuidora Médica Global S.A. de C.V.', 'Camino del Cedro 200, Sector Bosques, Municipio Horizonte, CP 40567', 251463, 'ventas@dmg-global.com'),
(5, 'Innovación y Desarrollo Farmacéutico S.A.', 'Boulevard Viento del Norte 1500, Parque Industrial Norte, Ciudad Neón, CP 50678', 251464, 'contacto@idfarmaceutica.com'),
(6, 'Salud y Bienestar Pharma S.A. de C.V.', 'Calle Aurora Boreal 45, Residencial Cumbres, Villa Polaris, CP 60789', 251465, 'info@sybpharma.com'),
(7, 'Medicamentos Esenciales del Sur S.A. de C.V.', ' Avenida Valle Dorado 678, Zona Central, Ciudad Horizonte, CP 70890', 251466, 'contacto@mesfarma.com'),
(8, 'Química Avanzada para la Salud S.A. de C.V.', 'Calle Río Cristal 789, Parque Empresarial Los Ríos, Municipio Plata, CP 80901', 251467, ' soporte@qashealth.com'),
(9, 'Corporativo Sanus Labs S.A. de C.V.', 'Avenida Nueva Esperanza 305, Barrio Estrella, Ciudad Esperanza, CP 90123', 251468, 'info@sanuslabs.com'),
(10, 'Alianza Farmacéutica Integral S.A.', 'Carretera del Águila km 12, Rancho Los Sauces, Pueblo Dorado, CP 10012', 251469, 'contacto@alianzapharma.com');

-- Insertando datos de proveedores de seguro 
INSERT INTO Proveedores_seguro VALUES
(1, 'Zurich Seguros Ecuador S.A', '0999382238', 'Av. Orellana', 'servicioalcliente.ec@zurich.com'),
(2, 'AIG Metropolitana','(02)395-5000', 'Av. Brasil 293, Quito 170102', 'servicio.cliente@aig.com '),
(3, 'Seguro Alianza', '(04)259-5160', ' Edificio San Francisco 300, 9 de Octubre, y, Guayaquil 090306','servicioalcliente@segurosalianza.com'),
(4, 'MAPFRE Ecuador', '(04)381-1500', 'Edificio, Torre Atlas, Dr. Luis Orrantia Cornejo', 'jcordovez@mapfre.com.ec'),
(5, 'Ecuatoriano Suiza', '(04)373-1515', 'Blvd. 9 de Octubre 2101, Guayaquil 090310', 'servicio.cliente@ecuasuiza.ec'),
(6, 'MegaSeguros', '(04)223-4683', 'Calle Bolívar 500', 'mega@seguros.ec'),
(7, 'AseguraPlus', '(04)248-7514', 'Av. 6 de Diciembre 300', 'plus@aseguratodo.ec'),
(8, 'Confianza Segura', '(04)348-5685', 'Av. América 200', 'confianza@seguros.ec'),
(9, 'MaxProtección', '(04)335-6876', 'Calle Quito y Sucre', 'max@proteccion.ec'),
(10, 'SeguroYa', '(04)424-5589', 'Calle Guayaquil y Mejía', 'contacto@seguroya.ec');

INSERT INTO Conductores VALUES 
(0991231234, 'Juan', 'Carlos', 'Perez', 'Gomez', '0991234567', 'juan.perez@gmail.com', 'A12345', '5 años'),
(0992342345, 'Maria', 'Isabel', 'Lopez', 'Martinez', '0992345678', 'maria.lopez@gmail.com', 'B67890', '2 años'),
(0993453456, 'Pedro', NULL, 'Sanchez', 'Rodriguez', '0993456789', 'pedro.sanchez@gmail.com', 'C34567', '8 años'),
(0994564567, 'Luis', 'Enrique', 'Ramirez', 'Diaz', '0994567890', 'luis.ramirez@gmail.com', 'D45678', '10 años'),
(0995675678, 'Ana', 'Maria', 'Torres', 'Castro', '0995678901', 'ana.torres@gmail.com', 'E56789', '3 años'),
(0996786789, 'Jose', 'Luis', 'Gutierrez', 'Mendoza', '0996789012', 'jose.gutierrez@gmail.com', 'F67890', '4 años'),
(0997897890, 'Carla', 'Patricia', 'Fernandez', 'Vargas', '0997890123', 'carla.fernandez@gmail.com', 'G78901', '6 años'),
(0999019012, 'Miguel', NULL, 'Ortega', 'Lopez', '0998901234', 'miguel.ortega@gmail.com', 'H89012', '2 años'),
(0998908901, 'Sofia', 'Gabriela', 'Morales', 'Perez', '0999012345', 'sofia.morales@gmail.com', 'I90123', '5 años'),
(0990120123, 'Raul', 'Andres', 'Navarro', 'Gonzalez', '0990123456', 'raul.navarro@gmail.com', 'J01234', '7 años');

INSERT INTO Auxiliares VALUES 
(1705432109, 'Carlos', 'Antonio', 'Rojas', 'Diaz', '0991231234', 'carlos.rojas@gmail.com'),
(0921345670, 'Patricia', 'Luisa', 'Garcia', 'Moreno', '0992342345', 'patricia.garcia@gmail.com'),
(1109876543, 'Manuel', 'Esteban', 'Ramirez', 'Gomez', '0993453456', 'manuel.ramirez@gmail.com'),
(1308765412, 'Monica', 'Isabel', 'Mendoza', 'Torres', '0994564567', 'monica.mendoza@gmail.com'),
(0807654321, 'Daniel', 'Felipe', 'Gomez', 'Castillo', '0995675678', 'daniel.gomez@gmail.com'),
(1712340987, 'Laura', 'Paola', 'Sanchez', 'Vargas', '0996786789', 'laura.sanchez@gmail.com'),
(0923456701, 'Roberto', 'Javier', 'Ortega', 'Navarro', '0997897890', 'roberto.ortega@gmail.com'),
(0612345678, 'Nadia', 'Lorena', 'Perez', 'Lopez', '0998908901', 'nadia.perez@gmail.com'),
(1401234560, 'Paulo', 'Ivan', 'Fernandez', 'Diaz', '0999019012', 'paulo.fernandez@gmail.com'),
(1709087654, 'Ximena', 'Valeria', 'Castro', 'Morales', '0990120123', 'ximena.castro@gmail.com');

-- Insertando de seguro
INSERT INTO Seguros VALUES
(1, 1500.00, 200.00, 1),
(2, 1200.00, 180.00, 2),
(3, 1800.00, 250.00, 3),
(4, 1600.00, 220.00, 4),
(5, 2000.00, 300.00, 5),
(6, 1100.00, 150.00, 1),
(7, 1700.00, 270.00, 2),
(8, 1300.00, 210.00, 3),
(9, 1900.00, 290.00, 4),
(10, 1550.00, 230.00, 5);

-- Insertando datos de vehiculos   los 01, 02, 03 son id de cedula del conductor o sea debemos enlazar 
INSERT INTO Vehículos VALUES  
('GBC1234', 10.5, 'Logger_01', '2024-02-15', 1),
('GEF5678', 12.0, 'Logger_02', '2024-03-20', 2),
('GHI9101', 15.0, 'Logger_03', '2024-05-25', 3),
('GKL1121', 8.0, 'Logger_04', '2024-02-15', 4),
('PNO3141', 14.0, 'Logger_05', '2024-04-25', 5),
('PQR5161', 9.5, 'Logger_06', '2024-07-15', 6),
('PTU7181', 11.0, 'Logger_07', '2024-05-20', 7),
('UWX9202', 13.0, 'Logger_08', '2024-06-16', 8),
('XZA2233', 7.5, 'Logger_09', '2023-12-12', 9),
('ECD4455', 16.0, 'Logger_10', '2024-06-15', 10),
('GFG1234', 10.0, 'Logger_11','2024-05-10', 1),
('XMN9101', 11.5, 'Logger_12','2024-06-20', 2),
('XPQ1121', 13.0, 'Logger_13', '2024-07-05', 3),
('EYZ7181', 14.0, 'Logger_14', '2024-08-20', 4),
('EBC9202', 16.0, 'Logger_15','2024-09-01', 5);

-- Insertando datos de vehiculos --LOS '01','02', '03 ' son las id de los conductores 
INSERT INTO Vehículos_Refrigerados VALUES
('GFG1234', 10.0, 'Logger_11', '2024-05-10', -5.0, -15.0, 1),
('GKL1121', 8.0, 'Logger_04', '2024-02-15', -4.0, -12.0, 4),
('XMN9101', 11.5, 'Logger_12', '2024-06-20', -6.0, -10.0, 2),
('XPQ1121', 13.0, 'Logger_13', '2024-07-05', -3.0, -8.0, 3),
('UWX9202', 13.0, 'Logger_08', '2024-06-16', -2.0, -10.0, 8),
('PTU7181', 11.0, 'Logger_04', '2024-05-20', -5.5, -15.5, 7),
('EYZ7181', 14.0, 'Logger_14', '2024-08-20', -3.5, -12.5, 4),
('EBC9202', 16.0, 'Logger_15', '2024-09-01', -4.5, -11.5, 5),
('GHI9101', 15.0, 'Logger_03', '2024-05-25', -6.5, -13.0, 3),
('ECD4455', 16.0, 'Logger_10', '2024-06-15', -3.0, -9.0, 10);

insert into almacenes(ID_almacen, capacidad, direccion, cedula) values
(1, 200.00, 'Calle del Pinar, 123 - Colonia Bosques, Ciudad Verde, CP 45678', 0987755320),
(2, 100.50, 'Calle del Pinar, 124 - Colonia Bosques, Ciudad Verde, CP 45678', 0987755320),
(3, 150.20, 'Avenida Sol Naciente, 987 - Residencial Aurora, Solaria, CP 78901', 0987755321),
(4, 50.10, 'Plaza de las Flores, 56 - Centro Histórico, Villa Encanto, CP 34567', 0987755322),
(5, 200.00, 'Camino de la Luna, 42 - Urbanización Celeste, Lunaria, CP 56789', 0987755323),
(6, 250.30, 'Boulevard Cascada Azul, 789 - Zona Mirador, Puerto Mar, CP 12345', 0987755324),
(7, 110.00, 'Callejón de la Estrella, 15 - Barrio Antigua, Villa Estrella, CP 23456', 0987755325),
(8, 25.00, 'Paseo del Horizonte, 250 - Colinas Doradas, Ciudad Amanecer, CP 67890', 0987755326),
(9, 500.80, 'Avenida de los Olivos, 365 - Sector Jardines, Valle Verde, CP 90123', 0987755327),
(10, 200.00, 'Ruta del Viento, 420 - Fraccionamiento Brisas, Ciudad Marina, CP 54321', 0987755328);

insert into productos(ID_producto, nombre, descripcion, tipo, valor, ID_proveedor) values
(1, 'CardioPlus', ' Suplemento para fortalecer el sistema cardiovascular y regular los niveles de colesterol.', 'Cardioprotector', 25.00, 1),
(2, 'NeuroCalm', 'Tabletas para aliviar el estrés y la ansiedad, promoviendo la relajación sin causar somnolencia.', 'Ansiolítico natural.', 18.00, 2),
(3, 'GastroRelief', 'Antiácido de acción rápida para el alivio del reflujo y la acidez estomacal.', 'Antiácido.', 12.00, 3),
(4, 'InmunoMax', 'Fortalece el sistema inmunológico con vitaminas y minerales esenciales.', 'Suplemento inmunológico.', 20.00, 1),
(5, 'DolorStop Forte', 'Analgésico de liberación prolongada para dolores musculares y articulares intensos.', 'Analgésico.', 15.00, 4),
(6, 'RespiraBien', 'Spray nasal que reduce la congestión y facilita la respiración.', 'Descongestionante nasal.', 8.00, 5),
(7, 'Dermocure', 'Crema tópica para tratar irritaciones, alergias y regenerar la piel.', 'Corticoide tópico.', 10.00, 1),
(8, 'GlucoBalance', 'Tabletas para ayudar a regular los niveles de glucosa en sangre.', 'Hipoglucemiante.', 22.00, 8),
(9, 'HepaCleanse', 'Protector hepático que favorece la desintoxicación del hígado.', 'Hepatoprotector.', 30.00, 9),
(10, 'Antivirox', 'Tratamiento antiviral para infecciones respiratorias leves.', 'Antiviral.', 28.00, 9);

insert into movimientos(id_movimiento, ID_almacen, ID_producto, fecha, cantidad, salida) values
(1, 1, 1, '2017-08-15 19:30:10', 100, 0),
(2, 1, 1, '2017-08-16 07:30:10', 50, 1),
(3, 2, 4, '2020-08-15 14:10:00', 100, 0),
(4, 2, 4, '2020-08-17 08:40:30', 10, 1),
(5, 1, 1, '2017-08-20 08:00:00', 25, 1),
(6, 3, 2, '2022-09-15 19:30:10', 100, 0),
(7, 5, 3, '2022-10-15 16:30:00', 50, 0),
(8, 9, 5, '2022-10-15 15:30:50', 35, 0),
(9, 9, 5, '2022-11-10 19:30:10', 150, 1),
(10, 8, 6, '2017-09-15 19:30:10', 45, 0);

insert into inventario values
(1, 1, 100),
(2, 4, 500),
(3, 2, 50),
(5, 3, 75),
(9, 5, 25),
(8, 6, 45),
(1, 3, 4),
(1, 5, 0),
(2, 3, 25),
(7, 1, 0),
(8, 1, 0);

INSERT INTO Clientes (ID_cliente, razon_social, telefono, direccion, correo, cedula) VALUES
(1, 'Hospital XYZ', '0981234567', 'Calle 123, Quito', 'cliente1@gmail.com', 1723456789),
(2, 'Industria ABC', '0971234568', 'Avenida Siempre Viva', 'cliente2@outlook.com', 1729876543),
(3, 'Empresa Delta', '0969876543', 'Av. Amazonas, Cuenca', 'cliente3@gmail.com', 1712345678),
(4, 'Farmaceutica Epsilon', '0998765432', 'Blvd. Shyris, Quito', 'cliente4@outlook.com', 1798765432),
(5, 'Distribuidora Omega', '0955678912', 'Calle Principal, Loja', 'cliente5@hotmail.com', 1709876541),
(6, 'Compañía Gamma', '0941234598', 'Av. Bolívar, Manta', 'cliente6@hotmail.com', 1734567812),
(7, 'Farmacia Theta', '0987654321', 'Calle Sucre, Ambato', 'cliente7@outlook.com', 1729871234),
(8, 'Clinica Kappa', '0976543210', 'Av. Libertad, Riobamba', 'cliente8@gmail.com', 1745678901),
(9, 'Sociedad Lambda', '0965432109', 'Av. Colón, Machala', 'cliente9@hotmail.com', 1756789012),
(10, 'Grupo Sigma', '0932109876', 'Calle 10 de Agosto, Ibarra', 'cliente10@outlook.com', 1767890123);

insert into unidades_trabajo values
(0991231234, 1705432109, 'GBC1234', null),
(0992342345, 0921345670, 'GBC1234', null),
(0991231234, 1705432109, 'GEF5678', null),
(0993453456, 0612345678, null, 'GFG1234'),
(0994564567, 0921345670, null, 'GKL1121'),
(0991231234, 1308765412, 'PTU7181', null),
(0997897890, 1705432109, null, 'XMN9101'),
(0993453456, 1109876543, 'XZA2233', null),
(0998908901, 0923456701, null, 'XPQ1121'),
(0990120123, 0807654321, null, 'PTU7181');

INSERT INTO Rutas VALUES 
(1, '2024-06-01 08:00:00', '2024-06-01 12:00:00', 150.5, 0, 0991231234, 1705432109, 'GBC1234', null, 0930786798),
(2, '2024-06-02 09:00:00', '2024-06-02 13:00:00', 200.0, 1, 0992342345, 0921345670, 'GBC1234', null, 0941015903),
(3, '2024-06-03 10:00:00', '2024-06-03 14:00:00', 300.5, 1, 0991231234, 1705432109, 'GEF5678', null, 0979342662),
(4, '2024-06-04 11:00:00', '2024-06-04 15:00:00', 120.0, 0, 0993453456, 0612345678, null, 'GFG1234', 0935728939),
(5, '2024-06-05 12:00:00', '2024-06-05 16:00:00', 250.0, 1, 0994564567, 0921345670, null, 'GKL1121', 0953382539),
(6, '2024-06-06 13:00:00', '2024-06-06 17:00:00', 180.0, 1, 0994564567, 0921345670, null, 'GKL1121', 0924643731),
(7, '2024-06-07 14:00:00', '2024-06-07 18:00:00', 220.0, 0, 0994564567, 0921345670, null, 'GKL1121', 0989076668),
(8, '2024-06-08 15:00:00', '2024-06-08 19:00:00', 170.0, 0, 0991231234, 1308765412, 'PTU7181', null, 0998130330),
(9, '2024-06-09 16:00:00', '2024-06-09 20:00:00', 310.0, 0, 0997897890, 1705432109, null, 'XMN9101', 0956769327),
(10, '2024-06-10 17:00:00', '2024-06-10 21:00:00', 130.5, 1, 0990120123, 0807654321, null, 'PTU7181', 0933125189);

INSERT INTO Rutas_alternativas VALUES 
(1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 1);

INSERT INTO Puntos_entrega (ID_p_entrega, dirección) VALUES
(1, 'Calle 123, Quito'),
(2, 'Avenida Siempre Viva, Guayaquil'),
(3, 'Av. Amazonas, Cuenca'),
(4, 'Blvd. Los Shyris, Quito'),
(5, 'Calle Principal, Loja'),
(6, 'Av. Bolívar, Manta'),
(7, 'Calle Sucre, Ambato'),
(8, 'Av. Libertad, Riobamba'),
(9, 'Av. Colón, Machala'),
(10, 'Calle 10 de Agosto, Ibarra');

INSERT INTO Entregas (ID_entrega, estado, fecha_entrega, firma, valor_total, ID_cliente, ID_p_entrega, id_ruta) VALUES
(1, 1, '2024-06-01 10:00:00', NULL, 1500.50, 1, 1, 1),
(2, 0, '2024-06-02 12:00:00', NULL, 3000.00, 2, 2, 7),
(3, 1, '2024-06-03 14:00:00', NULL, 2000.75, 3, 3, 3),
(4, 1, '2024-06-04 16:00:00', NULL, 4500.30, 4, 4, 2),
(5, 0, '2024-06-05 18:00:00', NULL, 1250.00, 5, 5, 10),
(6, 1, '2024-06-06 09:00:00', NULL, 6000.25, 6, 6, 8),
(7, 0, '2024-06-07 11:00:00', NULL, 75.90, 7, 7, 4),
(8, 1, '2024-06-08 13:00:00', NULL, 820.10, 8, 8, 5),
(9, 1, '2024-06-09 15:00:00', NULL, 250.80, 9, 9, 6),
(10, 0, '2024-06-10 17:00:00', NULL, 100.00, 10, 10, 9);

INSERT INTO Detalles_entrega (ID_entrega, ID_producto, cantidad) VALUES
(1, 1, 5),
(2, 2, 3),
(3, 3, 8),
(4, 4, 6),
(5, 5, 4),
(6, 6, 2),
(7, 7, 7),
(8, 8, 10),
(9, 9, 1),
(10, 10, 9);

INSERT INTO Reclamos (ID_entrega, ID_cliente, descripción) VALUES
(1, 1, 'Producto dañado'),
(2, 2, 'Entrega incompleta'),
(3, 3, 'Retraso en la entrega'),
(4, 4, 'Producto incorrecto'),
(5, 5, 'Firma no registrada'),
(6, 6, 'Falta de embalaje'),
(7, 7, 'Entrega duplicada'),
(8, 8, 'Costo incorrecto'),
(9, 9, 'Falta de confirmación'),
(10, 10, 'Horario no cumplido');

INSERT INTO Incidentes VALUES 
(1, '2024-06-01 08:00:00', 'Incidente leve', 1, 0991231234, null),
(2, '2024-06-02 09:30:00', 'Falla mecánica', 2, 0995675678, null),
(3, '2024-06-03 10:00:00', 'Accidente menor', 3, 0990120123, null),
(4, '2024-06-04 11:15:00', 'Retraso de ruta', 4, 0998908901, null),
(5, '2024-06-05 12:45:00', 'Problema con refrigeración', 5, 0999019012, null),
(6, '2024-06-06 13:30:00', 'Robo', 6, null, 1712340987),
(7, '2024-06-07 14:15:00', 'Desvío de ruta', 7, null, 1705432109),
(8, '2024-06-08 15:00:00', 'Falla eléctrica', 8, null, 0921345670),
(9, '2024-06-09 16:10:00', 'Retraso significativo', 9, null, 1109876543),
(10, '2024-06-10 17:20:00', 'Incidente reportado', 10, null, 0807654321);
