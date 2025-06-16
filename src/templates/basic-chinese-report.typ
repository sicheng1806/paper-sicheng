#import "@preview/i-figured:0.2.4"
#import "@preview/cuti:0.3.0": show-cn-fakebold
#import "@preview/numbly:0.1.0": numbly
#import "@preview/hydra:0.6.1": hydra
#import "../style.typ" as sc_style
#import "../models.typ" as sc_model
#import "../utils.typ" as sc_utils
#import "../constant.typ": *


#import sc_model: cn-bibliography
#import sc_style: appendix-conf

/// 中文报告的一般模版
/// 
/// == 示例
/// 
/// ```example
// #import "../../src/lib.typ": basic-chinese-report
// #import basic-chinese-report: chinese-report-style
// #show : chinese-report-style.with(
//   title: [基础中文文档模版],
//   with-outline: false
// )
/// ```
/// 
/// == 参数
///
/// - title (): 标题页，将用于页眉
/// - unnumbered-front-pages (): 不编号的前言部分
/// - numbered-front-pages (): 编号的前言部分，目录属于并置于其之后
/// - with-outline (): 是否添加目录
/// - doc (): 
/// -> content
#let chinese-report-style(
  title: [],
  unnumbered-front-pages: none,
  numbered-front-pages:none,
  with-outline:true,
  doc) = {
  // 全局页面设置
  set page(paper: "a4", margin: (top: 2.7cm, bottom: 3cm, left: 3.2cm, right: 3.2cm))
  set text(font: font-zh.宋体, size: fontsize-zh.小四, weight: "regular", lang: "zh")
  set par(first-line-indent: (amount: 2em, all: true), leading: 1.2em, justify: true)
  // heading 设置
  set heading(numbering: numbly(
    "第{1}章",
    "{1}.{2}",
    "{1}.{2}.{3}",
    default: "1.1"
  ))
  show heading: sc_style.set-heading.with(
    heading-text: (
      (font:font-zh.黑体, size: fontsize-zh.小二, weight: "bold"),
      (font:font-zh.黑体, size: fontsize-zh.四号, weight: "bold"),
      (font:font-zh.黑体, size: fontsize-zh.小四, weight: "bold"),
    ),
    heading-space: 0.5em,
    heading-align: (center, left,),
    heading-block: (
      (above: 1.96em, below: 1.6em),
      (above: 1.96em, below: 1.2em)
      ),
  )
  show heading: sc_style.set-newpage-by-heading.with()
  show heading: i-figured.reset-counters.with()
  // 其他设置
  set enum(numbering: it => {
    v(0.125em)
    numbering("1.", it)
  })
  show figure: sc_style.set-hhu-thesis-figure.with()
  show figure: i-figured.show-figure.with(numbering: "1.1")
  set figure(gap:1em)
  set math.equation(number-align: bottom)
  set math.cases(gap: 1em)
  show math.equation: i-figured.show-equation.with()
  show: show-cn-fakebold

  // 不编号前页，包括封面等部分
  if unnumbered-front-pages != none {
    unnumbered-front-pages
  }

  // 编号的前页,例如目录等部分，但目录自带,并置于其最后部分
  show: sc_style.set-footer.with(
    footer-align: center,
    footer-text: (size:12pt),
    display-both: false
  )
  set page(numbering: "I")
  counter(page).update(1)

  if numbered-front-pages != none {
    numbered-front-pages
  }

  // 目录部分设置
  show outline.entry: sc_style.set-hhu-outline.with()
  set outline(indent: 0em)
  if with-outline { 
    show heading.where(level: 1): it => {
      if numbered-front-pages != none {pagebreak()}
      set align(center)
      set text(font:font-zh.黑体, size: fontsize-zh.小二)
      strong(it.body)
    }
    if numbered-front-pages != none {
      heading(numbering: none,level: 1,[目#h(1em)录])
      v(1em)
      outline(title:none, depth: 2)
    } else{
      outline(title:[目#h(1em)录], depth: 2)
    }
  }

  // 正文部分设置
  set page(
    header: {
      set align(center)
      set text(font: font-zh.宋体, size: fontsize-zh.小五, lang: "zh")
      set par(
        first-line-indent: 0pt, 
        leading: 1.5em,
        justify: true,
        spacing: 0.5em
      )

      context {
        if calc.odd(counter(page).get().at(0)) { // 奇数页
          hydra(1,use-last: true, skip-starting: false)
        } else { // 偶数页
          title
        }
        line(length: 100%, stroke: (thickness: 0.5pt))
      }
    },
    header-ascent: 1cm,
    footer-descent: 50%,
  )
  counter(page).update(1)
  set page(numbering:"1")
  doc
}