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
