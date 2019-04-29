module Proof where


-- further reading -  http://people.inf.elte.hu/divip/AgdaTutorial/Index.html

-- to typecheck file: C-c C-l
-- to view type: C-c C-d

data Nat : Set where
  zero : Nat
  succ : Nat -> Nat

three : Nat 
three = succ (succ (succ zero))

-- we can aslo define

one : Nat 
one = {!!} 

two : Nat 
two = {!!}


four : Nat 
four = {!!}






-- ok that's a pain
{-# BUILTIN NATURAL Nat    #-}




five : Nat 
five = ?








-- we can write functions like in haskel

-- to get in hole: C-c C-,
-- to pattern match: C-c C-c
-- "refine" a hole: C-c C-r
_+_ : Nat -> Nat -> Nat
l + r = {!!}





-- to run function: C-c C-n
ans = two + three



data GTE  : Nat ->  Nat -> Set where
 eqItself : (n : Nat) -> GTE n n
 greaterThanByOne : (a : Nat) -> (b : Nat) -> GTE a b -> GTE (succ a) b

-- C-c C-a or C-c C-r
proof3>=1 : GTE 3 1
proof3>=1 = {!!}

proof3>=1' : GTE 3 1
proof3>=1' = {!!}

proofAllNatsGTEZero : (n : Nat) -> GTE n zero
proofAllNatsGTEZero n = {!!}





transitive : (a : Nat) -> (b : Nat) -> (c : Nat) -> (GTE a b) -> (GTE b c) -> (GTE a c)
transitive a b c ab  bc = {!!}



gteSucc : (a : Nat) -> (b : Nat) ->  GTE a b -> GTE (succ a) (succ b)
gteSucc a b ab = {!!}


-- bigger example

-- standard stuff
data List A : Set where
  Nil : List A
  Cons : (a : A) -> List A -> List A


data Bool : Set where
  True : Bool
  False : Bool

-- insertion sort

-- check is greater than 0
isGTE : Nat -> Nat -> Bool
isGTE m zero = True
isGTE zero (succ n) = False
isGTE (succ m) (succ n) = isGTE m n


--insertion into ordered list

insert : Nat -> List Nat -> List Nat
insert n Nil = (Cons n Nil)
insert n (Cons m ls) with isGTE n m  -- look here!
insert n (Cons m ls) | True  = (Cons m (insert n  ls))
insert n (Cons m ls) | False  = (Cons n  (Cons m ls))


sort : List Nat -> List Nat
sort Nil = Nil
sort (Cons a ls) = insert a (sort ls)

sortTest = sort (Cons 3 (Cons 1 (Cons 5 Nil)))








data lBound (n : Nat)  : List Nat -> Set where
  emptyGood : lBound n Nil
  hasThings : (m : Nat) -> (rest : List Nat)  -> GTE m n -> lBound  n rest -> lBound n (Cons m rest)



data Sorted : (List Nat) -> Set where
  isEmpty : Sorted Nil
  notEmpty : (m : Nat) -> (rest : List Nat)  -> (Sorted rest) -> lBound m rest -> Sorted (Cons m rest)



sortWorks :  (ls : List Nat)  -> Sorted (sort ls)
sortWorks = {!!} -- this is posible to prove like this https://gist.github.com/aztek/92e6d47bde0d128bcb9d

-- but is easier to rewrite sort in a way that makes proving easier





-- more standard things


data _×_ (A B : Set) : Set where
  <_,_> : A -> B -> A × B

fst : {A B : Set} -> A × B -> A
fst < x , y > = x

snd : {A B : Set} -> A × B -> B
snd < x , y > = y


data Either (A : Set)  (B : Set) : Set where
  Left : A -> Either A B
  Right : B -> Either A B


data Σ (A : Set) (B : A → Set) : Set where
  _,_ : (a : A) → (b : B a) → Σ A B



-- some helper proofs (lemmas)  about lower bounds we will need

extendB : (x : Nat) -> (y : Nat) ->  (ls : List Nat) -> GTE y x -> lBound y ls -> lBound x ls
extendB x y ls y>=x y<=ls = {!!}


getGte : (x : Nat) -> (y : Nat) ->  (ls : List Nat) -> lBound x (Cons y ls) -> GTE y x
getGte x y ls bound = {!!}


extendLs : (x : Nat) -> (y : Nat) ->  (ls : List Nat) -> GTE y x -> lBound y ls -> lBound x (Cons y ls)
extendLs x y ls y>=x y<=ls = {!!}



-- same as before but with more proof

isGTE' : (n : Nat) ->  (m : Nat) ->  Either (GTE n m) (GTE m n)
isGTE' zero m = Right (proofAllNatsGTEZero m)
isGTE' n zero =  Left (proofAllNatsGTEZero n)
isGTE'  (succ n) (succ m) with isGTE' n m
isGTE' (succ n) (succ m) | Left x = Left (gteSucc n m x)
isGTE' (succ n) (succ m) | Right x = Right (gteSucc m n x)


insert' : (n : Nat) -> (ls : List Nat) -> Sorted ls ->  Σ ( List Nat) (\ ls' ->  (Sorted ls')  × {!!} ) --  ( (x : Nat) -> GTE n x -> lBound x ls -> lBound x ls')
insert' n Nil pr = (Cons n Nil) , {!!}
insert' n (Cons m ls) isSorted with isGTE' n m
insert' n (Cons m ls) (notEmpty .m .ls isSorted m<=ls) | Left x = {!!}
insert' n (Cons m ls) (notEmpty .m .ls isSorted m<=ls) | Right m>=n = ( (Cons n  (Cons m ls))) , {!!}



sort' :  (ls : List Nat) ->  Σ ( List Nat) Sorted 
sort' Nil = Nil , isEmpty
sort' (Cons n  ls) with sort' ls
sort' (Cons n _) | ls , proof with insert' n ls  proof
sort' (Cons _ _) | _ , _ | (ls' , < ls'pr , _ >) = ls' , ls'pr











