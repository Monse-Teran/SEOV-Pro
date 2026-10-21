% =====================================================================
% SEOV-Pro: Servidor Web Nativo en SWI-Prolog
% =====================================================================

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_cors)).

% --- 1. BASE DE CONOCIMIENTO (Hechos y Reglas) ---
carrera(sistemas, 'Ingenieria en Sistemas Computacionales', exactas).
carrera(medicina, 'Medicina Humana', salud).
carrera(derecho, 'Licenciatura en Derecho', sociales).
carrera(administracion, 'Administracion de Empresas', economico_administrativas).
carrera(psicologia, 'Licenciatura en Psicologia', salud).
carrera(arquitectura, 'Arquitectura', diseno).
carrera(mecanica, 'Ingenieria Mecanica', exactas).
carrera(diseno_digital, 'Diseno y Animacion Digital', diseno).

requiere_habilidad(sistemas, programacion).
requiere_habilidad(sistemas, pensamiento_logico).
requiere_habilidad(medicina, biologia).
requiere_habilidad(medicina, empatia).
requiere_habilidad(derecho, lectura_comprensiva).
requiere_habilidad(derecho, oratoria).
requiere_habilidad(administracion, liderazgo).
requiere_habilidad(administracion, finanzas).
requiere_habilidad(psicologia, escucha_activa).
requiere_habilidad(arquitectura, dibujo_tecnico).
requiere_habilidad(mecanica, fisica).
requiere_habilidad(diseno_digital, creatividad).

requiere_entorno(sistemas, remoto_u_oficina).
requiere_entorno(medicina, hospital).
requiere_entorno(derecho, oficina_o_tribunal).
requiere_entorno(arquitectura, campo_y_oficina).
requiere_entorno(diseno_digital, remoto_u_oficina).
requiere_entorno(administracion, oficina_o_tribunal).
requiere_entorno(psicologia, oficina_o_tribunal).
requiere_entorno(mecanica, campo_y_oficina).

% Reglas de inferencia
evaluar_compatibilidad(Area, Habilidad, Entorno, IdCarrera, 'Alta (100%)') :-
    carrera(IdCarrera, _, Area),
    requiere_habilidad(IdCarrera, Habilidad),
    requiere_entorno(IdCarrera, Entorno).

evaluar_compatibilidad(Area, Habilidad, Entorno, IdCarrera, 'Moderada (Area + Habilidad)') :-
    carrera(IdCarrera, _, Area),
    requiere_habilidad(IdCarrera, Habilidad),
    \+ requiere_entorno(IdCarrera, Entorno).

evaluar_compatibilidad(Area, Habilidad, _, IdCarrera, 'Exploracion (Solo Area)') :-
    carrera(IdCarrera, _, Area),
    \+ requiere_habilidad(IdCarrera, Habilidad).

evaluar_compatibilidad(Area, Habilidad, _, IdCarrera, 'Exploracion (Solo Habilidad)') :-
    \+ carrera(IdCarrera, _, Area),
    requiere_habilidad(IdCarrera, Habilidad).

% ===================================================
% 2. CONFIGURACION DEL SERVIDOR PARA RENDER
% ===================================================

:- set_setting(http:cors, ['*']).

% Ruta para verificar el servidor
:- http_handler(root(health), api_health, []).

% Ruta para consultar recomendaciones
:- http_handler(root(recomendar), api_recomendar, []).

% Iniciar servidor
iniciar_servidor(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Verificar funcionamiento
api_health(Request) :-
    cors_enable(Request, [methods([get])]),
    reply_json_dict(_{
        estado: "activo",
        sistema: "SEOV-Pro",
        mensaje: "Servidor Prolog funcionando"
    }).


% ===================================================
% 3. API DE RECOMENDACIONES
% ===================================================

api_recomendar(Request) :-
    cors_enable(Request, [methods([get])]),

    http_parameters(Request, [
        area(Area, [atom]),
        habilidad(Habilidad, [atom]),
        entorno(Entorno, [atom])
    ]),

    findall(
        json([
            carrera=Nombre,
            nivel=Nivel
        ]),
        (
            evaluar_compatibilidad(
                Area,
                Habilidad,
                Entorno,
                Id,
                Nivel
            ),
            carrera(Id, Nombre, _)
        ),
        ListaSoluciones
    ),

    reply_json(ListaSoluciones).
    
    