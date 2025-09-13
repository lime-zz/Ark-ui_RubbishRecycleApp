import router from "@ohos.router";
import http from '@ohos.net.http';
import { promptAction } from "@kit.ArkUI";
//import { focusControl } from '@kit.ArkUI'  // 新增此行
import ServerResponseDataType from '../module/ServerResponseDataType';

@Entry
@Component
struct sousuo{
  @State message: string = 'Hello World';
  // 控制热门搜索详情的显示与隐藏
  @State isHotSearchVisible: boolean = true;
  // 控制历史搜索内容是否显示
  @State showHistory: boolean = true;
  // 控制删除确认弹窗是否显示
  @State showDeleteDialog: boolean = false;
  @State keyword: string = '';
  // 处理搜索逻辑
  async handleSearch() {
    if (!this.keyword.trim()) {
      promptAction.showToast({ message: '请输入搜索内容' })
      return
    }

    try {
      let request = http.createHttp()
      let url = `http://192.168.32.1:8080/api/search?keyword=${encodeURIComponent(this.keyword)}`

      let response = await request.request(url, {
        method: http.RequestMethod.GET,
        // 增加请求头，避免格式问题
        header: {
          'Content-Type': 'application/json'
        }
      })

      // 打印完整响应日志，便于排查
      console.log('响应状态码:', response.responseCode)
      console.log('响应结果:', response.result)

      // 先判断响应是否存在且为字符串
      if (response.responseCode === 200 && typeof response.result === 'string') {
        let result = JSON.parse(response.result) as ServerResponseDataType;
        console.log('解析后的数据:', result)

        if (result.code === 0) {
          // 新增判断：只有当data数组有数据时才跳转
          if (result.data && result.data.length > 0) {
            router.push({ url: 'pages/Sousuoyoujieguo' })
          } else {
            promptAction.showToast({ message: '搜索无结果,换个关键词试试看呢' })
          }
        } else {
          promptAction.showToast({ message: result.message || '搜索无结果' })
        }
      } else {
        // 处理非200状态或响应格式异常
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}` })
      }

      // 关闭请求（重要：避免内存泄漏）
      request.destroy()
    } catch (error) {
      // 将错误对象转为字符串，显示详细信息
      console.error('搜索失败详情:', JSON.stringify(error));
      promptAction.showToast({ message: '搜索失败，请重试' })
    }
  }
  build() {
    Column(){
      Column(){
        //顶端搜索
        Row({space:15}){
          Text('<')
            .fontColor('#ffffff')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
          Search({placeholder: '奶茶',value: this.keyword})
          // .id('searchInput')
            .searchButton('搜索',{fontColor: '#2bcddd'})
            .onClick(() => {
              this.handleSearch()  // 点击搜索按钮时执行搜索
            })
            // .onSubmit((value) => {
            //   this.keyword = value  // 回车提交时获取输入值
            //   this.handleSearch()
            // })
            .onChange((value) => {
              this.keyword = value  // 实时更新输入的关键词
            })
            .fontColor('#2bcddd')
            .width('90%')
            .placeholderColor('#696969')
            .backgroundColor('#ffffff')
        }
        .margin({top:33})
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#2bcddd')

      Column(){
        //历史搜索
        Row(){
          Row(){
            Image($r("app.media.shu"))
              .width(25)
            Text('历史搜索')
              .fontWeight(FontWeight.Bold)
          }
          // 为删除图片添加点击事件，显示确认弹窗
          Image($r("app.media.shanchu"))
            .width(18)
            .onClick(() => {
              this.showDeleteDialog = true;
            })
            .alt('删除历史搜索')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(20)

        // 历史搜索内容详情（条件显示）
        // if (this.showHistory) {
        //   Column({space:15}){
        //     Row({space:10}){
        //       Button('垃圾')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //       Button('锤目纹玻璃杯')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //       Button('衬衣')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //       Button('冰杯')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //
        //     }
        //     .width('90%')
        //
        //     Row({space:10}){
        //       Button('垃圾桶')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //       Button('水杯')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //       Button('床上用品')
        //         .height(30)
        //         .backgroundColor('#2bcddd')
        //     }
        //     .width('90%')
        //   }
        //   .transition({
        //     type: TransitionType.All,
        //   })
        // }
        // 历史搜索内容详情（条件显示）
        if (this.showHistory) {
          Column({space:15}){
            Row({space:10}){
              // 为每个按钮添加onClick事件，将按钮文字赋值给keyword
              Button('垃圾')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '垃圾'; // 按钮文字赋值给搜索框变量

                })
              Button('锤目纹玻璃杯')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '锤目纹玻璃杯';
                })
              Button('衬衣')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '衬衣';
                })
              Button('冰杯')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '冰杯';
                })
            }
            .width('90%')

            Row({space:10}){
              Button('垃圾桶')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '垃圾桶';
                })
              Button('水杯')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '水杯';
                })
              Button('床上用品')
                .height(30)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.keyword = '床上用品';
                })
            }
            .width('90%')
          }
          .transition({
            type: TransitionType.All,
          })
        }
        //热门搜索
        Row(){
          Row(){
            Image($r("app.media.shu"))
              .width(25)
            Text('热门搜索')
              .fontWeight(FontWeight.Bold)
          }
          // 隐藏图片点击事件
          Image($r("app.media.yingcang"))
            .width(18)
            .onClick(() => {
              this.isHotSearchVisible = !this.isHotSearchVisible;
            })
            .alt('隐藏/显示热门搜索')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(20)

        // 热门搜索详情（条件显示）
        if (this.isHotSearchVisible) {
          Column({space:10}){
            Row({space:95}){
              Button('垃圾袋')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
                .onClick(() => {
                  this.keyword = '垃圾袋'; // 按钮文字赋值给搜索框变量

                })
              Button('冰箱')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
            }
            .width('90%')

            Row({space:95}){
              Button('垃圾桶')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
                .onClick(() => {
                  this.keyword = '垃圾桶'; // 按钮文字赋值给搜索框变量

                })
              Button('电视')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
            }
            .width('90%')

            Row({space:95}){
              Button('水盆')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
              Button('    空调被')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
            }
            .width('90%')

            Row({space:95}){
              Button('风扇')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
              Button('    漱口杯')
                .fontSize(15)
                .fontColor('#898989')
                .backgroundColor('#ffffff')
            }
            .width('90%')

          }
          .justifyContent(FlexAlign.Start)
          .transition({
            type: TransitionType.All,
            translate: { y: 20 }
          })
        }
      }

      // 删除确认弹窗 - 正确交换按钮位置和功能
      if (this.showDeleteDialog) {
        Stack() {
          // 弹窗遮罩层
          Column()
            .width('100%')
            .height('100%')
            .backgroundColor('rgba(0, 0, 0, 0.3)')
            .onClick(() => {
              this.showDeleteDialog = false;
            })

          // 弹窗内容
          Column() {
            Text('确认删除')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .margin({ top: 20, bottom: 10 })

            Text('确定要删除所有历史搜索记录吗？')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ bottom: 20 })

            // 正确交换按钮位置和功能
            Row({ space: 30 }) {
              // 左侧按钮显示"取消"文字，执行取消功能
              Button('取消')
                .width(100)
                .backgroundColor('#ffffff')
                .fontColor('#000000')
                .border({ width: 1, color: '#dddddd' })
                .onClick(() => {
                  this.showDeleteDialog = false; // 仅关闭弹窗
                })

              // 右侧按钮显示"确认"文字，执行删除功能
              Button('确认')
                .width(100)
                .backgroundColor('#2bcddd')
                .onClick(() => {
                  this.showHistory = false; // 删除历史记录
                  this.showDeleteDialog = false; // 关闭弹窗
                })
            }
            .margin({ bottom: 20 })
          }
          .width(300)
          .backgroundColor('#ffffff')
          .borderRadius(10)
          .shadow({ radius: 10, color: 'rgba(0, 0, 0, 0.3)' })
          .alignSelf(ItemAlign.Center)
        }
        .width('100%')
        .height('100%')
        .position({ x: 0, y: 0 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }
}

