# 🛠️ Pipeline Jenkins para la Creación de Usuarios Linux

Este proyecto implementa un pipeline declarativo en Jenkins que permite automatizar la creación de usuarios en un sistema Linux, reduciendo errores humanos y centralizando la gestión desde el área de seguridad.

---

## 📦 Contenido del repositorio

- `crear_usuario.sh`: Script en Bash que realiza la creación del usuario, lo asigna a un grupo, y genera una contraseña temporal.
- `Jenkinsfile`: Pipeline declarativo que toma los datos ingresados por el operador y ejecuta el script.
- `README.md`: Guía de uso paso a paso (este archivo).

---

## 🚀 ¿Cómo utilizar el Job en Jenkins?

### 1. Prerrequisitos

- Jenkins instalado y en funcionamiento (ej: http://localhost:8080).
- Jenkins debe tener acceso a este repositorio GitHub.
- El sistema donde corre Jenkins debe tener permisos para ejecutar comandos como `useradd`.

---

### 2. Crear el Job en Jenkins

1. Ingresá a Jenkins
2. Hacé clic en **Nuevo Item**
3. Poné como nombre `crear-usuarios-pipeline`
4. Seleccioná **Pipeline**
5. En el campo **Definition**, elegí: `Pipeline script from SCM`
6. Completá los siguientes campos:
   - **SCM:** Git
   - **Repository URL:** `https://github.com/cristianrzc/crear-usuarios-pipeline.git`
   - **Branch:** `main`
   - **Script Path:** `Jenkinsfile` (por defecto)

---

### 3. Ejecutar el pipeline

1. En el Job, hacé clic en **Build with Parameters**
2. Completá los siguientes datos:

| Parámetro        | Descripción                              | Ejemplo       |
|------------------|------------------------------------------|---------------|
| `LOGIN`          | Usuario a crear (único)                  | jlopez        |
| `NOMBRE_COMPLETO`| Nombre y apellido del usuario            | Jose Lopez    |
| `DEPARTAMENTO`   | Grupo asignado al usuario                | tecnologia    |

3. Hacé clic en **Build**

---

### 4. Resultado

- Jenkins ejecutará el script `crear_usuario.sh`.
- El usuario será creado y asignado al grupo.
- Se generará una contraseña temporal que se mostrará en la salida de consola.
- El usuario deberá cambiar la contraseña en su primer inicio de sesión.

---

## 📸 Evidencia de uso

La salida completa del pipeline se encuentra disponible en el siguiente archivo:

[Console_Output](Console_Output.txt)

---

## 🔐 Nota sobre permisos

El script requiere ejecutar comandos con privilegios, por lo tanto, Jenkins debe ejecutarse con los permisos necesarios o el script debe estar configurado con `sudo` correctamente.

---

## 🙋 Autor

Cristian Rodríguez  
<cristian.andres.rodriguez.78@gmail.com>  
[https://github.com/cristianrzc](https://github.com/cristianrzc)

