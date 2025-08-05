open import Agda.Builtin.Sigma

module euclid where 
data N : Set where
  zero : N
  suc  : N → N

_+_ : N → N → N
zero  + n = n
suc m + n = suc (m + n)

_*_ : N → N → N
zero  * n = zero
suc m * n = n + (m * n)

fact : N → N
fact zero    = suc zero
fact (suc n) = suc n * fact n

divides : N → N → Set
divides d n = Σ[ k ∈ N ] (n ≡ d * k)

-- Primality: p > 1 and no divisor except 1 and p divides p

isPrime : N → Set
isPrime p = (suc (suc zero) ≤ p) × (∀ d → divides d p → ((d ≡ suc zero) ⊎ (d ≡ p)))

-- (You will also need to develop '<', '≤', and basic propositional equality.)

record LargerPrime (n : N) : Set where
  field
    p      : N
    pPrime : isPrime p
    pGtN   : n < p

-- Main function: for every n, construct a prime > n
largerPrime : (n : N) → LargerPrime n

