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
        DialogueLine(
          hanzi: '你是学生吗？',
          pinyin: 'Nǐ shì xuésheng ma?',
          english: 'Are you a student?',
        ),
        DialogueLine(
          hanzi: '是的，我是学生。',
          pinyin: 'Shì de, wǒ shì xuésheng.',
          english: "Yes, I'm a student.",
        ),
        DialogueLine(
          hanzi: '你学什么？',
          pinyin: 'Nǐ xué shénme?',
          english: 'What do you study?',
        ),
        DialogueLine(
          hanzi: '我学汉语。',
          pinyin: 'Wǒ xué Hànyǔ.',
          english: 'I study Chinese.',
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
        DialogueLine(
          hanzi: '你在哪里工作？',
          pinyin: 'Nǐ zài nǎlǐ gōngzuò?',
          english: 'Where do you work?',
        ),
        DialogueLine(
          hanzi: '我在一家公司工作。',
          pinyin: 'Wǒ zài yì jiā gōngsī gōngzuò.',
          english: 'I work at a company.',
        ),
        DialogueLine(
          hanzi: '你喜欢中国吗？',
          pinyin: 'Nǐ xǐhuan Zhōngguó ma?',
          english: 'Do you like China?',
        ),
        DialogueLine(
          hanzi: '我很喜欢中国。',
          pinyin: 'Wǒ hěn xǐhuan Zhōngguó.',
          english: 'I like China very much.',
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
        DialogueLine(
          hanzi: '这个菜辣吗？',
          pinyin: 'Zhège cài là ma?',
          english: 'Is this dish spicy?',
        ),
        DialogueLine(
          hanzi: '不辣，很好吃。',
          pinyin: 'Bú là, hěn hǎochī.',
          english: 'Not spicy, very tasty.',
        ),
        DialogueLine(
          hanzi: '请给我一杯水。',
          pinyin: 'Qǐng gěi wǒ yì bēi shuǐ.',
          english: 'Please give me a glass of water.',
        ),
        DialogueLine(
          hanzi: '好的，马上来。',
          pinyin: 'Hǎo de, mǎshàng lái.',
          english: 'OK, coming right up.',
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
          english: 'OK, fine.',
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
        DialogueLine(
          hanzi: '可以刷卡吗？',
          pinyin: 'Kěyǐ shuā kǎ ma?',
          english: 'Can I pay by card?',
        ),
        DialogueLine(
          hanzi: '可以，也可以付现金。',
          pinyin: 'Kěyǐ, yě kěyǐ fù xiànjīn.',
          english: 'Yes, or you can pay in cash.',
        ),
        DialogueLine(
          hanzi: '有别的颜色吗？',
          pinyin: 'Yǒu bié de yánsè ma?',
          english: 'Do you have other colours?',
        ),
        DialogueLine(
          hanzi: '有的，请等一下。',
          pinyin: 'Yǒu de, qǐng děng yíxià.',
          english: 'Yes, please wait a moment.',
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
          english: 'Not far, a five-minute walk.',
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
        DialogueLine(
          hanzi: '附近有地铁站吗？',
          pinyin: 'Fùjìn yǒu dìtiězhàn ma?',
          english: 'Is there a subway station nearby?',
        ),
        DialogueLine(
          hanzi: '有，就在前面。',
          pinyin: 'Yǒu, jiù zài qiánmiàn.',
          english: 'Yes, just ahead.',
        ),
        DialogueLine(
          hanzi: '走路要多久？',
          pinyin: 'Zǒulù yào duō jiǔ?',
          english: 'How long does it take on foot?',
        ),
        DialogueLine(
          hanzi: '大概十分钟。',
          pinyin: 'Dàgài shí fēnzhōng.',
          english: 'About ten minutes.',
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
        DialogueLine(
          hanzi: '你几点起床？',
          pinyin: 'Nǐ jǐ diǎn qǐchuáng?',
          english: 'What time do you get up?',
        ),
        DialogueLine(
          hanzi: '我七点起床。',
          pinyin: 'Wǒ qī diǎn qǐchuáng.',
          english: 'I get up at seven.',
        ),
        DialogueLine(
          hanzi: '周末你做什么？',
          pinyin: 'Zhōumò nǐ zuò shénme?',
          english: 'What do you do on weekends?',
        ),
        DialogueLine(
          hanzi: '我周末休息。',
          pinyin: 'Wǒ zhōumò xiūxi.',
          english: 'I rest on weekends.',
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
        DialogueLine(
          hanzi: '你有兄弟姐妹吗？',
          pinyin: 'Nǐ yǒu xiōngdì jiěmèi ma?',
          english: 'Do you have any siblings?',
        ),
        DialogueLine(
          hanzi: '我有一个妹妹。',
          pinyin: 'Wǒ yǒu yí gè mèimei.',
          english: 'I have a younger sister.',
        ),
        DialogueLine(
          hanzi: '她多大？',
          pinyin: 'Tā duō dà?',
          english: 'How old is she?',
        ),
        DialogueLine(
          hanzi: '她十八岁。',
          pinyin: 'Tā shíbā suì.',
          english: "She's eighteen.",
        ),
      ],
    ),

    // ── New common scenarios ────────────────────────────────────────────
    Dialogue(
      id: 'weather',
      title: 'Weather',
      subtitle: 'Talking about the weather',
      emoji: '🌤️',
      lines: [
        DialogueLine(
          hanzi: '今天天气怎么样？',
          pinyin: 'Jīntiān tiānqì zěnmeyàng?',
          english: "How's the weather today?",
        ),
        DialogueLine(
          hanzi: '今天很热。',
          pinyin: 'Jīntiān hěn rè.',
          english: "It's very hot today.",
        ),
        DialogueLine(
          hanzi: '明天会下雨吗？',
          pinyin: 'Míngtiān huì xià yǔ ma?',
          english: 'Will it rain tomorrow?',
        ),
        DialogueLine(
          hanzi: '可能会下雨。',
          pinyin: 'Kěnéng huì xià yǔ.',
          english: 'It might rain.',
        ),
        DialogueLine(
          hanzi: '你带伞了吗？',
          pinyin: 'Nǐ dài sǎn le ma?',
          english: 'Did you bring an umbrella?',
        ),
        DialogueLine(
          hanzi: '带了，谢谢。',
          pinyin: 'Dài le, xièxie.',
          english: 'Yes, thanks.',
        ),
        DialogueLine(
          hanzi: '冬天这里冷吗？',
          pinyin: 'Dōngtiān zhèlǐ lěng ma?',
          english: 'Is it cold here in winter?',
        ),
        DialogueLine(
          hanzi: '很冷，还会下雪。',
          pinyin: 'Hěn lěng, hái huì xià xuě.',
          english: 'Very cold, and it snows too.',
        ),
      ],
    ),
    Dialogue(
      id: 'hobbies',
      title: 'Hobbies',
      subtitle: 'What do you like to do?',
      emoji: '🎨',
      lines: [
        DialogueLine(
          hanzi: '你有什么爱好？',
          pinyin: 'Nǐ yǒu shénme àihào?',
          english: 'What hobbies do you have?',
        ),
        DialogueLine(
          hanzi: '我喜欢看书和听音乐。',
          pinyin: 'Wǒ xǐhuan kàn shū hé tīng yīnyuè.',
          english: 'I like reading and listening to music.',
        ),
        DialogueLine(
          hanzi: '你喜欢运动吗？',
          pinyin: 'Nǐ xǐhuan yùndòng ma?',
          english: 'Do you like sports?',
        ),
        DialogueLine(
          hanzi: '喜欢，我常常跑步。',
          pinyin: 'Xǐhuan, wǒ chángcháng pǎobù.',
          english: 'Yes, I often go running.',
        ),
        DialogueLine(
          hanzi: '你喜欢唱歌吗？',
          pinyin: 'Nǐ xǐhuan chànggē ma?',
          english: 'Do you like singing?',
        ),
        DialogueLine(
          hanzi: '我不太会唱歌。',
          pinyin: 'Wǒ bú tài huì chànggē.',
          english: "I'm not very good at singing.",
        ),
        DialogueLine(
          hanzi: '周末我们一起打球吧。',
          pinyin: 'Zhōumò wǒmen yìqǐ dǎqiú ba.',
          english: "Let's play ball together this weekend.",
        ),
        DialogueLine(
          hanzi: '好啊，我很乐意。',
          pinyin: 'Hǎo a, wǒ hěn lèyì.',
          english: "Sure, I'd love to.",
        ),
      ],
    ),
    Dialogue(
      id: 'airport',
      title: 'At the airport',
      subtitle: 'Checking in and boarding',
      emoji: '✈️',
      lines: [
        DialogueLine(
          hanzi: '请问，登机口在哪里？',
          pinyin: 'Qǐngwèn, dēngjīkǒu zài nǎlǐ?',
          english: 'Excuse me, where is the boarding gate?',
        ),
        DialogueLine(
          hanzi: '在二楼，一直走。',
          pinyin: 'Zài èr lóu, yìzhí zǒu.',
          english: 'On the second floor, go straight.',
        ),
        DialogueLine(
          hanzi: '我的航班几点起飞？',
          pinyin: 'Wǒ de hángbān jǐ diǎn qǐfēi?',
          english: 'What time does my flight take off?',
        ),
        DialogueLine(
          hanzi: '十点十分。',
          pinyin: 'Shí diǎn shí fēn.',
          english: 'At ten past ten.',
        ),
        DialogueLine(
          hanzi: '行李要托运吗？',
          pinyin: 'Xíngli yào tuōyùn ma?',
          english: 'Do I need to check my luggage?',
        ),
        DialogueLine(
          hanzi: '是的，请放在这里。',
          pinyin: 'Shì de, qǐng fàng zài zhèlǐ.',
          english: 'Yes, please put it here.',
        ),
        DialogueLine(
          hanzi: '谢谢你的帮助。',
          pinyin: 'Xièxie nǐ de bāngzhù.',
          english: 'Thanks for your help.',
        ),
        DialogueLine(
          hanzi: '不客气，祝你旅途愉快。',
          pinyin: 'Bú kèqi, zhù nǐ lǚtú yúkuài.',
          english: 'You are welcome, have a pleasant trip.',
        ),
      ],
    ),
    Dialogue(
      id: 'doctor',
      title: 'Seeing a doctor',
      subtitle: 'Describing symptoms',
      emoji: '🏥',
      lines: [
        DialogueLine(
          hanzi: '医生，我不舒服。',
          pinyin: 'Yīshēng, wǒ bù shūfu.',
          english: "Doctor, I don't feel well.",
        ),
        DialogueLine(
          hanzi: '你哪里不舒服？',
          pinyin: 'Nǐ nǎlǐ bù shūfu?',
          english: 'Where do you feel unwell?',
        ),
        DialogueLine(
          hanzi: '我头疼，还发烧。',
          pinyin: 'Wǒ tóuténg, hái fāshāo.',
          english: 'I have a headache and a fever.',
        ),
        DialogueLine(
          hanzi: '你感冒了。',
          pinyin: 'Nǐ gǎnmào le.',
          english: 'You have a cold.',
        ),
        DialogueLine(
          hanzi: '要吃药吗？',
          pinyin: 'Yào chī yào ma?',
          english: 'Do I need to take medicine?',
        ),
        DialogueLine(
          hanzi: '是的，每天三次。',
          pinyin: 'Shì de, měi tiān sān cì.',
          english: 'Yes, three times a day.',
        ),
        DialogueLine(
          hanzi: '需要休息几天？',
          pinyin: 'Xūyào xiūxi jǐ tiān?',
          english: 'How many days should I rest?',
        ),
        DialogueLine(
          hanzi: '休息两三天就好了。',
          pinyin: 'Xiūxi liǎng sān tiān jiù hǎo le.',
          english: "Rest for two or three days and you'll be fine.",
        ),
      ],
    ),
    Dialogue(
      id: 'hotel',
      title: 'At the hotel',
      subtitle: 'Booking a room',
      emoji: '🏨',
      lines: [
        DialogueLine(
          hanzi: '你好，我要订一个房间。',
          pinyin: 'Nǐ hǎo, wǒ yào dìng yí gè fángjiān.',
          english: "Hello, I'd like to book a room.",
        ),
        DialogueLine(
          hanzi: '您要单人间还是双人间？',
          pinyin: 'Nín yào dānrénjiān háishì shuāngrénjiān?',
          english: 'A single room or a double room?',
        ),
        DialogueLine(
          hanzi: '单人间，住两晚。',
          pinyin: 'Dānrénjiān, zhù liǎng wǎn.',
          english: 'A single room, for two nights.',
        ),
        DialogueLine(
          hanzi: '一晚三百块。',
          pinyin: 'Yì wǎn sānbǎi kuài.',
          english: 'Three hundred yuan a night.',
        ),
        DialogueLine(
          hanzi: '有早餐吗？',
          pinyin: 'Yǒu zǎocān ma?',
          english: 'Is breakfast included?',
        ),
        DialogueLine(
          hanzi: '有的，七点到九点。',
          pinyin: 'Yǒu de, qī diǎn dào jiǔ diǎn.',
          english: 'Yes, from seven to nine.',
        ),
        DialogueLine(
          hanzi: '可以看一下房间吗？',
          pinyin: 'Kěyǐ kàn yíxià fángjiān ma?',
          english: 'Can I take a look at the room?',
        ),
        DialogueLine(
          hanzi: '当然可以。',
          pinyin: 'Dāngrán kěyǐ.',
          english: 'Of course.',
        ),
      ],
    ),
    Dialogue(
      id: 'taxi',
      title: 'Taking a taxi',
      subtitle: 'Getting around by taxi',
      emoji: '🚕',
      lines: [
        DialogueLine(
          hanzi: '师傅，去火车站。',
          pinyin: 'Shīfu, qù huǒchēzhàn.',
          english: 'Driver, to the train station please.',
        ),
        DialogueLine(
          hanzi: '好的，请系好安全带。',
          pinyin: 'Hǎo de, qǐng jì hǎo ānquándài.',
          english: 'OK, please fasten your seatbelt.',
        ),
        DialogueLine(
          hanzi: '大概要多久？',
          pinyin: 'Dàgài yào duō jiǔ?',
          english: 'How long will it take?',
        ),
        DialogueLine(
          hanzi: '不堵车的话，二十分钟。',
          pinyin: 'Bù dǔchē de huà, èrshí fēnzhōng.',
          english: 'Twenty minutes if there is no traffic.',
        ),
        DialogueLine(
          hanzi: '多少钱？',
          pinyin: 'Duōshao qián?',
          english: 'How much is it?',
        ),
        DialogueLine(
          hanzi: '大概四十块。',
          pinyin: 'Dàgài sìshí kuài.',
          english: 'About forty yuan.',
        ),
        DialogueLine(
          hanzi: '可以手机支付吗？',
          pinyin: 'Kěyǐ shǒujī zhīfù ma?',
          english: 'Can I pay with my phone?',
        ),
        DialogueLine(hanzi: '可以。', pinyin: 'Kěyǐ.', english: 'Sure.'),
      ],
    ),
    Dialogue(
      id: 'phone',
      title: 'Making a phone call',
      subtitle: 'Calling a friend',
      emoji: '📞',
      lines: [
        DialogueLine(hanzi: '喂，你好。', pinyin: 'Wèi, nǐ hǎo.', english: 'Hello?'),
        DialogueLine(
          hanzi: '喂，请问李明在吗？',
          pinyin: 'Wèi, qǐngwèn Lǐ Míng zài ma?',
          english: 'Hello, is Li Ming there?',
        ),
        DialogueLine(
          hanzi: '我就是，你是哪位？',
          pinyin: 'Wǒ jiù shì, nǐ shì nǎ wèi?',
          english: "Speaking. Who's this?",
        ),
        DialogueLine(
          hanzi: '我是王芳，你好吗？',
          pinyin: 'Wǒ shì Wáng Fāng, nǐ hǎo ma?',
          english: "It's Wang Fang, how are you?",
        ),
        DialogueLine(
          hanzi: '我很好。有什么事吗？',
          pinyin: 'Wǒ hěn hǎo. Yǒu shénme shì ma?',
          english: "I'm fine. What's up?",
        ),
        DialogueLine(
          hanzi: '明天我们一起吃饭吧。',
          pinyin: 'Míngtiān wǒmen yìqǐ chīfàn ba.',
          english: "Let's have dinner together tomorrow.",
        ),
        DialogueLine(hanzi: '好的，几点？', pinyin: 'Hǎo de, jǐ diǎn?', english: 'OK, what time?'),
        DialogueLine(
          hanzi: '六点半，怎么样？',
          pinyin: 'Liù diǎn bàn, zěnmeyàng?',
          english: 'Half past six, how about that?',
        ),
        DialogueLine(
          hanzi: '没问题，明天见。',
          pinyin: 'Méi wèntí, míngtiān jiàn.',
          english: 'No problem, see you tomorrow.',
        ),
      ],
    ),
    Dialogue(
      id: 'bank',
      title: 'At the bank',
      subtitle: 'Withdrawing and exchanging money',
      emoji: '🏦',
      lines: [
        DialogueLine(
          hanzi: '你好，我想取钱。',
          pinyin: 'Nǐ hǎo, wǒ xiǎng qǔ qián.',
          english: "Hello, I'd like to withdraw money.",
        ),
        DialogueLine(
          hanzi: '请出示您的护照。',
          pinyin: 'Qǐng chūshì nín de hùzhào.',
          english: 'Please show your passport.',
        ),
        DialogueLine(
          hanzi: '这是我的护照。',
          pinyin: 'Zhè shì wǒ de hùzhào.',
          english: 'Here is my passport.',
        ),
        DialogueLine(
          hanzi: '您要取多少？',
          pinyin: 'Nín yào qǔ duōshao?',
          english: 'How much would you like to withdraw?',
        ),
        DialogueLine(
          hanzi: '我要取一千块。',
          pinyin: 'Wǒ yào qǔ yìqiān kuài.',
          english: "I'd like to withdraw one thousand yuan.",
        ),
        DialogueLine(
          hanzi: '请输入密码。',
          pinyin: 'Qǐng shūrù mìmǎ.',
          english: 'Please enter your password.',
        ),
        DialogueLine(
          hanzi: '可以换钱吗？',
          pinyin: 'Kěyǐ huàn qián ma?',
          english: 'Can I exchange money here?',
        ),
        DialogueLine(
          hanzi: '可以，请到三号窗口。',
          pinyin: 'Kěyǐ, qǐng dào sān hào chuāngkǒu.',
          english: 'Yes, please go to window three.',
        ),
      ],
    ),
  ];
}
