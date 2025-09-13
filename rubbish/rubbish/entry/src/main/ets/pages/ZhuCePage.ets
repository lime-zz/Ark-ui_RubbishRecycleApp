import { router } from '@kit.ArkUI';
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';


// 定义接口响应类型
interface ApiResponse {
  code: number;
  message: string;
}

@Entry
@Component
struct ZhucePage {
  @State message: string = 'Hello World';
  // 用于存储账号
  @State account: string = '';
  // 用于存储密码
  @State password: string = '';
  // 用于存储手机号
  @State phoneNumber: string = '';
  // 用于存储验证码
  @State verifyCode: string = '';
  // 倒计时秒数，默认 -1 表示未发送
  @State countDown: number = -1;
  // 记录定时器 ID，用于清除
  private timer: number | undefined;
  // 后端服务器地址
  private serverUrl: string = 'http://192.168.32.1:8080';


  build() {
    Column() {
      Stack() {
        Column() {
          //登录背景
          Column() {

            Text('注册')
              .fontSize(30)
              .fontColor('#FFFFFF')
              .textAlign(TextAlign.Start)
              .width('100%')
              .padding({ left: 40, top: 40 })

          }
          .backgroundColor('#2BCDDC')
          .borderRadius(15)
          .width('100%')
          .height('25%')
          //白色背景
          Column() {

          }.backgroundColor('#EBFCF9').width('100%').height('80%');
        }

        //悬浮
        Column() {
          //图标
          Image($r('app.media.denglu'))
            .width(60)
            .height(60)

          //输入
          Column({ space: 30 }) {
            TextInput({ placeholder: '请输入账号' })
              .fontSize(16)
              .padding(12)
              .backgroundColor('#ECFCF9')
              .borderRadius(8)
              .onChange((value) => this.account = value)

            TextInput({ placeholder: '请输入密码' })
              .fontSize(16)
              .padding(12)
              .backgroundColor('#ECFCF9')
              .borderRadius(8)
              .type(InputType.Password)
              .onChange((value) => this.password = value)

            // TextInput({ placeholder: '请输入手机号' })
            //   .fontSize(16)
            //   .padding(12)
            //   .backgroundColor('#ECFCF9')
            //   .borderRadius(8)
            //   .onChange((value) => this.phoneNumber = value)
          }
          .height('20%')
          .width('100%')
          .margin({ bottom: 10 })
          // // 验证码输入框 + 发送验证码按钮
          // Row() {
          //   TextInput({ placeholder: '请输入验证码' })
          //     .fontSize(16)
          //     .width('60%')
          //     .padding(10)
          //     .backgroundColor('#ECFCF9')
          //     .borderRadius(8)
          //     .flexGrow(1)
          //     .onChange((value) => this.verifyCode = value)
          //
          //   // 动态切换按钮文案：倒计时中显示秒数，否则显示“发送验证码”
          //   Button(this.countDown === -1 ? '发送验证码' : `${this.countDown}s后重发`)
          //     .fontSize(14)
          //     .fontColor('#FF5E81')
          //     .backgroundColor('#FFFFFF')
          //     .border({ width: 1, color: '#FF5E81', radius: 8 })
          //     .margin({ left: 10 })
          //     .padding({ right:1 })
          //     // 按钮置灰禁用：倒计时中不可重复点击
          //     .enabled(this.countDown === -1)
          //     .onClick(() => {
          //       // 触发倒计时逻辑
          //       this.startCountDown();
          //     })
          // }
          // .width('100%')
          // .margin({left:5})


          //登录表同意
          Row() {
            Text('注册及表示同意')
              .fontColor('#CCCCCF')
              .fontSize(13)

            Text('《用户注册协议》')
              .fontColor('#FF5E81')
              .fontSize(13)
          }
          .margin({  right: 50 })
          //空白区
          Column() {

          }.height('15%')


          //登录or取消
          Column({ space: 20 }) {
            // 注册按钮：纯色填充
            Button('注册')
              .width('100%')
              .height(50)
              .backgroundColor('#FF5E81') // 粉色背景
              .fontColor('#FFFFFF')       // 白色文字
              .borderRadius(25)           // 圆角，值为高度一半可实现胶囊状
              .fontSize(18)
              .onClick(() => {
                this.registerUser()
              })

            // 取消按钮：边框模式
            Button('取消')
              .width('100%')
              .height(50)
              .backgroundColor('#FFFFFF') // 白色背景
              .fontColor('#FF5E81')       // 粉色文字
              .border({                    // 边框配置
                width: 1,                 // 边框宽度
                color: '#FF69B4',         // 边框颜色，与文字同色
                radius: 25                // 边框圆角
              })
              .borderRadius(25)           // 按钮本身圆角（与 border.radius 保持一致）
              .fontSize(18)
              .onClick(() => router.replaceUrl({ url: 'pages/Denglu' }));
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#FFFFFF')

        }
        .padding(20)
        .backgroundColor('#ffffff')
        .width('80%')
        .borderRadius(30)
      }

    }
    .height('100%')
    .width('100%')
  }

  // 注册用户方法
  async registerUser() {
    if (!this.account || !this.password) {
      console.error('账号和密码不能为空');
      promptAction.showToast({ message: '账号和密码不能为空', duration: 2000 });
      return;
    }

    try {
      let httpRequest = http.createHttp();
      let response = await httpRequest.request(
        this.serverUrl + "/api/register",
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json'
          },
          extraData: JSON.stringify({
            account: this.account,
            password: this.password
          })
        }
      );

      if (response.responseCode === 200) {
        let result: ApiResponse = JSON.parse(response.result.toString());
        if (result.code === 0) {
          console.info('注册成功');
          promptAction.showToast({ message: '注册成功', duration: 2000 });
          // 注册成功后跳转到登录页面
          router.replaceUrl({ url: 'pages/Denglu' });
        } else {
          console.error('注册失败:', result.message);
          promptAction.showToast({ message: `注册失败: ${result.message}`, duration: 2000 });
        }
      } else if (response.responseCode === 409) {
        console.error('注册失败: 用户名已存在');
        promptAction.showToast({ message: '用户名已存在，请更换账号', duration: 2000 });
      } else {
        console.error('注册请求失败:', response.responseCode);
        promptAction.showToast({ message: `注册请求失败: ${response.responseCode}`, duration: 2000 });
      }
    } catch (error) {
      console.error('注册请求失败:', error);
      promptAction.showToast({ message: `注册请求失败: ${error}`, duration: 2000 });
    }
  }

  // 倒计时逻辑：60 秒为例
  startCountDown() {
    this.countDown = 60;
    this.timer = setInterval(() => {
      if (this.countDown > 0) {
        this.countDown--;
      } else {
        // 倒计时结束，清除定时器
        clearInterval(this.timer);
        this.countDown = -1;
      }
    }, 1000);

    // 可在此补充：调用后端接口发送真实验证码
    console.log('向手机号 ' + this.phoneNumber + ' 发送验证码');
  }

  // 页面销毁时清除定时器，避免内存泄漏
  aboutToDisappear() {
    if (this.timer) {
      clearInterval(this.timer);
    }
  }
}