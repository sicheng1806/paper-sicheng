#import "../constant.typ": font-zh, fontsize-zh
#import "fields.typ": fields-grid
#import "underline.typ": chinese-underline


/// 结构化封面设计
/// 
/// 一个结构化的封面，包括以下内容:
/// - 独立排版域，例如使用place放置的元素
/// - 结构化排版的域: 从上到下依次为
///   - 标题域
///   - 信息域
///   - 底部信息域
/// 
/// == 示例
/// ```example
// #let hhu-cn-cover(
//   author: (
//     NAME: "李华",
//     ID: "2162510220",
//     YEAR: "2021级",
//   ),
//   thesis-name: [本科毕业论文],
//   title: [植物对泥沙沉降规律的影响研究],
//   advisors: "张三",
//   reader: "李四 副教授",
//   major: "自动化",
//   date: "二〇二四年五月"
// ) = structured-cover(
//     margin: (
//       top: 265pt,
//       title-fields: (1.8cm,)
//     ),
//     structure-fields-height: 100% - 277.3pt,
//     independent-formatting-fields: (
//       place(
//         top + right,
//         dy: 2cm,
//         dx: -2cm,
//         {
//           fields-grid(
//             (
//               ("学号", author.ID),
//               ("年级", author.YEAR),
//             ),
//             align: center,
//             row-gutter: 15pt,
//             spliter-width: 3pt,
//             min-content-width: 80pt,
//             label-style: (it) => {
//               text(
//                 font: font-zh.黑体, 
//                 size: fontsize-zh.五号, 
//                 weight: "regular",
//                 it
//               )
//             },
//             content-style: (it) => {
//               text(
//                 font: font-zh.黑体,
//                 size: fontsize-zh.五号,
//                 weight: "regular",
//                 chinese-underline(it)
//               )
//             }
//           )
//         }
//       ),
//       place(
//         top + center,
//         dy: 4.8cm,
//         {
//           hhu-logo(width: 11cm)
//         },
//       )
//     ),
//     title-fields: (
//       block(fakebold(text(
//             font: font-zh.宋体,
//             size: fontsize-zh.一号,
//             thesis-name,
//       ))),
//       block(text(
//         font: font-zh.黑体,
//         size: fontsize-zh.二号,
//         weight: "bold",
//         title
//       )),
//     ),
//     information-fields: (
//       ("专业", major),
//       ("姓名", author.NAME),
//       ("指导教师", advisors),
//       ("评阅人", reader)
//     ),
//     bottom-fields: {
//       set text(font: font-zh.黑体,size: fontsize-zh.三号,weight: "bold")
//       grid(
//         rows: 2,
//         gutter: 16pt,
//         date,
//         "中国      南京"
//       )
//     },
// )
/// ```
/// == 参数
///
/// - independent-formatting-fields (): 
/// - title-fields (): 
/// - information-fields (): 
/// - bottom-fields (): 
/// - margin (): 
/// - structure-fields-height (): 
/// - page-settings (): 
/// -> content
#let structured-cover(
  independent-formatting-fields: (),
  title-fields: (),
  information-fields:(),
  bottom-fields: (),
  margin: (
    top:0pt,
    buttom:0pt,
    title-fields: (1fr,),
    information-fields: 1fr,
    buttom-fields: (1fr,),
  ),
  structure-fields-height: 100%,
  ..page-settings
) = {
  let page-settings = page-settings.named()
  let page-margin = page-settings.remove("margin",default:(top:2cm, bottom: 2cm, left:3.2cm, right: 3.2cm))
  let page-numbering = page-settings.remove("numbering",default:none)
  let page-header = page-settings.remove("header",default:none)
  let page-footer = page-settings.remove("footer",default:none)

  if type(independent-formatting-fields) != array {
    independent-formatting-fields = (independent-formatting-fields,)  
  }
  
  if title-fields == () {
    title-fields = ([],)
  }
  if bottom-fields == () {
    bottom-fields = ([],)
  }
  if type(title-fields) != array {
    title-fields = (title-fields,)  
  }
  if type(bottom-fields) != array {
    bottom-fields = (bottom-fields,)
  }
  
  let margin-title-fields = margin.at("title-fields",default:1fr)
  let margin-bottom-fields = margin.at("bottom-fields",default:1fr)


  let _get_field_margin(field-margin,fields) = {
    if type(field-margin) != array {
      field-margin = (field-margin,) * fields.len()
    }
    if field-margin.len() < fields.len() {
      field-margin = field-margin + (1fr,) * (fields.len() - field-margin.len())
    } else if field-margin.len() > fields.len() {
      field-margin = field-margin.slice(0,fields.len())
    }
    return field-margin.map(it => (auto,it)).flatten()
  }

  margin-title-fields = _get_field_margin(margin-title-fields, title-fields)
  margin-bottom-fields = _get_field_margin(margin-bottom-fields, bottom-fields).slice(0,-1)

  let structure-rows = (
      margin-title-fields 
      + (auto,margin.at("information-fields",default:1fr)) 
      + margin-bottom-fields
    )

  let title-fields = title-fields.map(it => (it,[])).flatten()
  let bottom-fields = bottom-fields.map(it => (it,[])).flatten().slice(0,-1)
  
  // assert(structure-rows.len() == title-fields.len() + 2 + bottom-fields.len())

  return page(
    margin: page-margin,
    numbering: page-numbering,
    header: page-header,
    footer: page-footer,
    ..page-settings,
    { 
      set align(center + top)
      set par(first-line-indent: 0pt)

      // 独立排版域直接循环排布
      for d in independent-formatting-fields {
        d
      }
      v(margin.at("top",default:0pt)) // 顶部留白
      // 结构化排版域置于网格中
      block(
        height: structure-fields-height,
        grid(
          rows: structure-rows,
          // 标题域
          ..title-fields,
          // 信息域
          {
            set text(font: font-zh.宋体, fontsize-zh.小三, weight: "regular")
            set underline(offset: 5pt)
            set place(dy: -0.2em, center)
            fields-grid(
              information-fields,
              align: center,
              row-gutter: 1.5em,
              spliter-width: 0.2em,
              min-label_width: 4em,
              min-content-width: 10em,
              label-style: it => text(font: font-zh.黑体, size: fontsize-zh.小三, weight: "bold", it),
              content-style: chinese-underline
            )
          },
          [],
          ..bottom-fields
        )
      )
      v(margin.at("bottom",default:0pt))
    }
  )
}

