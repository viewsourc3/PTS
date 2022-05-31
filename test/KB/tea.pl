:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

server(Port) :-
	http_server(http_dispatch, [port(Port)]).

/** 
identifier les différents types de thé
*/
kind(whiteTea).
kind(blackTea).
kind(oolongTea).
kind(yellowTea).
kind(greenTea).

/** 
identifier les étapes
*/
step(wilting).
step(bruising).

/**
identifier les contraintes de précédences
*/
pred(bruising, wilting).
pred(oxidation, bruising).

/** wilting - flétrissement 
wilting(whiteTea) se lit : La production du whiteTea passe par une étape de wilting
idem pour les autres facts
*/
wilting(whiteTea).
wilting(oolongTea).
wilting(blackTea).

/** bruising - écrasement */
bruising(Tea) :-
	tossingInBasket(Tea) ;
	lightCrushing(Tea) ;
	cTCwithFullOxidation(Tea).
tossingInBasket(oolongTea).
lightCrushing(blackTea).

/** oxidation - oxydation */
oxidation(Tea) :-
	partialOxidation(Tea) ;
	fullOxidation(Tea) ;
	cTCwithFullOxidation(Tea).
partialOxidation(oolongTea).
fullOxidation(blackTea).

cTCwithFullOxidation(blackTea).

/** fixation - fixation */
fixation(Tea) :-
	steaming(Tea) ;
	panning(Tea) ;
	baking(Tea).
steaming(greenTea).
panning(greenTea).
panning(yellowTea).
panning(oolongTea).
baking(whiteTea).
baking(oolongTea).

/** yellowing - jaunissement */
yellowing(Tea) :-
	sweltering(Tea).
sweltering(yellowTea).

/** shaping - mise en forme */
shaping(Tea) :-
	rolling(Tea) ;
	forming(Tea) ;
	lightRolling(Tea) ;
	ballRolling(Tea).
rolling(greenTea).
rolling(yellowTea).
rolling(oolongTea).
rolling(blackTea).
forming(greenTea).
lightRolling(whiteTea).
ballRolling(oolongTea).

/** drying - séchage */
drying(postFermentedTea).
drying(greenTea).
drying(yellowTea).
drying(whiteTea).
drying(oolongTea).
drying(blackTea).

/** curing - fumage */
curing(Tea) :- 
	naturalAging(Tea) ; 
	wetPiling(Tea) ; 
	firing(Tea).
naturalAging(postFermentedTea).
wetPiling(postFermentedTea).
firing(oolongTea).