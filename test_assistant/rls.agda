module rls where
open import Relation.Binary.Core using (Rel)

open import Data.Rational as ℚ using (ℚ; -_ ; _*_; 
  _-_; _+_; ∣_∣; _≤_; *≤* ; _≤?_; _÷_; ≡⇒≃)


open import Data.Integer as ℤ using (ℤ; +_ ; -[1+_]; pos; _%_)
open import Data.Nat as ℕ using (ℕ; suc; zero; _≤?_)
import Level





natToInteger : ℕ → ℤ
natToInteger zero    = 0
natToInteger (suc n) = pos (pos (suc n))

oneℤ : ℤ
oneℤ = pos 1


reciprocal : ℕ → ℚ
reciprocal zero    = 0 % 1
reciprocal (suc n) = oneℤ % pos (suc n)

record ℝ : Set where
  constructor Real
  field
    f : ℕ -> ℚ
    reg : {n m : ℕ} -> ∣ f n - f m ∣ ≤ reciprocal(suc n) + reciprocal(suc m)



_≃_ : Rel ℝ Level.zero
x ≃ y =  {n : ℕ} -> ∣ ℝ.f x n - ℝ.f y n ∣ ≤ reciprocal(suc n) + reciprocal(suc n)


