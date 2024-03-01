@Component
struct MyChild {
  // 定义在子组件，父组件改变，同步子组件
  @Prop age: number

  // 普通私有变量
  private inCrease: number = 1

  build() {
    Column() {
      Text(`子组件inCrease：${this.inCrease}`).fontSize(23).fontColor(Color.Red)
      Text(`子组件age：${this.age}`).fontSize(23).fontColor(Color.Red)
      Button('修改子组件age').onClick(()=>{
        // 子组件的age值变化，不会同步父组件
        this.age --
      })
    }
  }
}

@Entry
@Component
struct Parent {
  @State parentInCreaseCount: number = 1
  @State age: number = 1
  build() {
    Column({space:20}) {
      Text(`父组件age--${this.age}`)
      Text(`父组件InCrease--${this.parentInCreaseCount}`)
      Button("修改父组件的状态变量值").onClick(() => {
        this.parentInCreaseCount ++
        // 父组件状态变量的修改，同步子组件
        this.age = this.parentInCreaseCount
      })
      Divider()
      MyChild({ inCrease: this.parentInCreaseCount, age: this.age })

    }.margin({top:20}).width('100%')
  }
}