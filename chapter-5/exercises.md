# Chapter 5 Exercises

## First Intermission

Below you’ll find a list of several standard functions we’ve talked
about previously. Under that is a list of their type signatures. Match
the function to its type signature. Try to do it without peeking at
the type signatures (either in the text or in GHCi) and then check
your work. You may find it easier to start from the types and work out
what you think a function of that type would do.

1. Functions:
a) not
b) length
c) concat
d) head
e) (<)

2. Type signatures:
a) _ :: [a] -> a
b) _ :: [[a]] -> [a]
c) _ :: Bool -> Bool
d) _ :: [a] -> Int
e) _ :: Ord a => a -> a -> Bool

1a: 2c
1b: 2d
1c: 2b
1d: 2a
1e: 2e

## Second Intermission

Given a function and its type, tell us what type results from applying some or
all of the arguments.

1. If the type of f is a -> a -> a -> a,
   and the type of x is Char then the type of f x is
a) Char -> Char -> Char
b) x -> x -> x -> x
c) a -> a -> a
d) a -> a -> a -> Char

> Char -> Char -> Char

2. If the type of g is a -> b -> c -> b,
   then the type of g 0 'c' "woot" is

a) String
b) Char -> String
c) Int
d) Char

> d, Char


3. If the type of h is (Num a, Num b) => a -> b -> b,
   then the type of h 1.0 2 is

a) Double
b) Integer
c) Integral b => b
d) Num b => b

> d, Num b => b

4. If the type of h is (Num a, Num b) => a -> b -> b,
   then the type of h 1 (5.5 :: Double) is

a) Integer
b) Fractional b => b
c) Double
d) Num b => b

> c, Double

5. If the type of jackal is (Ord a, Eq b) => a -> b -> a,
   then the type of jackal "keyboard" "has the word jackal in it"

a) [Char]
b) Eq b => b
c) b -> [Char] d) b
e) Eq b => b -> [Char]

> a, [Char] -- String

6. If the type of jackal is(Ord a, Eq b) => a -> b -> a,
   then the type of jackal "keyboard"

a) b
b) Eq b => b
c) [Char]
d) b -> [Char]
e) Eq b => b -> [Char]

> e, Eq b -> [Char]

7. If the type of kessel is (Ord a, Num b) => a -> b -> a,
   then the type of kessel 1 2 is

a) Integer
b) Int
c) a
d) (Num a, Ord a) => a
e) Ord a => a
f) Num a => a

> (Num a, Ord a) => a

8. If the type of kessel is (Ord a, Num b) => a -> b -> a,
   then the type of kessel 1 (2 :: Integer) is

a) (Num a, Ord a) => a
b) Int
c) a
d) Num a => a
e) Ord a => a
f) Integer

> (Num a, Ord a) => a

9. If the type of kessel is (Ord a, Num b) => a -> b -> a,
   then the type of kessel (1 :: Integer) 2 is

a) Num a => a b) Ord a => a
c) Integer
d) (Num a, Ord a) => a
e) a

> c, Integer

## Third Intermission

All you can really do with a parametrically polymorphic value is pass
or not pass it to some other expression. Prove that to yourself with
these small demonstrations.

1. Given the type a -> a,
   which is the type for id -attempt to make it do something other
   than returning the same value. This is impossible, but you should
   try it anyway.

> p cool

2. We can get a more comfortable appreciation of para-metricity by looking at
   a -> a -> a. This hypotheti-cal function a -> a -> a has two–and only
   two–imple-mentations. Write both possible versions of a -> a -> a,
   then try to violate the constraints we’ve described.

> f :: a -> a -> a
> f _ = id

3. Implement a -> b -> b. How many implementations can it have? Does the behavior change when the types of a and b change?
