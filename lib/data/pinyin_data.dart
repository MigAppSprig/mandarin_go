import '../models/pinyin.dart';

/// Pinyin teaching content: the four tones (+ neutral), 23 initials and
/// 24 finals, plus the most important tone-change rules.
class PinyinData {
  PinyinData._();

  static const List<Tone> tones = <Tone>[
    Tone(
      number: 1,
      diacritic: '¯',
      englishName: 'First tone',
      chineseName: '阴平',
      contour: '5 → 5 (high and level)',
      description:
          'A steady, high pitch — like singing a sustained note. Keep your voice high and flat.',
      exampleSyllable: 'mā',
      exampleHanzi: '妈',
      exampleMeaning: 'mother',
    ),
    Tone(
      number: 2,
      diacritic: '´',
      englishName: 'Second tone',
      chineseName: '阳平',
      contour: '3 → 5 (rising)',
      description:
          'Rises from the middle to the top of your range — like the rising intonation of an English question.',
      exampleSyllable: 'má',
      exampleHanzi: '麻',
      exampleMeaning: 'hemp',
    ),
    Tone(
      number: 3,
      diacritic: 'ˇ',
      englishName: 'Third tone',
      chineseName: '上声',
      contour: '2 → 1 → 4 (dipping)',
      description:
          'Dips down low and then rises. Spoken in isolation it is a full dip-and-rise; in fast speech it is often just the low part.',
      exampleSyllable: 'mǎ',
      exampleHanzi: '马',
      exampleMeaning: 'horse',
    ),
    Tone(
      number: 4,
      diacritic: '`',
      englishName: 'Fourth tone',
      chineseName: '去声',
      contour: '5 → 1 (falling)',
      description:
          'Falls sharply from high to low — like an emphatic, forceful "No!" in English.',
      exampleSyllable: 'mà',
      exampleHanzi: '骂',
      exampleMeaning: 'to scold',
    ),
    Tone(
      number: 0,
      diacritic: '·',
      englishName: 'Neutral tone',
      chineseName: '轻声',
      contour: 'light and short',
      description:
          'Unstressed and brief. It has no fixed pitch — it takes its height from the tone before it.',
      exampleSyllable: 'ma',
      exampleHanzi: '吗',
      exampleMeaning: 'question particle',
    ),
  ];

