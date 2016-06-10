module Test.Data.Identity where

import Prelude

import Data.Identity (Identity)

import Test.StrongCheck.Laws (SC, A, checkLaws)
import Test.StrongCheck.Laws.Control as Control
import Test.StrongCheck.Laws.Data as Data

import Type.Proxy (Proxy(..), Proxy2(..))

checkIdentity ∷ ∀ eff. SC eff Unit
checkIdentity = checkLaws "Identity" do
  Data.checkEq prxIdentity
  Data.checkOrd prxIdentity
  Data.checkBounded prxIdentity

  Data.checkSemigroup prxIdentity
  Data.checkMonoid prxIdentity

  -- Data.checkSemiring prxIdentity
  -- Data.checkEuclideanRing prxIdentity
  -- Data.checkRing prxIdentity
  -- Data.checkCommutativeRing prxIdentity
  -- Data.checkField prxIdentity

  Data.checkFunctor prx2Identity
  Control.checkApply prx2Identity
  Control.checkApplicative prx2Identity
  Control.checkBind prx2Identity
  Control.checkMonad prx2Identity

  Control.checkExtend prx2Identity
  Control.checkComonad prx2Identity

  -- checkAlt prx2Identity
  -- checkPlus prx2Identity
  -- checkAlternative prx2Identity
  -- checkMonadZero prx2Identity
  where
  prxIdentity = Proxy ∷ Proxy (Identity A)
  prx2Identity = Proxy2 ∷ Proxy2 Identity
