#import "@preview/numbly:0.1.0": numbly
#import "@preview/i-figured:0.2.4"

/// 配置附录页面样式
/// 
/// == 示例
/// 
/// ```example
/// #show: appendix-conf.with()
/// ```
/// 
/// == 参数
///
/// - it (): 
/// - table-numbering (): 
/// - image-numbering (): 
/// - equation-numbering (): 
/// -> 
#let appendix-conf(
  it,
  table-numbering: "A.1",
  image-numbering: "A-1",
  equation-numbering: "(A.1)",
) = {
  counter(heading).update(0)
  counter(heading.where(level: 1)).update(0)
  set heading(numbering: numbly(
    "附录 {1:A}",
    "{1:A}.{2}",
    default: "A.1"
  ))

  show figure: i-figured.show-figure.with(numbering: image-numbering)
  show figure.where(kind: table): i-figured.show-figure.with(numbering: table-numbering)
  show math.equation.where(block: true): i-figured.show-equation.with(numbering: equation-numbering)
  it
}

#show: appendix-conf.with()