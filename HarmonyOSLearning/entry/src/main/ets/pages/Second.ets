import router from '@ohos.router'

@Entry
@Component
struct Second {
  @State message: string = "second page"
  param = router.getParams();

  build() {
    Row() {
      Column() {
        Text(this.param["name"]).fontSize(20).fontWeight(FontWeight.Bold)
        Button("Back").onClick(() => {
          router.back();
        }).margin(20)
      }.width('100%')
    }.height('100%')
  }
}