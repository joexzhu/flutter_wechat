import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_wechat/constant/cache_key.dart';

import 'package:flutter_wechat/model/common/common_item.dart';
import 'package:flutter_wechat/model/common/common_group.dart';
import 'package:flutter_wechat/model/common/common_footer.dart';
import 'package:flutter_wechat/model/common/common_header.dart';

import 'package:flutter_wechat/widgets/common/common_group_widget.dart';

import 'package:flutter_wechat/views/profile/add_way/add_way_page.dart';
import 'package:flutter_wechat/views/profile/binding_mailbox/binding_mailbox_page.dart';

/// 账号与安全
class MoreSecuritySettingPage extends StatefulWidget {
  MoreSecuritySettingPage({Key key}) : super(key: key);

  _MoreSecuritySettingPageState createState() =>
      _MoreSecuritySettingPageState();
}

class _MoreSecuritySettingPageState extends State<MoreSecuritySettingPage> {
  /// 数据源
  List<CommonGroup> _dataSource = [];

  @override
  void initState() {
    super.initState();

    // 配置数据源
    _configData();
  }

  /// 配置数据
  _configData() {
    // group0
    // QQ号
    final password = CommonItem(
      title: "QQ号",
      subtitle: '491273090',
    );
    // 邮箱地址
    final voiceLock = CommonItem(
      title: "邮箱地址",
      subtitle: '未绑定',
      onTap: (_) {
        Navigator.of(context).push(new MaterialPageRoute(
          builder: (_) {
            return BindingMailboxPage();
          },
        ));
      },
    );
    final group0 = CommonGroup(
      items: [
        password,
        voiceLock,
      ],
    );

    // 添加数据源
    _dataSource = [group0];
  }

  // 构建 child 的小部件
  Widget _buildChildWidget(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: _dataSource.length,
      itemBuilder: (BuildContext context, int index) {
        return CommonGroupWidget(
          group: _dataSource[index],
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更多安全设置'),
      ),
      body: Container(
        child: _buildChildWidget(context),
      ),
    );
  }
}
