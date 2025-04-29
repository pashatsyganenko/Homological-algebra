#import "definitions.typ": *

== Старшие $Ext$ 
Благодаря конструкции расширений мы установили, что $Ext^1(C, A) = tilde(Ext)^1 (C,A)$, так как они оба естественно изоморфны $epsilon(C, A)$. Однако, что делать со старшими $Ext^n$?

#definition[
  $epsilon^n (C, A) = { 0 -> A -> X_(n-1) -> dots -> X_0 -> C -> 0 "- точная"} slash tilde$, где отображение эквивалентности 
  $tilde$ определяется следующим образом: 

  
  #columns(3, [
    #v(2em)
    Скажем, что $E_1 > E_2$ #h(2em) #iff 
    #colbreak()
    #diagram(spacing: 2.5em, $
      E_1:  & A edge("hook->") edge("=", "d") & X_(n-1) edge("->") edge("->", "d") 
            & dots edge("->") & X_0 edge("->>") edge("->", "d") & C edge("=", "d") \
      E_1:  & A edge("hook->") & X_(n-1) edge("->") & dots edge("->") & X_0 edge("->>") & C \
    $)
  ])

  Тогда $E_1 tilde E_2 iff^"def" E_1 > E_2$ и $E_1 < E_2$.
]

#note[$tilde$ является отношением эквивалентности в силу определения.]

Повторяя сложение Бэра, заведем сложение на $epsilon^n (C, A)$. Для этого необходимо определить $f^*(E), med g_*(E)$.

#definition[
  Пусть $f: C' -> C$. $E in epsilon^n (C, A)$. Определим $f^*(E)$:
  #align(center)[
    #diagram(spacing: 3em, $
      f^*(E): & A edge("hook->") edge("=", "d") & X_(n-1) edge("->") edge("=", "d") 
      & dots edge("->") & X_1 edge("->") edge("=", "d") & Y edge("->>") edge("->", "d") & C' edge("->", "d", f, label-side: #left) \
      E: & A edge("hook->")  & X_(n-1) edge("->")  
      & dots edge("->") & X_1 edge("->")  & X_0 edge("->>") & C
    $, {
      node((5, 0), "", name: <Y>); pb-node(<Y>)
      node((5, 1), "", name: <X0>)
      node((4.5, 0.5), $bullet$, name: <ker1>); node((4.5, 1.5), $bullet$, name: <ker2>)
      edge(<ker1>, <Y>, "hook->"); edge(<ker2>, <X0>, "hook->"); 
      edge((4, 0), <ker1>, "->>"); edge((4, 1), <ker2>, "->>");
      edge(<ker1>, <ker2>, "="); 
    })
  ]
  Построим пуллбэк относительно $f$. Так как пуллбэк сохраняет ядра, то оставшаяся последовательность, начиная с $X_1$ продолжается без изменений.
]
#note[Определение корректно переносится на классы эквивалентности $tilde$, так как операции для построения $f^*$ и $g_*$ естественны по $E$.]
Аналогично, с помощью пушаута, можно определить $g_*(E)$ и тем самым задать структуру абелевой группы на $epsilon^n (C, A)$. Итогом данного параграфа становится следующая теорема, которая устраняет всю неявность между $Ext$ и $tilde(Ext)$, при условии, что в категории достаточно проективных и инъективных объектов.

#theorem[$Ext^n_R (A, M) tilde.eq epsilon^n (A, M) tilde.eq tilde(Ext)^n_R (A, M)$]
#proof[Теорема идет без доказательства.]
#pagebreak()

= Когомологии Хохшильда
== Определения
Пусть $bl(A, KK)$ - к.м. алгебра.
#definition[
  $Lambda := A times.circle_KK A^"op"$ называется *обертывающей алгеброй*.

  С помощью обертывающей алгебры, любой $bl(M, A)_A$ - бимодуль можно рассматривать:
  - либо как левый $Lambda$-модуль, где: $quad (a times.circle b) m = a m b$
  - либо как правый $Lambda$-модуль, где: $med thin m(a times.circle b) = b m a$
]

#definition[
  $Hoch^n (A, M) := Ext_Lambda^n (A, M)$, где $bl(M, A)_A$ - бимодуль, называются *когомологиями Хохшильда*.
  
  *Гомологии Хохшильда* определяются аналогично: $Hoch_n (A, M) := Tor^Lambda_n (A, M)$
]

