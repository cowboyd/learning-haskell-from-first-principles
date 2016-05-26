# Notes for Chapter Six Reading

- what is the difference between `div` and `quot`. `mod` and `rem`
- Man, I really wish there were a way to visualize the number type tree. I feel
  like  I'm back in my college Math class.... and not in a good way. I think seeing
  the mathematical objects ahead of time would have been helpful.
- *Why* is there an instance of `Ord` for Bool?
  - http://stackoverflow.com/questions/23880626/understanding-haskells-bool-deriving-an-ord
- Can you add an instance to a particular structural class? E.g.
   instance Ord => (Foo, Foo) where
