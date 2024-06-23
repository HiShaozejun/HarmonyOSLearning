/**
 * @Extend仅支持定义在全局，不支持在组件内部定义
 * /

 /**带参数 Extend  入参可以是状态变量 也可以是普通变量*/
@Extend(Text) function textFontSize(size: number) {
  .fontSize(size)
}

/**不带参数 Extend，内部可以调用extend*/
@Extend(Text) function myExtend() {
  .fontColor(Color.Red)
  .textFontSize(32)
}

/*参数为函数**/
@Extend(Text) function clickBack(click: () => void) {
  .onClick(click)
}

@Extend(Column) function layout() {
  .width(100)
  .height(200).backgroundColor(Color.Gray)
}


@Entry
@Component
struct Main {
  @State fonsize: number = 20

  clickEvent() {
    console.log("111111")
  }

  changeFontSize() {
    this.fonsize += 1
  }

  build() {
    Column() {
      Text('click').myExtend().clickBack(this.clickEvent.bind(this))
      Text('state Text').textFontSize(this.fonsize).clickBack(this.changeFontSize.bind(this))

      Text().stateStyles({normal:})
    }.layout()
  }
}

