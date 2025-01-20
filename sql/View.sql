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

-- Reportes 
CREATE VIEW ReporteRutasActivas AS
SELECT r.ID_ruta, r.hora_inicio, r.hora_final, r.distancia, r.estado
FROM Rutas r
WHERE r.estado = 1  -- si esta activo la ruta 
  AND r.hora_inicio <= CURRENT_TIMESTAMP  -- La hora de inicio ya pasó
  AND r.hora_final >= CURRENT_TIMESTAMP;  -- La hora final aún no ha pasado


CREATE VIEW ReporteEntregasConFirma AS
SELECT e.ID_entrega, e.fecha_entrega, e.firma, e.valor_total, c.razon_social
FROM Entregas e
JOIN Clientes c ON e.ID_cliente = c.ID_cliente
WHERE e.firma IS NOT NULL;


CREATE VIEW ReporteGerentesRutasAsignadas AS
SELECT gop.cedula, gop.primer_nombre, gop.segundo_nombre, r.ID_ruta, r.distancia
FROM Gerentes_operaciones gop
JOIN Rutas r ON gop.cedula = r.cedula_operaciones
WHERE r.estado = 1;  -- activas 

CREATE VIEW ReporteEntregasPorClienteYEstado AS
SELECT e.ID_entrega, e.fecha_entrega, e.estado, e.valor_total, c.razon_social
FROM Entregas e
JOIN Clientes c ON e.ID_cliente = c.ID_cliente
ORDER BY c.razon_social, e.fecha_entrega;

-- no entregada aun
CREATE VIEW ReporteRutasConEntregasPendientes AS
SELECT r.ID_ruta, r.hora_inicio, r.hora_final, r.distancia, e.ID_entrega, e.estado
FROM Rutas r
JOIN Entregas e ON r.ID_ruta = e.ID_ruta
WHERE e.firma IS NULL
  AND r.estado = 1;  -- Rutas activas pero no esta entregado con la firma


CREATE VIEW ReporteGerentesVentasPorCliente AS
SELECT gv.cedula, gv.primer_nombre, gv.segundo_nombre, c.ID_cliente, c.razon_social
FROM Gerentes_ventas gv
JOIN Clientes c ON gv.cedula = c.cedula
ORDER BY c.razon_social;


CREATE VIEW ReporteResumenEntregasPorFecha AS
SELECT e.fecha_entrega, COUNT(e.ID_entrega) AS total_entregas, SUM(e.valor_total) AS total
FROM Entregas e
GROUP BY e.fecha_entrega
ORDER BY e.fecha_entrega DESC;


CREATE VIEW DetallesPersonal AS
SELECT 
    c.cedula AS cedula_conductor,
    c.primer_nombre AS nombre_conductor,
    c.primer_apellido AS apellido_conductor,
    c.telefono AS telefono_conductor,
    c.correo AS correo_conductor,
    c.licencia AS licencia_conductor,
    c.experiencia AS experiencia_conductor,
    a.cedula AS cedula_auxiliar,
    a.primer_nombre AS nombre_auxiliar,
    a.primer_apellido AS apellido_auxiliar,
    a.telefono AS telefono_auxiliar,
    a.correo AS correo_auxiliar
FROM Conductores c
LEFT JOIN Auxiliares a ON c.cedula = a.cedula;


CREATE VIEW AsignacionesConductoresAuxiliares AS
SELECT 
    c.cedula AS cedula_conductor,
    c.primer_nombre AS nombre_conductor,
    c.primer_apellido AS apellido_conductor,
    a.cedula AS cedula_auxiliar,
    a.primer_nombre AS nombre_auxiliar,
    a.primer_apellido AS apellido_auxiliar,
    v.placa AS placa_vehiculo,
    v.capacidad AS capacidad_vehiculo,
    v.datalogger AS datalogger_vehiculo
FROM unidades_trabajo ut
JOIN Conductores c ON ut.cedula_c = c.cedula
JOIN Auxiliares a ON ut.cedula_a = a.cedula
JOIN Vehículos v ON ut.placa = v.placa;


CREATE VIEW ConductoresSinVehiculo AS
SELECT 
    c.cedula AS cedula_conductor,
    c.primer_nombre AS nombre_conductor,
    c.primer_apellido AS apellido_conductor,
    c.telefono AS telefono_conductor,
    c.correo AS correo_conductor,
    c.licencia AS licencia_conductor,
    c.experiencia AS experiencia_conductor
FROM Conductores c
LEFT JOIN unidades_trabajo ut ON c.cedula = ut.cedula_c
WHERE ut.cedula_c IS NULL;


CREATE VIEW AuxiliaresSinConductor AS
SELECT 
    a.cedula AS cedula_auxiliar,
    a.primer_nombre AS nombre_auxiliar,
    a.primer_apellido AS apellido_auxiliar,
    a.telefono AS telefono_auxiliar,
    a.correo AS correo_auxiliar
FROM Auxiliares a
LEFT JOIN unidades_trabajo ut ON a.cedula = ut.cedula_a
WHERE ut.cedula_a IS NULL;