#import "@preview/ctheorems:1.1.3": *
#import "@preview/cetz:0.3.0"
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#import fletcher.shapes: pill, rect

#let theorem = thmbox("теорема", "Теорема", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let lemma = thmbox("лемма", "Лемма", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let proposition = thmbox("предложение", "Предложение", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let corollary = thmplain("следствие", "Следствие", stroke: 0.6pt, inset: 1em, radius: 0em).with(numbering: none)
//#let note = thmplain("замечание", "Замечание", stroke: 0.2pt, inset: 1em, radius: 0em).with(numbering: none)
#let definition = thmbox("определение", "Определение", stroke: 0.7pt, radius: 0em).with(base_level: 0)
#let example = thmplain("пример", "Пример", stroke: 0.5pt, inset: 1em, radius: 0em).with(numbering: none)
#let proof = thmproof("доказательство", "Доказательство")

#let iff = $arrow.l.r.double.long$ // тогда и только тогда когда
//#let ipath = "/Images/" //путь где картинки -- пока их нет
#let author = rgb("#DC143C"); //цвет комментов
#let comment(x) = text(fill:author)[#x]
//#let scal(fst,scn) = $angle.l fst, scn angle.r$ // скалярное произведение -- понадобится - откроем
#let properties = text(12pt)[#underline[_Свойства_]#h(0.5mm):\ ] //СВОйства
// Я не спешу переделывать свойства в блок, потому что к лишним красным строкам отношусь настороженно
#let fact = text(12pt)[#underline[_Факт_]#h(0.5mm):]
#let diam = "diam" // диаметр
#let char(x) = [$"char" thin #x$] // характеристика поля
#let Rad(x) = [$"Rad" thin #x$] // радикал модуля
#let Ann(x) = [$"Ann" thin #x$] // аннулятор
#let Ker(x) = [$"Ker" thin #x$] // ядро
#let coker(x) = [$op("coker")(#x)$] // коядро
#let pullback = [$angle.right.rev$] // символ pullback'a
#let pushout = scale(y: -100%)[$angle.right$] // символ pullback'a
#let Im(x) = [$"Im" thin #x$] // образ
#let Soc(x) = [$"Soc" thin #x$] // цоколь
#let Com(x) = [$"Com"(#x$)] // категория комплексов
#let Hom(r, a, b) = [$op("Hom")_#r (#a, #b)$]
#let RMod(R) = [$#R"-Mod"$] // Категория левых модулей
#let ModR(R) = [$"Mod-"#R$] // Категория правых модулей
#let Rmod(R) = [$#R"-mod"$] // Категория левых к.п. модулей
#let modR(R) = [$"mod-"#R$] // Категория правых к.п. модулей
#let Id = "Id" // тождественный функтор
#let scr(it) = text(features: ("ss01",),box($cal(it)$)) // mathscr-шрифт
#let bl(x, ind) = [$attach(#x, bl: #ind)$] // Правый нижний индекс
#let ru_alph(pattern: "а)") = { // это для русской нумерации
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

// note without a border
#let note(body) = {
  figure(kind: "note", supplement: "Замечание", numbering: none)[
    #block(
        width: 100%,
        radius: 0.3em,
        breakable: false,
        [
          #set align(left)
          #text(12pt)[#underline[_Замечание_]#h(0.5mm):]
          #body
        ]
    )
  ]
}

#let scam-alert(body) = {
  //set text(font: "Arial", size: 12pt)
  set block(
    width: 100%,
    inset: 0.5em,
    fill: rgb(255, 230, 230),
    stroke: (left: 2pt + red, right: 2pt + red, top: 2pt + red, bottom: 2pt + red)
  )

  block[
    #set text(size: 14pt, weight: "bold")
    #set align(center)
    ⚠️#text(fill: red)[SCAM ALERT]⚠️

    #set text(size: 12pt, weight: "regular")
    #set align(left)
    #body
  ]
}

#let numbered-link(dest, body) = context {
  let thms = query(selector(<meta:thmenvcounter>).after(dest))
  let number = thmcounters.at(thms.first().location()).at("latest")
  link(dest)[#body #number.first()]
}