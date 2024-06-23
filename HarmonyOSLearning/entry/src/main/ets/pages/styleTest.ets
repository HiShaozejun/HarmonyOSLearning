// 不可以入参
@Styles function globalStyle(n:number) {
  .height(40)
  .width(100)
  .backgroundColor(Color.Red)
}

@Entry
@Component
struct Parent {
  @State p_height: number = 100

  @Styles innerStyle(n: number){
    .width(100)
    .height(this.p_height).backgroundColor(Color.Yellow)
    .onClick(() => {
      this.p_height = 200
    })
  }

  build() {
    Column() {
      Text('11').innerStyle(10)
      Text('22').globalStyle(1)
    }
  }
}