module irrational_proof where
  
open import Data.Nat
open import Data.Integer
open import Data.Rational
open import Data.Nat.Properties
open import Relation.Binary.PropositionalEquality
open import Data.Empty

irrationalSqrt2 :
  (m n : N) → n ≢ 0 →
  (abs (2 * n * n - m * m)) ≥ 1 →
  abs (sqrt 2 - (toQ m n)) ≥ 1 / (3 * (n * n))
irrationalSqrt2 m n n≠0 diff-lower = ?

