
masculino(bardock).
masculino(rei_cutelo).
masculino(raditz).
masculino(goku).
masculino(mr_satan).
masculino(gohan).
masculino(goten).
masculino(filho_do_raditz).


feminino(gine).
feminino(rainha_cutelo).
feminino(mulher_do_raditz).
feminino(chichi).
feminino(migueru).
feminino(videl).
feminino(pan).



paiOuMae(bardock,raditz).
paiOuMae(bardock,goku).
paiOuMae(gine,raditz).
paiOuMae(gine,goku).

paiOuMae(rei_cutelo,chichi).
paiOuMae(rainha_cutelo, chichi).

paiOuMae(raditz, filho_do_raditz).
paiOuMae(mulher_do_raditz,filho_do_raditz).

paiOuMae(goku,gohan).
paiOuMae(goku,goten).
paiOuMae(chichi,gohan).
paiOuMae(chichi,goten).

paiOuMae(mr_satan,videl).
paiOuMae(migueru,videl).

paiOuMae(gohan,pan).
paiOuMae(videl,pan).

conjugue(bardock, gine).
conjugue(gine, bardock).
conjugue(rei_cutelo, rainha_cutelo).
conjugue(rainha_cutelo, rei_cutelo).
conjugue(mr_satan, migueru).
conjugue(migueru, mr_satan).
conjugue(goku, chichi).
conjugue(chichi, goku).
conjugue(gohan, videl).
conjugue(videl, gohan).





%Regras A->B  .: B:-A

filhos(X,Y):-
    paiOuMae(Y,X).

filho(X,Y):-
    masculino(X),
    filhos(X,Y).

filha(X,Y):-
    feminino(X), filhos(X,Y).

irmaos(X,Y):-
    paiOuMae(Q,X),paiOuMae(Q,Y),X\=Y.

irma(X,Y):-
    filha(X,Q),paiOuMae(Q,Y), X\=Y.
irmao(X,Y):-
    filho(X,Q),paiOuMae(Q,Y),X\=Y.

mae(X,Y):-
    feminino(X),paiOuMae(X,Y).

pai(X,Y):-
    masculino(X),paiOuMae(X,Y).

marido(X,Y):-
    masculino(X),conjugue(X,Y).

esposa(X,Y):-
    marido(Y,X).

tios(T,S):-
    irmaos(T,Q),paiOuMae(Q,S),
    Q\=T.

tio(T, S):-
    masculino(T),
    tios(T,S).

tia(T, S):-
    feminino(T),
    tios(T,S).

primos(X,Y):-
    tios(A,X), paiOuMae(A,Y).
primo(X,Y):-
    masculino(X),primos(X,Y).
primo(X,Y):-
    feminino(X),primos(X,Y).

avoMOuavoF(X, Y):-
    paiOuMae(X, P),
    paiOuMae(P, Y).

avoM(X, Y):-
    avoMOuavoF(X, Y),
    masculino(X).


avoF(X, Y):-
    avoMOuavoF(X, Y),
    feminino(X).

netoOuNeta(N, A):-
    avoMOuavoF(A, N).

neta(N, A):-
    feminino(N),
    avoMOuavoF(A, N).
neto(N, A):-
    masculino(N),
    avoMOuavoF(A, N).





%GUI

