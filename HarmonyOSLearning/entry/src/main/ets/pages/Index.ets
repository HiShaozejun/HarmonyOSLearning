/**
 *  应用/服务包含的页面
 */
import router from '@ohos.router'
import data from '@ohos.telephony.data';

@Entry
@Component
struct Index {

  @State message: string = 'HarmonyOS Learning'

  private data: string[] = ["语法学习","其他学习"];

  pushAction(index: number){
    if (index == 0) {
      router.pushUrl({url: "pages/ArkTsGrammar"})
    }
  }

  build() {
    Column() {
      Column() {
        Text(this.message).fontSize(24).fontWeight(FontWeight.Bold).margin(10)
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.data, (item,index) => {
            ListItem() {
              Text('' + item)
                .width('100%').height(44).fontSize(16)
                .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
            }.onClick(()=> {
              this.pushAction(index)
            })
          },)
        }.width('90%')
      }.width('100%').height('100%').backgroundColor(Color.White).padding({ top: 5 })
    }
    }

}