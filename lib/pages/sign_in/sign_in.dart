import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_news/common/apis/apis.dart';
import 'package:flutter_news/common/entitys/entitys.dart';
import 'package:flutter_news/common/widgets/button.dart';
import 'package:flutter_news/common/widgets/input.dart';
import 'package:flutter_news/common/widgets/widgets.dart';
import 'package:flutter_news/common/utils/screen.dart';
import 'package:flutter_news/common/utils/utils.dart';
import 'package:flutter_news/common/values/colors.dart';
import 'package:flutter_news/common/values/values.dart';
import 'package:flutter_news/global.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //密码的控制器
  final TextEditingController _passController = TextEditingController();
  // 跳转 注册界面
  _handleNavSignUp() {
    Navigator.pushNamed(context, "/sign-up");
  }

  // 执行登录操作
  _handleSignIn() async {
    String _emailText = _emailController.value.text;
    String _passText = _passController.value.text;
    if (!duIsEmail(_emailText)) {
      toastInfo(msg: '请正确输入邮箱');
      return;
    }
    if (!duCheckStringLength(_passText, 6)) {
      toastInfo(msg: '密码不能小于6位');
      return;
    }

    UserLoginRequestEntity params = UserLoginRequestEntity(
        email: _emailText, password: duSHA256(_passText));
    UserLoginResponseEntity res = await UserAPI.login(params: params);
    Global.saveProfile(res);
    Navigator.pushNamed(
      context,
      '/app',
    );
  }

  // logo
  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      // color: Colors.red,
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: duSetWidth(76),
            width: duSetWidth(76),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    left: duSetWidth((110 - 76) / 2),
                    top: 0,
                    child: Container(
                      height: duSetWidth(76),
                      width: duSetWidth(76),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBackground,
                        boxShadow: [Shadows.primaryShadow],
                        borderRadius: BorderRadius.all(
                            Radius.circular(duSetWidth(76 * 0.5))),
                      ),
                    )),
                Positioned(
                  top: duSetWidth(13),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          inputTextEdit(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              marginTop: 0),
          // password input
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),
          Container(
            height: duSetHeight(44),
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: Row(
              children: [
                btnFlatButtonWidget(
                    onPressed: _handleNavSignUp,
                    gbColor: AppColors.thirdElement,
                    title: "Sign up"),
                Spacer(),
                btnFlatButtonWidget(
                  onPressed: () => _handleSignIn(),
                  gbColor: AppColors.primaryElement,
                  title: "Sign in",
                ),
              ],
            ),
          ),
          Container(
            height: duSetHeight(22),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: Text(
              "Fogot password?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: duSetFontSize(16),
                height: 1, // 设置下行高，否则字体下沉
              ),
            ),
          )
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/sign-up",
          );
        },
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // 避免键盘挡住输入框
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Center(
            child: Column(
              children: <Widget>[
                _buildLogo(),
                _buildInputForm(),
                Spacer(),
                _buildThirdPartyLogin(),
                _buildSignupButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
