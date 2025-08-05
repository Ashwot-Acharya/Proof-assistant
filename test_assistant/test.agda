data List (A : Set) : Set where
  []  : List A
  _∷_ : A → List A → List A

data Bool : Set where
  true  : Bool
  false : Bool

_++_ : {A : Set} → List A → List A → List A
[]       ++ ys = ys
(x ∷ xs) ++ ys = x ∷ (xs ++ ys)

data Sorted {A : Set} (_≤_ : A → A → Set) : List A → Set where
  sorted[]  : Sorted _≤_ []
  sorted∷1 : {x : A} → Sorted _≤_ (x ∷ [])
  sorted∷2 : {x y : A} {ys : List A} → x ≤ y → Sorted _≤_ (y ∷ ys) → Sorted _≤_ (x ∷ (y ∷ ys))
  

sort : {A : Set} (_≤_ : A → A → Bool) → List A → List A
sort _ [] = []
sort ≤ (x ∷ xs) = insert ≤ x (sort ≤ xs)
  where
    insert : {A : Set} (_≤_ : A → A → Bool) → A → List A → List A
    insert _ x [] = x ∷ []
    insert ≤ x (y ∷ ys) with ≤ x y
    ... | true  = x ∷ (y ∷ ys)
    ... | false = y ∷ insert ≤ x ys

sort-correct : {A : Set} (_≤_ : A → A → Bool) (_≼_ : A → A → Set) (xs : List A) → Sorted _≼_ (sort ≤ xs)

sort-correct _ _ [] = sorted[]

sort-correct ≤ _≼_ (x ∷ xs) = ?