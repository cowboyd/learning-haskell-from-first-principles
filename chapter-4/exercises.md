## First Intermission Exercises

``` haskell
data Mood = Blah | Woot deriving Show
```

1. What is the type constructor, or name of this type?

 `Mood` is the type constructor

2. If the function requires a Mood value, what are the values you could possibly use there?

 You could use `Blah` or `Woot` because those are the data constur

3. We are trying to write a function changeMood to change Chris’s mood
   instantaneously. So far, we’ve written a type signature
   `changeMood :: Mood -> Woot`. What’s wrong with that?

This type signature is not valid because it should map type constructors to type
constructors. `Woot` is a data constructor in the type constructor `Mood`

4. Now we want to write the function that changes his mood. Given an
   input mood, it gives us the other one. Fix any mistakes and
   complete the function:

``` haskell
  changeMood Blah = Woot
  changeMood Woot = Blah
```

5. Enter all of the above — datatype (including the “de- riving Show”
   bit), your corrected type signature, and the corrected function
   into a source file. Load it and run it in GHCi to make sure you got
   it right.

see `mood.hs` in this directory.

```haskell
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah
```

## Second Intermission Exercises

1. not True && true

`true` is not a valid data constructor. It should be `True`

2. not (x = 6)

`=` is a syntactic declaration and not a function, so this is a parse error.
Might be more accurately written as `not (x == 6)` assuming that x is defined
somewhere else.

3. (1 * 2) > 5

There's nothing wrong with this.

4. [Merry] > [Happy]

`Merry` and `Happy` are not in scope.

5. [1, 2, 3] ++ "look at me!"

`[1,2,3]` is of type `Num t => [t]` whereas `"look at me!" is of type [Char]`
and so there is a type mismatch.

## Chapter Exercises

``` haskell
awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]
```

1. Given the definition of length above, what would the type signature
   be? How many arguments, of what type does it take? What is the type
   of the result it evaluates to?

   length :: [a] -> Int

2. What are the results of the following expressions?
   a) length [1, 2, 3, 4, 5]

    five

   b) length [(1, 2), (2, 3), (3, 4)]

   three

   c) length allAwesome

   2

   d) length (concat allAwesome)

   5

3. Given what we know about numeric types and the type signature of
length, look at these two expressions. One works and one returns an
error. Determine which will return an error and why.  (n.b., If you’re
checking the type signature of length in GHC7.10, you will find `Foldable t
=> t a` representing [a], as with concat in the previous chapter. Again,
consider `Foldable t` to represent a list here, even though list is
only one of the possible types. We will explain it in detail later.)

    Prelude> 6 / 3
    -- and
    Prelude> 6 / length [1, 2, 3]

The second version will not work, because if we apply the first argument to
divide `/` then we get a function:

```haskell
*Mood> :t (/) 6
(/) 6 :: Fractional a => a -> a
```

`length` returns an `Int` and so it is a type mismatch error.

4. How can you fix the broken code from the preceding exercise using a
   different division function/operator?

   I have no ida

5. What is the type of the expression 2 + 3 == 5? What would we expect
   as a result?

   Boolean is the type, True is the result.

6. What is the type and expected result value of the following:

    Prelude> let x = 5
    Prelude> x + 3 == 5

The expected result is False, type Bool

7. Below are some bits of code. Which will work? Why or why not? If
   they will work, what value would these reduce to?

    Prelude> length allAwesome == 2
      answer: true
    Prelude> length [1, 'a', 3, 'b']
      This will fail to compile since the types in a list must be heterogeneous

    Prelude> length allAwesome + length awesome

        answer: 4

    Prelude> (8 == 8) && ('b' < 'a')

        answer: False

    Prelude> (8 == 8) && 9

    This will fail to compile because (&&) takes two boolean values and returns a
    boolean value.

8. Write a function that tells you whether or not a given String (or
   list) is a palindrome. Here you’ll want to use a function called
   ’reverse,’ a predefined function that does just what it sounds
   like.

    reverse :: [a] -> [a]
    reverse "blah"
    "halb"

    ```haskell
    isPalindrome :: (Eq a) => [a] -> Bool
    isPalindrome x = x == reverse x
    ```

9. Write a function to return the absolute value of a number using if-then-else

``` haskell
 myAbs :: Integer -> Integer
 myAbs x = if x < 0 then x * -1 else x
```


10. Fill in the definition of the following function, using fst and snd:

``` haskell
f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))
```
