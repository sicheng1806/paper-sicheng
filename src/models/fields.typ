#import "underline.typ": chinese-underline

/// Creates a grid layout for label-content pairs, handling multi-line labels and contents.
/// Each pair is split into lines and matched, with columns dynamically sized to fit the widest content.
/// == example
/// 
/// ```typ
/// 
/// 
/// ```
/// == argument
/// 
/// - pairs (): An array of (label, content) tuples, e.g., (("ID", "114514"), ("Grade", "2023")).
/// - spliter (): 
/// - spliter-width (): Width of the spacer column between label and content (default: 0.1em).
/// - row-gutter (): Vertical spacing between rows (default: 1em).
/// - min-label_width (): Minimum width for the label column (default: 2em).
/// - min-content-width (): Minimum width for the content column (default: 8em).
/// - label-style (): Function to style the label text (default: fit_in).
/// - content-style (): Function to style the content text (default: fill_in_blank).
/// - kwargs (): kwargs to grid
/// -> A grid with three columns (label, spacer, content), where column widths are dynamically adjusted.
///
#let fields-grid(
  spliter: "",
  spliter-width: 0.1em,
  min-label_width: 2em,
  min-content-width: 8em,
  row-gutter: 1em,
  label-style: it => it,
  content-style: it => it,
  ..kwargs,
  pairs
) = {
  assert(type(pairs) == array, message: "pairs must be an array of (label, content) tuple")
  
  context {
    let max_label_width = min-label_width.to-absolute()
    let max_content_width = min-content-width.to-absolute()

    for pair in pairs {
      max_label_width = calc.max(max_label_width, measure(content-style(pair.at(0))).width)
      max_content_width = calc.max(max_content_width, measure(content-style(pair.at(1))).width)
    }

    let max_spliter_width = calc.max(measure(box(spliter)).width,spliter-width.to-absolute())
  
    grid(
      columns: (max_label_width, max_spliter_width, max_content_width),
      row-gutter: row-gutter,
      ..kwargs,
      ..pairs.map(pair => {
        (
          label-style(pair.at(0)),
          box(spliter),
          content-style(pair.at(1)),
        )
      })
      .flatten()
    )
  }
  
  

  
}
