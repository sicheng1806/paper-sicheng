#import "../constant.typ": font-zh, fontsize-zh

/// 将figure设为满足河海大学毕业论文格式
///
/// - figure-text (): 
/// - caption-text (): 
/// - figure-block (): 
/// - it (): 
/// -> 
#let set-hhu-thesis-figure(
  figure-text:(
    font: font-zh.宋体,
    size: fontsize-zh.五号,
    weight: "regular"
  ),
  caption-text:(
    font: font-zh.黑体,
    size: fontsize-zh.五号,
    weight: "regular"
  ),
  figure-block:(breakable:true),
  it
  ) = {
  set figure.caption(position: top) if "table" in it.kind
  show figure.caption: set text(..caption-text)
  set text(..figure-text)
  set block(..figure-block)
  it
}