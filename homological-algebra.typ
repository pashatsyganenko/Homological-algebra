#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.0"

#set text(lang: "ru")
#show: thmrules.with(qed-symbol: $square$)
#show math.integral: math.limits
#show math.sum: math.limits
#show math.integral: math.display
#show math.equation: math.display
#show link: underline.with(stroke: red)
#set figure.caption(separator: [:#h(1mm)])
#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
//#show outline: set text(size: 9.6pt, fill: black)

#set page(width: 210mm, height: 297mm, margin: 1.5cm, numbering: none, number-align: right, header: [#counter(footnote).update(0)])
#set heading(numbering: "1.")

#let theorem = thmbox("теорема", "Теорема", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let lemma = thmbox("лемма", "Лемма", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let proposition = thmbox("предложение", "Предложение", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let corollary = thmplain("следствие", "Следствие", stroke: 0.6pt, inset: 1em, radius: 0em).with(numbering: none)
#let definition = thmbox("определение", "Определение", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let example = thmplain("пример", "Пример", stroke: 0.5pt, inset: 1em, radius: 0em).with(numbering: none)
#let proof = thmproof("доказательство", "Доказательство")

#let iff = $arrow.l.r.double.long$ // тогда и только тогда когда
#let ipath = "/Images/" //путь где картинки
#let author = rgb("#DC143C"); //цвет комментарий Павла Юрича
#let scal(fst,scn) = $angle.l fst, scn angle.r$ // скалярное произведение
#let svo = text(12pt)[#underline[_Свойства_]#h(0.5mm):\ ] //СВОйства
#let note = text(12pt)[#underline[_Замечание_]#h(0.5mm):]
#let fact = text(12pt)[#underline[_Факт_]#h(0.5mm):]
#let diam = "diam" // диаметр
#let char(x) = [$"char" thin #x$] // характеристика поля
#let Rad(x) = [$"Rad" thin #x$] // радикал модуля
#let ann(x) = [$"ann" thin #x$] // аннулятор
#let Ker(x) = [$"Ker" thin #x$] // ядро
#let ru_alph(pattern: "а)") = { // Это всё для РУZZКОЙ нумерации
  let alphabet = "абвгдежзиклмнопрстуфхцчшщэюя".split("")
  let f(i) = {
    let letter = alphabet.at(i)
    let str = ""
    for char in pattern {
      if char == "а" {
        str += letter
      }
      else if char == "А" {
        str += upper(letter)
      }
      else {
        str += char
      }
    }
    str
  }
  f
}

//Конспект написан на основе лекций Сергея Витальевича Кислякова, прочитанных в осеннем семетре 2024-2025 учебного года. Конспект написан #link("https://t.me/ariviento")[Павлом Цыганенко].


#align(center, text(20pt, font: "Linux Biolinum O")[*ГОМОЛОГИЧЕСКАЯ АЛГЕБРА*])
#align(center, text(13pt, font: "FreeMono")[_Андрей Вячеславович Семёнов_])
#align(center, text(10pt, font: "Linux Biolinum O")[*_КОНСПЕКТ ЗА АВТОРСТВОМ ПАВЛА ЦЫГАНЕНКО_*])
#outline(title: "Содержание", indent: 1em,)
//#set page(numbering: "1")
//#counter(page).update(1)



// Лекция 1 (12.02.2025)
= Кольца и модули
== Групповые алгебры
#definition[
  Групповая алгебра группы $G$ над полем $k$: $ k G = angle.l {e_g | g in G} angle.r_k $
]
То есть её элементы -- формальные комбинации вида $sum_(g in G) alpha_g g$, где ненулевых $alpha$ конечное число. Сложение и умножение задаются следующим образом:
$ sum_(g in G) alpha_g g + sum_(g in G) beta_g g = sum_(g in G) (alpha_g + beta_g) g, $
$ (sum_(g in G) alpha_g g) dot (sum_(g in G) beta_g g) = sum_(g in G) (sum_(x y = g) alpha_x beta_y) g. $
#text(fill: author)[Пока я не разберусь как нормально писать $thin_R M$, буду писать $M_R$ вне зависимости от того, правый модуль или левый.]
#definition[
  Модуль $M_R$ называется простым, если он не содержит нетривиальных собственных подмодулей.
]
#definition[
  Модуль $M_R$ называется полупростым, если любой его подмодуль выделяется прямым слагаемым.
]
То есть $forall N lt.eq.slant M : thick exists P lt.eq.slant M : thick M = M plus.circle N$.

#note
+ $M$ полупрост #iff $M = plus.circle.big_(i in I) M_i$, где все $M_i$ простые.
+ Кольцо называется полупростым, если оно полупросто как левый модуль над собой. Без доказательства скажем, что это эквивалентно тому, что любой левый $R$-модуль полупрост.

Следующую теорему вам должны были доказать в школьном курсе по некоммутативным кольцам.
#theorem("Веддерберна — Артина")[
  Если $R$ артиново, то $ R med #text[-- полупростое] #iff R = product_(j in I) M_(n_j) (D_j), quad D_j med #text[-- тела]. $
]
То есть полупростое артиново кольцо разлагается в прямое произведение матричных колец над телами, и в предположении артиновости обратное тоже верно.

