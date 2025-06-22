% Dejar esto al principio del archivo. Carga el archivo del dominio.
:- consult('solucion.pl'). 

:- begin_tests(precio).

% Tests para el predicado precio/2
test(precioCanieriaVacia, [nondet]) :-
    precio([], 0).

test(precioCanioRojo3m, [nondet]) :-
    precio(canio(rojo, 3), 9).

test(precioCodoRojo, [nondet]) :-
    precio(codo(rojo), 5).

test(precioCanillaTriangularRoja4cm, [nondet]) :-
    precio(canilla(triangular, rojo, 4), 20).

test(precioCanillaCircularAzul3cm, [nondet]) :-
    precio(canilla(circular, azul, 3), 12).

test(precioCanillaCuadradaVerde8cm, [nondet]) :-
    precio(canilla(cuadrada, verde, 8), 15).

test(precioCanieriaSimple, [nondet]) :-
    precio([codo(rojo), canio(azul, 2)], 11).

test(precioCanieriaCompleja, [nondet]) :-
    precio([canilla(triangular, negro, 10), codo(azul), canio(verde, 5), canilla(ovalada, gris, 6)], 55).

:- end_tests(precio).

%---

:- begin_tests(puedoEnchufar).

% Tests para el predicado puedoEnchufar/2 (entre piezas)
test(puedoEnchufarMismoColor, [nondet]) :-
    puedoEnchufar(codo(rojo), canio(rojo, 2)).

test(puedoEnchufarAzulRojo, [nondet]) :-
    puedoEnchufar(canio(azul, 1), canilla(triangular, rojo, 5)).

test(puedoEnchufarRojoNegro, [nondet]) :-
    puedoEnchufar(canilla(circular, rojo, 3), codo(negro)).

test(noPuedoEnchufarColoresNoCompatiblesVerdeAzul, [fail]) :-
    puedoEnchufar(canio(verde, 5), codo(azul)).

test(noPuedoEnchufarAzulNegro, [fail]) :-
    puedoEnchufar(canio(azul, 1), codo(negro)).

% Tests para el predicado puedoEnchufar/2 (entre cañería y pieza)
test(puedoEnchufarCanieriaPiezaExtremoCompatibleAzulRojo, [nondet]) :-
    puedoEnchufar([codo(azul), canio(azul, 2)], codo(rojo)).

test(noPuedoEnchufarCanieriaPiezaExtremoIncompatibleAzulVerde, [fail]) :-
    puedoEnchufar([codo(rojo), canio(azul, 2)], codo(verde)).

% Tests para el predicado puedoEnchufar/2 (entre pieza y cañería)
test(puedoEnchufarPiezaCanieriaInicioCompatibleAzulRojo, [nondet]) :-
    puedoEnchufar(codo(azul), [codo(rojo), canio(rojo, 3)]).

test(noPuedoEnchufarPiezaCanieriaInicioIncompatibleRojoAzul, [fail]) :-
    puedoEnchufar(codo(rojo), [codo(azul), canio(azul, 3)]).

% Tests para el predicado puedoEnchufar/2 (entre cañerías)
test(puedoEnchufarCanieriasCompatiblesRojoNegro, [nondet]) :-
    puedoEnchufar([canio(azul, 1), codo(rojo)], [codo(negro), canio(negro, 2)]).

test(puedoEnchufarCanieriasCompatiblesAzulRojo, [nondet]) :-
    puedoEnchufar([canio(rojo, 1), codo(azul)], [codo(rojo), canio(rojo, 2)]).

test(noPuedoEnchufarCanieriasIncompatiblesNegroAzul, [fail]) :-
    puedoEnchufar([canio(rojo, 1), codo(negro)], [codo(azul), canio(azul, 2)]).

:- end_tests(puedoEnchufar).

% Dejar esto al final del archivo para que se ejecuten automáticamente al cargarlo mediante SWI Prolog.
:- run_tests.