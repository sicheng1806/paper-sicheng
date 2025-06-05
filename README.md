# Paper Sicheng

一个模块化设计的Typst模块库，会随着模版滚动更新。

## 已有模版

- [x] 河海大学毕业论文模版

    河海大学毕业论文模版(工科)根据[河海大学毕业论文模版格式参考](https://bylw.hhu.edu.cn/UpLoadFile/83cd5f1169974a0db06d865c7ee11af4.pdf)制作而成。

    使用示例:

    ```typ
    #import "./src/lib.typ": hhu-thesis // 导入模版，替换为实际lib.typ路径
    #import hhu-thesis: hhu-bachelor-thesis, // 从模版库导入样式函数和一些写作模型

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
        form: "thesis", /// 毕业论文："thesis"，毕业设计："design", 课程报告："report"
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

        = 你的正文部分

        #thanks[致谢部分记得感谢所有对你有所支持的人]

        #cn-bibliography(
        bibliography.with("../../inputs/ref.bib"),
        full: true,
        )

        #show: appendix-conf

        = 设计图纸

        附录部分

        一个示例附录，例如可以附上你的设计图纸。
    ```

    更多查看[示例文件](https://github.com/sicheng1806/paper-sicheng/blob/main/template/hhu-bachelor-thesis/hhu-bachelor-thesis-temp.typ)和[示例效果演示文件](https://raw.githubusercontent.com/sicheng1806/paper-sicheng/template/hhu-bachelor-thesis/hhu-bachelor-thesis-temp.pdf)

## 使用方法

目前项目处于快速开发阶段，只支持本地使用。

### 本地使用

你可以使用git克隆本仓库进行使用。

使用前，请先安装 [字体依赖](https://github.com/shaneworld/Dots/tree/master/fonts) 中的全部字体。

或者将`scr/constant.typ`中字体相关常量修改为你系统中具有的字体:

```typ
#let font-zh = (
  仿宋: ("Times New Roman", "FangSong", "STFangSong"),
  宋体: ("Times New Roman", "SimSun"),
  黑体: ("Times New Roman", "SimHei"),
  楷体: ("Times New Roman", "KaiTi"),
  代码: ("FiraCode Nerd Font", "Times New Roman", "SimSun"),
)
```

## 致谢

- 非官方河海大学毕业论文模版(工科): [shaneworld/HHU-Thesis-Template](https://github.com/shaneworld/HHU-Thesis-Template)