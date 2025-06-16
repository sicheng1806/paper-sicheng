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

#let thanks(title: "致谢", s) = {
  heading(bookmarked: true, outlined: true, numbering: none, level: 1, title)
  s
}


/// 河海大学本科毕业论文模版(理工科)
/// 
/// == 示例
/// 
/// ```example
/// #show: hhu-bachelor-thesis.with(
///   author: (CN: "李华", EN: "Li Hua", ID: "2162510220", YEAR: "2021级"),
///   advisors: (
///     CN: "张三",
///     EN: "Zhang San"
///   ),
///   thesis-name: (
///     CN: "本科毕业论文",
///     EN: [
///       BACHELOR'S DEGREE THESIS \
///       OF HOHAI UNIVERSITY
///     ],
///     heading: "河海大学本科毕业论文"
///   ),
///   title: (
///     CN: [植物对泥沙沉降规律的影响研究],
///     EN: [
///       Study on the influence of plants on \
///       sediment deposition
///     ],
///   ),
///   school: (
///     CN: "河海大学",
///     EN: "Hohai University",
///   ),
///   form: "thesis", /// 毕业论文："thesis"，毕业设计："design", 课程报告："report"
///   major: "自动化",
///   subject: "subject",
///   reader: "李四 副教授",
///   date: "二〇二四年五月",
///   cn-abstract: [
///     由于泥沙与水流的相互作用，使得河流发生演变，因此泥沙特性与水流特性均是河流动力学的重要研究课题。当水流中含有植物时，水流的紊动特性会发生明显的改变，从而引起泥沙的一些特性如沉速发生改变。本文以实验为基础，结合理论分析，研究了在静水条件下刚性植物对泥沙沉速的影响，同时在水槽中通过改变流量来研究在恒定均匀流条件下非淹没植物对泥沙沉降轨迹的影响，得到如下主要结论：
///   ],
///   cn-keywords: ("关键词1", "关键词2"),
///   en-abstract: [
///     Fluvial river processes evolve over time in response to the constant interaction between sediment and the water column. If vegetation is present within the water column, the change in turbulence characteristics will impact the movement of sediment, in particular the settling velocity. In this paper, the influence of vegetation on the settling velocities of sediment particles is studied experimentally. The non-submerged vegetation friction factor in steady uniform flow is considered by under different flume discharge quantities. The main outcomes can be summarized as follows:
///   ],
///   en-keywords: ("Keywords1", "Keywords2"),
/// )
/// ```
/// 
/// == 参数
/// 
/// - author (): 作者
/// - advisors (): 指导教师
/// - thesis-name (): 论文名称
/// - title (): 论文标题
/// - school (): 学校名称
/// - subject (): 英文科目名称
/// - form (): 类型
/// - major (): 专业
/// - reader (): 评阅人
/// - date (): 日期
/// - cn-abstract (): 中文摘要
/// - cn-keywords (): 中文关键词
/// - en-abstract (): 英文摘要
/// - en-keywords (): 英文关键词
/// 
/// == 参考资料
/// 
/// 格式参考(https://bylw.hhu.edu.cn/UpLoadFile/83cd5f1169974a0db06d865c7ee11af4.pdf)
/// 
/// 重构于(https://github.com/shaneworld/HHU-Thesis-Template)
#let hhu-bachelor-thesis(
  author: (CN: "李华", EN: "Li Hua", ID: "2162510220", YEAR: "2021级"),
  advisors: (
    CN: "张三",
    EN: "Zhang San"
  ),
  thesis-name: (
    CN: "本科毕业论文",
    EN: [
      BACHELOR'S DEGREE THESIS \
      OF HOHAI UNIVERSITY
    ],
    heading: "河海大学本科毕业论文"
  ),
  title: (
    CN: [植物对泥沙沉降规律的影响研究],
    EN: [Study on the influence of plants on sediment deposition],
  ),
  school: (
    CN: "河海大学",
    EN: "Hohai University",
  ),
  subject: "subject",
  form: "thesis",
  major: "自动化",
  reader: "李四 副教授",
  date: "二〇二四年五月",
  cn-abstract: [
],
  cn-keywords: (),
  en-abstract: [
],
  en-keywords: (),
  doc
) = {
  // 自定义函数
  let hhu-statement-page(
    form: "thesis",
  ) = page(
    header: none,
    footer: none,
    numbering: none,
    margin: 3.2cm,
    {

      set text(font: font-zh.宋体, size: fontsize-zh.四号, lang: "zh")

      set par(first-line-indent: 2em, leading: 1.2em, justify: true)

      v(1.5cm)

      align(
          center,
          text(
            font: font-zh.宋体,
            size: fontsize-zh.二号,
            weight: "bold",
          )[郑 重 声 明],
        )
        v(1cm)

        if form == "thesis" {
          [
              本人呈交的毕业论文，是在导师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料真实可靠。尽我所知，除文中已经注明引用的内容外，本论文的研究成果不包含他人享有著作权的内容。对本论文所涉及的研究工作做出贡献的其他个人和集体，均已在文中以明确的方式标明。本论文的知识产权归属于培养单位。
          ]
        } else if form == "design" {
          [
              本人呈交的毕业设计，是在导师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料真实可靠。尽我所知，除文中已经注明引用的内容外，本设计的研究成果不包含他人享有著作权的内容。对本设计所涉及的研究工作做出贡献的其他个人和集体，均已在文中以明确的方式标明。本设计的知识产权归属于培养单位。
          ]
        } else {
          [错误：form 参数填写错误，只能在 `report`、`thesis`、`design` 中选择]
        }

        v(4cm)

        align(
          left,
          grid(
            columns: (auto, 6em, 3em, auto, 6em),
            column-gutter: 10pt,
            [本人签名：],
            line(start: (0pt, 0.9em), length: 6em, stroke: 0.5pt),
            [],
            [日期：],
            line(start: (0pt, 0.9em), length: 6em, stroke: 0.5pt),
          ),
        )
    },
  )
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
  // 封面部分
  {
    set text(24pt)
    set align(horizon + center)
      sc_model.hhu-cn-cover(
      author: author,
      thesis-name: thesis-name,
      title: title,
      advisors: advisors,
      school: school,
      major: major,
      date: date,
      reader: reader,
    )
    sc_model.hhu-en-cover(
      author: author,
      thesis-name: thesis-name,
      subject: subject,
      title: title,
      advisors: advisors,
      school: school,
      date: date,
    )
  }
  // 声明部分
  hhu-statement-page(form: form)
  
  // 编号前言开始
  
  show: sc_style.set-footer.with(
    footer-align: center,
    footer-text: (size:12pt),
    display-both: false
  )
  set page(numbering: "I")
  counter(page).update(1)

  // 摘要部分
  sc_model.hhu-abstract(
    cn-abstract: cn-abstract,
    cn-keywords: cn-keywords,
    en-abstract: en-abstract,
    en-keywords: en-keywords
  )

  // 目录部分设置
  show outline.entry: sc_style.set-hhu-outline.with()
  set outline(indent: 0em)
  { 
    show heading.where(level: 1): it => {
      pagebreak()
      set align(center)
      set text(font:font-zh.黑体, size: fontsize-zh.小二)
      strong(it.body)
    }
    heading(numbering: none,level: 1,[目#h(1em)录])
    v(1em)
    outline(title:none, depth: 2)
  }

  // 正文部分设置+正文开始
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
          thesis-name.heading
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