male(stuart).
male(robert).
male(stefan).
male(robert_sr).
male(richard).

female(faye).
female(joan).
female(carolyn).
female(sophie).

parent_of(robert, stefan).
parent_of(carolyn, stefan).
parent_of(robert, sophie).
parent_of(carolyn, sophie).
parent_of(robert, stuart).
parent_of(carolyn, stuart).

parent_of(robert_sr, robert).
parent_of(faye, robert).
parent_of(richard, carolyn).
parent_of(joan, carolyn).

child_of(X, Y) :- parent_of(Y, X).

father_of(X, Y) :- male(X),parent_of(X,Y).
mother_of(X, Y) :- female(X),parent_of(X,Y).

grandparent_of(Grandparent, Grandkid) :- parent_of(Parent, Grandkid), parent_of(Grandparent, Parent).

sibling_of(Sib1, Sib2) :- parent_of(P, Sib1), parent_of(P, Sib2), Sib1\=Sib2.

brother_of(X, Y) :- sibling_of(X, Y), male(X).
sister_of(X, Y) :- sibling_of(X, Y), female(X).

ancestor_of(X, Y) :- parent_of(X, Y) ; grandparent_of(X, Y).