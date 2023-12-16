import router from '@ohos.router'
import CommonConstants from '../Common/CommonConstants'
@Entry
@Component
struct Index {
  @State message: string = 'Index Page'
  @State src_1: string = router.getParams()?.['src_1'];
  build() {
    Row() {
      // 组件间隔 space
      Column({space:10}) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.src_1)
          .fontSize(20)

        Button('next')
          .borderRadius(20)
          .fontColor(Color.White)
          .backgroundColor(Color.Blue)
          .width(200)
          .height(100)
          .onClick(()=>{
            router.pushUrl({
              url:  CommonConstants.Second_URL,
              params: {
                src: CommonConstants.TO_SECOND_SRC_PARAM
              }
            });
            //   .catch((error:Error)=>{
            // //   错误抛出
            // });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}