// #[
//   // 调试structured-cover
//   #import "../assets.typ": hhu-logo
//   #import "@preview/cuti:0.3.0": fakebold
//   #let hhu-cn-cover(
//   author: (
//     NAME: "李华",
//     ID: "2162510220",
//     YEAR: "2021级",
//   ),
//   thesis-name: [本科毕业论文],
//   title: [植物对泥沙沉降规律的影响研究],
//   advisors: "张三",
//   reader: "李四 副教授",
//   major: "自动化",
//   date: "二〇二四年五月"
// ) = structured-cover(
//     margin: (
//       top: 265pt,
//       title-fields: (1.8cm,)
//     ),
//     structure-fields-height: 100% - 277.3pt,
//     independent-formatting-fields: (
//       place(
//         top + right,
//         dy: 2cm,
//         dx: -2cm,
//         {
//           fields-grid(
//             (
//               ("学号", author.ID),
//               ("年级", author.YEAR),
//             ),
//             align: center,
//             row-gutter: 15pt,
//             spliter-width: 3pt,
//             min-content-width: 80pt,
//             label-style: (it) => {
//               text(
//                 font: font-zh.黑体, 
//                 size: fontsize-zh.五号, 
//                 weight: "regular",
//                 it
//               )
//             },
//             content-style: (it) => {
//               text(
//                 font: font-zh.黑体,
//                 size: fontsize-zh.五号,
//                 weight: "regular",
//                 chinese-underline(it)
//               )
//             }
//           )
//         }
//       ),
//       place(
//         top + center,
//         dy: 4.8cm,
//         {
//           hhu-logo(width: 11cm)
//         },
//       )
//     ),
//     title-fields: (
//       block(fakebold(text(
//             font: font-zh.宋体,
//             size: fontsize-zh.一号,
//             thesis-name,
//       ))),
//       block(text(
//         font: font-zh.黑体,
//         size: fontsize-zh.二号,
//         weight: "bold",
//         title
//       )),
//     ),
//     information-fields: (
//       ("专业", major),
//       ("姓名", author.NAME),
//       ("指导教师", advisors),
//       ("评阅人", reader)
//     ),
//     bottom-fields: {
//       set text(font: font-zh.黑体,size: fontsize-zh.三号,weight: "bold")
//       grid(
//         rows: 2,
//         gutter: 16pt,
//         date,
//         "中国      南京"
//       )
//     },
// )

// #hhu-cn-cover()
// ]

