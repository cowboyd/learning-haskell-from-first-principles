# Combinators Determine if each of the following are combinators or not.
1. λx.xxx
   YES
2. λxy.zx
   NO
3. λxyz.xy(zx)
   YES
4. λxyz.xy(zxy)
   YES
5. λxy.xy(zxy)
   NO

# Normal form or diverge? Determine if each of the following can be
reduced to a normal form or if they diverge.

1. λx.xxx
   CONVERGE
2. (λz.zz)(λy.yy)
   (λy.yy)(λy.yy)
   DIVERGE
3. (λx.xxx)z
   zzz
   CONVERGE

# Beta reduce

Evaluate (that is, beta reduce) each of the following expres- sions to normal form. We strongly recommend writing out the steps on paper with a pencil or pen.
1. (λabc.cba)zz(λwv.w) => z
2. (λx.λy.xyy)(λa.a)b
3. (λy.y)(λx.xx)(λz.zq)
4. (λz.z)(λz.zz)(λz.zy) Hint: alpha equivalence.
5. (λx.λy.xyy)(λy.y)y
6. (λa.aa)(λb.ba)c
7. (λxyz.xz(yz))(λx.z)(λx.a)
