import appAccount from '@ohos.account.appAccount'
@Entry
@Component
struct Main {

  // 与AppStorage单向绑定
  @StorageProp('count') count: number = 1

  // 与AppStorage双向绑定
  @StorageLink('count') linkCount: number = 1

  build(){
    Column(){
      Text(`${this.count}`).fontSize(23).fontColor(Color.Red)

      Button('设置值').onClick(()=>{
        //获取值
        let value = AppStorage.Get<number>('count')
        console.log(value.toString())
        AppStorage.Set<number>('count',value + 1)
      })
    }
  }
}