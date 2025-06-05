#import "../constant.typ": font-zh, fontsize-zh

#let set-hhu-outline(
  outline-text:(
    (font: font-zh.宋体, size: fontsize-zh.四号, weight: "bold"),
    (font: font-zh.宋体, size: fontsize-zh.小四, weight: "regular"),
  ),
  outline-par:(
    (leading: 1.2em),
  ),
  it
) = {
  set text(..outline-text.at(it.level - 1, default: outline-text.last())) if outline-text != ()
  set par(..outline-par.at(it.level - 1, default: outline-par.last())) if outline-par != ()

  it
}