== Стандартная резольвента
#definition[
  Определим компоненты, как $P_n := underbrace(A times.circle_KK dots times.circle_KK A, n+2) = A^times.circle(n+2)$ - $Lambda$-модуль.

  Дифференциал зададим на образующих:
  $ d_n (a_0 times.circle dots times.circle a_(n+1)) = sum_(i = 0)^n (-1)^i a_0 times.circle dots times.circle a_j a_(j+1) times.circle dots times.circle a_(n+1) $
]
#theorem[
  $P_n$ является проективной резольвентой для $A$.
]
#proof[
  1. $P_n$ это комплекс, так как $d^2 = 0$.
  +  Проверим, что $P_n$ это точный комплекс. Для этого достаточно построить сечение $s_n: P_n -> P_(n+1)$, такое, что 
    $d_(n+1) s_n + s_(n-1)d_n = 1$. При этом $s$ дозволено быть лишь $KK$-гомоморфизмом.

    #let x = $a_0 times.circle dots times.circle a_(n+1)$
    Положим $s_n (#x) := 1 times.circle #x$. Тогда действительно: 
    $ (d s + s d)(#x) = #x - \ - thick 1 times.circle d(#x) +& s d(#x) = #x $
  + $P_n = A times.circle A^(times.circle n)times.circle A = Lambda times.circle_KK A^(times.circle n)$ - свободный $Lambda$-модуль с базисом $1 times.circle a_1 times.circle dots times.circle a_n$, где $a_i$ это базисные элементы $A$.
]

Обозначим за $tilde(P_n) = A^(times.circle n)$. Тогда по пункту 3 доказательства выше: $Hom(Lambda, P_n, M) = Hom(KK, tilde(P_n), M)$.

#corollary[
  #let cir(a, b) = $#a times.circle dots times.circle #b$;
  $Hoch^n (A, M) = H^n (Hom(KK, tilde(P_n), M), Delta^n)$, где дифференциалы определяются как:
  $ Delta^n (f)(cir(a_1, a_(n+1))) &= a_1 f(cir(a_2, a_(n+1))) + \ 
  &+ sum_(i = 1)^(n-1) (-1)^i f(a_1 times.circle dots times.circle a_i a_(i+1) times.circle dots times.circle a_(n+1)) + 
  (-1)^n f(cir(a_1, a_n))a_(n+1) $

  Аналогично, $Hoch_n = H_n (tilde(P_n) times.circle_KK M, Delta_n)$, где:
  $ Delta_n (cir(a_1, a_n) times.circle m) &= cir(a_2, a_n) times.circle (a_1 m) \
  &+ sum_(i = 1)^(n-1) (-1)^i a_1 times.circle dots a_i a_(i+1) dots times.circle a_n times.circle m 
  + (-1)^n cir(a_1, a_(n-1)) (a_n m) $
]

== Примеры
Пусть как обычно $bl(A, KK)$ -к.м. алгебра, $bl(M, A)_A$ - бимодуль.

Посмотрим на первые члены резольвенты: $M ->^Delta^0 Hom(KK, A, M) -> Hom(KK, A times.circle A, M) -> dots$
- $Delta^0(m)(a) = a m - m a$. 

  Отсюда $Hoch^0(A) = Ker(Delta^0) = {m in M: a m = m a}$

- $Delta^1(f)(a_1 times.circle a_2) = a_1f(a_2) - f(a_1a_2) + f(a_1)a_2$

  Отсюда $Ker(Delta^1) = {f: A -> M: f(a_1 a_2) = a_1f(a_2)+f(a_1)a_2} = op("Der")(A, M)$ - операторы дифференцирования.

  $Im(Delta^1) = {f_m: A -> M: f_m (a) = a m - m a} = op("IDer")(A, M)$ - внутренние операторы дифференцирования.

#corollary[
  $Hoch^0(A) = Z(A)$, $Hoch^1(A) = op("Der")(A) slash op("IDer")(A) = op("OuterDer")(A)$ - внешние операторы дифференцирования. 
]

#let dh = $op("dh")$ 
#let pd = $op("pd")$ 
#definition[
  $dh_A (A) = sup{n | exists M thick Hoch^n (A, M) != 0}$ - #comment[как она называется?] размерность.
  $pd_A (A) = inf{n | 0 -> P_n -> dots -> P_0 ->> M "- проективная резольвента"}$ - проективная размерность.
]
#theorem[
  Пусть $bl(A, KK)$ - к.м. алгебра. Тогда $dh_A (A) = pd_A (A)$.
]
#proof[
  Без доказательства.
]
== $Ext$-алгебра
#definition[
  $epsilon(M) := plus.circle.big_(j=0)^infinity Ext_A^j (M, M)$, где $bl(M, A)$ - $A$-модуль.
  
  Заведем операцию умножения на $epsilon(M)$, превратив ее в градуированную алгебру. Пусть $n, m in NN$.
  1. $n, m > 0$. Пусть  
  #columns(2)[
  $ f in Ext^n: M >-> X_(n-1) -> dots -> X_0 ->> M $ 
  #colbreak()
  $ g in Ext^m: M >-> Z_(m-1) -> dots -> Z_0 ->> M $
  ]
  Определим $f g$, "пристыковав" два расширения друг к другу:
  #align(center)[
    #diagram(spacing: 1em, $
      f g in Ext^(n+m): M edge("hook->") & X_(n-1) edge("->") & dots edge("->") & X_0 & & Z_(m-1) edge("->") & dots edge("->") & Z_0 edge("->>") &M         
    $,{
      node((4, 1), $M$, name: <M>)
      edge((3, 0), <M>, "->>")
      edge(<M>, (5, 0), "hook->")
      edge((3, 0), (5, 0), "-->")
    })
  ]
  2. $n = 0, m > 0$. Тогда применим $f^*$.
  + $n > 0, m = 0$. Тогда применим $g_*$.
  + $n = 0, m = 0$. Тогда $f g = f compose g$.

  Такое произведение называется *произведением Йонеды*.
]

#theorem[
  $(Ext(M), + "- сложение Бэра", dot "- произедение Йонеды")$ образует градуированную ассоциированную алгебру с единицей.
]
#definition[
  $Ext(A slash Rad(A)) = Ext(plus.circle.big_(n = 0)^k S_j) = plus.circle.big_(j = 0)^infinity plus.circle.big_(n, m = 0)^k Ext_A^j (S_n, S_m)$, где $S_j$ - простые алгебры,  называется *алгеброй Йонеды*.
]
