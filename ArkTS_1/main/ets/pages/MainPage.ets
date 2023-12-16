import ToDoItem from '../view/ToDoItem'
import DataModel from '../viewmodel/DataModel'
import CommonConstant from '../common/constant/CommonConstant'

@Entry
@Component
struct MainPage {
  private totalTasks: Array<string> = [];
  message: string = '待办列表';
  // 创建生命周期开始时调用数据
  aboutToAppear() {
    // 使用DataModel文件中的getData方法
    // 将CommonConstant中设置的数据传给当前数组
    this.totalTasks = DataModel.getData();
  }

  build() {
    // 纵向容器（向下）
    // 结构设计目的：
    /**
     * content_1
     * content_2
     * content_3
     * ...
     */
    // space 设置容器内组件的间隔
    Column({space:10}) {
      Row(){
        Text(this.message)
          .fontSize(30)
          // 字体加粗
          .fontWeight(FontWeight.Bold)
          // 橙色
          .fontColor('#ffe08312')
      }

      // 循环打出数组this.totalTasks内的内容,并且生成对应的相同组件
      ForEach(this.totalTasks, (item: string) => {
        // 调用ToDoItem组件
        ToDoItem({ content: item })
      }, (item: string) => JSON.stringify(item))
    }
    .width(CommonConstant.FULL_LENGTH)
    .height(CommonConstant.FULL_LENGTH)
    .backgroundColor($r('app.color.page_background'))
  }
}

