import '../models/dialogue.dart';

/// Short, practical conversations for beginners.
///
/// Lines alternate between two speakers: even indexes are Person A
/// (marked with a red speaker chip), odd indexes are Person B (gold chip).
class DialogueData {
  DialogueData._();

  static const List<Dialogue> all = <Dialogue>[
    Dialogue(
      id: 'greetings',
      title: 'Greetings',
      subtitle: 'Saying hello and introducing yourself',
      emoji: '👋',
      lines: [
        DialogueLine(hanzi: '你好！', pinyin: 'Nǐ hǎo!', english: 'Hello!'),
        DialogueLine(
          hanzi: '你好！你好吗？',
          pinyin: 'Nǐ hǎo! Nǐ hǎo ma?',
          english: 'Hello! How are you?',
        ),
        DialogueLine(
          hanzi: '我很好，谢谢。你呢？',
          pinyin: 'Wǒ hěn hǎo, xièxie. Nǐ ne?',
          english: "I'm fine, thanks. And you?",
        ),
        DialogueLine(
          hanzi: '我也很好。',
          pinyin: 'Wǒ yě hěn hǎo.',
          english: "I'm fine too.",
        ),
        DialogueLine(
          hanzi: '你叫什么名字？',
          pinyin: 'Nǐ jiào shénme míngzi?',
          english: "What's your name?",
        ),
        DialogueLine(
          hanzi: '我叫大卫。',
          pinyin: 'Wǒ jiào Dàwèi.',
          english: 'My name is David.',
        ),
        DialogueLine(
          hanzi: '很高兴认识你。',
          pinyin: 'Hěn gāoxìng rènshi nǐ.',
          english: 'Nice to meet you.',
        ),
        DialogueLine(
          hanzi: '我也是。',
          pinyin: 'Wǒ yě shì.',
          english: 'Me too.',
        ),
      ],
    ),
    Dialogue(
      id: 'self-intro',
      title: 'Self-introduction',
      subtitle: 'Talking about where you are from',
      emoji: '🙋',
      lines: [
        DialogueLine(
          hanzi: '你好！我是安娜。',
          pinyin: 'Nǐ hǎo! Wǒ shì Ānnà.',
          english: "Hello! I'm Anna.",
        ),
        DialogueLine(
          hanzi: '你好，安娜。我是大卫。',
          pinyin: 'Nǐ hǎo, Ānnà. Wǒ shì Dàwèi.',
          english: "Hi Anna. I'm David.",
        ),
        DialogueLine(
          hanzi: '你是哪国人？',
          pinyin: 'Nǐ shì nǎ guó rén?',
          english: 'Which country are you from?',
        ),
        DialogueLine(
          hanzi: '我是英国人。你呢？',
          pinyin: 'Wǒ shì Yīngguó rén. Nǐ ne?',
          english: "I'm British. And you?",
        ),
        DialogueLine(
          hanzi: '我是美国人。',
          pinyin: 'Wǒ shì Měiguó rén.',
          english: "I'm American.",
        ),
        DialogueLine(
          hanzi: '你会说汉语吗？',
          pinyin: 'Nǐ huì shuō Hànyǔ ma?',
          english: 'Can you speak Chinese?',
        ),
        DialogueLine(
          hanzi: '我会说一点儿。',
          pinyin: 'Wǒ huì shuō yìdiǎnr.',
          english: 'I can speak a little.',
        ),
        DialogueLine(
          hanzi: '你学汉语多久了？',
          pinyin: 'Nǐ xué Hànyǔ duō jiǔ le?',
          english: 'How long have you studied Chinese?',
        ),
        DialogueLine(
          hanzi: '三个月。',
          pinyin: 'Sān gè yuè.',
          english: 'Three months.',
        ),
        DialogueLine(
          hanzi: '你学得很好！',
          pinyin: 'Nǐ xué de hěn hǎo!',
          english: "You're learning well!",
        ),
      ],
    ),
    Dialogue(
      id: 'ordering',
      title: 'Ordering food',
      subtitle: 'At a restaurant',
      emoji: '🍜',
      lines: [
        DialogueLine(
          hanzi: '欢迎光临！请坐。',
          pinyin: 'Huānyíng guānglín! Qǐng zuò.',
          english: 'Welcome! Please sit down.',
        ),
        DialogueLine(
          hanzi: '谢谢。请给我菜单。',
          pinyin: 'Xièxie. Qǐng gěi wǒ càidān.',
          english: 'Thanks. Please give me the menu.',
        ),
        DialogueLine(
          hanzi: '您想喝什么？',
          pinyin: 'Nín xiǎng hē shénme?',
          english: 'What would you like to drink?',
        ),
        DialogueLine(
          hanzi: '我要一杯茶。',
          pinyin: 'Wǒ yào yì bēi chá.',
          english: "I'd like a cup of tea.",
        ),
        DialogueLine(
          hanzi: '您想吃什么？',
          pinyin: 'Nín xiǎng chī shénme?',
          english: 'What would you like to eat?',
        ),
        DialogueLine(
          hanzi: '我要米饭和鱼。',
          pinyin: 'Wǒ yào mǐfàn hé yú.',
          english: "I'd like rice and fish.",
        ),
        DialogueLine(
          hanzi: '还要别的吗？',
          pinyin: 'Hái yào bié de ma?',
          english: 'Anything else?',
        ),
        DialogueLine(
          hanzi: '不要了，谢谢。',
          pinyin: 'Bú yào le, xièxie.',
          english: 'No more, thanks.',
        ),
        DialogueLine(
          hanzi: '好的，请稍等。',
          pinyin: 'Hǎo de, qǐng shāo děng.',
          english: 'OK, please wait a moment.',
        ),
        DialogueLine(
          hanzi: '多少钱？',
          pinyin: 'Duōshao qián?',
          english: 'How much is it?',
        ),
        DialogueLine(
          hanzi: '五十块。',
          pinyin: 'Wǔshí kuài.',
          english: 'Fifty yuan.',
        ),
      ],
    ),
    Dialogue(
      id: 'shopping',
      title: 'Shopping',
      subtitle: 'Bargaining at a market',
      emoji: '🛍️',
      lines: [
        DialogueLine(
          hanzi: '你好，这个多少钱？',
          pinyin: 'Nǐ hǎo, zhège duōshao qián?',
          english: 'Hello, how much is this?',
        ),
        DialogueLine(
          hanzi: '这个二十块。',
          pinyin: 'Zhège èrshí kuài.',
          english: 'This one is twenty yuan.',
        ),
        DialogueLine(
          hanzi: '太贵了！',
          pinyin: 'Tài guì le!',
          english: 'Too expensive!',
        ),
        DialogueLine(
          hanzi: '那你想给多少？',
          pinyin: 'Nà nǐ xiǎng gěi duōshao?',
          english: 'How much would you like to pay?',
        ),
        DialogueLine(
          hanzi: '十五块，可以吗？',
          pinyin: 'Shíwǔ kuài, kěyǐ ma?',
          english: 'Fifteen yuan, is that OK?',
        ),
        DialogueLine(
          hanzi: '好吧。',
          pinyin: 'Hǎo ba.',
          english: "OK, fine.",
        ),
        DialogueLine(
          hanzi: '我要两个。',
          pinyin: 'Wǒ yào liǎng gè.',
          english: "I'll take two.",
        ),
        DialogueLine(
          hanzi: '一共三十块。',
          pinyin: 'Yígòng sānshí kuài.',
          english: 'Thirty yuan in total.',
        ),
        DialogueLine(
          hanzi: '给你钱。',
          pinyin: 'Gěi nǐ qián.',
          english: "Here's the money.",
        ),
        DialogueLine(
          hanzi: '谢谢，再见！',
          pinyin: 'Xièxie, zàijiàn!',
          english: 'Thanks, goodbye!',
        ),
      ],
    ),
    Dialogue(
      id: 'directions',
      title: 'Asking directions',
      subtitle: 'Finding your way around',
      emoji: '🗺️',
      lines: [
        DialogueLine(
          hanzi: '请问，车站在哪儿？',
          pinyin: 'Qǐng wèn, chēzhàn zài nǎr?',
          english: 'Excuse me, where is the station?',
        ),
        DialogueLine(
          hanzi: '一直往前走。',
          pinyin: 'Yìzhí wǎng qián zǒu.',
          english: 'Go straight ahead.',
        ),
        DialogueLine(
          hanzi: '远吗？',
          pinyin: 'Yuǎn ma?',
          english: 'Is it far?',
        ),
        DialogueLine(
          hanzi: '不远，走五分钟。',
          pinyin: 'Bù yuǎn, zǒu wǔ fēnzhōng.',
          english: "Not far, a five-minute walk.",
        ),
        DialogueLine(
          hanzi: '在左边还是右边？',
          pinyin: 'Zài zuǒbiān háishì yòubiān?',
          english: 'On the left or the right?',
        ),
        DialogueLine(
          hanzi: '在右边。',
          pinyin: 'Zài yòubiān.',
          english: 'On the right.',
        ),
        DialogueLine(hanzi: '谢谢！', pinyin: 'Xièxie!', english: 'Thanks!'),
        DialogueLine(
          hanzi: '不客气。',
          pinyin: 'Bú kèqi.',
          english: "You're welcome.",
        ),
      ],
    ),
    Dialogue(
      id: 'time',
      title: 'Time & schedule',
      subtitle: 'Talking about the time',
      emoji: '⏰',
      lines: [
        DialogueLine(
          hanzi: '现在几点了？',
          pinyin: 'Xiànzài jǐ diǎn le?',
          english: 'What time is it now?',
        ),
        DialogueLine(
          hanzi: '现在八点半。',
          pinyin: 'Xiànzài bā diǎn bàn.',
          english: "It's half past eight.",
        ),
        DialogueLine(
          hanzi: '你几点上课？',
          pinyin: 'Nǐ jǐ diǎn shàngkè?',
          english: 'What time do you have class?',
        ),
        DialogueLine(
          hanzi: '九点。',
          pinyin: 'Jiǔ diǎn.',
          english: "Nine o'clock.",
        ),
        DialogueLine(
          hanzi: '今天星期几？',
          pinyin: 'Jīntiān xīngqī jǐ?',
          english: 'What day is it today?',
        ),
        DialogueLine(
          hanzi: '今天星期五。',
          pinyin: 'Jīntiān xīngqīwǔ.',
          english: 'Today is Friday.',
        ),
        DialogueLine(
          hanzi: '明天你有时间吗？',
          pinyin: 'Míngtiān nǐ yǒu shíjiān ma?',
          english: 'Do you have time tomorrow?',
        ),
        DialogueLine(
          hanzi: '有，我们去看电影吧。',
          pinyin: 'Yǒu, wǒmen qù kàn diànyǐng ba.',
          english: "Yes, let's go see a movie.",
        ),
      ],
    ),
    Dialogue(
      id: 'family',
      title: 'Family',
      subtitle: 'Talking about your family',
      emoji: '👨‍👩‍👧‍👦',
      lines: [
        DialogueLine(
          hanzi: '你家有几口人？',
          pinyin: 'Nǐ jiā yǒu jǐ kǒu rén?',
          english: 'How many people are in your family?',
        ),
        DialogueLine(
          hanzi: '我家有四口人。',
          pinyin: 'Wǒ jiā yǒu sì kǒu rén.',
          english: 'There are four people in my family.',
        ),
        DialogueLine(
          hanzi: '他们是谁？',
          pinyin: 'Tāmen shì shéi?',
          english: 'Who are they?',
        ),
        DialogueLine(
          hanzi: '爸爸、妈妈、哥哥和我。',
          pinyin: 'Bàba, māma, gēge hé wǒ.',
          english: 'Dad, mom, my older brother and me.',
        ),
        DialogueLine(
          hanzi: '你哥哥做什么工作？',
          pinyin: 'Nǐ gēge zuò shénme gōngzuò?',
          english: 'What does your brother do?',
        ),
        DialogueLine(
          hanzi: '他是医生。',
          pinyin: 'Tā shì yīshēng.',
          english: "He's a doctor.",
        ),
        DialogueLine(
          hanzi: '你妈妈呢？',
          pinyin: 'Nǐ māma ne?',
          english: 'And your mom?',
        ),
        DialogueLine(
          hanzi: '她是老师。',
          pinyin: 'Tā shì lǎoshī.',
          english: "She's a teacher.",
        ),
      ],
    ),
  ];
}