  static const List<Initial> initials = <Initial>[
    Initial(symbol: 'b', hint: "like 'b' in bay (unaspirated)", examples: [
      SyllableExample(syllable: 'bā', hanzi: '八', meaning: 'eight'),
      SyllableExample(syllable: 'bà', hanzi: '爸', meaning: 'dad'),
    ]),
    Initial(symbol: 'p', hint: "like 'p' in pay (with a puff of air)", examples: [
      SyllableExample(syllable: 'pà', hanzi: '怕', meaning: 'to fear'),
      SyllableExample(syllable: 'pǎo', hanzi: '跑', meaning: 'to run'),
    ]),
    Initial(symbol: 'm', hint: "like 'm' in may", examples: [
      SyllableExample(syllable: 'mā', hanzi: '妈', meaning: 'mom'),
      SyllableExample(syllable: 'mǎ', hanzi: '马', meaning: 'horse'),
    ]),
    Initial(symbol: 'f', hint: "like 'f' in far", examples: [
      SyllableExample(syllable: 'fēi', hanzi: '飞', meaning: 'to fly'),
      SyllableExample(syllable: 'fàn', hanzi: '饭', meaning: 'rice, meal'),
    ]),
    Initial(symbol: 'd', hint: "like 'd' in day (unaspirated)", examples: [
      SyllableExample(syllable: 'dà', hanzi: '大', meaning: 'big'),
      SyllableExample(syllable: 'dì', hanzi: '弟', meaning: 'younger brother'),
    ]),
    Initial(symbol: 't', hint: "like 't' in tea (aspirated)", examples: [
      SyllableExample(syllable: 'tā', hanzi: '他', meaning: 'he'),
      SyllableExample(syllable: 'tīng', hanzi: '听', meaning: 'to listen'),
    ]),
    Initial(symbol: 'n', hint: "like 'n' in no", examples: [
      SyllableExample(syllable: 'nǐ', hanzi: '你', meaning: 'you'),
      SyllableExample(syllable: 'nǎ', hanzi: '哪', meaning: 'which'),
    ]),
    Initial(symbol: 'l', hint: "like 'l' in low", examples: [
      SyllableExample(syllable: 'lái', hanzi: '来', meaning: 'to come'),
      SyllableExample(syllable: 'lǎo', hanzi: '老', meaning: 'old'),
    ]),
    Initial(symbol: 'g', hint: "like 'g' in go (unaspirated)", examples: [
      SyllableExample(syllable: 'gē', hanzi: '哥', meaning: 'older brother'),
      SyllableExample(syllable: 'gāo', hanzi: '高', meaning: 'tall, high'),
    ]),
    Initial(symbol: 'k', hint: "like 'k' in key (aspirated)", examples: [
      SyllableExample(syllable: 'kàn', hanzi: '看', meaning: 'to look'),
      SyllableExample(syllable: 'kāi', hanzi: '开', meaning: 'to open'),
    ]),
    Initial(symbol: 'h', hint: "like 'h' in hat, but more throaty", examples: [
      SyllableExample(syllable: 'hǎo', hanzi: '好', meaning: 'good'),
      SyllableExample(syllable: 'hē', hanzi: '喝', meaning: 'to drink'),
    ]),
    Initial(symbol: 'j', hint: "like 'j' in jeep, tongue near lower teeth", examples: [
      SyllableExample(syllable: 'jiā', hanzi: '家', meaning: 'home'),
      SyllableExample(syllable: 'jiào', hanzi: '叫', meaning: 'to be called'),
    ]),
    Initial(symbol: 'q', hint: "like 'ch' in cheese (aspirated)", examples: [
      SyllableExample(syllable: 'qù', hanzi: '去', meaning: 'to go'),
      SyllableExample(syllable: 'qǐng', hanzi: '请', meaning: 'please'),
    ]),
    Initial(symbol: 'x', hint: "like 'sh' in sheep, but softer", examples: [
      SyllableExample(syllable: 'xiǎo', hanzi: '小', meaning: 'small'),
      SyllableExample(syllable: 'xué', hanzi: '学', meaning: 'to learn'),
    ]),
    Initial(symbol: 'zh', hint: "like 'j' in jump, tongue curled back", examples: [
      SyllableExample(syllable: 'zhōng', hanzi: '中', meaning: 'middle'),
      SyllableExample(syllable: 'zhè', hanzi: '这', meaning: 'this'),
    ]),
    Initial(symbol: 'ch', hint: "like 'ch' in church, tongue curled back", examples: [
      SyllableExample(syllable: 'chī', hanzi: '吃', meaning: 'to eat'),
      SyllableExample(syllable: 'chá', hanzi: '茶', meaning: 'tea'),
    ]),
    Initial(symbol: 'sh', hint: "like 'sh' in shoe, tongue curled back", examples: [
      SyllableExample(syllable: 'shì', hanzi: '是', meaning: 'to be'),
      SyllableExample(syllable: 'shuǐ', hanzi: '水', meaning: 'water'),
    ]),
    Initial(symbol: 'r', hint: "like 'r' in red, tongue curled back", examples: [
      SyllableExample(syllable: 'rén', hanzi: '人', meaning: 'person'),
      SyllableExample(syllable: 'rè', hanzi: '热', meaning: 'hot'),
    ]),
    Initial(symbol: 'z', hint: "like 'ds' in beds (unaspirated)", examples: [
      SyllableExample(syllable: 'zài', hanzi: '在', meaning: 'at, in'),
      SyllableExample(syllable: 'zǎo', hanzi: '早', meaning: 'early'),
    ]),
    Initial(symbol: 'c', hint: "like 'ts' in cats (aspirated)", examples: [
      SyllableExample(syllable: 'cài', hanzi: '菜', meaning: 'dish'),
      SyllableExample(syllable: 'cì', hanzi: '次', meaning: 'time (occurrence)'),
    ]),
    Initial(symbol: 's', hint: "like 's' in see", examples: [
      SyllableExample(syllable: 'sān', hanzi: '三', meaning: 'three'),
      SyllableExample(syllable: 'sì', hanzi: '四', meaning: 'four'),
    ]),
    Initial(symbol: 'y', hint: "like 'y' in yes", examples: [
      SyllableExample(syllable: 'yī', hanzi: '一', meaning: 'one'),
      SyllableExample(syllable: 'yǒu', hanzi: '有', meaning: 'to have'),
    ]),
    Initial(symbol: 'w', hint: "like 'w' in we", examples: [
      SyllableExample(syllable: 'wǒ', hanzi: '我', meaning: 'I, me'),
      SyllableExample(syllable: 'wǔ', hanzi: '五', meaning: 'five'),
    ]),
  ];

