#import "../lib.typ": (
  style as sc_style,
  utils as sc_utils,
  models as sc_models,
  constant
)
#import constant: font-zh, fontsize-zh

#let colors = (
  primary:rgb("#3a9df9"),
  neutral-lightest: rgb("#e5eff7c9"),
  neutral-darkest: rgb("#000000")
)
#let margin = 0.6cm

#let basic-cv(
  margin:auto,
  colors:(:),
  sidebar:none,
  doc
) = {
  show: doc => if sidebar == none {
    doc
    } else {
    sc_style.set-sidebar(
      sidebar,
      fill: colors.neutral-lightest,
      doc
    )
  }
  doc
}

#show: basic-cv.with(
  margin: margin,
  colors: colors,
  sidebar: [
#show heading: it => {
  set text(colors.primary)
  grid(
    columns: 3,
    it.body,
    h(1em),
    line(length: 100%, stroke: colors.primary)
  )
}
= Social Netword

#lorem(10)

= Languages

#lorem(10)

= Hard Skills

#lorem(20)

= Soft Skills

#lorem(20)
])

= Introduction

#lorem(100)

= work experience

#lorem(100)

= Education

#lorem(100)
