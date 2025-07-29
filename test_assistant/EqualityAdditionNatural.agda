

data N : Set where
    zero : N 
    suc : N -> N 

{-# BUILTIN NATURAL N #-}


--Equality
data _==_ { A : Set } ( x : A ) : A -> Set where 
    refl : x == x 

cong : {A B : Set } ( f : A -> B ) { x y : A}
    -> x == y
    -> f x == f y
cong f refl = refl 
sym : forall { A : Set } { x y : A}
    -> x == y
    -> y == x 
sym refl = refl

trans : { A : Set } { x y z : A}
    -> x == y
    -> y == z
    -> x == z

trans refl refl = refl 

{-# BUILTIN EQUALITY _==_ #-}

infix 4 _==_


--ADDITION

_+_ : N -> N -> N 
zero + x = x
suc x + y = suc(x + y)


--ZERO
zero-+ : ( a : N ) -> ( ( zero + a ) == a )
zero-+ a = refl

+-zero : ( a : N ) -> ( ( a + zero ) == a )
+-zero zero = refl
+-zero (suc a) = cong suc (+-zero a)

--LEMMA FOR COMMUTATIVITY
+-suc : forall x y -> x + suc y == suc (x + y)
+-suc zero y = refl
+-suc (suc x) y = cong suc (+-suc x y)


--ASSOCIATIVITY
assoc-+ : forall x y z -> (x + y) + z == x + (y + z)
assoc-+ zero y z = refl
assoc-+ (suc x) y z = cong suc (assoc-+ x y z)

--COMMUTATIVITY
+-comm : ( a b : N) -> ( ( a + b ) == ( b + a ) )
+-comm a zero = +-zero a 
+-comm a (suc b) = trans (+-suc a b) (cong suc (+-comm a b))