  static const List<Final> finals = <Final>[
    // Simple finals
    Final(symbol: 'a', group: 'simple', hint: "like 'a' in father", examples: [
      SyllableExample(syllable: 'bā', hanzi: '八', meaning: 'eight'),
      SyllableExample(syllable: 'mā', hanzi: '妈', meaning: 'mom'),
    ]),
    Final(symbol: 'o', group: 'simple', hint: "like 'or' with rounded lips", examples: [
      SyllableExample(syllable: 'wǒ', hanzi: '我', meaning: 'I, me'),
      SyllableExample(syllable: 'bō', hanzi: '波', meaning: 'wave'),
    ]),
    Final(symbol: 'e', group: 'simple', hint: "like 'u' in fur, without the r", examples: [
      SyllableExample(syllable: 'hē', hanzi: '喝', meaning: 'to drink'),
      SyllableExample(syllable: 'è', hanzi: '饿', meaning: 'hungry'),
    ]),
    Final(symbol: 'i', group: 'simple', hint: "like 'ee' in see", examples: [
      SyllableExample(syllable: 'yī', hanzi: '一', meaning: 'one'),
      SyllableExample(syllable: 'nǐ', hanzi: '你', meaning: 'you'),
    ]),
    Final(symbol: 'u', group: 'simple', hint: "like 'oo' in food", examples: [
      SyllableExample(syllable: 'wǔ', hanzi: '五', meaning: 'five'),
      SyllableExample(syllable: 'shū', hanzi: '书', meaning: 'book'),
    ]),
    Final(symbol: 'ü', group: 'simple', hint: "like French 'u' in tu: say 'ee' with rounded lips", examples: [
      SyllableExample(syllable: 'nǚ', hanzi: '女', meaning: 'woman'),
      SyllableExample(syllable: 'lǜ', hanzi: '绿', meaning: 'green'),
    ]),
    // Compound finals
    Final(symbol: 'ai', group: 'compound', hint: "like 'eye'", examples: [
      SyllableExample(syllable: 'ài', hanzi: '爱', meaning: 'love'),
      SyllableExample(syllable: 'mǎi', hanzi: '买', meaning: 'to buy'),
    ]),
    Final(symbol: 'ei', group: 'compound', hint: "like 'ay' in say", examples: [
      SyllableExample(syllable: 'bēi', hanzi: '杯', meaning: 'cup'),
      SyllableExample(syllable: 'měi', hanzi: '美', meaning: 'beautiful'),
    ]),
    Final(symbol: 'ui', group: 'compound', hint: "like 'way'", examples: [
      SyllableExample(syllable: 'shuǐ', hanzi: '水', meaning: 'water'),
      SyllableExample(syllable: 'guì', hanzi: '贵', meaning: 'expensive'),
    ]),
    Final(symbol: 'ao', group: 'compound', hint: "like 'ow' in now", examples: [
      SyllableExample(syllable: 'hǎo', hanzi: '好', meaning: 'good'),
      SyllableExample(syllable: 'māo', hanzi: '猫', meaning: 'cat'),
    ]),
    Final(symbol: 'ou', group: 'compound', hint: "like 'oh'", examples: [
      SyllableExample(syllable: 'kǒu', hanzi: '口', meaning: 'mouth'),
      SyllableExample(syllable: 'yǒu', hanzi: '有', meaning: 'to have'),
    ]),
    Final(symbol: 'iu', group: 'compound', hint: "like 'yo'", examples: [
      SyllableExample(syllable: 'jiǔ', hanzi: '九', meaning: 'nine'),
      SyllableExample(syllable: 'liù', hanzi: '六', meaning: 'six'),
    ]),
    Final(symbol: 'ie', group: 'compound', hint: "like 'ye' in yes", examples: [
      SyllableExample(syllable: 'xiě', hanzi: '写', meaning: 'to write'),
      SyllableExample(syllable: 'jiě', hanzi: '姐', meaning: 'older sister'),
    ]),
    Final(symbol: 'üe', group: 'compound', hint: "say 'ü' then slide to 'e'", examples: [
      SyllableExample(syllable: 'xué', hanzi: '学', meaning: 'to learn'),
      SyllableExample(syllable: 'yuè', hanzi: '月', meaning: 'month'),
    ]),
    Final(symbol: 'er', group: 'compound', hint: "like 'ar' in bar with a curled tongue", examples: [
      SyllableExample(syllable: 'èr', hanzi: '二', meaning: 'two'),
      SyllableExample(syllable: 'ér', hanzi: '儿', meaning: 'child'),
    ]),
    // Nasal finals
    Final(symbol: 'an', group: 'nasal', hint: "like 'an' in can, with an open a", examples: [
      SyllableExample(syllable: 'sān', hanzi: '三', meaning: 'three'),
      SyllableExample(syllable: 'kàn', hanzi: '看', meaning: 'to look'),
    ]),
    Final(symbol: 'en', group: 'nasal', hint: "like 'un' in fun", examples: [
      SyllableExample(syllable: 'rén', hanzi: '人', meaning: 'person'),
      SyllableExample(syllable: 'běn', hanzi: '本', meaning: 'volume (of books)'),
    ]),
    Final(symbol: 'in', group: 'nasal', hint: "like 'in' in pin", examples: [
      SyllableExample(syllable: 'nín', hanzi: '您', meaning: 'you (polite)'),
      SyllableExample(syllable: 'xīn', hanzi: '新', meaning: 'new'),
    ]),
    Final(symbol: 'un', group: 'nasal', hint: "like 'wen'", examples: [
      SyllableExample(syllable: 'chūn', hanzi: '春', meaning: 'spring'),
      SyllableExample(syllable: 'wén', hanzi: '文', meaning: 'language, writing'),
    ]),
    Final(symbol: 'ün', group: 'nasal', hint: "say 'ü' then nasal n", examples: [
      SyllableExample(syllable: 'yún', hanzi: '云', meaning: 'cloud'),
      SyllableExample(syllable: 'jūn', hanzi: '军', meaning: 'army'),
    ]),
    Final(symbol: 'ang', group: 'nasal', hint: "like 'ong' in song, with an open a", examples: [
      SyllableExample(syllable: 'bāng', hanzi: '帮', meaning: 'to help'),
      SyllableExample(syllable: 'cháng', hanzi: '长', meaning: 'long'),
    ]),
    Final(symbol: 'eng', group: 'nasal', hint: "like 'ung' in sung", examples: [
      SyllableExample(syllable: 'lěng', hanzi: '冷', meaning: 'cold'),
      SyllableExample(syllable: 'péng', hanzi: '朋', meaning: 'friend'),
    ]),
    Final(symbol: 'ing', group: 'nasal', hint: "like 'ing' in sing", examples: [
      SyllableExample(syllable: 'qǐng', hanzi: '请', meaning: 'please'),
      SyllableExample(syllable: 'xīng', hanzi: '星', meaning: 'star'),
    ]),
    Final(symbol: 'ong', group: 'nasal', hint: "like 'oong' with rounded lips", examples: [
      SyllableExample(syllable: 'zhōng', hanzi: '中', meaning: 'middle'),
      SyllableExample(syllable: 'gōng', hanzi: '工', meaning: 'work'),
    ]),
  ];

