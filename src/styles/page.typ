#import "../constant.typ": font-zh, fontsize-zh

#let set-footer(
  footer-align: center, 
  footer-text: (size: 8pt),
  display-both: false,
  doc
) = {
  let footer-numbering = context query(page)
  set page(
    footer: context {
      set align(footer-align)
      set text(..footer-text)
      counter(page).display(auto, both:display-both)
    }
  )

  doc
}
