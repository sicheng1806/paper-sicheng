#import "../utils.typ": get-page-margin

/// 添加一个侧边栏
/// 
/// == 示例
/// 
/// ```example
// #show: set-sidebar.with(
//   fill: gray,
//   outset: (top:4em, left:auto, bottom: 0em),
//   lorem(100)
// )
// #lorem(100)
/// ```
/// 
/// - dir () : 侧边栏方向, left|right
/// - gutter (): 侧边栏和主体距离
/// - width (): 侧边栏宽度
/// - height (): 侧边栏高度
/// - fill (): 侧边栏填充色
/// - outset (): 侧边栏边界扩展，与block类似。设置为字典类型，且top,left,bottom,right为auto时侧边栏将相对页面扩展。
/// - background (content): 设置侧边栏背景
/// - body (): 侧边栏内容
/// - doc (): 
/// -> 
#let set-sidebar(
  dir:left,
  gutter:0pt,
  width: 12em,
  height: 100%,
  fill: none,
  outset: (left:auto,right:auto,top:auto,bottom:auto),
  background: none,
  body,
  doc
  ) = context {
  assert(dir in (left, right), message: "dir must be left or right")

  let grid-columns = if dir == left {
    (width, 1fr)
  } else {
    (1fr, width)
  }

  let outset = outset
  if type(outset) == dictionary{
    let page-margin = get-page-margin()
    for d in ("left","right","top","bottom") {
  
    if outset.at(d,default: none) == auto {
      if dir == left and d == "right" {
        outset.at(d) = 0pt
      } else if dir == right and d == "left" {
        outset.at(d) = 0pt
      } else {
        outset.at(d) = page-margin.at(d)
      }
    }
    }
  }

  let body = if background != none {
    {
      place(top+dir, block(
        width: width,
        height: height, 
        outset: outset,
        fill: fill,
        background,
      ))
      place(top+dir,block(
        width: width,
        height: height,
        outset: outset,
        body
      ))
    }
  } else {
    block(
        width: width,
        height: height,
        outset: outset,
        fill: fill,
        body
    )
  }

  grid(
    columns: grid-columns,
    gutter: gutter,
    body,
    doc
  )
}

// #set page(fill: luma(200),background: place(dx:8.8cm,dy:1cm,text(20pt)[Page]))

// #show: set-sidebar.with(
//   fill: gray,
//   background: place(center+horizon, rotate(24deg,text(18pt, fill: rgb("FFCBC4"),[*BACKGROUND*]))),
//   [
//   #set align(center+horizon)
//   #text(20pt,blue)[SideBar]
//   ],
//   )

// #block(width: 100%, height: 100%, fill: luma(80))[#align(center+horizon)[#text(20pt,green)[Body]]]

