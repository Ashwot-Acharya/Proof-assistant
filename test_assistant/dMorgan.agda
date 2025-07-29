open import Agda.Primitive using (Level; lzero)
open import Data.Product using (_×_; _,_)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Relation.Nullary using (Dec; yes; no)
open import Data.Empty using (⊥; ⊥-elim)
open import Relation.Nullary.Negation using (¬_)


--One Direction
deMorganOneWay : ∀ {ℓ} {P Q : Set ℓ} → (¬ P) ⊎ (¬ Q) → ¬ (P × Q)
deMorganOneWay (inj₁ np) (p , q) = np p
deMorganOneWay (inj₂ nq) (p , q) = nq q

--Converse, Requires Non Constructive Assumptions 
deMorganOtherWay :
  ∀ {ℓ} {P Q : Set ℓ}
  → Dec P
  → Dec Q
  → ¬ (P × Q)
  → (¬ P) ⊎ (¬ Q)
deMorganOtherWay (yes p) _ notPQ = inj₂ (λ q → notPQ (p , q))
deMorganOtherWay (no np) (yes q) _ = inj₁ np
deMorganOtherWay (no np) (no nq) _ = inj₁ np  -- or inj₂ nq

