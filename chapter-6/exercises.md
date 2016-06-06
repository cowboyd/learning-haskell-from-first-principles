# Chapter 6

## First Intermission

> Look at the types given for quotRem and divMod. What do you think those
> functions do? Test your hypotheses by playing with them in the REPL. We’ve
> given you a sample to start with below:
>
> Prelude> let ones x = snd (divMod x 10)

Based on the type `Integral a => a -> a -> (a, a)` My guess is that
`divMod` returns a tuple containing first the div and then the mod,
and `quotRem` returns a tuple containing the quotient and then the
remainder.

## Second Intermission

>Next, take a look at the following code examples and try to decide if
>they will work, what result they will return if they do, and why or
>why not (be sure, as always, to test them in your REPL once you have
>decided on your answer):

> 1. max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])

guess: will work => 5
actual: `5` as expected

> 2. compare (3 * 4) (3 * 5)

guess: will work => LT
atual: `LT` as expected

> 3. compare "Julie" True

guess: will not work (because) `True` is not a `[Char]`
actual: did not work.

> 4. (5 + 3) > (3 + 6)

guess: will work => False
actual: `False`


## Chapter Exercises

### Multiple Choice

> 1. The Eq class
>    a) includes all types in Haskell
>    b) is the same as the Ord class
>    c) makes equality tests possible
>    d) only includes numeric types

(c): The Eq class makes equality tests possible

> 2. The typeclass Ord
>    a) allows any two values to be compared
>    b) is a subclass of Eq
>    c) is a superclass of Eq
>    d) has no instance for Bool

(b): The typeclass Ord is a subclass of Eq. You can see this by typing
`:i Ord` at the REPL. You might be thinking that it is `(a)` but the
"weasel word" here is _any_. Ord does not allow any two values to be
compared, only values of the same type class.

> 4. Suppose the typeclass Ord has an operator >. What is the type of >?
>
>    a) Ord a => a -> a -> Bool
>    b) Ord a => Int -> Bool
>    c) Ord a => a -> Char
>    d) Ord a => Char -> [Char]

(a): They type of `>` is Ord a => a -> a -> Bool

None of the other functions even have take two arguments like an infix operator
would.

> 4. In x = divMod 16 12
>    a) the type of 𝑥 is Integer
>    b) the value of 𝑥 is undecidable
>    c) the type of 𝑥 is a tuple
>    d) 𝑥 is equal to 12 / 16

(d): the type of x is a tuple because that's what the divMod function
returns.

> 5. The typeclass Integral includes
>    a) Int and Integer numbers
>    b) integral, real, and fractional numbers
>    c) Schrodinger’s cat
>    d) only positive numbers

(a): Int and Integer numbers.

### Does it typecheck?

1. Does the following code typecheck? If not, why not?

``` haskell
data Person = Person Bool

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
```

No. this does not typecheck, because there is no instance of `Show`
for the datatype `Person`.

2. Does the following typecheck? If not, why not?

``` haskell
data Mood = Blah
          | Woot deriving Show

settleDown x = if x == Woot
          then Blah
          else x
```

No. I don't believe that this typechecks because in th first arm of
the if statement returns a `Mood`, and the second returns x, which, if
the first arm of the `if` is to beileved is `Mood -> Mood`. At least I
can't see how to make sense out of it, but let's typcheck it.....

Ok, I was totally wrong on this one.... or rather I was right, but for
the wrong reasons. I don't know what I was thinking. I somehow had it
in my head that `x` was actually a function and not the argument, so
the type of `settleDown` is just fine. as `Mood -> Mood`. However, the
kicker is that `Mood` does not have an instance of `Eq`, so that first
arm of the `if` that compares `x == Woot`, won't compile.


3. If you were able to get settleDown to typecheck:

a) What values are acceptable inputs to that function?

The only acceptable inputs to the function are `Woot` and `Blah`
because since we're comparing `Blah` from the first arm of the `if`
and returning x in the send, `x` and `Blah` must have the same type,
namely `Woot`

b) What will happen if you try to run settleDown 9? Why?

It won't compile because the type of `settleDown` would be `Mood ->
Mood`, and `Mood` is not a `Num`

c) What will happen if you try to run Blah > Woot? Why?

It will not compile because we're comparing `Blah` and `Woot` with
the `>` operator, and that requires `Mood` to have an instance of
`Ord`, which it does not.

4. Does the following typecheck? If not, why not?

``` haskell
type Subject = String
type Verb = String
type Object = String

data Sentence =
    Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
```

This will type checke because Subject is just a synonym for
String. This seems a little shady in this case because `Subject` is I
guess an alias also for `Verb` and vice-versa. I assume the same
applies to `Object` as well? let's check with the compiler....


Boom. the code loads.


### Given a datatype declaration, what can we do?

Given the following datatype definitions:

``` haskell
data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah deriving (Eq, Show)

```

Which of the following will typecheck? For the ones that don’t
typecheck, why don’t they?


1. phew = Papu "chases" True

This will not compile because there is no data constructor `Papu
String`. Instead, there is `Papu Rocks Yeah`, so you could do
something like:

``` haskell
phew = Papu (Rocks "chases") (Yeah True)
```

Compiler survey says.... nope! Does not compile:

```
*Chapter6> let phew = Papu "chases" True

<interactive>:6:17:
    Couldn't match expected type ‘Rocks’ with actual type ‘[Char]’
    In the first argument of ‘Papu’, namely ‘"chases"’
    In the expression: Papu "chases" True
    In an equation for ‘phew’: phew = Papu "chases" True

<interactive>:6:26:
    Couldn't match expected type ‘Yeah’ with actual type ‘Bool’
    In the second argument of ‘Papu’, namely ‘True’
    In the expression: Papu "chases" True
