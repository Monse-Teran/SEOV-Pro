% ===================================================
% SEOV-Pro - Archivo de inicio para Render
% ===================================================

:- use_module(library(http/thread_httpd)).

% Cargar la base de conocimientos y las rutas
:- consult('servidor_web.pl').

% Ejecutar main al iniciar Prolog como programa
:- initialization(main, main).

main :-
    % Obtener el puerto configurado por Render
    ( getenv('PORT', PuertoTexto)
    -> atom_number(PuertoTexto, Puerto)
    ;  Puerto = 8080
    ),

    % Iniciar el servidor HTTP
    iniciar_servidor(Puerto),

    % Mostrar mensaje de confirmacion
    format('SEOV-Pro iniciado en puerto ~w~n', [Puerto]),

    % Mantener el proceso activo
    thread_get_message(_).

