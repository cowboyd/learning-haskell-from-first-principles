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
