module hello where

an-implication : { A B C : Set} -> ( A -> B) -> ( A -> B) -> ( B -> C ) -> A -> C

an-implication g g' f x = ?

another-implication : { A B C : Set} -> ( A -> B) -> ( A -> B) -> ( B -> C ) -> A -> C

another-implication g g' f x = f (g x) 


data N : Set where 
  zero : N 
  suc : N -> N 


_+_ : N -> N -> N 
zero + x =  x 
(suc x) + y = suc (x + y ) 

data _≡_ {A : Set} (x : A) : A -> Set where
  refl : x ≡ x

_*_ : N -> N -> N
zero  * n = zero
suc m * n = n + (m * n)

data Even : N -> Set where
  evenZero : Even zero
  evenSucSuc : ∀ {n} -> Even n -> Even (suc (suc n))

square : N -> N

square n = n * n

data ⊥ : Set where

m^2 = 2n^2 

irrationalSqrt2 : (m n : N) -> n ≡ zero ->  ⊥  -> square m ≡ ((suc (suc zero)) * square n) -> ⊥
irrationalSqrt2 m n nNonZero absurd eq =  {!!}

i