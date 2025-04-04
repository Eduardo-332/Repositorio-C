
USE proyectoterraformdb;

CREATE SCHEMA terradb;

-- Tabla de Usuarios (Clientes y Administradores)
CREATE TABLE terradb.Usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    correo NVARCHAR(255) UNIQUE NOT NULL,
    contrasena NVARCHAR(255) NOT NULL,
    tipo_usuario NVARCHAR(50) CHECK (tipo_usuario IN ('Cliente', 'Administrador')) NOT NULL,
    fecha_registro DATETIME DEFAULT GETDATE()
);

-- Tabla de Productos
CREATE TABLE terradb.Productos (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    imagen_url NVARCHAR(500),
    fecha_creacion DATETIME DEFAULT GETDATE()
);

-- Tabla de Órdenes (Pedidos)
CREATE TABLE terradb.Ordenes (
    id_orden INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_orden DATETIME DEFAULT GETDATE(),
    estado NVARCHAR(50) CHECK (estado IN ('Pendiente', 'En Proceso', 'Enviado', 'Entregado', 'Cancelado')) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES terradb.Usuarios(id_usuario)
);

-- Tabla de Detalles de Órdenes
CREATE TABLE terradb.DetallesOrden (
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_orden INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal AS (cantidad * precio_unitario) PERSISTED,
    FOREIGN KEY (id_orden) REFERENCES terradb.Ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES terradb.Productos(id_producto)
);

-- Tabla de Carrito de Compras
CREATE TABLE terradb.Carrito (
    id_carrito INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    fecha_agregado DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES terradb.Usuarios(id_usuario),
    FOREIGN KEY (id_producto) REFERENCES terradb.Productos(id_producto)
);

-- Tabla de Pagos
CREATE TABLE terradb.Pagos (
    id_pago INT IDENTITY(1,1) PRIMARY KEY,
    id_orden INT NOT NULL,
    metodo_pago NVARCHAR(50) CHECK (metodo_pago IN ('Tarjeta de Crédito', 'PayPal', 'Transferencia')) NOT NULL,
    estado_pago NVARCHAR(50) CHECK (estado_pago IN ('Pendiente', 'Pagado', 'Rechazado')) NOT NULL,
    fecha_pago DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_orden) REFERENCES terradb.Ordenes(id_orden)
);

-- Tabla de Archivos (Para almacenamiento de imágenes y documentos)
CREATE TABLE terradb.Archivos (
    id_archivo INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT NOT NULL,
    nombre_archivo NVARCHAR(255) NOT NULL,
    url_archivo NVARCHAR(500) NOT NULL,
    fecha_subida DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES terradb.Usuarios(id_usuario)
);

-- Tabla de Caché (Para consultas más frecuentes)
CREATE TABLE terradb.CacheConsultas (
    id_cache INT IDENTITY(1,1) PRIMARY KEY,
    clave NVARCHAR(255) UNIQUE NOT NULL,
    valor TEXT NOT NULL,
    fecha_expiracion DATETIME NOT NULL
);
