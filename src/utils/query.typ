/// 根据页码，确定当前的章节
/// 
/// !NOTE: 考虑使用hydra包代替
/// 
/// -> content
#let get-cur-chapter-by-page() = {
  let chapters = query(heading.where(level: 1)) // 所有章节
  let cur-page = here().page() // 当前页码
  if cur-page < chapters.at(0).location().page() {
    return none
  }

  let cur-chapter = none

  for c in chapters {
    if cur-page >= c.location().page() {
      cur-chapter = c
    } else {
      return cur-chapter
    }
  }

  return cur-chapter
}

