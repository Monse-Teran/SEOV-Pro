# SEOV-Pro — Sistema Experto de Orientación Vocacional

## 1. Descripción del proyecto

SEOV-Pro es un sistema experto de orientación vocacional que permite recomendar carreras profesionales a partir de las preferencias, habilidades y áreas de interés de los estudiantes.

El sistema utiliza SWI-Prolog como motor de inferencia y una interfaz web desarrollada con HTML, CSS y JavaScript.

Su funcionamiento se basa en una base de conocimientos que contiene hechos y reglas lógicas para determinar el nivel de compatibilidad entre el perfil del estudiante y las carreras disponibles.

## 2. Objetivo

Desarrollar un sistema experto capaz de proporcionar recomendaciones vocacionales mediante programación lógica, utilizando reglas de inferencia y consultas realizadas desde una interfaz web.

## 3. Tecnologías utilizadas

| Tecnología | Función |
|---|---|
| SWI-Prolog | Base de conocimientos y motor de inferencia |
| HTML5 | Estructura de la interfaz web |
| CSS3 | Diseño y presentación visual |
| JavaScript | Interacción con el usuario y consultas HTTP |
| Docker | Contenerización del backend |
| Render | Alojamiento del servidor SWI-Prolog |
| Vercel | Publicación del frontend |
| Git y GitHub | Control de versiones y repositorio |

## 4. Arquitectura del sistema

SEOV-Pro utiliza una arquitectura cliente-servidor dividida en dos componentes principales.

### Frontend

Desarrollado con HTML, CSS y JavaScript. Permite seleccionar las preferencias del estudiante, enviar consultas al servidor y visualizar los resultados.

### Backend

Desarrollado con SWI-Prolog. Contiene los hechos, las reglas de inferencia y los endpoints HTTP necesarios para procesar las consultas.

### Comunicación

1. El usuario selecciona sus preferencias en la página web.
2. JavaScript envía una petición HTTP al endpoint `/recomendar`.
3. SWI-Prolog recibe los parámetros y evalúa las reglas.
4. El servidor devuelve las recomendaciones en formato JSON.
5. JavaScript presenta los resultados en la interfaz.

## 5. Estructura del proyecto

```text
SEOV-Pro/
├── backend/
│   ├── Dockerfile
│   ├── main.pl
│   └── servidor_web.pl
├── frontend/
│   └── index.html
├── .gitignore
└── README.md
```

## 6. Requisitos de instalación

Para ejecutar el proyecto localmente se requiere:

- SWI-Prolog instalado.
- Git para clonar el repositorio.
- Un navegador web.
- Un editor de código como Visual Studio Code.

## 7. Instalación y ejecución local

### Clonar el repositorio

```bash
git clone https://github.com/Monse-Teran/SEOV-Pro.git
cd SEOV-Pro
```

### Ejecutar el backend

Acceder al directorio:

```bash
cd backend
```

Iniciar SWI-Prolog:

```bash
swipl -q -s main.pl
```

La configuración local prevista utiliza el puerto 8080.

Para verificar el servidor, abrir:

`http://localhost:8080/health`

### Ejecutar el frontend

Abrir una segunda terminal y acceder a la carpeta `frontend`.

Se puede utilizar un servidor HTTP local, por ejemplo:

```bash
python -m http.server 5500
```

Después abrir:

`http://localhost:5500`

El frontend debe estar configurado para consultar la URL del backend correspondiente. En la versión publicada utiliza Render.

## 8. API de recomendaciones

### Endpoint

`GET /recomendar`

### Parámetros

| Parámetro | Descripción |
|---|---|
| area | Área de interés profesional |
| habilidad | Habilidad destacada del estudiante |
| entorno | Ambiente de trabajo preferido |

### Ejemplo de consulta

`https://seov-pro-backend.onrender.com/recomendar?area=exactas&habilidad=programacion&entorno=remoto_u_oficina`

### Ejemplo de respuesta

```json
[
  {
    "carrera": "Ingenieria en Sistemas Computacionales",
    "nivel": "Alta (100%)"
  },
  {
    "carrera": "Ingenieria Mecanica",
    "nivel": "Exploracion (Solo Area)"
  }
]
```

Los resultados son generados por las reglas de inferencia de SWI-Prolog.

## 9. Despliegue del sistema

### Backend en Render

1. Crear una cuenta en Render.
2. Conectar el repositorio de GitHub.
3. Crear un Web Service.
4. Seleccionar Docker como entorno de ejecución.
5. Configurar la rama `main`.
6. Establecer `backend` como Root Directory.
7. Seleccionar una instancia compatible con los requisitos del proyecto.
8. Iniciar el despliegue.
9. Comprobar el endpoint `/health` y realizar una consulta de recomendaciones.

### Frontend en Vercel

1. Crear una cuenta en Vercel.
2. Conectar GitHub.
3. Importar el repositorio `SEOV-Pro`.
4. Seleccionar `Other` como Application Preset.
5. Configurar `frontend` como Root Directory.
6. Desplegar el proyecto.
7. Verificar que las consultas se envíen correctamente al backend de Render.

## 10. Enlaces del proyecto

**Aplicación web:**

https://seov-pro-frontend.vercel.app

**API SWI-Prolog:**

https://seov-pro-backend.onrender.com

**Repositorio GitHub:**

https://github.com/Monse-Teran/SEOV-Pro

## 11. Control de versiones

El proyecto utiliza Git para registrar modificaciones y GitHub para almacenar el código fuente.

Los cambios se documentan mediante commits descriptivos que permiten identificar avances, correcciones y nuevas funcionalidades.

## 12. Seguridad

El repositorio incorpora un archivo `.gitignore` para excluir archivos temporales, dependencias locales y variables de entorno.

No deben publicarse contraseñas, tokens de acceso, claves privadas ni otros secretos.

## 13. Integrantes y contribuciones

**Integrantes:** 
Lopez Teran Monserrat
Garcia Ramirez Saul Maximiliano

Grupo: 3CV3

## 14. Estado del proyecto

Frontend y backend desplegados correctamente.

Se comprobó el funcionamiento de la API de recomendaciones y la comunicación entre Vercel y Render.
