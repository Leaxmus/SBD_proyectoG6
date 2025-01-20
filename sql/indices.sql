use transporte;


CREATE INDEX idx_conductores_telefono ON Conductores(telefono);
CREATE INDEX idx_conductores_correo ON Conductores(correo);
CREATE INDEX idx_auxiliares_telefono ON Auxiliares(telefono);
CREATE INDEX idx_auxiliares_correo ON Auxiliares(correo);
CREATE INDEX idx_productos_nombre ON productos(nombre);
CREATE INDEX idx_productos_tipo ON productos(tipo);
CREATE INDEX idx_clientes_razon_social ON Clientes(razon_social);
CREATE INDEX idx_clientes_telefono ON Clientes(telefono);
CREATE INDEX idx_clientes_correo ON Clientes(correo);
CREATE INDEX idx_entregas_estado ON Entregas(estado);
CREATE INDEX idx_entregas_fecha_entrega ON Entregas(fecha_entrega);
CREATE INDEX idx_entregas_valor_total ON Entregas(valor_total);
CREATE INDEX idx_reclamos_descripcion ON Reclamos(descripcion);
