#import "../../src/lib.typ": hhu-thesis, utils
#import hhu-thesis: hhu-bachelor-thesis

#show: hhu-bachelor-thesis.with(
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
    EN: [
      Study on the influence of plants on \
      sediment deposition
    ],
  ),
  school: (
    CN: "河海大学",
    EN: "Hohai University",
  ),
  form: "thesis", 
  major: "自动化",
  subject: "subject",
  reader: "李四 副教授",
  date: "二〇二四年五月",
  cn-abstract: [
    由于泥沙与水流的相互作用，使得河流发生演变，因此泥沙特性与水流特性均是河流动力学的重要研究课题。当水流中含有植物时，水流的紊动特性会发生明显的改变，从而引起泥沙的一些特性如沉速发生改变。本文以实验为基础，结合理论分析，研究了在静水条件下刚性植物对泥沙沉速的影响，同时在水槽中通过改变流量来研究在恒定均匀流条件下非淹没植物对泥沙沉降轨迹的影响，得到如下主要结论：
  ],
  cn-keywords: ("关键词1", "关键词2"),
  en-abstract: [
    Fluvial river processes evolve over time in response to the constant interaction between sediment and the water column. If vegetation is present within the water column, the change in turbulence characteristics will impact the movement of sediment, in particular the settling velocity. In this paper, the influence of vegetation on the settling velocities of sediment particles is studied experimentally. The non-submerged vegetation friction factor in steady uniform flow is considered by under different flume discharge quantities. The main outcomes can be summarized as follows:
  ],
  en-keywords: ("Keywords1", "Keywords2"),
)

= 绪论

绪论可以包含：研究目的与意义、国内外研究现状、研究内容和技术路线等部分。


== 问题的提出及研究意义

泥沙在自然界中的河流中普遍存在着，泥沙含量的不同影响着河流流态，加上各种泥沙特性不同，使得河流泥沙问题更加复杂多变。如广泛分布在黄河流域一带的黄土地质均匀，其粉砂含量占 60%\~70%，缺乏团粒结构，粒间的固结主要依靠硫酸钙质，这种硫酸钙质遇水极易溶解流失，加上黄土孔隙率极高，抗蚀能力很差。

=== 问题提出

近年来，随着环境的日益恶化，人们对生态日益重视，含有植物的水流问题也已经成为河流动力学研究中的热点之一。直观的了解，河渠水流中的植物不仅减少了过水面积，加大了河渠地面的粗糙程度，降低了河渠的行洪能力，加大了两岸的洪灾威胁。

+ 问题一

+ 问题二

- point1

- point2

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

以上内容为示例文本。

= 公式、图文示例章节

== 公式示例

在 Typst 中，使用 ```typ $$``` 包裹公式以获得行内公式，在公式内容两侧增加空格以获得行间公式。如 ```typ $alpha + beta = gamma$``` 会获得行内公式 $alpha + beta = gamma$，而加上两侧空格，写成 ```typ $ alpha + beta = gamma $``` ，就会变成带自动编号的块公式：

$ (gamma s - gamma) times pi D^3/6 = C_D times pi times gamma omega^2/(2g) times D^2/4 $ <eqexample>

多行公式可以使用 `\ ` 换行（反斜杠紧跟空格或者反斜杠紧跟换行）。与 LaTeX 类似，`&` 可以用于声明对齐关系。

*注意：`~` 在 Typst 的书写环境中是不断行空格。如果需要输入 `~` 本身，可能需要转义为 `\~` 输入。*

$ E_"ocv" &= 1.229 - 0.85 times 10^(-3) (T_"st" - T_0) \
  &+ 4.3085 times 10^(-5) T_"st" [ln(P_H_2/1.01325)+1/2 ln(P_O_2/1.01325)] 
$

```typ
$ E_"ocv" &= 1.229 - 0.85 times 10^(-3) (T_"st" - T_0) \
  &+ 4.3085 times 10^(-5) T_"st" [ln(P_H_2/1.01325)+1/2 ln(P_O_2/1.01325)] 
$
```

包含大括号的公式：

$ cases(
  frac(0-V_1,r_"o4") =g_"m3"V_1+frac(V_1-V_X,r_"o3"),
  frac(V_2-0,r_"o1")=-g_"m2"V_2+frac(V_1-V_X,r_"o3")
) $

```typ
$ cases(
  frac(0-V_1,r_"o4") =g_"m3"V_1+frac(V_1-V_X,r_"o3"),
  frac(V_2-0,r_"o1")=-g_"m2"V_2+frac(V_1-V_X,r_"o3")
) $
```

*由于目前实现公式首行空四格的做法是修改对齐方式，故如遇多行公式，请手动为每行公式添加对齐，否则公式的位置将错位。*

公式引用使用式 1、式 1.1 等，英语文本中用 Eq.1、Eq.1.1 等。在 Typst 中，可以给公式添加 label 再引用。例如引用@eqt:eqexample。

请注意，引用公式、图表需要添加相应的前缀，如  ```typ @tbl:``` ```typ @fig:``` ```typ @eqt:```。


```typ
$ alpha + beta = gamma $ <eqexample​>

例如引用@eqt:eqexample。
```


// 上面这处代码请不要直接复制
// 因为为了规避渲染报错，加了一个零宽度空格

