
/// 以字典形式返回页边距
///
/// -> dictionary
#let get-page-margin() = {

  let _to-absolute-margin(margin) = {
    if margin == auto {
      margin = calc.min(page.width, page.height) * 2.5 / 21
    } else if type(margin) == relative {
      margin = margin.length.to-absolute()
    }
    return margin
  }

  let margin = _to-absolute-margin(page.margin)

  if type(margin) == length {
    margin = (
      top: margin,
      right: margin,
      left: margin,
      bottom: margin
    )
  } else if type(margin) == dictionary {
    for m in ("top", "right", "left", "bottom") {
      margin.at(m) = _to-absolute-margin(margin.at(m))
    }
  }

  return margin
}