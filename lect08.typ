#import "definitions.typ": *

#comment[ТУТ ЕЩЁ ПРО EXT, НО СНАЧАЛА ЛУЧШЕ ЛЕКЦИЮ 7 ЗАПИСАТЬ]

= Группы расширений
== Сложение Бэра

Рассмотрим короткую точную последовательность $A >->^alpha B ->>^beta C$, назовём её $E$, и стрелку $f: C' -> C$. Построим пулбэк $f$ и $beta$, пусть это $B_1$ со стрелками $beta_1 : B_1 -> C'$ и $h: B_1 -> B$. Тогда $beta_1$ тоже эпиморфизм. #footnote[#h(1mm) Если это не очевидно, то подробнее тут: #link("https://math.stackexchange.com/questions/1299488/the-pushout-of-an-epimorphism-is-an-epimorphism")] Заведём дополнительно нулевую стрелку из $A$ в $C$. Тогда взяв предел получим единственное $alpha_1 : A -> B_1$ такое, что $beta_1 alpha_1 = 0$ и $h alpha_1 = alpha$. Заметим, что подходит $alpha_1 = ker(beta_1)$ #comment[в каком плане?]

#align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (B1,CC,A,B,C) = ((1,0.3),(2,-0.3),(0,1),(1,1),(2,1))
    node(B1,$B_1$)
    node(CC,$C'$)
    node(A,$A$)
    node(B,$B$)
    node(C,$C$)
    edge(A,B,$alpha$,">->",label-side:right)
    edge(B,C,$beta$,"->>", label-side:right)
    edge(CC,C,$f$,"->",label-side:left)
    edge(B1,CC,$beta_1$,"->>",label-side:right)
    edge(B1,B,$h$,"->",label-side:left)
    edge(A,B1,$exists! alpha_1$,"-->",label-pos:90%)
    edge(A,CC,bend:50deg,$0$,"->")
  }))

#definition[
  Пусть $E: space A >-> B ->> C$ -- короткая точная последовательность, $f: C' -> C$.\ За $f^* (E)$ обозначается верхняя строка в диаграмме, которую мы только что построили:
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,F) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1))
    node(A,$A$)
    node(B,$B_1$)
    node(C,$C'$)
    node(D,$A$)
    node(E,$B$)
    node(F,$C$)
    edge(A,B,$alpha_1$,">->")
    edge(B,C,$beta_1$,"->>")
    edge(A,D,"=")
    edge(D,E,$alpha$,">->")
    edge(E,F,$beta$,"->>")
    edge(B,E,$h$,"->")
    edge(C,F,$f$,"->")
  }))
]

Аналогичным образом, имея короткую точную последовательность $A >->^alpha B ->>^beta C$ и стрелку $g: A -> A'$ можно построить пушаут $g$ и $alpha$, назовём его $A' ->^(alpha_1) B_1 <-^h B$. Тогда $alpha_1$ -- мономорфизм. Также заводим нулевую стрелку $A' -> C$ и получаем единственную $beta_1 : B_1 -> C$ такую что $beta_1 alpha_1 = 0$ и $beta_1 h = beta$. В качестве такой стрелки подходит $beta_1 = coker(alpha_1)$.
#align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,A1,B1) = ((0,0),(1,0),(2,0),(0,1.3),(1,0.7))
    node(A,$A$)
    node(B,$B$)
    node(C,$C$)
    node(A1,$A'$)
    node(B1,$B_1$)
    edge(A,A1,$g$,"->")
    edge(A,B,$alpha$,">->")
    edge(B,C,$beta$,"->")
    edge(A1,B1,$alpha_1$,">->")
    edge(B1,C,$exists! beta_1$,"-->",label-side:right,label-pos:20%)
    edge(B,B1,$h$,"->")
    edge(A1,C,$0$,"->",bend:-50deg)
  }))

#definition[
  Пусть $E: space A >-> B ->> C$ -- короткая точная последовательность, $f: A -> A'$.\ За $f_* (E)$ обозначается нижняя строка в диаграмме, которую мы только что построили:
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,F) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1))
    node(A,$A$)
    node(B,$B$)
    node(C,$C$)
    node(D,$A'$)
    node(E,$B_1$)
    node(F,$C$)
    edge(A,B,$alpha$,">->")
    edge(B,C,$beta$,"->>")
    edge(A,D,$g$,"->")
    edge(D,E,$alpha_1$,">->")
    edge(E,F,$beta_1$,"->>")
    edge(B,E,$h$,"->")
    edge(C,F,"=")
  }))
]

#definition[
  Короткие точные последовательности $E_1 : space A >->^(alpha_1) B_1 ->>^(beta_1) C$ и $E_2 : space A >->^(alpha_2) B_2 ->>^(beta_2) C$ называются конгруэнтными ($E_1 ~ E_2$), если существует $h: B_1 -> B_2$ такое, что $h alpha_1 = alpha_2$ и \ $beta_2 h = beta_1$, то есть в следуещей диаграмме оба квадрата коммутативны:
  #align(center, diagram(cell-size: 7mm, label-size: 3mm, {
    let (A,B,C,D,E,F) = ((0,0),(1,0),(2,0),(0,1),(1,1),(2,1))
    node(A,$A$)
    node(B,$B_1$)
    node(C,$C$)
    node(D,$A$)
    node(E,$B_2$)
    node(F,$C$)
    edge(A,B,$alpha_1$,">->")
    edge(B,C,$beta_1$,"->>")
    edge(A,D,"=")
    edge(D,E,$alpha_2$,">->")
    edge(E,F,$beta_2$,"->>")
    edge(B,E,$h$,"-->")
    edge(C,F,"=")
  }))
]

Заметим, что конгруэнтность -- отношение эквивалентности. Действительно, рефлексивность и транзитивность очевидны, а по #link(<2-squares-lemma>)[лемме о двух квадратах] $h$ изоморфизм, откуда следует симметричность. #comment[Нет, не по ней, а по чему?]

#definition[
  $epsilon(C,A) := {A >-> B ->> C -"КТП"} slash ~$.
]