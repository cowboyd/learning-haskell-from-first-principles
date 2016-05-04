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
