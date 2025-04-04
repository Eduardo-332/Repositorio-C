/*🔐 Usuarios*/
INSERT INTO terradb.Usuarios (nombre, correo, contrasena, tipo_usuario) VALUES
('Juan Pérez', 'juan@example.com', 'pwd123', 'Cliente'),
('Ana Torres', 'ana@example.com', 'pwd456', 'Administrador'),
('Luis Gómez', 'luisg@example.com', 'pwd789', 'Cliente'),
('María Rivas', 'mariar@example.com', 'pwd321', 'Cliente'),
('Pedro López', 'pedrol@example.com', 'pwd654', 'Administrador'),
('Lucía Fernández', 'luciaf@example.com', 'pwd111', 'Cliente'),
('Carlos Ruiz', 'carlosr@example.com', 'pwd222', 'Cliente'),
('Sofía Núñez', 'sofian@example.com', 'pwd333', 'Cliente'),
('Ricardo Díaz', 'ricardod@example.com', 'pwd444', 'Administrador'),
('Valentina Ortiz', 'valentinao@example.com', 'pwd555', 'Cliente');

/*🛍️ Productos*/
INSERT INTO terradb.Productos (nombre, descripcion, precio, stock, imagen_url) VALUES
('Laptop Lenovo ThinkPad', 'Laptop con 16GB RAM y 512GB SSD.', 950.00, 15, 'https://example.com/img/laptop.jpg'),
('Mouse Logitech', 'Mouse inalámbrico ergonómico.', 25.99, 100, 'https://example.com/img/mouse.jpg'),
('Teclado RGB', 'Teclado mecánico retroiluminado.', 59.99, 50, 'https://example.com/img/keyboard.jpg'),
('Monitor LG 24"', 'Monitor Full HD 24 pulgadas.', 199.99, 20, 'https://example.com/img/monitor.jpg'),
('Impresora HP', 'Impresora multifuncional inalámbrica.', 120.00, 30, 'https://example.com/img/impresora.jpg'),
('Disco Duro Externo 1TB', 'Almacenamiento portátil.', 89.90, 40, 'https://example.com/img/hdd.jpg'),
('Memoria USB 64GB', 'Memoria USB 3.0 rápida.', 14.50, 200, 'https://example.com/img/usb.jpg'),
('Auriculares Bluetooth', 'Sonido envolvente con micrófono.', 39.99, 75, 'https://example.com/img/headphones.jpg'),
('Cámara Web Full HD', 'Ideal para videollamadas.', 49.99, 60, 'https://example.com/img/webcam.jpg'),
('Router TP-Link', 'Router de doble banda.', 79.99, 35, 'https://example.com/img/router.jpg');


/*📦 Órdenes*/
INSERT INTO terradb.Ordenes (id_usuario, estado, total) VALUES
(1, 'Pendiente', 950.00),
(2, 'En Proceso', 59.99),
(3, 'Enviado', 225.98),
(4, 'Entregado', 120.00),
(5, 'Cancelado', 89.90),
(6, 'Pendiente', 14.50),
(7, 'Pendiente', 239.98),
(8, 'Enviado', 49.99),
(9, 'En Proceso', 25.99),
(10, 'Entregado', 1000.00);

/*📋 Detalles de Órdenes*/
INSERT INTO terradb.DetallesOrden (id_orden, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 950.00),
(2, 3, 1, 59.99),
(3, 2, 2, 25.99),
(3, 4, 1, 174.00),
(4, 5, 1, 120.00),
(5, 6, 1, 89.90),
(6, 7, 1, 14.50),
(7, 3, 2, 59.99),
(8, 9, 1, 49.99),
(9, 2, 1, 25.99);

/*🛒 Carrito de Compras*/
INSERT INTO terradb.Carrito (id_usuario, id_producto, cantidad) VALUES
(1, 2, 1),
(1, 3, 2),
(2, 5, 1),
(3, 6, 1),
(4, 7, 3),
(5, 8, 1),
(6, 9, 2),
(7, 4, 1),
(8, 1, 1),
(9, 10, 1);

/*💳 Pagos*/
INSERT INTO terradb.Pagos (id_orden, metodo_pago, estado_pago) VALUES
(1, 'Tarjeta de Crédito', 'Pagado'),
(2, 'PayPal', 'Pendiente'),
(3, 'Transferencia', 'Pagado'),
(4, 'Tarjeta de Crédito', 'Pagado'),
(5, 'PayPal', 'Rechazado'),
(6, 'Transferencia', 'Pendiente'),
(7, 'Tarjeta de Crédito', 'Pagado'),
(8, 'PayPal', 'Pagado'),
(9, 'Tarjeta de Crédito', 'Pendiente'),
(10, 'Transferencia', 'Pagado');

/*📁 Archivos*/
INSERT INTO terradb.Archivos (id_usuario, nombre_archivo, url_archivo) VALUES
(1, 'factura_orden1.pdf', 'https://example.com/files/factura_orden1.pdf'),
(2, 'manual_teclado.pdf', 'https://example.com/files/manual_teclado.pdf'),
(3, 'foto_perfil.jpg', 'https://example.com/files/foto_perfil.jpg'),
(4, 'ticket_pago.png', 'https://example.com/files/ticket_pago.png'),
(5, 'comprobante_transferencia.pdf', 'https://example.com/files/transferencia.pdf'),
(6, 'imagen_producto.png', 'https://example.com/files/producto.png'),
(7, 'datos_envio.txt', 'https://example.com/files/envio.txt'),
(8, 'warranty_hp.pdf', 'https://example.com/files/warranty.pdf'),
(9, 'router_config.pdf', 'https://example.com/files/router_config.pdf'),
(10, 'resumen_orden.txt', 'https://example.com/files/resumen.txt');

/*⚡ Caché de Consultas*/
INSERT INTO terradb.CacheConsultas (clave, valor, fecha_expiracion) VALUES
('top_productos', '{"productos": ["Laptop", "Mouse", "Teclado"]}', DATEADD(HOUR, 1, GETDATE())),
('ultimas_ordenes_usuario_1', '{"ordenes": [1, 3, 6]}', DATEADD(MINUTE, 30, GETDATE())),
('stock_bajo', '{"productos": ["Monitor", "Router"]}', DATEADD(MINUTE, 45, GETDATE())),
('ordenes_enviadas', '{"ordenes": [3, 8]}', DATEADD(HOUR, 2, GETDATE())),
('carrito_usuario_4', '{"productos": [7]}', DATEADD(MINUTE, 15, GETDATE())),
('recomendados_usuario_5', '{"productos": [1, 6]}', DATEADD(HOUR, 1, GETDATE())),
('productos_oferta', '{"productos": [3, 9]}', DATEADD(HOUR, 3, GETDATE())),
('historial_usuario_2', '{"ordenes": [2, 5]}', DATEADD(MINUTE, 50, GETDATE())),
('mas_vendidos', '{"productos": [1, 2, 3]}', DATEADD(HOUR, 4, GETDATE())),
('productos_nuevos', '{"productos": [10, 8]}', DATEADD(MINUTE, 40, GETDATE()));