janela:-
	new(D, dialog('consulta')),
	new(C, text_item(consulta)),
	send(D, append(button(pai_de,message(@prolog,pai_de,C?selection)))),
	send(D, append(button(mae_de,message(@prolog,mae_de,C?selection)))),
	send(D, append(button(pais_de,message(@prolog,pais_de,C?selection)))),
	send(D, append(button(filho_de,message(@prolog,filho_de,C?selection)))),
	send(D, append(button(filha_de,message(@prolog,filha_de,C?selection)))),
	send(D, append(button(filhos_de,message(@prolog,filhos_de,C?selection)))),
	send(D, append(button(irmaos_de,message(@prolog,irmaos_de,C?selection)))),
	send(D, append(button(irmao_de,message(@prolog,irmao_de,C?selection)))),
	send(D, append(button(irma_de,message(@prolog,irma_de,C?selection)))),
	send(D, append(button(netos_de,message(@prolog,netos_de,C?selection)))),
	send(D, append(button(neto_de,message(@prolog,neto_de,C?selection)))),
	send(D, append(button(neta_de,message(@prolog,neta_de,C?selection)))),
	send(D, append, C),
	send(D, append(button(marido_de,message(@prolog,marido_de,C?selection)))),
	send(D, append(button(esposa_de,message(@prolog,esposa_de,C?selection)))),
	send(D, append(button(tios_de,message(@prolog,tios_de,C?selection)))),
	send(D, append(button(tio_de,message(@prolog,tio_de,C?selection)))),
	send(D, append(button(tia_de,message(@prolog,tia_de,C?selection)))),
	send(D, append(button(primos_de,message(@prolog,primos_de,C?selection)))),
	send(D, append(button(primo_de,message(@prolog,primo_de,C?selection)))),
	send(D, append(button(prima_de,message(@prolog,prima_de,C?selection)))),
	send(D, append(button(avos_de,message(@prolog,avos_de,C?selection)))),
	send(D, append(button(avoM_de,message(@prolog,avoM_de,C?selection)))),
	send(D, append(button(avoF_de,message(@prolog,avoF_de,C?selection)))),
	get(D, confirm, Rval),
	Rval \== 0,
	send(D, open).

consulta_binaria:-
	new(D, dialog('retorna valor booleano')),
	new(X, text_item(xitem)),
	new(Y, text_item(yitem)),
	send(D, append(button(filho_x_y_,message(@prolog,filho_, X?selection, Y?selection)))),
	send(D, append(button(filha_x_y_,message(@prolog,filha_, X?selection, Y?selection)))),
	send(D, append(button(irmao_x_y_,message(@prolog,irmao_, X?selection, Y?selection)))),
	send(D, append(button(irma_x_y_,message(@prolog,irma_, X?selection, Y?selection)))),
	send(D, append(button(pai_x_y_,message(@prolog,pai_, X?selection, Y?selection)))),
	send(D, append(button(mae_x_y_,message(@prolog,mae_, X?selection, Y?selection)))),
	send(D, append(button(marido_x_y_,message(@prolog,marido_, X?selection, Y?selection)))),
	send(D, append(button(esposa_x_y_,message(@prolog,esposa_, X?selection, Y?selection)))),
	send(D, append,X),
	send(D, append,Y),
	send(D, append(button(tio_x_y_,message(@prolog,tio_, X?selection, Y?selection)))),
	send(D, append(button(tia_x_y_,message(@prolog,tia_, X?selection, Y?selection)))),
	send(D, append(button(primo_x_y_,message(@prolog,primo_, X?selection, Y?selection)))),
	send(D, append(button(prima_x_y_,message(@prolog,prima_, X?selection, Y?selection)))),
	send(D, append(button(avoM_x_y_,message(@prolog,avoM_, X?selection, Y?selection)))),
	send(D, append(button(avoF_x_y_,message(@prolog,avoF_, X?selection, Y?selection)))),
	send(D, append(button(neto_x_y_,message(@prolog,neto_, X?selection, Y?selection)))),
	send(D, append(button(neta_x_y_,message(@prolog,neta_, X?selection, Y?selection)))),
	get(D, confirm, Rval),
	Rval \== 0,
	send(D,open).

