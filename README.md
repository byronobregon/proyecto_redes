# README

El ambiente de laboratorio se levanta utilizando contenedores docker, configurados en una red interna. Por consiguiente, es necesario contar con docker instalado para poder ejecutar el proyecto.

## Comandos previos

```bash
docker network create redes_usach
docker volume create redes_usach_cliente
docker volume create redes_usach
```

## Pasos para levantar la simulación del cliente

Primero es necesario definir un token para el servidor cliente en **client_simulation/.env**, cabe destacar que no es buena practica subir este tipo de archivos a repositorios online, sin embargo, dado que el uso de éste es exclusivo para el ambiente de desarrollo, y que se puede modificar de manera local, se optó por subirlo con un token por defecto:

```env
MONITOR_TOKEN='49f3041e0fe69e00cdb0d6150f2211ab41a46aca'
```

El token **49f3041e0fe69e00cdb0d6150f2211ab41a46aca**, o el que se haya definido en caso de ser modificado, será requerido al momento de registrar al servidor cliente en el sistema de monitoreo

Luego, para iniciar el servidor del cliente es necesario seguir los siguientes pasos:

```bash
cd client_simulation
docker compose build
docker compose up
```

Una vez iniciado el servidor se puede verificar su funcionamiento en
http://localhost:3001/

## Pasos para levantar el sistema de monitoreo

En otro terminal, ejecutar los siguientes comandos:

```bash
docker compose build
docker compose up
```

Una vez iniciado el servidor, se debe abrir otro terminal donde se ejecuten los siguientes comandos para iniciar la base de datos:

**Migrate** es necesario para crear las tablas con sus relaciones

```bash
docker compose run monitor rails db:migrate
```

**Seed** crea un usuario con las siguientes credenciales:
* correo: admin@admin.com
* nombre: Admin
* contraseña: admins

Se puede modificar este registro y añadir otros en el archivo: ***db/seeds.rb***

Una vez confirmados los cambios se debe ejecutar el siguiente comando para aplicar el seed:

```bash
docker compose run monitor rails db:seed
```

Por último, es necesario instalar tailwindcss:

```bash
docker compose run monitor rails tailwindcss:install
```

En este punto, ya se puede acceder al sistema con las credenciales creadas en
http://localhost:3000

## Registrar al cliente en el sistema de monitoreo

Dentro de la interfaz del sistema, en el link **"+Agregar Servidor"** se puede ver un formulario para registrar los servidores, dado que el ambiente de laboratorio se encuentra en una red de contenedores docker, es necesario hacer referencia a la url de la siguiente forma:

```url
http://web:3000/api/monitoring/metrics
```

Notar que ***"web"*** corresponde al servicio del cliente levantado por docker
