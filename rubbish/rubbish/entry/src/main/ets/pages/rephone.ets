import { router } from '@kit.ArkUI';
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';

// 定义接口类型
interface UserData {
  id: number;
  username: string;
  password: string;
  phone: string;
  create_time: string;
}

interface ApiResponse {
  code: number;
  message: string;
  data?: UserData;
}

interface UpdatePhoneResponse {
  code: number;
  message: string;
}

@Entry
@Component
struct Rephone {
  @State phoneNumber: string = ''; // 从数据库获取的原手机号
  @State verificationCode: string = '';
  @State newPhoneNumber: string = '';
  @State countdown: number = 60;
  @State timerActive: boolean = false;
  @State isLoading: boolean = false;
  @State userId: number = 1; // 当前用户ID，实际应用中应该从登录状态获取

  // 后端服务器地址
  private serverUrl: string = 'http://192.168.43.37:8080';

  // 页面加载时获取用户数据
  aboutToAppear() {
    this.getUserData();
  }

  // 从数据库获取用户数据
  async getUserData(): Promise<void> {
    try {
      this.isLoading = true;
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        `${this.serverUrl}/api/user/${this.userId}`,
        {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json',
          },
        }
      );

      if (response.responseCode === 200) {
        const result: ApiResponse = JSON.parse(response.result.toString());
        if (result.code === 0 && result.data) {
          this.phoneNumber = result.data.phone || '未设置';
          console.info('获取用户数据成功');
        } else {
          promptAction.showToast({ message: `获取用户数据失败: ${result.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      httpRequest.destroy();
    } catch (error) {
      console.error('获取用户数据失败:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    } finally {
      this.isLoading = false;
    }
  }

  // 更新手机号
  async updatePhoneNumber(): Promise<void> {
    try {
      this.isLoading = true;
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        `${this.serverUrl}/api/user/${this.userId}/phone`,
        {
          method: http.RequestMethod.PUT,
          header: {
            'Content-Type': 'application/json',
          },
          extraData: JSON.stringify({
            phone: this.newPhoneNumber
          }),
        }
      );

      if (response.responseCode === 200) {
        const result: UpdatePhoneResponse = JSON.parse(response.result.toString());
        if (result.code === 0) {
          promptAction.showToast({ message: '手机号修改成功', duration: 2000 });
          // 更新本地显示的手机号
          this.phoneNumber = this.newPhoneNumber;
          this.newPhoneNumber = '';
          this.verificationCode = '';
          console.info('手机号修改成功');
        } else {
          promptAction.showToast({ message: `修改失败: ${result.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `修改请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      httpRequest.destroy();
    } catch (error) {
      console.error('修改手机号失败:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    } finally {
      this.isLoading = false;
    }
  }

  startCountdown() {
    if (this.timerActive) return;

    this.timerActive = true;
    this.countdown = 60;

    let timer = setInterval(() => {
      this.countdown -= 1;
      if (this.countdown <= 0) {
        clearInterval(timer);
        this.timerActive = false;
      }
    }, 1000);
  }

  submitForm() {
    // 验证码不能为空
    if (!this.verificationCode || this.verificationCode.trim() === '') {
      promptAction.showToast({ message: '验证码不能为空', duration: 2000 });
      return;
    }

    // 新手机号不能为空
    if (!this.newPhoneNumber || this.newPhoneNumber.trim() === '') {
      promptAction.showToast({ message: '新手机号不能为空', duration: 2000 });
      return;
    }

    // 验证手机号格式（简单验证11位数字）
    if (!/^\d{11}$/.test(this.newPhoneNumber)) {
      promptAction.showToast({ message: '请输入正确的11位手机号', duration: 2000 });
      return;
    }

    // 验证码格式验证（6位数字）
    if (!/^\d{6}$/.test(this.verificationCode)) {
      promptAction.showToast({ message: '请输入6位数字验证码', duration: 2000 });
      return;
    }

    // 提交修改
    this.updatePhoneNumber();
  }

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Image($r('app.media.return'))
          .width(24)
          .height(24)
          .onClick(() => {
            router.back()
          })
          .margin({ left: 12, top: 30 })

        Text('手机号码修改')
          .fontSize(25)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12, top: 30 })

        Blank()

        Button('提交')
          .fontSize(18)
          .fontColor('#FFFFFF')
          .backgroundColor(Color.Transparent)
          .borderWidth(0)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.submitForm()
          })
          .margin({ right: 12, top: 30 })
      }
      .width('100%')
      .height(85)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#2BCDDD')
      .justifyContent(FlexAlign.SpaceBetween)

      // 表单区域
      Column() {
        // 原手机号行
        Row() {
          Text('原手机号')
            .fontSize(18)
            .fontColor('#000000')

          if (this.isLoading) {
            Text('加载中...')
              .fontSize(18)
              .fontColor('#666666')
              .margin({ left: 15 })
          } else {
            Text(this.phoneNumber)
              .fontSize(18)
              .fontColor('#666666')
              .margin({ left: 15 })
          }

          Blank()

          Button(this.timerActive ? `${this.countdown}秒后重发` : '发送验证码')
            .fontSize(16)
            .fontColor('#FF0000')
            .backgroundColor(Color.Transparent)
            .borderWidth(0)
            .onClick(() => {
              if (!this.timerActive) {
                this.startCountdown()
                promptAction.showToast({ message: '验证码已发送', duration: 2000 });
              }
            })
        }
        .width('100%')
        .height(60)
        .padding({ left: 20, right: 20 })
        .backgroundColor('#FFFFFF')

        Divider()
          .strokeWidth(1)         // 线宽为1px
          .color('#E0E0E0')       // 浅灰色线条
          .margin({ left: 20, right: 20 })

        // 验证码输入行
        Row() {
          Text('验证码')
            .fontSize(18)
            .fontColor('#000000')

          TextInput({ placeholder: '请输入6位验证码' })
            .fontSize(18)
            .fontColor('#999999')
            .placeholderColor('#CCC9C9')
            .margin({ left: 15 })
            .maxLength(6)
            .layoutWeight(1)
            .backgroundColor('#FFFFFF')
            .type(InputType.Number)
            .onChange((value: string) => {
              this.verificationCode = value
            })
        }
        .width('100%')
        .height(60)
        .padding({ left: 20, right: 20 })
        .backgroundColor('#FFFFFF')

        Divider()
          .strokeWidth(1)         // 线宽为1px
          .color('#E0E0E0')
          .margin({ left: 20, right: 20 })// 浅灰色线条

        // 新手机号输入行
        Row() {
          Text('新手机号')
            .fontSize(18)
            .fontColor('#000000')

          TextInput({ placeholder: '请输入新手机号' })
            .fontSize(18)
            .margin({ left: 15 })
            .fontColor('#999999')
            .placeholderColor('#CCC9C9')
            .layoutWeight(1)
            .type(InputType.Number)
            .maxLength(11)
            .backgroundColor('#FFFFFF')
            .onChange((value: string) => {
              this.newPhoneNumber = value
            })
        }
        .width('100%')
        .height(60)
        .padding({ left: 20, right: 20 })
        .backgroundColor('#FFFFFF')
      }
      .width('90%')
      .padding({ top: 20, bottom: 10 })
    }
    .backgroundColor('#ECFDFA')
    .width('100%')
    .height('100%')
  }
}