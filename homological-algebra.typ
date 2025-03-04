#import "definitions.typ": *

#set text(lang: "ru")
#show: thmrules.with(qed-symbol: [#text(fill: black, font: "Noto Emoji")[😎]])
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
#set page(width: 210mm, height: 297mm, margin: 1.5cm, numbering: none, number-align: right, header: [#counter(footnote).update(0)])
#set heading(numbering: "1.")

#align(center, text(20pt, font: "Linux Biolinum O")[*ГОМОЛОГИЧЕСКАЯ АЛГЕБРА*])
#align(center, text(13pt, font: "FreeMono")[_Андрей Вячеславович Семёнов_])
#align(center, text(10pt, font: "Linux Biolinum O")[*_КОНСПЕКТ ЗА АВТОРСТВОМ ПАВЛА ЦЫГАНЕНКО И ЛЬВА МУКОСЕЕВА_*])
#outline(title: "Содержание", indent: 1em,)

// Лекция 1 (12.02.2025)
#include "lect01.typ"
// Лекция 2 (19.02.2025)
#include "lect02.typ"
// Лекция 3 (26.02.2025)
#include "lect03.typ"