module Test.Prim.Array where

import Prelude

import Effect (Effect)
import Test.StrongCheck.Laws (A, checkLaws)
import Test.StrongCheck.Laws.Control as Control
import Test.StrongCheck.Laws.Data as Data
import Type.Proxy (Proxy(..), Proxy2(..))

checkArray ∷ Effect Unit
checkArray = checkLaws "Array" do
  Data.checkEq prxArray
  Data.checkOrd prxArray
  Data.checkFunctor prx2Array
  Control.checkApply prx2Array
  Control.checkApplicative prx2Array
  Control.checkBind prx2Array
  Control.checkMonad prx2Array
  Data.checkSemigroup prxArray
  Data.checkMonoid prxArray
  Control.checkAlt prx2Array
  Control.checkPlus prx2Array
  Control.checkAlternative prx2Array
  Control.checkMonadZero prx2Array
  Control.checkMonadPlus prx2Array
  where
  prxArray = Proxy ∷ Proxy (Array A)
  prx2Array = Proxy2 ∷ Proxy2 Array
