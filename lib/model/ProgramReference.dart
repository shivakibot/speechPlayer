/// プログラムの実行履歴やれコメント情報を蓄える必要がある？
class ProgramReference{
//  static final ProgramReference ref = ProgramReference.internal();
//  ProgramReference.internal();
//  factory ProgramReference(){
//    return ref;
//  }
  static final String assetRoot = 'assets/';
  static final String preFixMedia = 'speech';
  static final String preFixDraft = 'draft';
  static final String preFixImg = 'image';

  static _numberDir(int index){
    if(index < 10 && index > -1){
      return '0$index/';
    }else if(index > 9 && index < 100){
      return '$index/';
    }
  }
  static String storyPath(int index){
//    debugPrint('$assetRoot${_numberDir(index)}');
    return '$assetRoot${_numberDir(index)}';
  }
//  static String mediaPath(int index){
//    return '$assetRoot${_numberDir(index)}$postFixMedia';
//  }
//  static String draftPath(int index){
//    return '$assetRoot${_numberDir(index)}$postFixDraft';
//  }
//  static String imgPath(int index){
//    return '$assetRoot${_numberDir(index)}$postFixImg';
//  }
}

enum ProgramList{
  AKUTAGAWA01,
  NATSUME01,
  MIYAZAWA01,
}

extension ProgramTitle on ProgramList{
  static final titles ={
    ProgramList.AKUTAGAWA01: '人間失格',
    ProgramList.NATSUME01: 'こころ',
    ProgramList.MIYAZAWA01: '銀河鉄道の夜',
  };
  String get title => titles[this];
}

extension ProgramAuthor on ProgramList{
  static final authors ={
    ProgramList.AKUTAGAWA01: '芥川龍之介',
    ProgramList.NATSUME01: '夏目漱石',
    ProgramList.MIYAZAWA01: '宮沢賢治',
  };
  String get author => authors[this];
}