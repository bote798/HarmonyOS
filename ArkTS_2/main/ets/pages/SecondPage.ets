import router from '@ohos.router';
import CommonConstants from '../Common/CommonConstants';
@Entry
@Component
struct SecondPage {
  // @State src: string = (router.getParams() as Record<string, string>)['src'];
  @State src: string = router.getParams()?.['src'];
  build() {
    Row() {
      Column({space:10}) {
        Text('Second Page')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.src)
          .fontSize(20)

        Button('back',{type:ButtonType.Normal,stateEffect:true})
          .borderRadius(20)
          .width(200)
          .height(100)
          .onClick(()=>{
            // router.back()可以直接返回上一个界面
            router.pushUrl({
              url: CommonConstants.Index_URL,
              params: {
                src_1:  CommonConstants.TO_INDEX_SRX_PARAM
            }
            });
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}