```


2. truth = Papu (Rocks "chomskydoz") (Yeah True)

This will compile because there is a constructor `Papu Rock Yeah`

3. equalityForall :: Papu -> Papu -> Bool
   equalityForall p p' = p == p'

This typechecks because `Papu` has an instance of `Eq` so `p` and `p'`
are both `Papu`'s so `p == p'` is completely legit. In fact, I wonder
if it could be defined as `(==)`

4. comparePapus :: Papu -> Papu -> Bool
   comparePapus p p' = p > p'

This does not typecheck because `Papu` has no instance of
`Ord`. Compiler says:

```
exercises.hs:36:23:
    No instance for (Ord Papu) arising from a use of ‘>’
    In the expression: p > p'
    In an equation for ‘comparePapus’: comparePapus p p' = p > p'

```

### Match the types

We’re going to give you two types and their implementations. Then
we’re going to ask you if you can substitute the second type for the
first. You can test this by typing the first declaration and its type
into a file and editing in the new one, loading to see if it
fails. Don’t just guess, test all your answers!

1. For the following definition.

a) i :: Num a => a
   i = 1

b) Try replacing the type signature with the following:
   i :: a

> this will not compile, because `1` will not fit into a completely typeless
> value.

```
<interactive>:15:17:
    No instance for (Num a) arising from the literal ‘1’
    Possible fix:
      add (Num a) to the context of the type signature for i :: a
    In the expression: 1
    In an equation for ‘i’: i = 1
```

After you’ve formulated your own answer, then tested that answer and
believe you understand why you were right or wrong, make sure to use
GHCi to check what type GHC infers for the definitions we provide
without a type assigned. For example, for this one, you’d type in:

```
Prelude> let i = 1
Prelude> :t i
 -- Result elided intentionally.
```

2. a) f :: Float
      f = 1.0

   b) f :: Num a => a

> This will not work because 1.0 implies that this is a Float or a
> Double which is more specific than a `Num`
> Yup, that's the deal:

```
interactive>:14:28:
    Could not deduce (Fractional a) arising from the literal ‘1.0’
    from the context (Num a)
      bound by the type signature for f :: Num a => a
      at <interactive>:14:10-21
    Possible fix:
      add (Fractional a) to the context of
        the type signature for f :: Num a => a
    In the expression: 1.0
    In an equation for ‘f’: f = 1.0
```

3. a) f :: Float
      f = 1.0

   b) f :: Fractional a => a

> This this will work because 1.0 is a fractional.

4. Hint for the following: type :info RealFrac in your REPL.

   a) f :: Float
      f = 1.0

   b) f :: RealFrac a => a

> This totally works because 1.0 is real, and fractional. I.e. if 3
> worked, 4 has got to work.

5. a) freud:: a -> a
      freud x = x

   b) freud :: Ord a => a -> a

> This will work just fine, because the id function will work with any
> type, although specifying it as ord is overkill.

6. a) freud' :: a -> a
      freud' x = x

   b) freud' :: Int -> Int

> Again, this is also just fine, because the definition of freud' does not
> use any type information.

7. a) myX = 1 :: Int

      sigmund :: Int -> Int
      sigmund x = myX

   b) sigmund :: a -> a

> This will not work because `sigmund :: a -> a` as a signature means that
> must return the same type as its argument, so if `a` has no
> constraints, then having an `Int` as a return value is not cool.

8. a) myX = 1 :: Int
      sigmund' :: Int -> Int
      sigmund' x = myX

   b) sigmund' :: Num a => a -> a

> Man, this is tough. Is it acceptable to return an `Int` if all we
> know is that it must be a `Num`? An `Int` *is* a `Num` after
> all. I'm gonna go ahead and say yeah, it's ok, because anything that
> *calls* `sigmund` will just need a Num, and can only treat it as a
> `Num` and nothing else. So an `Int` will be just fine in any of the
> contexts that it might be used.
>
> I was totally wrong.
>
><interactive>:27:47:
>    Couldn't match expected type ‘a’ with actual type ‘Int’
>      ‘a’ is a rigid type variable bound by
>          the type signature for sigmund' :: Num a => a -> a
>          at <interactive>:27:17
>    Relevant bindings include
>      x :: a (bound at <interactive>:27:43)
>      sigmund' :: a -> a (bound at <interactive>:27:34)
>    In the expression: myX
>    In an equation for ‘sigmund'’: sigmund' x = myX
>
> I don't really get that.

9. a) You’ll need to import sort from Data.List.

      jung :: Ord a => [a] -> a
      jung xs = head (sort xs)

   b) jung :: [Int] -> Int

> This will totally work because Int implements Ord

10. a) young :: [Char] -> Char
       young xs = head (sort xs)

    b) young :: Ord a => [a] -> a

> This will also totally work because the all that sort needs is a n
> instance of `Ord` and that's what we've got

11. a) mySort :: [Char] -> [Char]
       mySort = sort

       signifier :: [Char] -> Char
       signifier xs = head (mySort xs)

    b) signifier :: Ord a => [a] -> a

> No, this is not gonna work. because the only thing we know about the
> `xs` in signifier is that it's got a type constraint of `Ord` which
> is not a legal argument for `mySort` which requires [Char] as its
> argument.
>
>   Couldn't match type ‘a’ with ‘Char’
>      ‘a’ is a rigid type variable bound by
>          the type signature for signifier :: Ord a => [a] -> a
>          at exercises.hs:51:14
>    Expected type: [a]
>      Actual type: [Char]
>    Relevant bindings include
>      xs :: [a] (bound at exercises.hs:52:11)
>      signifier :: [a] -> a (bound at exercises.hs:52:1)
>    In the first argument of ‘head’, namely ‘(mySort xs)’
>    In the expression: head (mySort xs)
