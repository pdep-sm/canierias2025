% Una cañería es una lista de piezas
% [   ]
%
% Canio rojo de 3m ? => canio(rojo, 3)
% Codo rojo => codo(rojo)
% Canilla triangular roja de 4 cm de ancho => canilla(triangular, rojo, 4)
% [codo(rojo), codo(rojo), codo(rojo)]
% Definir un predicado que relacione una cañería con su precio. Una cañería es una lista de piezas.
% 1-
%precio(Canieria, Precio):- 
precio([], 0).
precio([Pieza|Piezas], Precio):-
    precio(Pieza, PrecioPieza),
    precio(Piezas, PrecioResto),
    Precio is PrecioPieza + PrecioResto.

precio(canio(_, Metros), Precio):- 
    Precio is 3 * Metros.

precio(codo(_), 5).

precio(canilla(triangular,_,_), 20).
precio(canilla(Tipo,_,Ancho), 12):- Tipo \= triangular, Ancho =< 5.
precio(canilla(Tipo,_,Ancho), 15):- Tipo \= triangular, Ancho > 5.

% 2 - 
puedoEnchufar(PiezaIzquierda, PiezaDerecha):-
    color(PiezaIzquierda, ColorIzquierdo),
    color(PiezaDerecha, ColorDerecho),
    coloresEnchufables(ColorIzquierdo, ColorDerecho).

coloresEnchufables(Color, Color).
coloresEnchufables(azul, rojo).
coloresEnchufables(rojo, negro).

color(canio(Color, _), Color).
color(codo(Color), Color).
color(canilla(_, Color, _), Color).

% 3 - 
puedoEnchufar(Canieria, PiezaOCanieria):-
    last(Canieria, PiezaIzquierda),
    puedoEnchufar(PiezaIzquierda, PiezaOCanieria).

puedoEnchufar(PiezaOCanieria, [PiezaDerecha | _]):-
    puedoEnchufar(PiezaOCanieria, PiezaDerecha).

/* No hace falta, se resuelve por los otros
puedoEnchufar(Canieria1, [PiezaDerecha|_]):-
    last(Canieria, PiezaIzquierda),
    puedoEnchufar(PiezaIzquierda, PiezaDerecha).
*/