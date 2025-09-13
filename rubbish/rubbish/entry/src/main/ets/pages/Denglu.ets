import { router } from '@kit.ArkUI';
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';


// 定义登录响应接口
interface LoginResponse {
  code: number;
  message: string;
}

@Entry
@Component
struct Denglu {
  @State username: string = '';
  @State password: string = '';
  private serverUrl: string = 'http://192.168.32.1:8080';

  build() {
    Column() {
      Stack() {
        // 背景区域（保持不变）
        Column() {
          Column() {
            Text('登录')
              .fontSize(30)
              .fontColor('#FFFFFF')
              .textAlign(TextAlign.Start)
              .width('100%')
              .padding({ left: 40, top: 40 });
          }
          .backgroundColor('#2BCDDC')
          .borderRadius(15)
          .width('100%')
          .height('35%');

          Column() {}.backgroundColor('#EBFCF9').width('100%').height('80%');
        }

        // 悬浮表单区域（保持不变）
        Column() {
          Image($r('app.media.denglu'))
            .width(60)
            .height(60)
            .margin({ bottom: 20 });

          Column({ space: 20 }) {
            TextInput({ placeholder: '请输入用户名' })
              .fontSize(16)
              .padding(12)
              .backgroundColor('#ECFCF9')
              .borderRadius(8)
              .onChange((value) => this.username = value);

            TextInput({ placeholder: '请输入密码' })
              .fontSize(16)
              .padding(12)
              .backgroundColor('#ECFCF9')
              .borderRadius(8)
              .type(InputType.Password) // 修正：明确导入 InputType
              .onChange((value) => this.password = value);
          }
          .height('10%')
          .width('100%')
          .margin({ bottom: 15 });

          Column({space:10}) {
            // 协议区域
            Row() {
              Text('登录及表示同意')
                .fontColor('#CCCCCF')
                .fontSize(13);
              Text('《用户登录协议》')
                .fontColor('#FF5E81')
                .fontSize(13);
            }
            .margin({ top: 50, right: 50 });
            Row(){
              // 注册跳转
              Text('如果没有账号请先')
                .fontColor('#CCCCCF')
                .fontSize(13);
              Text('注册')
                .fontColor('#FF5E81')
                .fontSize(13)
                .onClick(() => router.replaceUrl({ url: 'pages/ZhuCePage' }));
            }
            .margin({right:115})
          }

          Column() {}.height('13%');

          // 登录按钮（修正存储逻辑）
          Column({ space: 20 }) {
            Button('登录')
              .width('100%')
              .height(50)
              .backgroundColor('#FF5E81')
              .fontColor('#FFFFFF')
              .borderRadius(25)
              .fontSize(18)
              .onClick(async () => {
                if (!this.username.trim()) {
                  promptAction.showToast({ message: '用户名不能为空' });
                  return;
                }
                if (!this.password.trim()) {
                  promptAction.showToast({ message: '密码不能为空' });
                  return;
                }

                try {
                  const response = await http.createHttp().request(
                    this.serverUrl + '/api/login',
                    {
                      method: http.RequestMethod.POST,
                      header: { 'Content-Type': 'application/json' },
                      extraData: JSON.stringify({
                        account: this.username,
                        password: this.password,
                      }),
                    }
                  );

                  if (response.responseCode === 200) {
                    const result: LoginResponse = JSON.parse(response.result.toString());
                    if (result.code === 0) {
                      // 修正：使用 AppStorage 全局对象，无需导入
                      AppStorage.SetOrCreate('currentUser', this.username); // 正确的存储方法
                      promptAction.showToast({ message: '登录成功' });
                      router.pushUrl({ url: 'pages/Index' });
                    } else {
                      promptAction.showToast({ message: result.message || '登录失败' });
                    }
                  } else {
                    promptAction.showToast({ message: '请求失败，状态码：' + response.responseCode });
                  }
                } catch (error) {
                  promptAction.showToast({ message: '网络错误，请重试' });
                  console.error('登录失败:', error);
                }
              });

            Button('取消')
              .width('100%')
              .height(50)
              .backgroundColor('#FFFFFF')
              .fontColor('#FF5E81')
              .border({ width: 1, color: '#FF69B4', radius: 25 })
              .borderRadius(25)
              .fontSize(18);
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor('#FFFFFF');
        }
        .padding(20)
        .backgroundColor('#ffffff')
        .width('80%')
        .borderRadius(30);
      }
    }
    .height('100%')
    .width('100%');
  }
}