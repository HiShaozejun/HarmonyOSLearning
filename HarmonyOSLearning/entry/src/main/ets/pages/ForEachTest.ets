@Component
struct MyChild {
  label: string

  build() {
    Text(this.label).fontColor(Color.Blue).fontSize(24)
  }
}

// ForEach 可以单独修改某一个组件的值，不是移除子组件
@Entry
@Component
struct MyParent {
  @State my_arr: Array<string> = ['one', 'two','three','four']

  build() {
    Column() {
      Button('点击修改第二个值').onClick(()=>{
        this.my_arr[1] = 'new_two'
      })
      ForEach(this.my_arr, (item: string, index) => {
        MyChild({ label: item })
      })
    }.justifyContent(FlexAlign.Center).width('100%').height('100%')
  }
}