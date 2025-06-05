#import "../constant.typ": font-zh, fontsize-zh
#import "@preview/numbly:0.1.0": numbly

#let set-newpage-by-heading(it) = {
  if it.has("level") and it.level == 1 {
    pagebreak(weak: true)
    it
  } else {
    it
  }
}



/// 标题主要的设置选项的包装函数
///
/// 示例:
/// 
/// ```typ
/// #show heading: set-heading.with(
///   heading-text: (
///     (font:font-zh.黑体, size: fontsize-zh.小二, weight: "bold"), 
///     (font:font-zh.黑体, size: fontsize-zh.四号, weight: "bold"),
///     (font:font-zh.黑体, size: fontsize-zh.小四, weight: "bold"),
///   ),
///   heading-space: 0.5em,
///   heading-align: (center, left,),
///   heading-block: (
///     (above: 0.96em, below: 0.6em),
///     (:)
///    ),
///   heading-number-display: chinese-heading-number-display,
///  )
/// ```
/// 
/// - heading-align (aligment): 各级标题的对齐
/// - heading-text (dictionary): 
/// - heading-block (dictionary): 
/// - heading-space (length): 
/// - heading-number-display (auto,content,function): 标题的编号展示方式
/// - it (content): 文章的标题元素
/// -> content
#let set-heading(
  heading-align: (),
  heading-text: (),
  heading-block: (),
  heading-space: (),
  it
) = {
  let must-be-array(a) = {
    if type(a) != array {
      (a,)
    } else {
      a
    }
  }
  heading-align = must-be-array(heading-align)
  heading-text = must-be-array(heading-text)
  heading-block = must-be-array(heading-block)
  heading-space = must-be-array(heading-space)

  set align(heading-align.at(it.depth - 1, default: heading-align.last())) if heading-align != ()
  set text(..(heading-text.at(it.depth - 1, default: heading-text.last()))) if heading-text != ()
  set block(..(heading-block.at(it.depth - 1, default: heading-block.last()))) if heading-block != ()
  
  heading-space = if heading-space != () {
    h(heading-space.at(it.depth - 1, default: heading-space.last()))
  } else {
    h(0em)
  }

  context block({
    if it.numbering != none {
      counter(heading).display()
      heading-space
    }
    it.body
  })
}

