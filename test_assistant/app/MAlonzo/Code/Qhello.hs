{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE EmptyCase #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}

{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module MAlonzo.Code.Qhello where

import MAlonzo.RTE (coe, erased, AgdaAny, addInt, subInt, mulInt,
                    quotInt, remInt, geqInt, ltInt, eqInt, add64, sub64, mul64, quot64,
                    rem64, lt64, eq64, word64FromNat, word64ToNat)
import qualified MAlonzo.RTE
import qualified Data.Text

-- hello.an-implication
d_an'45'implication_8 ::
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_an'45'implication_8 ~v0 ~v1 ~v2 ~v3 v4 v5 v6
  = du_an'45'implication_8 v4 v5 v6
du_an'45'implication_8 ::
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_an'45'implication_8 v0 v1 v2 = coe v1 (coe v0 v2)
-- hello.another-implication
d_another'45'implication_24 ::
  () ->
  () ->
  () ->
  (AgdaAny -> AgdaAny) ->
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
d_another'45'implication_24 ~v0 ~v1 ~v2 v3 ~v4 v5 v6
  = du_another'45'implication_24 v3 v5 v6
du_another'45'implication_24 ::
  (AgdaAny -> AgdaAny) -> (AgdaAny -> AgdaAny) -> AgdaAny -> AgdaAny
du_another'45'implication_24 v0 v1 v2 = coe v1 (coe v0 v2)
-- hello.N
d_N_34 = ()
data T_N_34 = C_zero_36 | C_suc_38 T_N_34
-- hello._+_
d__'43'__40 :: T_N_34 -> T_N_34 -> T_N_34
d__'43'__40 v0 v1
  = case coe v0 of
      C_zero_36 -> coe v1
      C_suc_38 v2 -> coe C_suc_38 (coe d__'43'__40 (coe v2) (coe v1))
      _ -> MAlonzo.RTE.mazUnreachableError