filho_(X,Y):-
	filho(X,Y),
	new(D, dialog('filho')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+filho(X,Y),
	new(D, dialog('filho')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

filha_(X,Y):-
	filha(X,Y),
	new(D, dialog('filha')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+filha(X,Y),
	new(D, dialog('filha')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).


irmao_(X,Y):-
	irmao(X,Y),
	new(D, dialog('irmao')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+irmao(X,Y),
	new(D, dialog('irmao')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

irma_(X,Y):-
	irma(X,Y),
	new(D, dialog('irma')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+irma(X,Y),
	new(D, dialog('irma')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

pai_(X,Y):-
	pai(X,Y),
	new(D, dialog('pai')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+pai(X,Y),
	new(D, dialog('pai')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

mae_(X,Y):-
	mae(X,Y),
	new(D, dialog('mae')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+mae(X,Y),
	new(D, dialog('mae')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

marido_(X,Y):-
	marido(X,Y),
	new(D, dialog('marido')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+marido(X,Y),
	new(D, dialog('marido')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).
esposa_(X,Y):-
	esposa(X,Y),
	new(D, dialog('esposa')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+esposa(X,Y),
	new(D, dialog('esposa')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

tio_(X,Y):-
	tio(X,Y),
	new(D, dialog('tio')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+tio(X,Y),
	new(D, dialog('tio')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

tia_(X,Y):-
	tia(X,Y),
	new(D, dialog('tia')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+tia(X,Y),
	new(D, dialog('tia')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

primo_(X,Y):-
	primo(X,Y),
	new(D, dialog('primo')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+primo(X,Y),
	new(D, dialog('primo')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

prima_(X,Y):-
	prima(X,Y),
	new(D, dialog('prima')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+prima(X,Y),
	new(D, dialog('prima')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

avoM_(X,Y):-
	avoM(X,Y),
	new(D, dialog('avoM')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+avoM(X,Y),
	new(D, dialog('avoM')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

avoF_(X,Y):-
	avoF(X,Y),
	new(D, dialog('avoF')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+avoF(X,Y),
	new(D, dialog('avoF')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

neto_(X,Y):-
	neto(X,Y),
	new(D, dialog('neto')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+neto(X,Y),
	new(D, dialog('neto')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).

neta_(X,Y):-
	neta(X,Y),
	new(D, dialog('neta')),
	new(T, text('true')),
	send(D, append,T),
	send(D, open)
	;
	\+neta(X,Y),
	new(D, dialog('neta')),
	new(T, text('false')),
	send(D, append,T),
	send(D, open).
menu:-
	new(D,dialog('Menu')),
	send(D,append(button(masculinos,message(@prolog,todos_masculinos)))),
	send(D,append(button(femininos,message(@prolog,todos_femininos)))),
	send(D, append(button(consulta,message(@prolog,janela)))),
	send(D, append(button(consulta_binaria,message(@prolog,consulta_binaria)))),
	get(D, confirm, Rval),
	Rval \== 0,
	send(D,open).

todos_masculinos:-
	findall(X,masculino(X),L),
	atomics_to_string(L, ', ', S),
	%new(D, window('masculinos')),
	%send(D, size, size(250, 250)),
	%send(D, display, text(S), point(0, 20)),
	new(D, dialog('Masculino')),
	send(D, append,text(S)),
	send(D, open).

todos_femininos:-
	findall(X,feminino(X),L),
	atomics_to_string(L, ', ', S),
	%new(D, window('femininos')),
	%send(D, size, size(250, 100)),
	%send(D, display, text(S), point(0, 20)),
	new(D, dialog('Feminino')),	
	send(D, append, text(S)),	
	send(D, open).

filho_de(X):-
	findall(Y,filho(Y,X),L),
	atomics_to_string(L,', ',S),
	new(D, window('filho')),
	send(D, size, size(250, 100)),
	send(D, display, text('filho:'),point(0, 50)),
	send(D, display, text(S), point(30, 50)),
	send(D, open).

filha_de(X):-
	findall(Y,filha(Y,X),L),
	atomics_to_string(L,', ',S),
	new(D, window('filha')),
	send(D, size, size(250, 100)),
	send(D, display, text('filha:'),point(0, 50)),
	send(D, display, text(S), point(30, 50)),
	send(D, open).

filhos_de(X):-
	findall(Y,filhos(Y,X),L),
	atomics_to_string(L,', ',S),
	new(D, window('filha')),
	send(D, size, size(250, 100)),
	send(D, display, text('filhos:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

pai_de(X):-
	pai(Y,X),
	new(D, window('pai')),
	send(D, size, size(250, 100)),
	send(D, display, text('pai:'), point(0, 20)),
	send(D, display, text(Y),point(30,20)),
	send(D, open).

mae_de(X):-
	mae(Y,X),
	new(D, window('mae')),
	send(D, size, size(250, 100)),
	send(D, display, text('mae:'), point(0, 20)),
	send(D, display, text(Y),point(30,20)),
	send(D, open).

pais_de(X):-
	findall(Y,filhos(X,Y),L),
	atomics_to_string(L,', ',S),
	new(D, window('pais')),
	send(D, size, size(250, 100)),
	send(D, display, text('pais:'),point(0, 50)),
	send(D, display, text(S), point(30, 50)),
	send(D, open).

irmaos_de(X):-
	findall(Y,irmaos(X,Y),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('irmaos')),
	send(D, size, size(250, 100)),
	send(D, display, text('irmaos:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

irmao_de(X):-
	findall(Y,irmao(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('irmao')),
	send(D, size, size(250, 100)),
	send(D, display, text('irmao:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

irma_de(X):-
	findall(Y,irma(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('irma')),
	send(D, size, size(250, 100)),
	send(D, display, text('irma:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

marido_de(X):-
	marido(Y,X),
	new(D, window('marido')),
	send(D, size, size(250, 100)),
	send(D, display, text('marido:'), point(0, 20)),
	send(D, display, text(Y),point(50,20)),
	send(D, open).

esposa_de(X):-
	esposa(Y,X),
	new(D, window('esposa')),
	send(D, size, size(250, 100)),
	send(D, display, text('esposa:'), point(0, 20)),
	send(D, display, text(Y),point(50,20)),
	send(D, open).

tios_de(X):-
	findall(Y,tios(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('tios')),
	send(D, size, size(250, 100)),
	send(D, display, text('tios:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

tio_de(X):-
	findall(Y,tio(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('tio')),
	send(D, size, size(250, 100)),
	send(D, display, text('tio:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

tia_de(X):-
	findall(Y,tia(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('tia')),
	send(D, size, size(250, 100)),
	send(D, display, text('tia:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

primos_de(X):-
	findall(Y,primos(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('primos')),
	send(D, size, size(250, 100)),
	send(D, display, text('primos:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

primo_de(X):-
	findall(Y,primo(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('primo')),
	send(D, size, size(250, 100)),
	send(D, display, text('primo:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

prima_de(X):-
	findall(Y,prima(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('prima')),
	send(D, size, size(250, 100)),
	send(D, display, text('prima:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).


avos_de(X):-
	findall(Y,avoMOuavoF(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('avos')),
	send(D, size, size(250, 100)),
	send(D, display, text('avos:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).
avoM_de(X):-
	findall(Y,avoM(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('avoM')),
	send(D, size, size(250, 100)),
	send(D, display, text('avoM:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

avoF_de(X):-
	findall(Y,avoF(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('avoF')),
	send(D, size, size(250, 100)),
	send(D, display, text('avoF:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

netos_de(X):-
	findall(Y,netoOuNeta(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('netos')),
	send(D, size, size(250, 100)),
	send(D, display, text('netos:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

neto_de(X):-
	findall(Y,neto(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('neto')),
	send(D, size, size(250, 100)),
	send(D, display, text('neto:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).

neta_de(X):-
	findall(Y,neta(Y,X),L),
	sort(L,L2),
	atomics_to_string(L2,', ',S),
	new(D, window('neta')),
	send(D, size, size(250, 100)),
	send(D, display, text('neta:'),point(0, 50)),
	send(D, display, text(S), point(50, 50)),
	send(D, open).


:-menu.











