#theorem("Машке")[
  Пусть $k$ -- поле, $abs(G) < infinity$, $char(k) = 0$ или $char(k) divides.not abs(G)$. Тогда $k G$ -- полупростая алгебра.
]
#proof[
  Покажем, что произвольный модуль $M$ над $k G$ полупрост. Рассмотрим $N lt.eq.slant M$ и стандартные отображения $ N arrow.r.tail M arrow.twohead^(tilde(pi)) N. $
  Определим усреднение $tilde(pi)$: $ pi(x) = 1/abs(G) sum_(g in G) g tilde(pi) (g^(-1) x). $
  - $pi$ -- $k G$-линейный гомоморфизм. Действительно, для $h in G$ проверим, что $pi(h x) h pi(x)$, а остальное и так понятно.
  Обозначим $t = h^(-1) g$, тогда $ pi(h x) = 1/abs(G) sum_(g in G) g tilde(pi) (g^(-1) h x) = 1/abs(G) sum_(t in G) h t tilde(pi) (t^(-1) x) = h pi(x). $
  - $N$ неподвижен под действием $pi$. Действительно, если $x in N$, то $g^(-1) x in N$ и $tilde(pi)(g^(-1) x) = g^(-1) x$, так что теперь всё ясно.
  Тем самым, $M = N plus.circle Ker(pi)$.
]

== Радикал алгебры
Далее под $A$ подразумевается конечномерная алгебра над полем $k$.
#definition[
  _Радикалом_ $J(A)$ называется сумма всех двухсторонних нильпотентных идеалов.
]
#theorem[
  + $J(A)$ -- нильпотентный идеал в $A$.
  + Любой нильпотентный идеал лежит в $J(A)$.
  + $J(A slash J(A)) = 0$
]
#proof[
  + Во-первых, сумма двух нильпотентных двухсторонних идеалов тоже нильпотентный двухсторонний идеал. Действительно, если $I_1^(n_1) = 0$ и $I_2^(n_2)=0$, то $(I_1 + I_2)^(n_1+n_2)$ порождается всеми произведениями длины $n_1+n_2$ элементов из $I_1+I_2$, но раскрывая скобки получится либо не менее $n_1$ множителей из $I_1$, либо не менее $n_2$ из $I_1$, а значит $(I_1 + I_2)^(n_1+n_2) = 0$. Понятно, что вместо $n_1+n_2$ можно было взять $max(n_1,n_2)$.\
    Во-вторых, можно считать, что в сумме из определения $J(A)$ конечное число идеалов, потому что алгебра конечномерна.
  + Если идеал двухсторонний, то всё ясно. Допустим $I$ -- левый идеал и $I^k = 0$. Тогда $I A$ -- двухсторонний. Покажем, что $I A subset.eq J(A)$ и так как алгебра с единицей, из этого будет следовать искомое.\
  $ (I A)^k = I underbrace((A I) dots (A I), k-1) A subset.eq I^k A = 0. $
  + Рассмотрим двухсторонний нильпотентный идеал $overline(I)$ в $A slash J(A)$. Пусть $overline(I)^k = 0$. Тогда $I^k subset.eq J(A)$. По первому пункту теоремы $J(A)$ нильпотентен, скажем, $J^n (A) = 0$.
  $ I^(k n) subset.eq J^n (A) = 0 quad arrow.double.long quad I^(k n) = 0. $
  По второму пункту $I$ лежит в $J(A)$, а значит $overline(I) = 0$.
]

#fact $A$ полупроста #iff $J(A) = 0$.

== Радикал модуля
Сейчас мы будем работать с модулями над конечномерной алгеброй над полем.
#definition[
  _Радикалом_ модуля $M$ называется пересечение всех его максимальых подмодулей и обозначается как $Rad(M)$.
]
#lemma[
  $M$ полупрост $arrow.double.long$ $Rad(M) = 0$.
]
#proof[
  Допустим существует $x in Rad(M) without {0}$. Как и всякий подмодуль, $A x$ можно выделить в прямую сумму: $M = A plus.circle U$. Если рассмотреть стандартный эпиморфизм $A -> A x : med 1 arrow.bar x$, то станет очевидно, что $A x tilde.equiv A slash #h(-0.1mm) ann(x)$. Вложение $ann(x)$ в максимальный идеал $I$, его содержащий, индуцирует эпиморфизм $A slash #h(-0.1mm) ann(x) arrow.twohead A slash I$, причём $S := A slash I$ -- простая алгебра. Имеем
  $ M arrow.twohead^pi M slash U tilde.equiv A x tilde.equiv A slash #h(-0.1mm)ann(x) arrow.twohead^f S, $
  так что будем считать, что $f pi : M -> S$. Положим $N := Ker(f pi)$, тогда так как $M slash N tilde.equiv S$, то $N$ -- максимальный подмодуль. $U subset.eq N$ по построению и $x in N$ по определению радикала. Тогда $M = A x + U subset.eq N$. Противоречие.
]
#note Мы не пользовались конечномерностью, так что на самом деле это верно для модулей над любым ассоциативным кольцом с единицей.

Перед тем как доказать следующую теорему, упомянем факт, который на лекции был дан как упражнение.
#proposition[
  $X lt.eq.slant Rad(M) arrow.double.long Rad(M / X) = Rad(M) / X$.
]
#proof[

]
#theorem[
  $Rad(M) = J(A) M$.
]
#proof[
  Допустим, что включение слева направо уже доказано. Рассмотрим $overline(A) := A slash J(A)$ 
  Бля щас бы...
]