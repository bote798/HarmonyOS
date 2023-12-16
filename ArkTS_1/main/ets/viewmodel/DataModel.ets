import CommonConstants from '../common/constant/CommonConstant';

/**
 * Saving and manipulating data displayed on the page.
 */
// 类似javabean
export class DataModel {
  /**
   * Saved Data.
   */
  // 获取数据 TODO_DATA
  private tasks: Array<string> = CommonConstants.TODO_DATA;

  /**
   * Get the data.
   */
  getData(): Array<string> {
    return this.tasks;
  }
}

export default new DataModel();