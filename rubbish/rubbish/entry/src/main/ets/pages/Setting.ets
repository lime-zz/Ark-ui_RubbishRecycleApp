import { router } from '@kit.ArkUI';
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';


@Entry
@Component
export struct Setting {
  @State message: string = 'Hello World';
  @State account: string = '未登录'; // 显示的用户名
  private storage: preferences.Preferences | null = null; // 存储实例

  // 页面加载时读取用户名（和“我的”页面逻辑一致）
  aboutToAppear() {
    this.loadUserInfo(); // 调用读取方法
  }

  // 从preferences读取用户名（复用“我的”页面逻辑）
  async loadUserInfo() {
    try {
      const context = getContext(this); // 获取上下文
      this.storage = await preferences.getPreferences(context, 'userInfo'); // 打开存储实例
      const username = await this.storage.get('currentUser', '未登录'); // 读取键为currentUser的值
      this.account = username as string; // 赋值给状态变量
      console.info('设置页面读取用户名成功:', this.account);
    } catch (error) {
      console.error('设置页面读取用户名失败:', error);
      this.account = '未登录';
    }
  }
  build() {
    Column({}){
      // 导航栏
      Column({space:9}) {
        Row({space:2}){
          Image($r('app.media.return'))
            .width(20)
            .height(20)
            .margin({ right: 8 ,top:6})
            .onClick(() => {
              // 跳转到 Index 页面，并传递参数 tabIndex=4（指定“我的”标签）
              router.replaceUrl({
                url: 'pages/Index',
                params: { tabIndex: 4 } // 传递标签索引，4对应“我的”标签
              });
            })
          Text('设置')
            .fontSize(20)
            .fontColor('#FFFFFF')
        }
        .width('100%')
        .height(56)
        .padding({ left: 16,top:40 })
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center);
      }
      .backgroundColor('#2BCDDC')
      .width('100%')
      .height('10%')

      // 白色背景内容区
      Column({space:10}){
        Row({space:10}){
          Row() {
            Image($r('app.media.naicha'))
              .width(50)
              .height(50)
              .borderRadius(25);
            Column() {
              // 显示读取的用户名
              Text(this.account)
                .fontSize(18)
              Text('19118978968')
                .fontSize(10)
            }
          }
          Image($r("app.media.loggingin"))
            .width(30)
            .height(30)
        }
        .margin({top:20})
        .justifyContent(FlexAlign.SpaceBetween)
        .width('85%')
        .height('10%')
        .backgroundColor('#ffffff')
        .borderRadius(10)
        .onClick(() => {
          router.pushUrl({ url: 'pages/gerenxinxixiugai' })
        })

        // 手机号修改部分
        Column({space:0}){
          Row(){
            Row({space:8}){
              Image($r('app.media.xiugaishoujihao'))
                .width(10)
                .height(10)
              Text('手机号修改')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({ url: 'pages/rephone' })
          })

          Row(){
            Row({space:6}){
              Image($r('app.media.zhifumimaxiugai'))
                .width(15)
                .height(15)
              Text('支付密码修改')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({ url: 'pages/rephone' })
          })
        }
        .borderRadius(10)

        // 消息提醒部分
        Column({space:0}){
          Row(){
            Row({space:8}){
              Image($r('app.media.xiaoxitixing'))
                .width(10)
                .height(10)
              Text('消息提醒')
                .fontSize(16)

            }
            Image($r('app.media.xiaoxitixing'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({ url: 'pages/xiaoxitixing' })
          })

          Row(){
            Row({space:6}){
              Image($r('app.media.yaoqinghaoyou'))
                .width(15)
                .height(15)
              Text('邀请好友')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({ url: 'pages/Settingzerenshengming' })
          })
        }
        .borderRadius(10)

        // 关于部分
        Column({space:0}){
          Row(){
            Row({space:8}){
              Image($r('app.media.about'))
                .width(10)
                .height(10)
              Text('关于')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({ url: 'pages/Settingabout' })
          })

          Row(){
            Row({space:6}){
              Image($r('app.media.zeshenshengming'))
                .width(15)
                .height(15)
              Text('责任声明')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
          .onClick(() => {
            router.pushUrl({ url: 'pages/Settingzerenshengming' })
          })
        }
        .borderRadius(10)

        // 检查更新部分
        Column({space:0}){
          Row(){
            Row({space:8}){
              Image($r('app.media.jianchagengxin'))
                .width(10)
                .height(10)
              Text('检查更新')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')

          Row(){
            Row({space:6}){
              Image($r('app.media.yijianfankui'))
                .width(15)
                .height(15)
              Text('意见反馈')
                .fontSize(16)
            }
            Image($r('app.media.loggingin'))
              .width(15)
              .height(15)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')

          Row(){
            Row({space:6}){
              Image($r('app.media.qinlihuancun'))
                .width(15)
                .height(15)
              Text('清理缓存')
                .fontSize(16)
            }
            Text('16.64MB')
              .fontSize(16)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
        }
        .borderRadius(10)

        // QQ交流群
        Column({space:0}){
          Row(){
            Row({space:8}){
              Image($r('app.media.qq'))
                .width(14)
                .height(14)
              Text('qq交流群')
                .fontSize(16)
            }
            Text('624868897')
              .fontSize(16)
          }
          .justifyContent(FlexAlign.SpaceBetween)
          .width('85%')
          .height('6%')
          .backgroundColor('#ffffff')
        }
        .borderRadius(10)

        // 占位
        Column(){}.height('8%')

        // 退出按钮
        Button('退出登录')
          .backgroundColor('#FF5E81')
          .width('85%')
          .height('6%')
          .onClick(() => {
            // 退出登录时清除存储的用户名
            AppStorage.delete('currentUser');
            router.pushUrl({ url: 'pages/Denglu' })
          })
      }
      .backgroundColor('#EBFCF9')
      .width('100%')
      .height('90%')
      .borderRadius(10)
    }
    .height('100%')
    .width('100%')
  }
}