  static List<Final> finalsInGroup(String group) =>
      finals.where((f) => f.group == group).toList();

  static const List<String> finalGroups = ['simple', 'compound', 'nasal'];

  /// 声母呼读音 (how an initial is pronounced on its own).
  ///
  /// A bare consonant can't be spoken, so Chinese teachers read each initial
  /// with a helper vowel: b → "bo", p → "po", zh → "zhi", etc. The map value
  /// is the representative character (for TTS) plus its tone-marked pinyin.
  static const Map<String, ({String hanzi, String pinyin})> initialSounds = {
    'b': (hanzi: '玻', pinyin: 'bō'),
    'p': (hanzi: '坡', pinyin: 'pō'),
    'm': (hanzi: '摸', pinyin: 'mō'),
    'f': (hanzi: '佛', pinyin: 'fó'),
    'd': (hanzi: '德', pinyin: 'dé'),
    't': (hanzi: '特', pinyin: 'tè'),
    'n': (hanzi: '讷', pinyin: 'nè'),
    'l': (hanzi: '勒', pinyin: 'lè'),
    'g': (hanzi: '哥', pinyin: 'gē'),
    'k': (hanzi: '科', pinyin: 'kē'),
    'h': (hanzi: '喝', pinyin: 'hē'),
    'j': (hanzi: '基', pinyin: 'jī'),
    'q': (hanzi: '欺', pinyin: 'qī'),
    'x': (hanzi: '希', pinyin: 'xī'),
    'zh': (hanzi: '知', pinyin: 'zhī'),
    'ch': (hanzi: '吃', pinyin: 'chī'),
    'sh': (hanzi: '诗', pinyin: 'shī'),
    'r': (hanzi: '日', pinyin: 'rì'),
    'z': (hanzi: '资', pinyin: 'zī'),
    'c': (hanzi: '疵', pinyin: 'cī'),
    's': (hanzi: '思', pinyin: 'sī'),
    'y': (hanzi: '衣', pinyin: 'yī'),
    'w': (hanzi: '乌', pinyin: 'wū'),
  };

