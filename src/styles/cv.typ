#import "../constant.typ": font-zh, fontsize-zh
#import "../style.typ": set-sidebar

#let default-colors = (
  primary: rgb("#003F88"),
  primary-light: rgb("#2159A5"),
  primary-lightest: rgb("#F2F4F8"),
  neutral-lightest: rgb("#FFFFFF"),
  neutral-darkest: rgb("#000000")
)

#let default-text-conf = (
  base-text: (
    font: font-zh.宋体,
    size: fontsize-zh.小四,
    weight: "regular",
  )
)

#let default-sidebar-conf = (
  use: true,
  dir: left,
  width: 14em,
)

#let make-cv-config(
  colors:(:),
  text-conf:(:),
  sidebar-conf:(:),
  ..configs,
  style-func
) = {
  if colors == (:) {
    colors = default-colors
  }
  if text-conf == (:) {
    text-conf = default-text-conf
  }
  if sidebar-conf == (:) {
    sidebar-conf = default-sidebar-conf
  }

  let self = (
    colors: colors, // 各部分的颜色设置
    text-conf: text-conf, // 各部分的字体设置
    sidebar-conf: sidebar-conf , // 侧边栏样式设置
  ) + configs.named()

  style-func(self)
  
}

#make-cv-config(
  name: "nihao",
  self => {
    self
})

