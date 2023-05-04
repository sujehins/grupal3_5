Parte 1: Crear entorno de trabajo

CREATE DATABASE telovendobbdd;

CREATE USER 'nombre_de_usuario'@'localhost' IDENTIFIED BY 'contraseña';
GRANT ALL PRIVILEGES ON telovendobbdd TO 'nombre_de_usuario'@'localhost';
FLUSH PRIVILEGES;

Parte 2: Crear dos tablas.
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT  PRIMARY KEY NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contraseña VARCHAR(100) NOT NULL,
  zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
  género VARCHAR(20),
  telefono_contacto INT
);

CREATE TABLE ingresos (
  id_ingreso INT PRIMARY KEY  NOT NULL,
  id_usuario INT  NOT NULL,
  fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP  NOT NULL,
   FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

Parte 3: Modificación de la tabla
ALTER TABLE usuarios
ALTER COLUMN zona_horaria SET DEFAULT 'UTC-2';

Parte 4: Creación de registros.
INSERT INTO usuarios (id_usuario, nombre, apellido, contraseña, zona_horaria, género, telefono_contacto)
VALUES
  (1, 'Juan', 'Pérez', 'contra01', 'UTC-2', 'Masculino', '955683302'),
  (2, 'María', 'Gómez', 'contra02', 'UTC-2', 'Femenino', '955683301'),
  (3, 'Carlos', 'López', 'contra03', 'UTC-2', 'Masculino', '955683303'),
  (4, 'Ana', 'Rodríguez', 'contra04', 'UTC-2', 'Femenino', '955683304'),
  (5, 'Pedro', 'Martínez', 'contra05', 'UTC-2', 'Masculino', '955683305'),
  (6, 'Laura', 'Sánchez', 'contra06', 'UTC-2', 'Femenino', '955683306'),
  (7, 'Miguel', 'Torres', 'contra07', 'UTC-2', 'Masculino', '955683307'),
  (8, 'Sofía', 'Ramírez', 'contra08', 'UTC-2', 'Femenino', '955683308');
  
  
  INSERT INTO ingresos (id_ingreso, id_usuario, fecha_hora_ingreso)
VALUES
  (1, 1, '2023-05-02 10:00:00'),
  (2, 2, '2023-05-02 11:30:00'),
  (3, 3, '2023-05-02 12:15:00'),
  (4, 4, '2023-05-02 14:45:00'),
  (5, 5, '2023-05-02 16:20:00'),
  (6, 6, '2023-05-02 17:10:00'),
  (7, 7, '2023-05-02 19:30:00'),
  (8, 8, '2023-05-02 20:45:00');
  
Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
  Para la tabla de usuarios:

id_usuario (INT): Se utiliza el tipo de dato INT para representar un identificador numérico único para cada usuario. Si se espera un número limitado de usuarios, este tipo de dato puede ser óptimo. Sin embargo, si se espera un gran número de usuarios, se podría considerar el uso de un tipo de dato más grande, como BIGINT, para permitir una mayor capacidad de almacenamiento.

nombre (VARCHAR): Se utiliza el tipo de dato VARCHAR para almacenar el nombre del usuario, que es una cadena de caracteres de longitud variable. Es apropiado para almacenar datos de texto de longitud moderada, como los nombres de los usuarios.

apellido (VARCHAR): Al igual que el campo nombre, se utiliza el tipo de dato VARCHAR para almacenar el apellido del usuario.

contraseña (VARCHAR): Se utiliza el tipo de dato VARCHAR para almacenar la contraseña del usuario. Sin embargo, en términos de seguridad, es recomendable utilizar técnicas de cifrado y almacenar una versión hash de la contraseña en lugar de almacenarla en texto plano.

zona_horaria (VARCHAR): Se utiliza el tipo de dato VARCHAR para almacenar la zona horaria del usuario. El uso de VARCHAR es adecuado para almacenar cadenas de texto de longitud variable, como los nombres de las zonas horarias.

género (ENUM): Se utiliza el tipo de dato ENUM para almacenar el género del usuario. Un tipo de dato ENUM permite definir un conjunto predefinido de valores posibles. En este caso, los valores posibles son "Masculino", "Femenino" y "Otro". El uso de ENUM es apropiado para limitar las opciones válidas y garantizar la integridad de los datos.

telefono_contacto (VARCHAR): Se utiliza el tipo de dato VARCHAR para almacenar el número de teléfono de contacto del usuario. Al igual que los campos anteriores de tipo VARCHAR, es adecuado para almacenar cadenas de texto de longitud variable.


Para la tabla de ingresos:

id_ingreso (INT): Al igual que en la tabla de usuarios, se utiliza el tipo de dato INT para representar un identificador numérico único para cada ingreso. La justificación y evaluación son las mismas que se mencionaron anteriormente.

id_usuario (INT): Se utiliza el tipo de dato INT para almacenar el identificador numérico del usuario asociado con el ingreso. Al igual que en la tabla de usuarios, la justificación y evaluación son las mismas.

fecha_hora_ingreso (DATETIME): Se utiliza el tipo de dato DATETIME para almacenar la fecha y hora de ingreso del usuario. El tipo de dato DATETIME es apropiado para almacenar valores de fecha y hora precisos. Sin embargo, si no es necesario un nivel de precisión tan alto


Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
correo electronico)

CREATE TABLE Contactos (
  id_contacto INT PRIMARY KEY  NOT NULL,
  id_usuario INT NOT NULL,
  numero_telefono INT NOT NULL,
  correo_electronico VARCHAR(100) ,
   FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
tabla Contactos.

  ALTER TABLE usuarios
ADD COLUMN id_contacto INT,
ADD FOREIGN KEY (id_contacto) REFERENCES Contactos(id_contacto);