  /// 韵母本音 (how a final is pronounced on its own).
  ///
  /// Each final maps to a single syllable whose sound is exactly that final:
  /// a → "啊", ang → "昂", ü → "迂", etc.
  static const Map<String, ({String hanzi, String pinyin})> finalSounds = {
    'a': (hanzi: '阿', pinyin: 'ā'),
    'o': (hanzi: '噢', pinyin: 'ō'),
    'e': (hanzi: '鹅', pinyin: 'é'),
    'i': (hanzi: '衣', pinyin: 'yī'),
    'u': (hanzi: '乌', pinyin: 'wū'),
    'ü': (hanzi: '迂', pinyin: 'yū'),
    'ai': (hanzi: '哀', pinyin: 'āi'),
    'ei': (hanzi: '诶', pinyin: 'ēi'),
    'ui': (hanzi: '威', pinyin: 'wēi'),
    'ao': (hanzi: '凹', pinyin: 'āo'),
    'ou': (hanzi: '欧', pinyin: 'ōu'),
    'iu': (hanzi: '优', pinyin: 'yōu'),
    'ie': (hanzi: '耶', pinyin: 'yē'),
    'üe': (hanzi: '约', pinyin: 'yuē'),
    'er': (hanzi: '儿', pinyin: 'ér'),
    'an': (hanzi: '安', pinyin: 'ān'),
    'en': (hanzi: '恩', pinyin: 'ēn'),
    'in': (hanzi: '因', pinyin: 'yīn'),
    'un': (hanzi: '温', pinyin: 'wēn'),
    'ün': (hanzi: '氲', pinyin: 'yūn'),
    'ang': (hanzi: '肮', pinyin: 'āng'),
    'eng': (hanzi: '亨', pinyin: 'hēng'),
    'ing': (hanzi: '英', pinyin: 'yīng'),
    'ong': (hanzi: '翁', pinyin: 'wēng'),
  };

  /// Short, learner-friendly explanations of the main tone-change rules.
  static const List<Map<String, String>> toneRules = <Map<String, String>>[
    {
      'title': 'Third-tone sandhi',
      'rule':
          'When two third-tone syllables appear together, the first one is pronounced as a second tone. 你好 (nǐ hǎo) is actually said "ní hǎo".',
    },
    {
      'title': '不 (bù) changes tone',
      'rule':
          '不 is fourth tone, but before another fourth-tone syllable it changes to second tone: 不是 → "bú shì", 不对 → "bú duì".',
    },
    {
      'title': '一 (yī) changes tone',
      'rule':
          '一 is first tone alone, but becomes fourth tone before first/second/third tones (一天 yì tiān) and second tone before a fourth tone (一个 yí gè).',
    },
    {
      'title': 'Where to put the tone mark',
      'rule':
          'Put the mark on a, o or e if present; otherwise on the last vowel. For iu and ui the mark goes on the last letter: liù, shuǐ.',
    },
    {
      'title': 'Neutral tone',
      'rule':
          'Many grammatical particles and the second syllable of many two-syllable words are unstressed: 谢谢 xièxie, 妈妈 māma, 吗 ma.',
    },
  ];
}