Typst 默认尝试使用数学方式表现，例如 ```typ $I=V / R$``` 会显示为 $I=V / R$，有时需要使用转义方式输入斜杠，如 ```typ $I=V \/ R$```。


== 表示例

带编号、表名的表格需要使用 `#figure` 包裹，才能自动编号。方式与上方图片相仿，或者查看下面的代码说明。表格本身建议使用函数 `table` 、或第三方库 `tablem` 库绘制。使用 `tablem` 库时，`#figure` 可能会认为其包裹的内容不是 `table` 类型，而编号“图X-X”。可以通过添加 `kind: table` 声明这是一个表格。


  ```typst
  #figure(
    {
      set table.cell(stroke: (top: 0.5pt, bottom: 0.5pt, left: 0pt, right: 0pt))
      show table.cell.where(y:0): set text(weight: "bold")
      table(
        columns: 6,
        inset: (
          x: 25pt,
          y: 10pt,
        ),
        align: center + horizon,
        // 表格内容
        table.cell(rowspan: 2)[实验编码], [H], [Q], [J], [B], [$U_*$],
        [$"cm"$], [$"L/s"$], [$permille$], [$"cm"$], [$"cm/s"$],
        [w1], [18], [7.56], [0.02], [42], [0.19], 
        [w2], [18], [11.34], [0.07], [42], [0.68], 
        [w3], [18], [15.12], [0.13], [42], [1.27], 
        [w4], [18], [18.9], [0.21], [42], [2.05], 
        [w5], [18], [22.68], [0.28], [42], [2.73]
      )
      // text(align: left, [其中：$U_*$为摩阻流速，$U_* = sqrt("JRg")$，（其中R 为水力半径）；J为水力坡降，B为水槽宽度，H为水深。])
    },
    caption: "光滑明渠水流实验水力条件",
  )<table1​>
  ```


#figure(
  {
    set table.cell(stroke: (top: 0.5pt, bottom: 0.5pt, left: 0pt, right: 0pt))
    show table.cell.where(y:0): set text(weight: "bold")
    table(
      columns: 6,
      inset: (
        x: 25pt,
        y: 10pt,
      ),
      align: center + horizon,
      // 表格内容
      table.cell(rowspan: 2)[实验编码], [H], [Q], [J], [B], [$U_*$],
      [$"cm"$], [$"L/s"$], [$permille$], [$"cm"$], [$"cm/s"$],
      [w1], [18], [7.56], [0.02], [42], [0.19], 
      [w2], [18], [11.34], [0.07], [42], [0.68], 
      [w3], [18], [15.12], [0.13], [42], [1.27], 
      [w4], [18], [18.9], [0.21], [42], [2.05], 
      [w5], [18], [22.68], [0.28], [42], [2.73]
    )
    // text(align: left, [其中：$U_*$为摩阻流速，$U_* = sqrt("JRg")$，（其中R 为水力半径）；J为水力坡降，B为水槽宽度，H为水深。])
  },
  caption: "光滑明渠水流实验水力条件",
)<table1>

== 图示例

本模板采用按章节编号的方式。如果需要插入带自动编号的图片，需要使用```typ #figure```。例如，使用下面的代码插入带编号的图片：


  ```typst
  #figure(
    image("./assets/24h_rain.png", width: 8.36cm),// 宽度/高度需要自行调整
    caption: [每小时降水量24小时均值分布图]
  )
  ```



#figure(
  image("imgs/图示例.png", width: 9cm),
  caption: [每小时降水量24小时均值分布图]
)

如一个插图由两个及以上的分图组成，分图用(a)、(b)、(c)等标出，并标出分图名。目前，本模板尚未实现分图的字母自动编号。如需要分图，建议使用 `#grid` 来构建。例如：


  ```typstthanks
  #figure(
    grid(
      columns: (3.83cm, 3cm, 5.51cm),
      image("./assets/2-2a.png") + "(a) 速度障碍集合", 
      [],
      image("./assets/2-2b.png") + "(b) 避免碰撞集合",
    ),
    caption: "速度障碍法速度选择"
  )
  ```

```typ columns``` 中间的参数为两图片的间距，实际使用中，网格划分、网格大小调整需要自行操作。

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

#align(center)[......]

= 结论与展望

结论应该观点明确、严谨、完整、准确，文字必须简明扼要，要阐明本人在科研工作中的创造性成果、新见解及其意义，本文成果在本领域中的地位和作用，对存在的问题和不足应做出客观的叙述和提出建议。

应严格区分自己的成果与导师科研成果和前人已有研究的界限。

= 后面的章节

后面还需添加致谢、参考文献，若有附录还可添加附录


参考文献需要使用 bib 格式的引用文献表，再在正文中通过 ```typ @labelname``` 方式引用。如

```typst
这里有一段话 @kopka2004guide.

引用多个会自动合并 @kopka2004guide @wang2010guide 。
```

里有一段话 ，引用多个会自动合并 。


完成上述操作后，*在致谢章节之后！致谢章节之后！致谢章节之后！*，添加


  ```typst
  #hhu-bibliography(
    bibliography: bibliography.with("ref.bib"),
    full: true
  )
  ```


就会自动生成参考文献表。

根据要求，河海大学本科毕业论文要求参考文献部分采用 `GB7714-2005`。
