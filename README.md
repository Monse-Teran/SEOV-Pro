
# SEOV-Pro

Sistema Experto de Orientación Vocacional desarrollado con SWI-Prolog, HTML, CSS.

## Descripción

El sistema recomienda carreras profesionales mediante una base de conocimientos y reglas de inferencia, considerando las áreas de interés, habilidades y preferencias laborales del usuario.

## Tecnologías

- SWI-Prolog: backend y motor de inferencia.
- HTML, CSS: frontend.
- Docker: ejecución del backend.
- Render: alojamiento del backend.
- Vercel: alojamiento del frontend.
- GitHub: control de versiones.

## Estructura

- `backend/`: servidor Prolog, API y Dockerfile.
- `frontend/`: interfaz web.

## Ejecución local

1. Instalar SWI-Prolog.
2. Abrir una terminal en la carpeta `backend`.
3. Ejecutar `swipl -q -s main.pl`.
4. Comprobar `http://localhost:8080/health`.
5. Abrir el frontend con un servidor web local y configurar la URL de la API.

## Arquitectura

El frontend envía consultas HTTP al backend mediante el endpoint `/recomendar`. SWI-Prolog evalúa las reglas y devuelve recomendaciones en formato JSON.

## Ejemplo de consulta

`GET /recomendar?area=exactas&habilidad=programacion&entorno=remoto_u_oficina`

Resultado esperado:

```json
[
  {
    "carrera": "Ingenieria en Sistemas Computacionales",
    "nivel": "Alta (100%)"
  }
]
```

## Despliegue

- Backend: Render, mediante Docker y la carpeta `backend`.
- Frontend: Vercel, utilizando la carpeta `frontend`.

Las URL públicas se agregarán después del despliegue.

## Integrantes

Lopez Teran Monserrat
Garcia Ramirez Saul Maximiliano

Grupo:3CV3
