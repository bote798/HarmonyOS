import CommonConstants from '../common/constant/CommonConstant';

@Component
export default struct ToDoItem {
  private content?: string;
  @State isComplete: boolean = false;


  // 自定义的图片组件
  @Builder label(Icon: Resource) {
    Image(Icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    // 横向容器设计目的结构： 图片 文本
    Row() {
      Text()
      // 图片组件点击改变逻辑
      if (this.isComplete) {
        this.label($r('app.media.ic_ok'));
      } else {
        this.label($r('app.media.ic_default'))
      }
      // 文本
      Text(this.content)
        .fontSize($r('app.float.item_font_size'))
        .fontWeight(CommonConstants.FONT_WEIGHT)
          // 透明度(因点击而改变)(三元表达式)
        .opacity(this.isComplete ? CommonConstants.OPACITY_COMPLETED : CommonConstants.OPACITY_DEFAULT)
          // 文本描述类型(三元表达式)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
      // 圆角
    .borderRadius(CommonConstants.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    // 使用自定义的列表默认宽度
    .width(CommonConstants.LIST_DEFAULT_WIDTH)
    //
    .height($r('app.float.list_item_height'))
    // 点击事件
    .onClick(()=>{
      this.isComplete = !this.isComplete;
    })
  }
}