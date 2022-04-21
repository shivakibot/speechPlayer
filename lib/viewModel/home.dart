import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:r3speechplayer/model/ProgramReference.dart';
import 'package:r3speechplayer/model/home.dart';
import 'package:r3speechplayer/model/program.dart';
import 'package:state_notifier/state_notifier.dart';

class HomeVM extends StateNotifier<HomeM> with LocatorMixin{
  HomeVM() : super(HomeM());

  @override
  void initState() {
    super.initState();
    debugPrint('initState HomeVM');
  }

  void init(Map<String, dynamic> manifestMap) async{
//    debugPrint('init HomeVM');
//    debugPrint('$manifestMap');
    List<String> dirList;
    List<ProgramModel> programs = [];
    List<String> content;
    String original;
    /// 取得したAssets のマップから対象のkey のディレクトリリストを生成
    await Future.forEach<ProgramList>(ProgramList.values, (program) async{
//      debugPrint('ProgramList forEach $program');
      dirList = manifestMap.keys.where((String key) => key.contains(ProgramReference.storyPath(program.index))).toList();
//      debugPrint('$program result $dirList');
      if(dirList.length == 3){
        dirList.sort((a, b) => a.length.compareTo(b.length));
//        debugPrint('$program sort $dirList');
        //// image => speech => content の順番になる気がする
        /// 字数カウントしておく。
        original = await rootBundle.loadString('${dirList[2]}');
        debugPrint('${program.title}.add ${original.length}');
        content = original.split('\r\n').toList();
        programs.add(ProgramModel(title: program.title, author: program.author, imagePath: dirList[0], mediaPath: dirList[1], content: content, original: original));
//        debugPrint('programs.add $program');
      }
    });
//    debugPrint('list $programs');
    state = state.copyWith(programs: programs);
  }
}