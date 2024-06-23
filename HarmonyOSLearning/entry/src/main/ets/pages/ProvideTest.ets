@Component
struct MyChild1 {
  build() {
    Column({space:10}){
      Text('MyChild1').fontColor(Color.Red).fontSize(23)
      MyChild2()
    }
  }
}

@Component
struct MyChild2 {
  @Consume userId: number

  build() {
    Column() {
      Text(`MyChild2组件的userid ${this.userId}`).fontSize(23).fontColor(Color.Orange)
    }
  }
}

@Entry
@Component
struct MainComp {
  @Provide userId: number = 122

  build() {
    Column({space:20}) {
      Text("Main").fontSize(23).fontColor(Color.Green)
      MyChild1()
      Button('修改父组件的userid').onClick(() => {
        this.userId = 33
      })
    }.margin(20)
  }
}