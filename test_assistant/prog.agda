module prog where 

data N : Set where 
    zero : N 
    suc : N -> N  



data Vec (A : Set) : N → Set where
  []  : Vec A zero
  _∷_ : ∀ {n} (x : A) (xs : Vec A n) → Vec A (suc n)

infixr 5 _∷_

_+_ : N -> N -> N 
zero + x = x 
(suc x ) + y = suc ( x + y)