import router from '@ohos.router'
@Entry
@Component
// 声明UI
struct ArkTsGrammar{

  private url: string = "https:"

  clickFunc(event: ClickEvent): void{
    console.info("1111111111")
  }

  build(){
    Column(){
      Image(this.url)
      Text($r("app.string.app_name")).fontSize(30)
      Button("路由返回").onClick(()=>{
        router.back()
      })
      Button("函数封装调用").onClick(this.clickFunc.bind(this))
    }.padding(20)
  }
}

class GrammarCls{


}