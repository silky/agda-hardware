{-# OPTIONS --safe --without-K #-}

module Functions.Laws where

open import Categorical.Laws
open import Categorical.Equiv
open import Functions.Raw public

module →-laws-instances where

  open import Level
  open import Data.Product
  open import Relation.Binary.PropositionalEquality
       renaming (refl to refl≡ ; trans to trans≡)

  instance

    category : Category Function _
    category = record
      { identityˡ = refl≡
      ; identityʳ = refl≡
      ; assoc     = refl≡
      ; ∘≈        = λ { {k = k} h≈k f≈g → trans≡ h≈k (cong k f≈g) }
      }

    cartesian : Cartesian Function _
    cartesian = record
      { exl▵exr = refl≡
      ; exl∘▵   = refl≡
      ; exr∘▵   = refl≡
      ; ▵≈      = λ h≈k f≈g → cong₂ _,_ h≈k f≈g
      }

    -- TODO: CartesianClosed
