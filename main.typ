#import "unimib-template.typ": unimib
#import "packages.typ": codly, codly-languages

#show: unimib.with(
  title: "Software architecture project",
  // area: [Scuola di Scienza],
  // department: [Dipartimento di Informatica, Sistemi e Comunicazione],
  // course: [Corso di Scienze Informatiche],
  authors: (
    "Andrea Falbo 887525",
    "Damiano Pellegrini 886261",
    "Marco Sanvito 886493",
    "Ruben Tenderini 879290"
  ),
  bibliography: bibliography(style: "ieee", "citations.bib", full: true),
  abstract: none,
  dark: false,
  lang: "en",
  // flipped: true
)


#show: codly.codly-init
#codly.codly(languages: codly-languages.codly-languages, breakable: true)

#set table(stroke: none, gutter: 0.2em, fill: (x, y) => {
  if y == 0 { luma(120) } else {
    if calc.odd(y) {
      luma(240)
    } else {
      luma(220)
    }
  }
})

#show table.cell: it => {
  if it.y == 0 {
    set text(white)
    strong(it)
  } else {
    it
  }
}

#set cite(form: "prose")

#set heading(numbering: none)

#set heading(numbering: "1.1.")

#include "chapters/1.problem.analysis.typ"
#include "chapters/2.problem.architecture.typ"

#set heading(numbering: none)
