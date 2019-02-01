insert(A, _ , tree(A,_, _)).
insert(A, tree(A,Left,Right), Tree):-!, Tree = tree(A,Left,Right).
insert(A, tree(B,Left,Right), tree(B, L0, Right)):- A < B, !,insert(A, Left, L0).
insert(A, tree(B,Left,Right), tree(B,Left, R0)):- A > B, insert(A, Right, R0).


search(A,tree(A,_,_)).
search(A,tree(_,Left,_)) :-
    search(A,Left).
search(A,tree(_,_,Right)) :-
    search(A,Right).


/*Use this to call the preOrder, postOrder inOrder(node(5, node(3, node(1, Na, Na), node(4, Na, Na)), node(8, node(6, Na, Na), Na)), list). */

inOrder(Na, []).
inOrder(node(X,Left,Right), Arr):-
    inOrder(Left,L0), inOrder(Right, R0),
    append(L0, [X|R0], Arr).

/* check if empty, X is root node, left is left subtree, right is right subtree, Arr is where we store the new nodes. Left list first, then right list, append leftlist, then root, then right list they get stored in Arr. */

postOrder(Na, []).
postOrder(node(X,Left,Right), Arr):-
    postOrder(Left,L0), postOrder(Right, R0),
    append(L0, R0,R1), append(R1, [X], Arr).

/* append left list with right list, save in temporary list, then append the temporary list to the root node */


preOrder(Na, []).
preOrder(node(X,Left,Right), Arr):-
    preOrder(Left,L0), preOrder(Right, R0),
    append([X|L0], R0, Arr).







