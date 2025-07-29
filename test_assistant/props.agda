module props where

open import Agda.Primitive using (Level; lzero)

open import Data.Product using (Σ; _,_)

variable
  l : Level
  X : Set l
  A B : X → Set l
  s : X

-- The theorem: from (forallx → A x → B x) and A s, prove ∃ x → B x

prop23 : (forall x → A x → B x) → (s : X) → A s → Σ X B
prop23 allImp s aS = s , allImp s aS

prop24 : forall {A B : Set} -> A -> B -> A
prop24 a b = a