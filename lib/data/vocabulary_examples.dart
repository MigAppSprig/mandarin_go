import '../models/vocabulary.dart';

/// Additional example sentences for vocabulary words, keyed by word id.
///
/// The primary example lives on each [Word]; these are extra examples shown
/// on the flashcard back and the word-of-the-day card.
class VocabularyExamples {
  VocabularyExamples._();

  static const Map<String, List<WordExample>> extra = <String, List<WordExample>>{
    "好": [
      WordExample(hanzi: "今天天气很好。", pinyin: "Jīn tiān tiān qì hěn hǎo.", english: "The weather is very nice today."),
      WordExample(hanzi: "你的中文很好。", pinyin: "Nǐ de Zhōng wén hěn hǎo.", english: "Your Chinese is very good."),
    ],
    "大": [
      WordExample(hanzi: "这个房间很大。", pinyin: "Zhè ge fáng jiān hěn dà.", english: "This room is big."),
      WordExample(hanzi: "我哥哥比我大三岁。", pinyin: "Wǒ gē ge bǐ wǒ dà sān suì.", english: "My older brother is three years older than me."),
    ],
    "小": [
      WordExample(hanzi: "我的房间太小了。", pinyin: "Wǒ de fáng jiān tài xiǎo le.", english: "My room is too small."),
      WordExample(hanzi: "这只狗很小。", pinyin: "Zhè zhī gǒu hěn xiǎo.", english: "This dog is very small."),
    ],
    "多": [
      WordExample(hanzi: "今天作业很多。", pinyin: "Jīn tiān zuò yè hěn duō.", english: "There is a lot of homework today."),
      WordExample(hanzi: "他的朋友很多。", pinyin: "Tā de péng you hěn duō.", english: "He has many friends."),
    ],
    "少": [
      WordExample(hanzi: "今天客人很少。", pinyin: "Jīn tiān kè rén hěn shǎo.", english: "There are very few guests today."),
      WordExample(hanzi: "街上的人很少。", pinyin: "Jiē shang de rén hěn shǎo.", english: "There are few people on the street."),
    ],
    "热": [
      WordExample(hanzi: "这杯茶还很热。", pinyin: "Zhè bēi chá hái hěn rè.", english: "This cup of tea is still very hot."),
      WordExample(hanzi: "夏天这里很热。", pinyin: "Xià tiān zhè lǐ hěn rè.", english: "It is very hot here in summer."),
    ],
    "冷": [
      WordExample(hanzi: "今天有一点冷。", pinyin: "Jīn tiān yǒu yì diǎn lěng.", english: "It is a little cold today."),
      WordExample(hanzi: "房间里很冷。", pinyin: "Fáng jiān lǐ hěn lěng.", english: "It is cold in the room."),
    ],
    "高兴": [
      WordExample(hanzi: "今天我很高兴。", pinyin: "Jīn tiān wǒ hěn gāo xìng.", english: "I am very happy today."),
      WordExample(hanzi: "妈妈听了很高兴。", pinyin: "Mā ma tīng le hěn gāo xìng.", english: "Mom was happy to hear it."),
    ],
    "忙": [
      WordExample(hanzi: "你最近忙吗？", pinyin: "Nǐ zuì jìn máng ma?", english: "Have you been busy lately?"),
      WordExample(hanzi: "他工作很忙。", pinyin: "Tā gōng zuò hěn máng.", english: "He is very busy with work."),
    ],
    "累": [
      WordExample(hanzi: "你看起来很累。", pinyin: "Nǐ kàn qǐ lái hěn lèi.", english: "You look very tired."),
      WordExample(hanzi: "我累了，想休息。", pinyin: "Wǒ lèi le, xiǎng xiū xi.", english: "I am tired and want to rest."),
    ],
    "漂亮": [
      WordExample(hanzi: "你姐姐真漂亮。", pinyin: "Nǐ jiě jie zhēn piào liang.", english: "Your older sister is really pretty."),
      WordExample(hanzi: "这件衣服很漂亮。", pinyin: "Zhè jiàn yī fu hěn piào liang.", english: "This piece of clothing is very pretty."),
    ],
    "贵": [
      WordExample(hanzi: "这里的房子很贵。", pinyin: "Zhè lǐ de fáng zi hěn guì.", english: "Houses here are very expensive."),
      WordExample(hanzi: "这家店的东西太贵。", pinyin: "Zhè jiā diàn de dōng xi tài guì.", english: "Things in this shop are too expensive."),
    ],
    "便宜": [
      WordExample(hanzi: "这件衬衫很便宜。", pinyin: "Zhè jiàn chèn shān hěn pián yi.", english: "This shirt is very cheap."),
      WordExample(hanzi: "水果现在很便宜。", pinyin: "Shuǐ guǒ xiàn zài hěn pián yi.", english: "Fruit is very cheap now."),
    ],
    "新": [
      WordExample(hanzi: "这是我新买的手机。", pinyin: "Zhè shì wǒ xīn mǎi de shǒu jī.", english: "This is the phone I just bought."),
      WordExample(hanzi: "他买了一辆新车。", pinyin: "Tā mǎi le yí liàng xīn chē.", english: "He bought a new car."),
    ],
    "旧": [
      WordExample(hanzi: "这双鞋太旧了。", pinyin: "Zhè shuāng xié tài jiù le.", english: "This pair of shoes is too old."),
      WordExample(hanzi: "我家有一台旧电视。", pinyin: "Wǒ jiā yǒu yì tái jiù diàn shì.", english: "My family has an old TV."),
    ],
    "老": [
      WordExample(hanzi: "他看起来不老。", pinyin: "Tā kàn qǐ lái bù lǎo.", english: "He doesn't look old."),
      WordExample(hanzi: "这只狗很老了。", pinyin: "Zhè zhī gǒu hěn lǎo le.", english: "This dog is very old."),
    ],
    "年轻": [
      WordExample(hanzi: "他比我年轻两岁。", pinyin: "Tā bǐ wǒ nián qīng liǎng suì.", english: "He is two years younger than me."),
      WordExample(hanzi: "年轻人都喜欢上网。", pinyin: "Nián qīng rén dōu xǐ huan shàng wǎng.", english: "Young people all like going online."),
    ],
    "快": [
      WordExample(hanzi: "你走得真快。", pinyin: "Nǐ zǒu de zhēn kuài.", english: "You walk really fast."),
      WordExample(hanzi: "时间过得很快。", pinyin: "Shí jiān guò de hěn kuài.", english: "Time passes quickly."),
    ],
    "慢": [
      WordExample(hanzi: "公交车开得很慢。", pinyin: "Gōng jiāo chē kāi de hěn màn.", english: "The bus drives very slowly."),
      WordExample(hanzi: "别着急，慢一点。", pinyin: "Bié zháo jí, màn yì diǎn.", english: "Don't hurry, slow down a little."),
    ],
    "长": [
      WordExample(hanzi: "她留着长头发。", pinyin: "Tā liú zhe cháng tóu fa.", english: "She has long hair."),
      WordExample(hanzi: "夏天白天很长。", pinyin: "Xià tiān bái tiān hěn cháng.", english: "Summer days are long."),
    ],
    "短": [
      WordExample(hanzi: "我的头发很短。", pinyin: "Wǒ de tóu fa hěn duǎn.", english: "My hair is very short."),
      WordExample(hanzi: "冬天白天很短。", pinyin: "Dōng tiān bái tiān hěn duǎn.", english: "Winter days are short."),
    ],
    "高": [
      WordExample(hanzi: "他比我高很多。", pinyin: "Tā bǐ wǒ gāo hěn duō.", english: "He is much taller than me."),
      WordExample(hanzi: "这座山真高。", pinyin: "Zhè zuò shān zhēn gāo.", english: "This mountain is really high."),
    ],
    "矮": [
      WordExample(hanzi: "我弟弟还很矮。", pinyin: "Wǒ dì di hái hěn ǎi.", english: "My little brother is still very short."),
      WordExample(hanzi: "这张桌子太矮了。", pinyin: "Zhè zhāng zhuō zi tài ǎi le.", english: "This table is too low."),
    ],
    "胖": [
      WordExample(hanzi: "他最近变胖了。", pinyin: "Tā zuì jìn biàn pàng le.", english: "He has gotten fatter recently."),
      WordExample(hanzi: "吃太多会变胖。", pinyin: "Chī tài duō huì biàn pàng.", english: "Eating too much will make you fat."),
    ],
    "瘦": [
      WordExample(hanzi: "你最近瘦了很多。", pinyin: "Nǐ zuì jìn shòu le hěn duō.", english: "You have gotten much thinner recently."),
      WordExample(hanzi: "这只狗太瘦了。", pinyin: "Zhè zhī gǒu tài shòu le.", english: "This dog is too thin."),
    ],
    "干净": [
      WordExample(hanzi: "你的手很干净。", pinyin: "Nǐ de shǒu hěn gān jìng.", english: "Your hands are very clean."),
      WordExample(hanzi: "这件衣服不干净。", pinyin: "Zhè jiàn yī fu bù gān jìng.", english: "This piece of clothing is not clean."),
    ],
    "脏": [
      WordExample(hanzi: "你的鞋很脏。", pinyin: "Nǐ de xié hěn zāng.", english: "Your shoes are very dirty."),
      WordExample(hanzi: "地上很脏，别坐。", pinyin: "Dì shang hěn zāng, bié zuò.", english: "The floor is dirty, don't sit down."),
    ],
    "容易": [
      WordExample(hanzi: "学汉语不容易。", pinyin: "Xué Hàn yǔ bù róng yì.", english: "Learning Chinese is not easy."),
      WordExample(hanzi: "在这里停车很容易。", pinyin: "Zài zhè lǐ tíng chē hěn róng yì.", english: "Parking here is easy."),
    ],
    "难": [
      WordExample(hanzi: "这个问题太难了。", pinyin: "Zhè ge wèn tí tài nán le.", english: "This question is too hard."),
      WordExample(hanzi: "写汉字很难。", pinyin: "Xiě Hàn zì hěn nán.", english: "Writing Chinese characters is hard."),
    ],
    "对": [
      WordExample(hanzi: "这个答案是对的。", pinyin: "Zhè ge dá àn shì duì de.", english: "This answer is correct."),
      WordExample(hanzi: "你说的话不对。", pinyin: "Nǐ shuō de huà bú duì.", english: "What you said is not right."),
    ],
    "错": [
      WordExample(hanzi: "我打错了电话。", pinyin: "Wǒ dǎ cuò le diàn huà.", english: "I dialed the wrong number."),
      WordExample(hanzi: "对不起，是我错了。", pinyin: "Duì bu qǐ, shì wǒ cuò le.", english: "Sorry, it was my fault."),
    ],
    "一样": [
      WordExample(hanzi: "这两件衣服一样贵。", pinyin: "Zhè liǎng jiàn yī fu yí yàng guì.", english: "These two pieces of clothing are equally expensive."),
      WordExample(hanzi: "我们的想法一样。", pinyin: "Wǒ men de xiǎng fǎ yí yàng.", english: "Our ideas are the same."),
    ],
    "不同": [
      WordExample(hanzi: "我们俩性格不同。", pinyin: "Wǒ men liǎ xìng gé bù tóng.", english: "We two have different personalities."),
      WordExample(hanzi: "这两种茶味道不同。", pinyin: "Zhè liǎng zhǒng chá wèi dào bù tóng.", english: "These two kinds of tea taste different."),
    ],
    "好吃": [
      WordExample(hanzi: "这个蛋糕真好吃。", pinyin: "Zhè ge dàn gāo zhēn hǎo chī.", english: "This cake is really delicious."),
      WordExample(hanzi: "妈妈做的菜很好吃。", pinyin: "Mā ma zuò de cài hěn hǎo chī.", english: "The dishes Mom makes are delicious."),
    ],
    "好看": [
      WordExample(hanzi: "你今天很好看。", pinyin: "Nǐ jīn tiān hěn hǎo kàn.", english: "You look very nice today."),
      WordExample(hanzi: "这件裙子真好看。", pinyin: "Zhè jiàn qún zi zhēn hǎo kàn.", english: "This skirt is really pretty."),
    ],
    "安静": [
      WordExample(hanzi: "请安静一点。", pinyin: "Qǐng ān jìng yì diǎn.", english: "Please be a little quieter."),
      WordExample(hanzi: "教室现在很安静。", pinyin: "Jiào shì xiàn zài hěn ān jìng.", english: "The classroom is quiet now."),
    ],
    "动物": [
      WordExample(hanzi: "动物园里有很多动物。", pinyin: "Dòng wù yuán lǐ yǒu hěn duō dòng wù.", english: "There are many animals in the zoo."),
      WordExample(hanzi: "动物是我们的朋友。", pinyin: "Dòng wù shì wǒ men de péng you.", english: "Animals are our friends."),
    ],
    "猫": [
      WordExample(hanzi: "小猫在沙发上睡觉。", pinyin: "Xiǎo māo zài shā fā shang shuì jiào.", english: "The kitten is sleeping on the sofa."),
      WordExample(hanzi: "我的猫喜欢吃鱼。", pinyin: "Wǒ de māo xǐ huan chī yú.", english: "My cat likes eating fish."),
    ],
    "狗": [
      WordExample(hanzi: "我每天带狗去散步。", pinyin: "Wǒ měi tiān dài gǒu qù sàn bù.", english: "I take the dog for a walk every day."),
      WordExample(hanzi: "那只狗很聪明。", pinyin: "Nà zhī gǒu hěn cōng ming.", english: "That dog is very smart."),
    ],
    "鸟": [
      WordExample(hanzi: "树上有两只小鸟。", pinyin: "Shù shang yǒu liǎng zhī xiǎo niǎo.", english: "There are two little birds in the tree."),
      WordExample(hanzi: "小鸟在唱歌。", pinyin: "Xiǎo niǎo zài chàng gē.", english: "The little bird is singing."),
    ],
    "鱼": [
      WordExample(hanzi: "我妈妈做了鱼。", pinyin: "Wǒ mā ma zuò le yú.", english: "My mom cooked fish."),
      WordExample(hanzi: "河里有很多鱼。", pinyin: "Hé lǐ yǒu hěn duō yú.", english: "There are many fish in the river."),
    ],
    "马": [
      WordExample(hanzi: "他骑马去山上。", pinyin: "Tā qí mǎ qù shān shang.", english: "He rides a horse up the mountain."),
      WordExample(hanzi: "那匹马是白色的。", pinyin: "Nà pǐ mǎ shì bái sè de.", english: "That horse is white."),
    ],
    "牛": [
      WordExample(hanzi: "爷爷家有两头牛。", pinyin: "Yé ye jiā yǒu liǎng tóu niú.", english: "My grandpa's family has two cows."),
      WordExample(hanzi: "牛奶很好喝。", pinyin: "Niú nǎi hěn hǎo hē.", english: "Milk is tasty."),
    ],
    "羊": [
      WordExample(hanzi: "小羊在草地上吃草。", pinyin: "Xiǎo yáng zài cǎo dì shang chī cǎo.", english: "The lamb is eating grass on the lawn."),
      WordExample(hanzi: "那只羊是白色的。", pinyin: "Nà zhī yáng shì bái sè de.", english: "That sheep is white."),
    ],
    "鸡": [
      WordExample(hanzi: "奶奶养了很多鸡。", pinyin: "Nǎi nai yǎng le hěn duō jī.", english: "Grandma raises many chickens."),
      WordExample(hanzi: "我喜欢吃鸡肉。", pinyin: "Wǒ xǐ huan chī jī ròu.", english: "I like eating chicken."),
    ],
    "猪": [
      WordExample(hanzi: "农场里有三只猪。", pinyin: "Nóng chǎng lǐ yǒu sān zhī zhū.", english: "There are three pigs on the farm."),
      WordExample(hanzi: "这只小猪很胖。", pinyin: "Zhè zhī xiǎo zhū hěn pàng.", english: "This little pig is very fat."),
    ],
    "熊猫": [
      WordExample(hanzi: "熊猫是中国的国宝。", pinyin: "Xióng māo shì Zhōng guó de guó bǎo.", english: "The panda is China's national treasure."),
      WordExample(hanzi: "我们去动物园看熊猫。", pinyin: "Wǒ men qù dòng wù yuán kàn xióng māo.", english: "We are going to the zoo to see the pandas."),
    ],
    "兔子": [
      WordExample(hanzi: "小兔子吃了一个萝卜。", pinyin: "Xiǎo tù zi chī le yí gè luó bo.", english: "The little rabbit ate a carrot."),
      WordExample(hanzi: "我妹妹喜欢兔子。", pinyin: "Wǒ mèi mei xǐ huan tù zi.", english: "My little sister likes rabbits."),
    ],
    "老虎": [
      WordExample(hanzi: "老虎住在森林里。", pinyin: "Lǎo hǔ zhù zài sēn lín lǐ.", english: "Tigers live in the forest."),
      WordExample(hanzi: "我在动物园看见老虎。", pinyin: "Wǒ zài dòng wù yuán kàn jiàn lǎo hǔ.", english: "I saw a tiger at the zoo."),
    ],
    "大象": [
      WordExample(hanzi: "大象的鼻子很长。", pinyin: "Dà xiàng de bí zi hěn cháng.", english: "An elephant's trunk is long."),
      WordExample(hanzi: "动物园里有一只大象。", pinyin: "Dòng wù yuán lǐ yǒu yì zhī dà xiàng.", english: "There is an elephant in the zoo."),
    ],
    "猴子": [
      WordExample(hanzi: "猴子喜欢吃香蕉。", pinyin: "Hóu zi xǐ huan chī xiāng jiāo.", english: "Monkeys like eating bananas."),
      WordExample(hanzi: "那只猴子很聪明。", pinyin: "Nà zhī hóu zi hěn cōng ming.", english: "That monkey is very smart."),
    ],
    "身体": [
      WordExample(hanzi: "我身体不错。", pinyin: "Wǒ shēn tǐ bú cuò", english: "I'm in good health."),
      WordExample(hanzi: "多锻炼身体。", pinyin: "Duō duàn liàn shēn tǐ", english: "Get more exercise."),
    ],
    "头": [
      WordExample(hanzi: "我今天头疼。", pinyin: "Wǒ jīn tiān tóu téng", english: "I have a headache today."),
      WordExample(hanzi: "他低着头看书。", pinyin: "Tā dī zhe tóu kàn shū", english: "He reads with his head lowered."),
    ],
    "眼睛": [
      WordExample(hanzi: "闭上眼睛休息。", pinyin: "Bì shàng yǎn jing xiū xi", english: "Close your eyes and rest."),
      WordExample(hanzi: "我的眼睛很干。", pinyin: "Wǒ de yǎn jing hěn gān", english: "My eyes are very dry."),
    ],
    "耳朵": [
      WordExample(hanzi: "我耳朵很疼。", pinyin: "Wǒ ěr duo hěn téng", english: "My ear hurts a lot."),
      WordExample(hanzi: "他捂住耳朵。", pinyin: "Tā wǔ zhù ěr duo", english: "He covers his ears."),
    ],
    "鼻子": [
      WordExample(hanzi: "我鼻子流血了。", pinyin: "Wǒ bí zi liú xuè le", english: "My nose is bleeding."),
      WordExample(hanzi: "她的鼻子很高。", pinyin: "Tā de bí zi hěn gāo", english: "She has a high nose bridge."),
    ],
    "嘴巴": [
      WordExample(hanzi: "请闭上嘴巴。", pinyin: "Qǐng bì shàng zuǐ ba", english: "Please close your mouth."),
      WordExample(hanzi: "他的嘴巴不大。", pinyin: "Tā de zuǐ ba bú dà", english: "His mouth isn't big."),
    ],
    "手": [
      WordExample(hanzi: "请把手洗干净。", pinyin: "Qǐng bǎ shǒu xǐ gān jìng", english: "Please wash your hands clean."),
      WordExample(hanzi: "我的手很冷。", pinyin: "Wǒ de shǒu hěn lěng", english: "My hands are cold."),
    ],
    "脚": [
      WordExample(hanzi: "他光着脚走路。", pinyin: "Tā guāng zhe jiǎo zǒu lù", english: "He walks barefoot."),
      WordExample(hanzi: "小狗的脚很脏。", pinyin: "Xiǎo gǒu de jiǎo hěn zàng", english: "The puppy's paws are dirty."),
    ],
    "腿": [
      WordExample(hanzi: "运动以后腿疼。", pinyin: "Yùn dòng yǐ hòu tuǐ téng", english: "My legs hurt after exercising."),
      WordExample(hanzi: "他摔伤了腿。", pinyin: "Tā shuāi shāng le tuǐ", english: "He hurt his leg in a fall."),
    ],
    "脸": [
      WordExample(hanzi: "她的脸很红。", pinyin: "Tā de liǎn hěn hóng", english: "Her face is very red."),
      WordExample(hanzi: "我用毛巾擦脸。", pinyin: "Wǒ yòng máo jīn cā liǎn", english: "I wipe my face with a towel."),
    ],
    "心": [
      WordExample(hanzi: "他好像有心事。", pinyin: "Tā hǎo xiàng yǒu xīn shì", english: "He seems to have something on his mind."),
      WordExample(hanzi: "我心跳得厉害。", pinyin: "Wǒ xīn tiào de lì hai", english: "My heart is pounding."),
    ],
    "衣服": [
      WordExample(hanzi: "我要洗衣服。", pinyin: "Wǒ yào xǐ yī fu.", english: "I need to wash the clothes."),
      WordExample(hanzi: "妈妈买了新衣服。", pinyin: "Mā ma mǎi le xīn yī fu.", english: "Mom bought new clothes."),
    ],
    "裤子": [
      WordExample(hanzi: "这条裤子太长了。", pinyin: "Zhè tiáo kù zi tài cháng le.", english: "These pants are too long."),
      WordExample(hanzi: "他的裤子是蓝色的。", pinyin: "Tā de kù zi shì lán sè de.", english: "His pants are blue."),
    ],
    "裙子": [
      WordExample(hanzi: "这条裙子多少钱？", pinyin: "Zhè tiáo qún zi duō shao qián?", english: "How much is this skirt?"),
      WordExample(hanzi: "她买了一条红裙子。", pinyin: "Tā mǎi le yì tiáo hóng qún zi.", english: "She bought a red skirt."),
    ],
    "鞋子": [
      WordExample(hanzi: "这双鞋子很好看。", pinyin: "Zhè shuāng xié zi hěn hǎo kàn.", english: "This pair of shoes looks nice."),
      WordExample(hanzi: "他穿着黑色的鞋子。", pinyin: "Tā chuān zhe hēi sè de xié zi.", english: "He is wearing black shoes."),
    ],
    "帽子": [
      WordExample(hanzi: "这顶帽子很漂亮。", pinyin: "Zhè dǐng mào zi hěn piào liang.", english: "This hat is very pretty."),
      WordExample(hanzi: "冬天要戴帽子。", pinyin: "Dōng tiān yào dài mào zi.", english: "You need to wear a hat in winter."),
    ],
    "袜子": [
      WordExample(hanzi: "这双袜子太小了。", pinyin: "Zhè shuāng wà zi tài xiǎo le.", english: "This pair of socks is too small."),
      WordExample(hanzi: "你的袜子脏了。", pinyin: "Nǐ de wà zi zāng le.", english: "Your socks are dirty."),
    ],
    "衬衫": [
      WordExample(hanzi: "爸爸的白衬衫很干净。", pinyin: "Bà ba de bái chèn shān hěn gān jìng.", english: "Dad's white shirt is very clean."),
      WordExample(hanzi: "我要买一件蓝衬衫。", pinyin: "Wǒ yào mǎi yí jiàn lán chèn shān.", english: "I want to buy a blue shirt."),
    ],
    "外套": [
      WordExample(hanzi: "请穿上你的外套。", pinyin: "Qǐng chuān shàng nǐ de wài tào.", english: "Please put on your coat."),
      WordExample(hanzi: "我的外套在椅子上。", pinyin: "Wǒ de wài tào zài yǐ zi shang.", english: "My coat is on the chair."),
    ],
    "颜色": [
      WordExample(hanzi: "这个颜色很好看。", pinyin: "Zhè ge yánsè hěn hǎokàn.", english: "This colour looks nice."),
      WordExample(hanzi: "颜色太深了。", pinyin: "Yánsè tài shēn le.", english: "The colour is too dark."),
    ],
    "红色": [
      WordExample(hanzi: "她穿红色的裙子。", pinyin: "Tā chuān hóngsè de qúnzi.", english: "She is wearing a red skirt."),
      WordExample(hanzi: "红色的苹果很甜。", pinyin: "Hóngsè de píngguǒ hěn tián.", english: "Red apples are sweet."),
    ],
    "黄色": [
      WordExample(hanzi: "他买了一辆黄色的车。", pinyin: "Tā mǎi le yí liàng huángsè de chē.", english: "He bought a yellow car."),
      WordExample(hanzi: "这朵花是黄色的。", pinyin: "Zhè duǒ huā shì huángsè de.", english: "This flower is yellow."),
    ],
    "绿色": [
      WordExample(hanzi: "绿色的树叶很漂亮。", pinyin: "Lǜsè de shùyè hěn piàoliang.", english: "The green leaves are very pretty."),
      WordExample(hanzi: "她买了一个绿色的包。", pinyin: "Tā mǎi le yí gè lǜsè de bāo.", english: "She bought a green bag."),
    ],
    "蓝色": [
      WordExample(hanzi: "他喜欢蓝色的衬衫。", pinyin: "Tā xǐhuan lánsè de chènshān.", english: "He likes blue shirts."),
      WordExample(hanzi: "我的书包是蓝色的。", pinyin: "Wǒ de shūbāo shì lánsè de.", english: "My backpack is blue."),
    ],
    "白色": [
      WordExample(hanzi: "她穿了一件白色的裙子。", pinyin: "Tā chuān le yí jiàn báisè de qúnzi.", english: "She is wearing a white skirt."),
      WordExample(hanzi: "白色的墙上有一幅画。", pinyin: "Báisè de qiáng shàng yǒu yì fú huà.", english: "There is a picture on the white wall."),
    ],
    "黑色": [
      WordExample(hanzi: "他穿着一件黑色的外套。", pinyin: "Tā chuān zhe yí jiàn hēisè de wàitào.", english: "He is wearing a black coat."),
      WordExample(hanzi: "我喜欢黑色的鞋子。", pinyin: "Wǒ xǐhuan hēisè de xiézi.", english: "I like black shoes."),
    ],
    "灰色": [
      WordExample(hanzi: "他穿了一件灰色的毛衣。", pinyin: "Tā chuān le yí jiàn huīsè de máoyī.", english: "He is wearing a grey sweater."),
      WordExample(hanzi: "这只猫是灰色的。", pinyin: "Zhè zhī māo shì huīsè de.", english: "This cat is grey."),
    ],
    "橙色": [
      WordExample(hanzi: "她的帽子是橙色的。", pinyin: "Tā de màozi shì chéngsè de.", english: "Her hat is orange."),
      WordExample(hanzi: "我喜欢橙色的花。", pinyin: "Wǒ xǐhuan chéngsè de huā.", english: "I like orange flowers."),
    ],
    "粉色": [
      WordExample(hanzi: "这件衣服是粉色的。", pinyin: "Zhè jiàn yīfu shì fěnsè de.", english: "This shirt is pink."),
      WordExample(hanzi: "妹妹有一个粉色的包。", pinyin: "Mèimei yǒu yí gè fěnsè de bāo.", english: "My little sister has a pink bag."),
    ],
    "紫色": [
      WordExample(hanzi: "她买了一双紫色的鞋。", pinyin: "Tā mǎi le yì shuāng zǐsè de xié.", english: "She bought a pair of purple shoes."),
      WordExample(hanzi: "我喜欢紫色的裙子。", pinyin: "Wǒ xǐhuan zǐsè de qúnzi.", english: "I like purple skirts."),
    ],
    "这": [
      WordExample(hanzi: "这是我妈妈。", pinyin: "Zhè shì wǒ mā ma.", english: "This is my mom."),
      WordExample(hanzi: "这个苹果很甜。", pinyin: "Zhè ge píng guǒ hěn tián.", english: "This apple is very sweet."),
    ],
    "那": [
      WordExample(hanzi: "那是我爸爸。", pinyin: "Nà shì wǒ bà ba.", english: "That is my dad."),
      WordExample(hanzi: "那件衣服很漂亮。", pinyin: "Nà jiàn yī fu hěn piào liang.", english: "That piece of clothing is very pretty."),
    ],
    "和": [
      WordExample(hanzi: "我和他都喜欢茶。", pinyin: "Wǒ hé tā dōu xǐ huan chá.", english: "He and I both like tea."),
      WordExample(hanzi: "我要茶和咖啡。", pinyin: "Wǒ yào chá hé kā fēi.", english: "I want tea and coffee."),
    ],
    "很": [
      WordExample(hanzi: "今天天气很好。", pinyin: "Jīn tiān tiān qì hěn hǎo.", english: "The weather is very nice today."),
      WordExample(hanzi: "我妈妈很忙。", pinyin: "Wǒ mā ma hěn máng.", english: "My mom is very busy."),
    ],
    "不": [
      WordExample(hanzi: "我今天不太累。", pinyin: "Wǒ jīn tiān bú tài lèi.", english: "I'm not very tired today."),
      WordExample(hanzi: "我不喝咖啡。", pinyin: "Wǒ bù hē kā fēi.", english: "I don't drink coffee."),
    ],
    "都": [
      WordExample(hanzi: "我们都很高兴。", pinyin: "Wǒ men dōu hěn gāo xìng.", english: "We are all very happy."),
      WordExample(hanzi: "他们都说汉语。", pinyin: "Tā men dōu shuō Hàn yǔ.", english: "They all speak Chinese."),
    ],
    "也": [
      WordExample(hanzi: "我也喜欢茶。", pinyin: "Wǒ yě xǐ huan chá.", english: "I also like tea."),
      WordExample(hanzi: "他也有一只猫。", pinyin: "Tā yě yǒu yì zhī māo.", english: "He also has a cat."),
    ],
    "个": [
      WordExample(hanzi: "我有两个哥哥。", pinyin: "Wǒ yǒu liǎng ge gē ge.", english: "I have two older brothers."),
      WordExample(hanzi: "请给我一个杯子。", pinyin: "Qǐng gěi wǒ yí ge bēi zi.", english: "Please give me a cup."),
    ],
    "本": [
      WordExample(hanzi: "我有三本汉语书。", pinyin: "Wǒ yǒu sān běn Hàn yǔ shū.", english: "I have three Chinese books."),
      WordExample(hanzi: "这本词典很贵。", pinyin: "Zhè běn cí diǎn hěn guì.", english: "This dictionary is very expensive."),
    ],
    "上": [
      WordExample(hanzi: "请上楼找我。", pinyin: "Qǐng shàng lóu zhǎo wǒ.", english: "Please come upstairs to find me."),
      WordExample(hanzi: "周末我们上山。", pinyin: "Zhōu mò wǒ men shàng shān.", english: "We go up the mountain on weekends."),
    ],
    "下": [
      WordExample(hanzi: "今天下雨了。", pinyin: "Jīn tiān xià yǔ le.", english: "It rained today."),
      WordExample(hanzi: "请下楼吃饭。", pinyin: "Qǐng xià lóu chī fàn.", english: "Please come downstairs to eat."),
    ],
    "左": [
      WordExample(hanzi: "学校在左边。", pinyin: "Xué xiào zài zuǒ biān.", english: "The school is on the left."),
      WordExample(hanzi: "请往左边走。", pinyin: "Qǐng wǎng zuǒ biān zǒu.", english: "Please walk on the left side."),
    ],
    "右": [
      WordExample(hanzi: "医院在右边。", pinyin: "Yī yuàn zài yòu biān.", english: "The hospital is on the right."),
      WordExample(hanzi: "请你往右看。", pinyin: "Qǐng nǐ wǎng yòu kàn.", english: "Please look to the right."),
    ],
    "前": [
      WordExample(hanzi: "往前走，就是车站。", pinyin: "Wǎng qián zǒu, jiù shì chē zhàn.", english: "Go straight ahead and you will reach the station."),
      WordExample(hanzi: "他坐在我前面。", pinyin: "Tā zuò zài wǒ qián miàn.", english: "He sits in front of me."),
    ],
    "后": [
      WordExample(hanzi: "我在你后面。", pinyin: "Wǒ zài nǐ hòu miàn.", english: "I am behind you."),
      WordExample(hanzi: "学校后面有一个公园。", pinyin: "Xué xiào hòu miàn yǒu yí ge gōng yuán.", english: "There is a park behind the school."),
    ],
    "里": [
      WordExample(hanzi: "书包里面有什么？", pinyin: "Shū bāo lǐ miàn yǒu shén me?", english: "What is inside the schoolbag?"),
      WordExample(hanzi: "我在家里等你。", pinyin: "Wǒ zài jiā li děng nǐ.", english: "I will wait for you at home."),
    ],
    "外": [
      WordExample(hanzi: "今天外面很冷。", pinyin: "Jīn tiān wài miàn hěn lěng.", english: "It is very cold outside today."),
      WordExample(hanzi: "门外有人等你。", pinyin: "Mén wài yǒu rén děng nǐ.", english: "Someone is waiting for you outside the door."),
    ],
    "旁边": [
      WordExample(hanzi: "我坐在他旁边。", pinyin: "Wǒ zuò zài tā páng biān.", english: "I sit next to him."),
      WordExample(hanzi: "旁边有一家书店。", pinyin: "Páng biān yǒu yì jiā shū diàn.", english: "There is a bookstore next door."),
    ],
    "对面": [
      WordExample(hanzi: "我家对面是医院。", pinyin: "Wǒ jiā duì miàn shì yī yuàn.", english: "Across from my home is a hospital."),
      WordExample(hanzi: "对面有个公园。", pinyin: "Duì miàn yǒu ge gōng yuán.", english: "There is a park across the street."),
    ],
    "附近": [
      WordExample(hanzi: "我家附近有公园。", pinyin: "Wǒ jiā fù jìn yǒu gōng yuán.", english: "There is a park near my home."),
      WordExample(hanzi: "附近没有医院。", pinyin: "Fù jìn méi yǒu yī yuàn.", english: "There is no hospital nearby."),
    ],
    "这里": [
      WordExample(hanzi: "请在这里等我。", pinyin: "Qǐng zài zhè lǐ děng wǒ.", english: "Please wait for me here."),
      WordExample(hanzi: "这里的东西很便宜。", pinyin: "Zhè lǐ de dōng xi hěn pián yi.", english: "The things here are very cheap."),
    ],
    "那里": [
      WordExample(hanzi: "我们去那里吃饭。", pinyin: "Wǒ men qù nà lǐ chī fàn.", english: "Let's go eat there."),
      WordExample(hanzi: "那里很安静。", pinyin: "Nà lǐ hěn ān jìng.", english: "It is very quiet there."),
    ],
    "中间": [
      WordExample(hanzi: "我在他们中间。", pinyin: "Wǒ zài tā men zhōng jiān.", english: "I am between them."),
      WordExample(hanzi: "桌子中间有一个花瓶。", pinyin: "Zhuō zi zhōng jiān yǒu yí ge huā píng.", english: "There is a vase in the middle of the table."),
    ],
    "开心": [
      WordExample(hanzi: "见到你我很开心。", pinyin: "Jiàn dào nǐ wǒ hěn kāi xīn", english: "I'm very happy to see you."),
      WordExample(hanzi: "孩子们玩得很开心。", pinyin: "Hái zi men wán de hěn kāi xīn", english: "The children are having a lot of fun."),
    ],
    "难过": [
      WordExample(hanzi: "别难过，明天会更好。", pinyin: "Bié nán guò, míng tiān huì gèng hǎo", english: "Don't be sad; tomorrow will be better."),
      WordExample(hanzi: "我今天有点难过。", pinyin: "Wǒ jīn tiān yǒu diǎn nán guò", english: "I'm a little sad today."),
    ],
    "生气": [
      WordExample(hanzi: "他为什么生气？", pinyin: "Tā wèi shén me shēng qì?", english: "Why is he angry?"),
      WordExample(hanzi: "你生气了吗？", pinyin: "Nǐ shēng qì le ma?", english: "Are you angry?"),
    ],
    "害怕": [
      WordExample(hanzi: "别害怕，我在这里。", pinyin: "Bié hài pà, wǒ zài zhè lǐ", english: "Don't be afraid, I'm right here."),
      WordExample(hanzi: "弟弟害怕打雷。", pinyin: "Dì di hài pà dǎ léi", english: "My little brother is afraid of thunder."),
    ],
    "担心": [
      WordExample(hanzi: "妈妈很担心我。", pinyin: "Mā ma hěn dān xīn wǒ", english: "My mom worries about me a lot."),
      WordExample(hanzi: "我很担心明天的考试。", pinyin: "Wǒ hěn dān xīn míng tiān de kǎo shì", english: "I'm worried about tomorrow's exam."),
    ],
    "想念": [
      WordExample(hanzi: "我很想念我的家人。", pinyin: "Wǒ hěn xiǎng niàn wǒ de jiā rén", english: "I really miss my family."),
      WordExample(hanzi: "她很想念她的妈妈。", pinyin: "Tā hěn xiǎng niàn tā de mā ma", english: "She misses her mom very much."),
    ],
    "感动": [
      WordExample(hanzi: "他的话让我很感动。", pinyin: "Tā de huà ràng wǒ hěn gǎn dòng", english: "His words really touched me."),
      WordExample(hanzi: "这个电影让我感动。", pinyin: "Zhè ge diàn yǐng ràng wǒ gǎn dòng", english: "This movie moved me."),
    ],
    "紧张": [
      WordExample(hanzi: "我上台说话很紧张。", pinyin: "Wǒ shàng tái shuō huà hěn jǐn zhāng", english: "I get nervous when I speak on stage."),
      WordExample(hanzi: "别紧张，慢慢说。", pinyin: "Bié jǐn zhāng, màn màn shuō", english: "Don't be nervous, speak slowly."),
    ],
    "家": [
      WordExample(hanzi: "我七点回家。", pinyin: "Wǒ qī diǎn huí jiā.", english: "I go home at seven."),
      WordExample(hanzi: "你家有几口人？", pinyin: "Nǐ jiā yǒu jǐ kǒu rén?", english: "How many people are in your family?"),
    ],
    "爸爸": [
      WordExample(hanzi: "爸爸在做饭。", pinyin: "Bàba zài zuòfàn.", english: "Dad is cooking."),
      WordExample(hanzi: "我爸爸喜欢喝茶。", pinyin: "Wǒ bàba xǐhuan hē chá.", english: "My dad likes drinking tea."),
    ],
    "妈妈": [
      WordExample(hanzi: "妈妈去买菜了。", pinyin: "Māma qù mǎi cài le.", english: "Mom went to buy groceries."),
      WordExample(hanzi: "妈妈，我饿了。", pinyin: "Māma, wǒ è le.", english: "Mom, I'm hungry."),
    ],
    "哥哥": [
      WordExample(hanzi: "哥哥在打篮球。", pinyin: "Gēge zài dǎ lánqiú.", english: "My older brother is playing basketball."),
      WordExample(hanzi: "哥哥比我大三岁。", pinyin: "Gēge bǐ wǒ dà sān suì.", english: "My older brother is three years older than me."),
    ],
    "姐姐": [
      WordExample(hanzi: "姐姐会弹钢琴。", pinyin: "Jiějie huì tán gāngqín.", english: "My older sister can play the piano."),
      WordExample(hanzi: "姐姐喜欢看电影。", pinyin: "Jiějie xǐhuan kàn diànyǐng.", english: "My older sister likes watching movies."),
    ],
    "弟弟": [
      WordExample(hanzi: "弟弟今年五岁。", pinyin: "Dìdi jīnnián wǔ suì.", english: "My younger brother is five years old this year."),
      WordExample(hanzi: "弟弟在写作业。", pinyin: "Dìdi zài xiě zuòyè.", english: "My younger brother is doing his homework."),
    ],
    "妹妹": [
      WordExample(hanzi: "妹妹在唱歌。", pinyin: "Mèimei zài chànggē.", english: "My younger sister is singing."),
      WordExample(hanzi: "我教妹妹说汉语。", pinyin: "Wǒ jiāo mèimei shuō Hànyǔ.", english: "I teach my younger sister to speak Chinese."),
    ],
    "儿子": [
      WordExample(hanzi: "儿子喜欢踢足球。", pinyin: "Érzi xǐhuan tī zúqiú.", english: "My son likes playing football."),
      WordExample(hanzi: "我儿子上小学了。", pinyin: "Wǒ érzi shàng xiǎoxué le.", english: "My son has started primary school."),
    ],
    "女儿": [
      WordExample(hanzi: "我女儿喜欢画画。", pinyin: "Wǒ nǚ'ér xǐhuan huàhuà.", english: "My daughter likes drawing."),
      WordExample(hanzi: "女儿今天很累。", pinyin: "Nǚ'ér jīntiān hěn lèi.", english: "My daughter is very tired today."),
    ],
    "孩子": [
      WordExample(hanzi: "那个孩子在哭。", pinyin: "Nàge háizi zài kū.", english: "That child is crying."),
      WordExample(hanzi: "我有两个孩子。", pinyin: "Wǒ yǒu liǎng ge háizi.", english: "I have two children."),
    ],
    "吃": [
      WordExample(hanzi: "我们一起去吃饭吧。", pinyin: "Wǒ men yì qǐ qù chī fàn ba.", english: "Let's go eat together."),
      WordExample(hanzi: "你吃饭了吗？", pinyin: "Nǐ chī fàn le ma?", english: "Have you eaten yet?"),
    ],
    "喝": [
      WordExample(hanzi: "多喝热水对身体好。", pinyin: "Duō hē rè shuǐ duì shēn tǐ hǎo.", english: "Drinking more hot water is good for you."),
      WordExample(hanzi: "他每天喝很多水。", pinyin: "Tā měi tiān hē hěn duō shuǐ.", english: "He drinks a lot of water every day."),
    ],
    "水": [
      WordExample(hanzi: "我想喝一杯凉水。", pinyin: "Wǒ xiǎng hē yì bēi liáng shuǐ.", english: "I'd like a glass of cold water."),
      WordExample(hanzi: "水太热了，等一下吧。", pinyin: "Shuǐ tài rè le, děng yí xià ba.", english: "The water is too hot, wait a moment."),
    ],
    "茶": [
      WordExample(hanzi: "请给我一杯热茶。", pinyin: "Qǐng gěi wǒ yì bēi rè chá.", english: "Please give me a cup of hot tea."),
      WordExample(hanzi: "我们边喝茶边聊天。", pinyin: "Wǒ men biān hē chá biān liáo tiān.", english: "We chat while drinking tea."),
    ],
    "咖啡": [
      WordExample(hanzi: "这家店的咖啡很好喝。", pinyin: "Zhè jiā diàn de kā fēi hěn hǎo hē.", english: "The coffee at this shop is very good."),
      WordExample(hanzi: "你每天喝咖啡吗？", pinyin: "Nǐ měi tiān hē kā fēi ma?", english: "Do you drink coffee every day?"),
    ],
    "牛奶": [
      WordExample(hanzi: "冰箱里还有牛奶吗？", pinyin: "Bīng xiāng lǐ hái yǒu niú nǎi ma?", english: "Is there any milk left in the fridge?"),
      WordExample(hanzi: "孩子喜欢喝牛奶。", pinyin: "Hái zi xǐ huan hē niú nǎi.", english: "Children like drinking milk."),
    ],
    "米饭": [
      WordExample(hanzi: "妈妈做了很多米饭。", pinyin: "Mā ma zuò le hěn duō mǐ fàn.", english: "Mom made a lot of rice."),
      WordExample(hanzi: "我不太想吃米饭。", pinyin: "Wǒ bú tài xiǎng chī mǐ fàn.", english: "I don't really want to eat rice."),
    ],
    "面包": [
      WordExample(hanzi: "我买了一个面包。", pinyin: "Wǒ mǎi le yí gè miàn bāo.", english: "I bought a loaf of bread."),
      WordExample(hanzi: "面包放在桌子上。", pinyin: "Miàn bāo fàng zài zhuō zi shàng.", english: "The bread is on the table."),
    ],
    "苹果": [
      WordExample(hanzi: "我每天吃一个苹果。", pinyin: "Wǒ měi tiān chī yí gè píng guǒ.", english: "I eat an apple every day."),
      WordExample(hanzi: "苹果多少钱一斤？", pinyin: "Píng guǒ duō shao qián yì jīn?", english: "How much is half a kilo of apples?"),
    ],
    "鸡蛋": [
      WordExample(hanzi: "我想买十个鸡蛋。", pinyin: "Wǒ xiǎng mǎi shí gè jī dàn.", english: "I want to buy ten eggs."),
      WordExample(hanzi: "早饭我吃了一个鸡蛋。", pinyin: "Zǎo fàn wǒ chī le yí gè jī dàn.", english: "I ate an egg for breakfast."),
    ],
    "菜": [
      WordExample(hanzi: "妈妈做的菜很好吃。", pinyin: "Mā ma zuò de cài hěn hǎo chī.", english: "The dishes Mom makes are delicious."),
      WordExample(hanzi: "我想点一个素菜。", pinyin: "Wǒ xiǎng diǎn yí gè sù cài.", english: "I'd like to order a vegetable dish."),
    ],
    "肉": [
      WordExample(hanzi: "这个肉有点咸。", pinyin: "Zhè ge ròu yǒu diǎn xián.", english: "This meat is a bit salty."),
      WordExample(hanzi: "我喜欢吃牛肉。", pinyin: "Wǒ xǐ huan chī niú ròu.", english: "I like eating beef."),
    ],
    "水果": [
      WordExample(hanzi: "这里的水果很便宜。", pinyin: "Zhè lǐ de shuǐ guǒ hěn pián yi.", english: "The fruit here is very cheap."),
      WordExample(hanzi: "我每天吃一些水果。", pinyin: "Wǒ měi tiān chī yì xiē shuǐ guǒ.", english: "I eat some fruit every day."),
    ],
    "面条": [
      WordExample(hanzi: "我要一碗面条。", pinyin: "Wǒ yào yì wǎn miàn tiáo.", english: "I want a bowl of noodles."),
      WordExample(hanzi: "他今天中午吃面条。", pinyin: "Tā jīn tiān zhōng wǔ chī miàn tiáo.", english: "He is having noodles for lunch today."),
    ],
    "饺子": [
      WordExample(hanzi: "我们晚上包饺子。", pinyin: "Wǒ men wǎn shang bāo jiǎo zi.", english: "We are making dumplings this evening."),
      WordExample(hanzi: "妈妈做的饺子很好吃。", pinyin: "Mā ma zuò de jiǎo zi hěn hǎo chī.", english: "The dumplings Mom makes are delicious."),
    ],
    "包子": [
      WordExample(hanzi: "这个包子是肉的。", pinyin: "Zhè ge bāo zi shì ròu de.", english: "This steamed bun has meat in it."),
      WordExample(hanzi: "我想买两个包子。", pinyin: "Wǒ xiǎng mǎi liǎng gè bāo zi.", english: "I want to buy two steamed buns."),
    ],
    "汤": [
      WordExample(hanzi: "妈妈做的汤很好喝。", pinyin: "Mā ma zuò de tāng hěn hǎo hē.", english: "The soup Mom makes is delicious."),
      WordExample(hanzi: "天冷了，喝点热汤吧。", pinyin: "Tiān lěng le, hē diǎn rè tāng ba.", english: "It's cold, have some hot soup."),
    ],
    "糖": [
      WordExample(hanzi: "我不喜欢吃糖。", pinyin: "Wǒ bù xǐ huan chī táng.", english: "I don't like eating sweets."),
      WordExample(hanzi: "汤里放一点糖。", pinyin: "Tāng lǐ fàng yì diǎn táng.", english: "Put a little sugar in the soup."),
    ],
    "盐": [
      WordExample(hanzi: "菜里的盐太多了。", pinyin: "Cài lǐ de yán tài duō le.", english: "There is too much salt in the dish."),
      WordExample(hanzi: "请再给我一点盐。", pinyin: "Qǐng zài gěi wǒ yì diǎn yán.", english: "Please give me a little more salt."),
    ],
    "啤酒": [
      WordExample(hanzi: "你想喝啤酒吗？", pinyin: "Nǐ xiǎng hē pí jiǔ ma?", english: "Do you want to drink beer?"),
      WordExample(hanzi: "我们买了两瓶啤酒。", pinyin: "Wǒ men mǎi le liǎng píng pí jiǔ.", english: "We bought two bottles of beer."),
    ],
    "果汁": [
      WordExample(hanzi: "这杯果汁很甜。", pinyin: "Zhè bēi guǒ zhī hěn tián.", english: "This glass of juice is very sweet."),
      WordExample(hanzi: "孩子喜欢喝果汁。", pinyin: "Hái zi xǐ huan hē guǒ zhī.", english: "Children like drinking juice."),
    ],
    "早餐": [
      WordExample(hanzi: "我早餐吃面包和鸡蛋。", pinyin: "Wǒ zǎo cān chī miàn bāo hé jī dàn.", english: "I eat bread and eggs for breakfast."),
      WordExample(hanzi: "早餐店几点开门？", pinyin: "Zǎo cān diàn jǐ diǎn kāi mén?", english: "What time does the breakfast shop open?"),
    ],
    "晚餐": [
      WordExample(hanzi: "今天的晚餐很丰富。", pinyin: "Jīn tiān de wǎn cān hěn fēng fù.", english: "Today's dinner is very hearty."),
      WordExample(hanzi: "我们一起吃晚餐吧。", pinyin: "Wǒ men yì qǐ chī wǎn cān ba.", english: "Let's have dinner together."),
    ],
    "吗": [
      WordExample(hanzi: "你喜欢喝茶吗？", pinyin: "Nǐ xǐ huan hē chá ma?", english: "Do you like drinking tea?"),
      WordExample(hanzi: "明天你有空吗？", pinyin: "Míng tiān nǐ yǒu kòng ma?", english: "Are you free tomorrow?"),
    ],
    "呢": [
      WordExample(hanzi: "我的手机呢？", pinyin: "Wǒ de shǒu jī ne?", english: "Where is my phone?"),
      WordExample(hanzi: "妈妈在做什么呢？", pinyin: "Mā ma zài zuò shén me ne?", english: "What is Mom doing?"),
    ],
    "吧": [
      WordExample(hanzi: "我们吃饭吧。", pinyin: "Wǒ men chī fàn ba.", english: "Let's eat."),
      WordExample(hanzi: "你休息一下吧。", pinyin: "Nǐ xiū xi yí xià ba.", english: "Take a rest."),
    ],
    "什么": [
      WordExample(hanzi: "你叫什么名字？", pinyin: "Nǐ jiào shén me míng zi?", english: "What is your name?"),
      WordExample(hanzi: "你想吃什么？", pinyin: "Nǐ xiǎng chī shén me?", english: "What do you want to eat?"),
    ],
    "谁": [
      WordExample(hanzi: "谁是你的老师？", pinyin: "Shéi shì nǐ de lǎo shī?", english: "Who is your teacher?"),
      WordExample(hanzi: "那个女孩是谁？", pinyin: "Nà ge nǚ hái shì shéi?", english: "Who is that girl?"),
    ],
    "哪": [
      WordExample(hanzi: "你喜欢哪件衣服？", pinyin: "Nǐ xǐ huan nǎ jiàn yī fu?", english: "Which piece of clothing do you like?"),
      WordExample(hanzi: "你住在哪个城市？", pinyin: "Nǐ zhù zài nǎ ge chéng shì?", english: "Which city do you live in?"),
    ],
    "哪里": [
      WordExample(hanzi: "你从哪里来？", pinyin: "Nǐ cóng nǎ lǐ lái?", english: "Where do you come from?"),
      WordExample(hanzi: "哪里可以买票？", pinyin: "Nǎ lǐ kě yǐ mǎi piào?", english: "Where can I buy tickets?"),
    ],
    "怎么": [
      WordExample(hanzi: "你每天怎么去上班？", pinyin: "Nǐ měi tiān zěn me qù shàng bān?", english: "How do you go to work every day?"),
      WordExample(hanzi: "请问，怎么去火车站？", pinyin: "Qǐng wèn, zěn me qù huǒ chē zhàn?", english: "Excuse me, how do I get to the train station?"),
    ],
    "为什么": [
      WordExample(hanzi: "你为什么迟到？", pinyin: "Nǐ wèi shén me chí dào?", english: "Why are you late?"),
      WordExample(hanzi: "他为什么不高兴？", pinyin: "Tā wèi shén me bù gāo xìng?", english: "Why is he unhappy?"),
    ],
    "多少": [
      WordExample(hanzi: "你有多少本书？", pinyin: "Nǐ yǒu duō shao běn shū?", english: "How many books do you have?"),
      WordExample(hanzi: "你们班有多少学生？", pinyin: "Nǐ men bān yǒu duō shao xué sheng?", english: "How many students are in your class?"),
    ],
    "几": [
      WordExample(hanzi: "你家有几口人？", pinyin: "Nǐ jiā yǒu jǐ kǒu rén?", english: "How many people are in your family?"),
      WordExample(hanzi: "你的生日是几月几号？", pinyin: "Nǐ de shēng rì shì jǐ yuè jǐ hào?", english: "What month and day is your birthday?"),
    ],
    "你好": [
      WordExample(hanzi: "你好，很高兴认识你。", pinyin: "Nǐ hǎo, hěn gāoxìng rènshi nǐ.", english: "Hello, nice to meet you."),
      WordExample(hanzi: "你好，请问你叫什么名字？", pinyin: "Nǐ hǎo, qǐngwèn nǐ jiào shénme míngzi?", english: "Hello, may I ask what your name is?"),
    ],
    "您好": [
      WordExample(hanzi: "您好，请问您找谁？", pinyin: "Nín hǎo, qǐngwèn nín zhǎo shéi?", english: "Hello, who are you looking for?"),
      WordExample(hanzi: "您好，很高兴见到您。", pinyin: "Nín hǎo, hěn gāoxìng jiàndào nín.", english: "Hello, it is a pleasure to meet you."),
    ],
    "谢谢": [
      WordExample(hanzi: "谢谢你，我很喜欢。", pinyin: "Xièxie nǐ, wǒ hěn xǐhuan.", english: "Thank you, I like it very much."),
      WordExample(hanzi: "谢谢，不用了。", pinyin: "Xièxie, bú yòng le.", english: "Thanks, no need."),
    ],
    "再见": [
      WordExample(hanzi: "我先走了，再见！", pinyin: "Wǒ xiān zǒu le, zàijiàn!", english: "I'm heading off first, goodbye!"),
      WordExample(hanzi: "再见，路上小心。", pinyin: "Zàijiàn, lùshang xiǎoxīn.", english: "Goodbye, take care on the way."),
    ],
    "对不起": [
      WordExample(hanzi: "对不起，让您久等了。", pinyin: "Duìbuqǐ, ràng nín jiǔ děng le.", english: "Sorry for keeping you waiting so long."),
      WordExample(hanzi: "对不起，这是我的错。", pinyin: "Duìbuqǐ, zhè shì wǒ de cuò.", english: "Sorry, this is my mistake."),
    ],
    "没关系": [
      WordExample(hanzi: "没关系，我们明天再去。", pinyin: "Méi guānxi, wǒmen míngtiān zài qù.", english: "No problem, we'll go again tomorrow."),
      WordExample(hanzi: "没关系，慢慢来。", pinyin: "Méi guānxi, màn màn lái.", english: "It's okay, take your time."),
    ],
    "请": [
      WordExample(hanzi: "请给我一杯茶。", pinyin: "Qǐng gěi wǒ yì bēi chá.", english: "Please give me a cup of tea."),
      WordExample(hanzi: "请再说一遍。", pinyin: "Qǐng zài shuō yí biàn.", english: "Please say that again."),
    ],
    "不客气": [
      WordExample(hanzi: "不客气，这是我应该做的。", pinyin: "Bú kèqi, zhè shì wǒ yīnggāi zuò de.", english: "You're welcome, it's what I should do."),
      WordExample(hanzi: "不客气，很高兴能帮你。", pinyin: "Bú kèqi, hěn gāoxìng néng bāng nǐ.", english: "You're welcome, I'm glad I can help you."),
    ],
    "早上好": [
      WordExample(hanzi: "早上好，昨晚睡得好吗？", pinyin: "Zǎoshang hǎo, zuówǎn shuì de hǎo ma?", english: "Good morning, did you sleep well last night?"),
      WordExample(hanzi: "早上好，今天天气不错。", pinyin: "Zǎoshang hǎo, jīntiān tiānqì búcuò.", english: "Good morning, the weather is nice today."),
    ],
    "晚安": [
      WordExample(hanzi: "太晚了，晚安。", pinyin: "Tài wǎn le, wǎn'ān.", english: "It's too late, good night."),
      WordExample(hanzi: "晚安，早点休息。", pinyin: "Wǎn'ān, zǎo diǎn xiūxi.", english: "Good night, get some rest early."),
    ],
    "你好吗": [
      WordExample(hanzi: "好久不见，你好吗？", pinyin: "Hǎojiǔ bú jiàn, nǐ hǎo ma?", english: "Long time no see, how are you?"),
      WordExample(hanzi: "老师，你好吗？", pinyin: "Lǎoshī, nǐ hǎo ma?", english: "Teacher, how are you?"),
    ],
    "健康": [
      WordExample(hanzi: "运动让人更健康。", pinyin: "Yùn dòng ràng rén gèng jiàn kāng", english: "Exercise makes people healthier."),
      WordExample(hanzi: "健康比钱重要。", pinyin: "Jiàn kāng bǐ qián zhòng yào", english: "Health is more important than money."),
    ],
    "生病": [
      WordExample(hanzi: "弟弟昨天生病了。", pinyin: "Dì di zuó tiān shēng bìng le", english: "My little brother got sick yesterday."),
      WordExample(hanzi: "她生病不能上班。", pinyin: "Tā shēng bìng bù néng shàng bān", english: "She is sick and can't go to work."),
    ],
    "药": [
      WordExample(hanzi: "这药一天吃两次。", pinyin: "Zhè yào yì tiān chī liǎng cì", english: "Take this medicine twice a day."),
      WordExample(hanzi: "药店在医院旁边。", pinyin: "Yào diàn zài yī yuàn páng biān", english: "The pharmacy is next to the hospital."),
    ],
    "感冒": [
      WordExample(hanzi: "我有点感冒。", pinyin: "Wǒ yǒu diǎn gǎn mào", english: "I have a slight cold."),
      WordExample(hanzi: "感冒要多喝水。", pinyin: "Gǎn mào yào duō hē shuǐ", english: "When you have a cold, drink more water."),
    ],
    "头疼": [
      WordExample(hanzi: "我今天有点头疼。", pinyin: "Wǒ jīn tiān yǒu diǎn tóu téng", english: "I have a slight headache today."),
      WordExample(hanzi: "他头疼得厉害。", pinyin: "Tā tóu téng de lì hai", english: "His headache is severe."),
    ],
    "发烧": [
      WordExample(hanzi: "他发烧三十九度。", pinyin: "Tā fā shāo sān shí jiǔ dù", english: "He has a fever of thirty-nine degrees."),
      WordExample(hanzi: "我昨天发烧了。", pinyin: "Wǒ zuó tiān fā shāo le", english: "I had a fever yesterday."),
    ],
    "休息": [
      WordExample(hanzi: "休息一下就好了。", pinyin: "Xiū xi yí xià jiù hǎo le", english: "Take a short rest and you'll be fine."),
      WordExample(hanzi: "周末好好休息。", pinyin: "Zhōu mò hǎo hǎo xiū xi", english: "Rest well on the weekend."),
    ],
    "舒服": [
      WordExample(hanzi: "这张床很舒服。", pinyin: "Zhè zhāng chuáng hěn shū fu", english: "This bed is very comfortable."),
      WordExample(hanzi: "我睡得很舒服。", pinyin: "Wǒ shuì de hěn shū fu", english: "I slept very comfortably."),
    ],
    "雨": [
      WordExample(hanzi: "外面下雨了。", pinyin: "Wài miàn xià yǔ le.", english: "It's raining outside."),
      WordExample(hanzi: "雨停了，我们走吧。", pinyin: "Yǔ tíng le, wǒ men zǒu ba.", english: "The rain has stopped, let's go."),
    ],
    "雪": [
      WordExample(hanzi: "雪下得很大。", pinyin: "Xuě xià de hěn dà.", english: "It's snowing heavily."),
      WordExample(hanzi: "孩子们喜欢玩雪。", pinyin: "Hái zi men xǐ huan wán xuě.", english: "The children like playing in the snow."),
    ],
    "风": [
      WordExample(hanzi: "风从哪里来？", pinyin: "Fēng cóng nǎ lǐ lái?", english: "Where does the wind come from?"),
      WordExample(hanzi: "风把我的帽子吹走了。", pinyin: "Fēng bǎ wǒ de mào zi chuī zǒu le.", english: "The wind blew my hat away."),
    ],
    "太阳": [
      WordExample(hanzi: "太阳从东边升起。", pinyin: "Tài yáng cóng dōng biān shēng qǐ.", english: "The sun rises in the east."),
      WordExample(hanzi: "今天太阳很好。", pinyin: "Jīn tiān tài yáng hěn hǎo.", english: "The sun is nice today."),
    ],
    "月亮": [
      WordExample(hanzi: "月亮出来了。", pinyin: "Yuè liang chū lái le.", english: "The moon has come out."),
      WordExample(hanzi: "今晚的月亮真亮。", pinyin: "Jīn wǎn de yuè liang zhēn liàng.", english: "The moon is really bright tonight."),
    ],
    "星星": [
      WordExample(hanzi: "星星真漂亮。", pinyin: "Xīng xing zhēn piào liang.", english: "The stars are really pretty."),
      WordExample(hanzi: "晚上能看到很多星星。", pinyin: "Wǎn shang néng kàn dào hěn duō xīng xing.", english: "You can see many stars at night."),
    ],
    "云": [
      WordExample(hanzi: "天上没有云。", pinyin: "Tiān shang méi yǒu yún.", english: "There are no clouds in the sky."),
      WordExample(hanzi: "那片云像一只小狗。", pinyin: "Nà piàn yún xiàng yì zhī xiǎo gǒu.", english: "That cloud looks like a little dog."),
    ],
    "山": [
      WordExample(hanzi: "我们去爬山吧。", pinyin: "Wǒ men qù pá shān ba.", english: "Let's go climb a mountain."),
      WordExample(hanzi: "山上有很多树。", pinyin: "Shān shang yǒu hěn duō shù.", english: "There are many trees on the mountain."),
    ],
    "河": [
      WordExample(hanzi: "这条河很宽。", pinyin: "Zhè tiáo hé hěn kuān.", english: "This river is wide."),
      WordExample(hanzi: "孩子们在河边玩。", pinyin: "Hái zi men zài hé biān wán.", english: "The children are playing by the river."),
    ],
    "海": [
      WordExample(hanzi: "海边人很多。", pinyin: "Hǎi biān rén hěn duō.", english: "There are many people at the seaside."),
      WordExample(hanzi: "夏天我们去海边。", pinyin: "Xià tiān wǒ men qù hǎi biān.", english: "In summer we go to the seaside."),
    ],
    "树": [
      WordExample(hanzi: "树上有一只小鸟。", pinyin: "Shù shang yǒu yì zhī xiǎo niǎo.", english: "There is a little bird in the tree."),
      WordExample(hanzi: "我们在树下休息。", pinyin: "Wǒ men zài shù xià xiū xi.", english: "We rest under the tree."),
    ],
    "花": [
      WordExample(hanzi: "这些花真香。", pinyin: "Zhè xiē huā zhēn xiāng.", english: "These flowers smell really good."),
      WordExample(hanzi: "我买了一些花。", pinyin: "Wǒ mǎi le yì xiē huā.", english: "I bought some flowers."),
    ],
    "草": [
      WordExample(hanzi: "孩子们在草地上跑。", pinyin: "Hái zi men zài cǎo dì shang pǎo.", english: "The children are running on the grass."),
      WordExample(hanzi: "请不要踩草。", pinyin: "Qǐng bú yào cǎi cǎo.", english: "Please don't step on the grass."),
    ],
    "春天": [
      WordExample(hanzi: "春天花开了。", pinyin: "Chūn tiān huā kāi le.", english: "The flowers bloom in spring."),
      WordExample(hanzi: "我最喜欢春天。", pinyin: "Wǒ zuì xǐ huan chūn tiān.", english: "I like spring the most."),
    ],
    "夏天": [
      WordExample(hanzi: "夏天白天很长。", pinyin: "Xià tiān bái tiān hěn cháng.", english: "The days are long in summer."),
      WordExample(hanzi: "夏天我们去游泳。", pinyin: "Xià tiān wǒ men qù yóu yǒng.", english: "In summer we go swimming."),
    ],
    "秋天": [
      WordExample(hanzi: "秋天的叶子黄了。", pinyin: "Qiū tiān de yè zi huáng le.", english: "The leaves turn yellow in autumn."),
      WordExample(hanzi: "秋天风很大。", pinyin: "Qiū tiān fēng hěn dà.", english: "The wind is strong in autumn."),
    ],
    "冬天": [
      WordExample(hanzi: "冬天白天很短。", pinyin: "Dōng tiān bái tiān hěn duǎn.", english: "The days are short in winter."),
      WordExample(hanzi: "冬天我们常吃火锅。", pinyin: "Dōng tiān wǒ men cháng chī huǒ guō.", english: "In winter we often eat hotpot."),
    ],
    "空气": [
      WordExample(hanzi: "这里的空气很新鲜。", pinyin: "Zhè lǐ de kōng qì hěn xīn xiān.", english: "The air here is very fresh."),
      WordExample(hanzi: "开窗换换空气。", pinyin: "Kāi chuāng huàn huàn kōng qì.", english: "Open the window and let some fresh air in."),
    ],
    "零": [
      WordExample(hanzi: "今天只有零度。", pinyin: "Jīntiān zhǐ yǒu líng dù.", english: "It is only zero degrees today."),
      WordExample(hanzi: "他考了零分。", pinyin: "Tā kǎo le líng fēn.", english: "He got a zero on the test."),
    ],
    "一": [
      WordExample(hanzi: "我住在十一楼。", pinyin: "Wǒ zhù zài shí yī lóu.", english: "I live on the eleventh floor."),
      WordExample(hanzi: "请给我一杯茶。", pinyin: "Qǐng gěi wǒ yì bēi chá.", english: "Please give me a cup of tea."),
    ],
    "二": [
      WordExample(hanzi: "二月的北京很冷。", pinyin: "Èryuè de Běijīng hěn lěng.", english: "Beijing is very cold in February."),
      WordExample(hanzi: "第二课不太难。", pinyin: "Dì èr kè bú tài nán.", english: "Lesson two is not too difficult."),
    ],
    "三": [
      WordExample(hanzi: "现在三点半。", pinyin: "Xiànzài sān diǎn bàn.", english: "It is half past three now."),
      WordExample(hanzi: "我们有三只猫。", pinyin: "Wǒmen yǒu sān zhī māo.", english: "We have three cats."),
    ],
    "四": [
      WordExample(hanzi: "四月常常下雨。", pinyin: "Sìyuè chángcháng xià yǔ.", english: "It often rains in April."),
      WordExample(hanzi: "我买了四个鸡蛋。", pinyin: "Wǒ mǎi le sì gè jīdàn.", english: "I bought four eggs."),
    ],
    "五": [
      WordExample(hanzi: "我五点下班。", pinyin: "Wǒ wǔ diǎn xiàbān.", english: "I get off work at five."),
      WordExample(hanzi: "这本书五十元。", pinyin: "Zhè běn shū wǔshí yuán.", english: "This book is fifty yuan."),
    ],
    "六": [
      WordExample(hanzi: "我六点起床。", pinyin: "Wǒ liù diǎn qǐchuáng.", english: "I get up at six."),
      WordExample(hanzi: "我们班有六十人。", pinyin: "Wǒmen bān yǒu liùshí rén.", english: "There are sixty people in our class."),
    ],
    "七": [
      WordExample(hanzi: "我七点吃早饭。", pinyin: "Wǒ qī diǎn chī zǎofàn.", english: "I eat breakfast at seven."),
      WordExample(hanzi: "他今年七十岁。", pinyin: "Tā jīnnián qīshí suì.", english: "He is seventy years old this year."),
    ],
    "八": [
      WordExample(hanzi: "我八点去上班。", pinyin: "Wǒ bā diǎn qù shàngbān.", english: "I go to work at eight."),
      WordExample(hanzi: "桌上有八瓶水。", pinyin: "Zhuō shàng yǒu bā píng shuǐ.", english: "There are eight bottles of water on the table."),
    ],
    "九": [
      WordExample(hanzi: "我九点睡觉。", pinyin: "Wǒ jiǔ diǎn shuìjiào.", english: "I go to bed at nine."),
      WordExample(hanzi: "我哥哥二十九岁。", pinyin: "Wǒ gēge èrshíjiǔ suì.", english: "My older brother is twenty-nine years old."),
    ],
    "十": [
      WordExample(hanzi: "我学了十课。", pinyin: "Wǒ xué le shí kè.", english: "I have studied ten lessons."),
      WordExample(hanzi: "还有十分钟。", pinyin: "Háiyǒu shí fēnzhōng.", english: "There are ten minutes left."),
    ],
    "百": [
      WordExample(hanzi: "这个包三百元。", pinyin: "Zhège bāo sānbǎi yuán.", english: "This bag is three hundred yuan."),
      WordExample(hanzi: "我们学校有一百个老师。", pinyin: "Wǒmen xuéxiào yǒu yì bǎi gè lǎoshī.", english: "Our school has one hundred teachers."),
    ],
    "千": [
      WordExample(hanzi: "这台电脑三千元。", pinyin: "Zhè tái diànnǎo sānqiān yuán.", english: "This computer is three thousand yuan."),
      WordExample(hanzi: "这里有一千人。", pinyin: "Zhèlǐ yǒu yì qiān rén.", english: "There are one thousand people here."),
    ],
    "万": [
      WordExample(hanzi: "这个城市有五百万人。", pinyin: "Zhège chéngshì yǒu wǔbǎi wàn rén.", english: "This city has five million people."),
      WordExample(hanzi: "他花了一万元。", pinyin: "Tā huā le yí wàn yuán.", english: "He spent ten thousand yuan."),
    ],
    "我": [
      WordExample(hanzi: "我很好，你呢？", pinyin: "Wǒ hěn hǎo, nǐ ne?", english: "I'm fine, and you?"),
      WordExample(hanzi: "我明天回家。", pinyin: "Wǒ míngtiān huí jiā.", english: "I'm going home tomorrow."),
    ],
    "你": [
      WordExample(hanzi: "你住在哪儿？", pinyin: "Nǐ zhù zài nǎr?", english: "Where do you live?"),
      WordExample(hanzi: "你喜欢喝茶吗？", pinyin: "Nǐ xǐhuan hē chá ma?", english: "Do you like drinking tea?"),
    ],
    "他": [
      WordExample(hanzi: "他有一个女儿。", pinyin: "Tā yǒu yí gè nǚ'ér.", english: "He has a daughter."),
      WordExample(hanzi: "他明天来北京。", pinyin: "Tā míngtiān lái Běijīng.", english: "He is coming to Beijing tomorrow."),
    ],
    "她": [
      WordExample(hanzi: "她在医院工作。", pinyin: "Tā zài yīyuàn gōngzuò.", english: "She works at a hospital."),
      WordExample(hanzi: "她的汉语很好。", pinyin: "Tā de Hànyǔ hěn hǎo.", english: "Her Chinese is very good."),
    ],
    "我们": [
      WordExample(hanzi: "我们一起吃饭吧。", pinyin: "Wǒmen yìqǐ chīfàn ba.", english: "Let's eat together."),
      WordExample(hanzi: "我们八点上课。", pinyin: "Wǒmen bā diǎn shàngkè.", english: "We have class at eight."),
    ],
    "你们": [
      WordExample(hanzi: "你们吃什么？", pinyin: "Nǐmen chī shénme?", english: "What are you all eating?"),
      WordExample(hanzi: "你们都是学生吗？", pinyin: "Nǐmen dōu shì xuésheng ma?", english: "Are you all students?"),
    ],
    "他们": [
      WordExample(hanzi: "他们在打球。", pinyin: "Tāmen zài dǎ qiú.", english: "They are playing ball."),
      WordExample(hanzi: "他们明天去上海。", pinyin: "Tāmen míngtiān qù Shànghǎi.", english: "They are going to Shanghai tomorrow."),
    ],
    "人": [
      WordExample(hanzi: "那个人是谁？", pinyin: "Nà gè rén shì shéi?", english: "Who is that person?"),
      WordExample(hanzi: "我家有三口人。", pinyin: "Wǒ jiā yǒu sān kǒu rén.", english: "There are three people in my family."),
    ],
    "朋友": [
      WordExample(hanzi: "我的朋友是医生。", pinyin: "Wǒ de péngyou shì yīshēng.", english: "My friend is a doctor."),
      WordExample(hanzi: "我的朋友住在北京。", pinyin: "Wǒ de péngyou zhù zài Běijīng.", english: "My friend lives in Beijing."),
    ],
    "老师": [
      WordExample(hanzi: "我的老师很年轻。", pinyin: "Wǒ de lǎoshī hěn niánqīng.", english: "My teacher is very young."),
      WordExample(hanzi: "老师，谢谢您！", pinyin: "Lǎoshī, xièxie nín!", english: "Teacher, thank you!"),
    ],
    "学生": [
      WordExample(hanzi: "他是我的学生。", pinyin: "Tā shì wǒ de xuésheng.", english: "He is my student."),
      WordExample(hanzi: "学生都在教室里。", pinyin: "Xuésheng dōu zài jiàoshì lǐ.", english: "The students are all in the classroom."),
    ],
    "医生": [
      WordExample(hanzi: "医生，我不舒服。", pinyin: "Yīshēng, wǒ bù shūfu.", english: "Doctor, I don't feel well."),
      WordExample(hanzi: "我想当医生。", pinyin: "Wǒ xiǎng dāng yīshēng.", english: "I want to be a doctor."),
    ],
    "男人": [
      WordExample(hanzi: "这个男人在等人。", pinyin: "Zhège nánrén zài děng rén.", english: "This man is waiting for someone."),
      WordExample(hanzi: "那个男人会说汉语。", pinyin: "Nà gè nánrén huì shuō Hànyǔ.", english: "That man can speak Chinese."),
    ],
    "女人": [
      WordExample(hanzi: "那个女人在打电话。", pinyin: "Nà gè nǚrén zài dǎ diànhuà.", english: "That woman is making a phone call."),
      WordExample(hanzi: "这个女人是我的同事。", pinyin: "Zhège nǚrén shì wǒ de tóngshì.", english: "This woman is my colleague."),
    ],
    "男孩": [
      WordExample(hanzi: "男孩在踢足球。", pinyin: "Nánhái zài tī zúqiú.", english: "The boy is playing football."),
      WordExample(hanzi: "那个男孩是我弟弟。", pinyin: "Nà gè nánhái shì wǒ dìdi.", english: "That boy is my younger brother."),
    ],
    "女孩": [
      WordExample(hanzi: "女孩在唱歌。", pinyin: "Nǚhái zài chànggē.", english: "The girl is singing."),
      WordExample(hanzi: "那个女孩跑得很快。", pinyin: "Nà gè nǚhái pǎo de hěn kuài.", english: "That girl runs fast."),
    ],
    "先生": [
      WordExample(hanzi: "李先生是我的老师。", pinyin: "Lǐ xiānsheng shì wǒ de lǎoshī.", english: "Mr. Li is my teacher."),
      WordExample(hanzi: "先生，您请坐。", pinyin: "Xiānsheng, nín qǐng zuò.", english: "Sir, please have a seat."),
    ],
    "女士": [
      WordExample(hanzi: "那位女士是谁？", pinyin: "Nà wèi nǚshì shì shéi?", english: "Who is that lady?"),
      WordExample(hanzi: "女士，您的茶。", pinyin: "Nǚshì, nín de chá.", english: "Here is your tea, ma'am."),
    ],
    "大家": [
      WordExample(hanzi: "大家都很高兴。", pinyin: "Dàjiā dōu hěn gāoxìng.", english: "Everyone is very happy."),
      WordExample(hanzi: "请大家安静一下。", pinyin: "Qǐng dàjiā ānjìng yíxià.", english: "Everyone, please be quiet for a moment."),
    ],
    "学校": [
      WordExample(hanzi: "我去学校上课。", pinyin: "Wǒ qù xuéxiào shàngkè.", english: "I go to school for class."),
      WordExample(hanzi: "学校离家很近。", pinyin: "Xuéxiào lí jiā hěn jìn.", english: "The school is very close to home."),
    ],
    "商店": [
      WordExample(hanzi: "这家商店很便宜。", pinyin: "Zhè jiā shāngdiàn hěn piányi.", english: "This shop is very cheap."),
      WordExample(hanzi: "我去商店买水果。", pinyin: "Wǒ qù shāngdiàn mǎi shuǐguǒ.", english: "I am going to the shop to buy fruit."),
    ],
    "医院": [
      WordExample(hanzi: "我哥哥在医院工作。", pinyin: "Wǒ gēge zài yīyuàn gōngzuò.", english: "My older brother works at the hospital."),
      WordExample(hanzi: "我们去医院看他。", pinyin: "Wǒmen qù yīyuàn kàn tā.", english: "We are going to the hospital to see him."),
    ],
    "钱": [
      WordExample(hanzi: "这本书多少钱？", pinyin: "Zhè běn shū duōshao qián?", english: "How much is this book?"),
      WordExample(hanzi: "我的钱不够。", pinyin: "Wǒ de qián bú gòu.", english: "I don't have enough money."),
    ],
    "电话": [
      WordExample(hanzi: "你的电话是多少？", pinyin: "Nǐ de diànhuà shì duōshao?", english: "What is your phone number?"),
      WordExample(hanzi: "电话在桌子上。", pinyin: "Diànhuà zài zhuōzi shang.", english: "The telephone is on the table."),
    ],
    "手机": [
      WordExample(hanzi: "我的手机没电了。", pinyin: "Wǒ de shǒujī méi diàn le.", english: "My mobile phone is out of battery."),
      WordExample(hanzi: "请关掉你的手机。", pinyin: "Qǐng guān diào nǐ de shǒujī.", english: "Please turn off your mobile phone."),
    ],
    "电脑": [
      WordExample(hanzi: "我用电脑看电影。", pinyin: "Wǒ yòng diànnǎo kàn diànyǐng.", english: "I watch movies on the computer."),
      WordExample(hanzi: "这台电脑很贵。", pinyin: "Zhè tái diànnǎo hěn guì.", english: "This computer is expensive."),
    ],
    "书": [
      WordExample(hanzi: "我在看一本书。", pinyin: "Wǒ zài kàn yì běn shū.", english: "I am reading a book."),
      WordExample(hanzi: "我喜欢看中文书。", pinyin: "Wǒ xǐhuan kàn Zhōngwén shū.", english: "I like reading Chinese books."),
    ],
    "汉语": [
      WordExample(hanzi: "他的汉语说得很好。", pinyin: "Tā de Hànyǔ shuō de hěn hǎo.", english: "He speaks Chinese very well."),
      WordExample(hanzi: "汉语不太难。", pinyin: "Hànyǔ bú tài nán.", english: "Chinese is not too difficult."),
    ],
    "英语": [
      WordExample(hanzi: "我在学习英语。", pinyin: "Wǒ zài xuéxí Yīngyǔ.", english: "I am learning English."),
      WordExample(hanzi: "她用英语唱歌。", pinyin: "Tā yòng Yīngyǔ chàng gē.", english: "She sings in English."),
    ],
    "名字": [
      WordExample(hanzi: "请写下你的名字。", pinyin: "Qǐng xiě xià nǐ de míngzi.", english: "Please write down your name."),
      WordExample(hanzi: "这个名字很好听。", pinyin: "Zhège míngzi hěn hǎotīng.", english: "This name sounds very nice."),
    ],
    "东西": [
      WordExample(hanzi: "你找什么东西？", pinyin: "Nǐ zhǎo shénme dōngxi?", english: "What are you looking for?"),
      WordExample(hanzi: "桌子上有很多东西。", pinyin: "Zhuōzi shang yǒu hěn duō dōngxi.", english: "There are many things on the table."),
    ],
    "天气": [
      WordExample(hanzi: "明天的天气怎么样？", pinyin: "Míngtiān de tiānqì zěnmeyàng?", english: "What will the weather be like tomorrow?"),
      WordExample(hanzi: "天气冷了，多穿衣服。", pinyin: "Tiānqì lěng le, duō chuān yīfu.", english: "It is getting cold, so wear more clothes."),
    ],
    "车": [
      WordExample(hanzi: "我开车去上班。", pinyin: "Wǒ kāi chē qù shàngbān.", english: "I drive to work."),
      WordExample(hanzi: "车在门口等你。", pinyin: "Chē zài ménkǒu děng nǐ.", english: "The car is waiting for you at the door."),
    ],
    "银行": [
      WordExample(hanzi: "银行在学校旁边。", pinyin: "Yínháng zài xuéxiào pángbiān.", english: "The bank is next to the school."),
      WordExample(hanzi: "我想去银行换钱。", pinyin: "Wǒ xiǎng qù yínháng huàn qián.", english: "I want to go to the bank to change money."),
    ],
    "邮局": [
      WordExample(hanzi: "我去邮局寄信。", pinyin: "Wǒ qù yóujú jì xìn.", english: "I am going to the post office to mail a letter."),
      WordExample(hanzi: "邮局离这儿很远。", pinyin: "Yóujú lí zhèr hěn yuǎn.", english: "The post office is far from here."),
    ],
    "公园": [
      WordExample(hanzi: "公园里有很多花。", pinyin: "Gōngyuán lǐ yǒu hěn duō huā.", english: "There are many flowers in the park."),
      WordExample(hanzi: "孩子们在公园玩。", pinyin: "Háizimen zài gōngyuán wán.", english: "The children are playing in the park."),
    ],
    "图书馆": [
      WordExample(hanzi: "图书馆里很安静。", pinyin: "Túshūguǎn lǐ hěn ānjìng.", english: "The library is very quiet."),
      WordExample(hanzi: "我在图书馆借书。", pinyin: "Wǒ zài túshūguǎn jiè shū.", english: "I borrow books from the library."),
    ],
    "饭店": [
      WordExample(hanzi: "我们在饭店吃饭。", pinyin: "Wǒmen zài fàndiàn chīfàn.", english: "We are eating at a restaurant."),
      WordExample(hanzi: "那家饭店的菜很好吃。", pinyin: "Nà jiā fàndiàn de cài hěn hǎochī.", english: "The food at that restaurant is delicious."),
    ],
    "厕所": [
      WordExample(hanzi: "我去一下厕所。", pinyin: "Wǒ qù yíxià cèsuǒ.", english: "I am going to the restroom for a moment."),
      WordExample(hanzi: "这附近有厕所吗？", pinyin: "Zhè fùjìn yǒu cèsuǒ ma?", english: "Is there a toilet nearby?"),
    ],
    "城市": [
      WordExample(hanzi: "我喜欢这个城市。", pinyin: "Wǒ xǐhuan zhège chéngshì.", english: "I like this city."),
      WordExample(hanzi: "城市里人很多。", pinyin: "Chéngshì lǐ rén hěn duō.", english: "There are many people in the city."),
    ],
    "国家": [
      WordExample(hanzi: "你去过哪些国家？", pinyin: "Nǐ qù guo nǎxiē guójiā?", english: "Which countries have you been to?"),
      WordExample(hanzi: "我想去别的国家。", pinyin: "Wǒ xiǎng qù bié de guójiā.", english: "I want to go to another country."),
    ],
    "运动": [
      WordExample(hanzi: "运动对身体很好。", pinyin: "Yùn dòng duì shēn tǐ hěn hǎo.", english: "Exercise is good for your health."),
      WordExample(hanzi: "周末我们一起去运动。", pinyin: "Zhōu mò wǒ men yì qǐ qù yùn dòng.", english: "Let's go exercise together this weekend."),
    ],
    "游泳": [
      WordExample(hanzi: "夏天我常常去游泳。", pinyin: "Xià tiān wǒ cháng cháng qù yóu yǒng.", english: "I often go swimming in summer."),
      WordExample(hanzi: "他游泳游得很快。", pinyin: "Tā yóu yǒng yóu de hěn kuài.", english: "He swims very fast."),
    ],
    "跑步": [
      WordExample(hanzi: "我们去公园跑步吧。", pinyin: "Wǒ men qù gōng yuán pǎo bù ba.", english: "Let's go running in the park."),
      WordExample(hanzi: "跑步让我很开心。", pinyin: "Pǎo bù ràng wǒ hěn kāi xīn.", english: "Running makes me very happy."),
    ],
    "打球": [
      WordExample(hanzi: "你明天打球吗？", pinyin: "Nǐ míng tiān dǎ qiú ma?", english: "Are you playing ball tomorrow?"),
      WordExample(hanzi: "我们在学校打球。", pinyin: "Wǒ men zài xué xiào dǎ qiú.", english: "We play ball at school."),
    ],
    "篮球": [
      WordExample(hanzi: "他打篮球打得很好。", pinyin: "Tā dǎ lán qiú dǎ de hěn hǎo.", english: "He plays basketball very well."),
      WordExample(hanzi: "我们下午打篮球。", pinyin: "Wǒ men xià wǔ dǎ lán qiú.", english: "We are playing basketball this afternoon."),
    ],
    "足球": [
      WordExample(hanzi: "孩子们在踢足球。", pinyin: "Hái zi men zài tī zú qiú.", english: "The children are playing football."),
      WordExample(hanzi: "你看足球比赛吗？", pinyin: "Nǐ kàn zú qiú bǐ sài ma?", english: "Do you watch football matches?"),
    ],
    "唱歌": [
      WordExample(hanzi: "我们一起唱歌吧。", pinyin: "Wǒ men yì qǐ chàng gē ba.", english: "Let's sing together."),
      WordExample(hanzi: "他一边唱歌一边跳舞。", pinyin: "Tā yì biān chàng gē yì biān tiào wǔ.", english: "He sings while he dances."),
    ],
    "跳舞": [
      WordExample(hanzi: "她跳舞跳得很美。", pinyin: "Tā tiào wǔ tiào de hěn měi.", english: "She dances beautifully."),
      WordExample(hanzi: "我想学跳舞。", pinyin: "Wǒ xiǎng xué tiào wǔ.", english: "I want to learn to dance."),
    ],
    "画画": [
      WordExample(hanzi: "妹妹画画很认真。", pinyin: "Mèi mei huà huà hěn rèn zhēn.", english: "My little sister draws very carefully."),
      WordExample(hanzi: "我们一起学画画。", pinyin: "Wǒ men yì qǐ xué huà huà.", english: "Let's learn to draw together."),
    ],
    "旅游": [
      WordExample(hanzi: "明年我想去中国旅游。", pinyin: "Míng nián wǒ xiǎng qù Zhōng guó lǚ yóu.", english: "I want to travel to China next year."),
      WordExample(hanzi: "我们去南方旅游了。", pinyin: "Wǒ men qù nán fāng lǚ yóu le.", english: "We traveled to the south."),
    ],
    "玩": [
      WordExample(hanzi: "我们周末一起玩吧。", pinyin: "Wǒ men zhōu mò yì qǐ wán ba.", english: "Let's hang out together this weekend."),
      WordExample(hanzi: "别在这里玩。", pinyin: "Bié zài zhè lǐ wán.", english: "Don't play here."),
    ],
    "游戏": [
      WordExample(hanzi: "这个游戏很好玩。", pinyin: "Zhè ge yóu xì hěn hǎo wán.", english: "This game is very fun."),
      WordExample(hanzi: "孩子们喜欢玩游戏。", pinyin: "Hái zi men xǐ huan wán yóu xì.", english: "Children like playing games."),
    ],
    "学习": [
      WordExample(hanzi: "我在学习中文。", pinyin: "Wǒ zài xué xí Zhōng wén.", english: "I am studying Chinese."),
      WordExample(hanzi: "我们一起学习吧。", pinyin: "Wǒ men yì qǐ xué xí ba.", english: "Let's study together."),
    ],
    "上课": [
      WordExample(hanzi: "现在要上课了。", pinyin: "Xiàn zài yào shàng kè le.", english: "It's time for class now."),
      WordExample(hanzi: "我们上午上课。", pinyin: "Wǒ men shàng wǔ shàng kè.", english: "We have class in the morning."),
    ],
    "下课": [
      WordExample(hanzi: "下课以后我去吃饭。", pinyin: "Xià kè yǐ hòu wǒ qù chī fàn.", english: "After class I go to eat."),
      WordExample(hanzi: "我们三点下课。", pinyin: "Wǒ men sān diǎn xià kè.", english: "We finish class at three."),
    ],
    "考试": [
      WordExample(hanzi: "这次考试不难。", pinyin: "Zhè cì kǎo shì bù nán.", english: "This exam is not hard."),
      WordExample(hanzi: "我考试考得很好。", pinyin: "Wǒ kǎo shì kǎo de hěn hǎo.", english: "I did very well on the exam."),
    ],
    "作业": [
      WordExample(hanzi: "作业做完了吗？", pinyin: "Zuò yè zuò wán le ma?", english: "Have you finished your homework?"),
      WordExample(hanzi: "今天的作业不多。", pinyin: "Jīn tiān de zuò yè bù duō.", english: "There isn't much homework today."),
    ],
    "课": [
      WordExample(hanzi: "我有两节课。", pinyin: "Wǒ yǒu liǎng jié kè.", english: "I have two classes."),
      WordExample(hanzi: "这节课很难。", pinyin: "Zhè jié kè hěn nán.", english: "This class is hard."),
    ],
    "问题": [
      WordExample(hanzi: "这个问题很简单。", pinyin: "Zhè ge wèn tí hěn jiǎn dān.", english: "This question is very simple."),
      WordExample(hanzi: "我想问你一个问题。", pinyin: "Wǒ xiǎng wèn nǐ yí gè wèn tí.", english: "I want to ask you a question."),
    ],
    "答案": [
      WordExample(hanzi: "你知道答案吗？", pinyin: "Nǐ zhī dào dá àn ma?", english: "Do you know the answer?"),
      WordExample(hanzi: "答案在书上。", pinyin: "Dá àn zài shū shang.", english: "The answer is in the book."),
    ],
    "工作": [
      WordExample(hanzi: "我找到新工作了。", pinyin: "Wǒ zhǎo dào xīn gōng zuò le.", english: "I found a new job."),
      WordExample(hanzi: "他工作很努力。", pinyin: "Tā gōng zuò hěn nǔ lì.", english: "He works very hard."),
    ],
    "办公室": [
      WordExample(hanzi: "经理在办公室吗？", pinyin: "Jīng lǐ zài bàn gōng shì ma?", english: "Is the manager in the office?"),
      WordExample(hanzi: "我的办公室在三楼。", pinyin: "Wǒ de bàn gōng shì zài sān lóu.", english: "My office is on the third floor."),
    ],
    "公司": [
      WordExample(hanzi: "这家公司很大。", pinyin: "Zhè jiā gōng sī hěn dà.", english: "This company is big."),
      WordExample(hanzi: "我在公司等你。", pinyin: "Wǒ zài gōng sī děng nǐ.", english: "I'll wait for you at the company."),
    ],
    "老板": [
      WordExample(hanzi: "老板，早上好！", pinyin: "Lǎo bǎn, zǎo shang hǎo!", english: "Good morning, boss!"),
      WordExample(hanzi: "老板在开会。", pinyin: "Lǎo bǎn zài kāi huì.", english: "The boss is in a meeting."),
    ],
    "同事": [
      WordExample(hanzi: "我的同事叫小王。", pinyin: "Wǒ de tóng shì jiào Xiǎo Wáng.", english: "My colleague is called Xiao Wang."),
      WordExample(hanzi: "我和同事一起吃饭。", pinyin: "Wǒ hé tóng shì yì qǐ chī fàn.", english: "I eat together with my colleagues."),
    ],
    "笔": [
      WordExample(hanzi: "这支笔很好写。", pinyin: "Zhè zhī bǐ hěn hǎo xiě.", english: "This pen writes very well."),
      WordExample(hanzi: "请借我一支笔。", pinyin: "Qǐng jiè wǒ yì zhī bǐ.", english: "Please lend me a pen."),
    ],
    "纸": [
      WordExample(hanzi: "这张纸上有字。", pinyin: "Zhè zhāng zhǐ shang yǒu zì.", english: "There is writing on this sheet of paper."),
      WordExample(hanzi: "请给我两张纸。", pinyin: "Qǐng gěi wǒ liǎng zhāng zhǐ.", english: "Please give me two sheets of paper."),
    ],
    "今天": [
      WordExample(hanzi: "今天我很忙。", pinyin: "Jīn tiān wǒ hěn máng.", english: "I am very busy today."),
      WordExample(hanzi: "今天我们去公园吧。", pinyin: "Jīn tiān wǒ men qù gōng yuán ba.", english: "Let's go to the park today."),
    ],
    "明天": [
      WordExample(hanzi: "明天我有课。", pinyin: "Míng tiān wǒ yǒu kè.", english: "I have class tomorrow."),
      WordExample(hanzi: "明天会下雨吗？", pinyin: "Míng tiān huì xià yǔ ma?", english: "Will it rain tomorrow?"),
    ],
    "昨天": [
      WordExample(hanzi: "昨天我很累。", pinyin: "Zuó tiān wǒ hěn lèi.", english: "I was very tired yesterday."),
      WordExample(hanzi: "昨天我们看了电影。", pinyin: "Zuó tiān wǒ men kàn le diàn yǐng.", english: "We watched a movie yesterday."),
    ],
    "现在": [
      WordExample(hanzi: "我现在要回家了。", pinyin: "Wǒ xiàn zài yào huí jiā le.", english: "I want to go home now."),
      WordExample(hanzi: "现在外面下雨了。", pinyin: "Xiàn zài wài miàn xià yǔ le.", english: "It is raining outside now."),
    ],
    "早上": [
      WordExample(hanzi: "早上我要喝咖啡。", pinyin: "Zǎo shang wǒ yào hē kā fēi.", english: "I want to drink coffee in the morning."),
      WordExample(hanzi: "早上空气很好。", pinyin: "Zǎo shang kōng qì hěn hǎo.", english: "The air is very fresh in the morning."),
    ],
    "中午": [
      WordExample(hanzi: "中午我吃面条。", pinyin: "Zhōng wǔ wǒ chī miàn tiáo.", english: "I eat noodles at noon."),
      WordExample(hanzi: "中午我们休息一下。", pinyin: "Zhōng wǔ wǒ men xiū xi yí xià.", english: "We take a short break at noon."),
    ],
    "晚上": [
      WordExample(hanzi: "晚上我九点睡觉。", pinyin: "Wǎn shang wǒ jiǔ diǎn shuì jiào.", english: "I go to bed at nine in the evening."),
      WordExample(hanzi: "晚上外面很冷。", pinyin: "Wǎn shang wài miàn hěn lěng.", english: "It is very cold outside in the evening."),
    ],
    "年": [
      WordExample(hanzi: "我学了三年中文。", pinyin: "Wǒ xué le sān nián Zhōng wén.", english: "I have studied Chinese for three years."),
      WordExample(hanzi: "明年我去中国。", pinyin: "Míng nián wǒ qù Zhōng guó.", english: "I am going to China next year."),
    ],
    "月": [
      WordExample(hanzi: "我五月去北京。", pinyin: "Wǒ wǔ yuè qù Běi jīng.", english: "I am going to Beijing in May."),
      WordExample(hanzi: "十二月下雪。", pinyin: "Shí èr yuè xià xuě.", english: "It snows in December."),
    ],
    "星期": [
      WordExample(hanzi: "今天星期几？", pinyin: "Jīn tiān xīng qī jǐ?", english: "What day of the week is it today?"),
      WordExample(hanzi: "星期天我休息。", pinyin: "Xīng qī tiān wǒ xiū xi.", english: "I rest on Sunday."),
    ],
    "时间": [
      WordExample(hanzi: "时间不早了。", pinyin: "Shí jiān bù zǎo le.", english: "It is getting late."),
      WordExample(hanzi: "你有时间吗？", pinyin: "Nǐ yǒu shí jiān ma?", english: "Do you have time?"),
    ],
    "上午": [
      WordExample(hanzi: "上午我在家。", pinyin: "Shàng wǔ wǒ zài jiā.", english: "I am at home in the morning."),
      WordExample(hanzi: "上午九点开会。", pinyin: "Shàng wǔ jiǔ diǎn kāi huì.", english: "The meeting is at nine in the morning."),
    ],
    "下午": [
      WordExample(hanzi: "下午我有课。", pinyin: "Xià wǔ wǒ yǒu kè.", english: "I have class in the afternoon."),
      WordExample(hanzi: "下午三点见。", pinyin: "Xià wǔ sān diǎn jiàn.", english: "See you at three in the afternoon."),
    ],
    "分钟": [
      WordExample(hanzi: "还有十分钟。", pinyin: "Hái yǒu shí fēn zhōng.", english: "There are ten minutes left."),
      WordExample(hanzi: "我迟到五分钟。", pinyin: "Wǒ chí dào wǔ fēn zhōng.", english: "I was five minutes late."),
    ],
    "小时": [
      WordExample(hanzi: "我等了一个小时。", pinyin: "Wǒ děng le yí gè xiǎo shí.", english: "I waited for an hour."),
      WordExample(hanzi: "车开了两个小时。", pinyin: "Chē kāi le liǎng gè xiǎo shí.", english: "The car drove for two hours."),
    ],
    "点": [
      WordExample(hanzi: "你几点起床？", pinyin: "Nǐ jǐ diǎn qǐ chuáng?", english: "What time do you get up?"),
      WordExample(hanzi: "我们八点上课。", pinyin: "Wǒ men bā diǎn shàng kè.", english: "We have class at eight."),
    ],
    "号": [
      WordExample(hanzi: "明天是八月五号。", pinyin: "Míng tiān shì bā yuè wǔ hào.", english: "Tomorrow is August fifth."),
      WordExample(hanzi: "今天是十月八号。", pinyin: "Jīn tiān shì shí yuè bā hào.", english: "Today is October eighth."),
    ],
    "周末": [
      WordExample(hanzi: "周末你在家吗？", pinyin: "Zhōu mò nǐ zài jiā ma?", english: "Are you at home on the weekend?"),
      WordExample(hanzi: "周末我们去看电影。", pinyin: "Zhōu mò wǒ men qù kàn diàn yǐng.", english: "We are going to see a movie this weekend."),
    ],
    "生日": [
      WordExample(hanzi: "祝你生日快乐！", pinyin: "Zhù nǐ shēng rì kuài lè!", english: "Happy birthday to you!"),
      WordExample(hanzi: "我的生日在五月。", pinyin: "Wǒ de shēng rì zài wǔ yuè.", english: "My birthday is in May."),
    ],
    "节日": [
      WordExample(hanzi: "祝你节日快乐！", pinyin: "Zhù nǐ jié rì kuài lè!", english: "Happy holiday to you!"),
      WordExample(hanzi: "这是我们的节日。", pinyin: "Zhè shì wǒ men de jié rì.", english: "This is our festival."),
    ],
    "季节": [
      WordExample(hanzi: "你最喜欢哪个季节？", pinyin: "Nǐ zuì xǐ huan nǎ ge jì jié?", english: "Which season do you like best?"),
      WordExample(hanzi: "春天是最好的季节。", pinyin: "Chūn tiān shì zuì hǎo de jì jié.", english: "Spring is the best season."),
    ],
    "交通": [
      WordExample(hanzi: "交通非常方便。", pinyin: "Jiāo tōng fēi cháng fāng biàn.", english: "Transportation is very convenient."),
      WordExample(hanzi: "早上的交通很堵。", pinyin: "Zǎo shang de jiāo tōng hěn dǔ.", english: "The morning traffic is heavy."),
    ],
    "火车": [
      WordExample(hanzi: "火车快到了。", pinyin: "Huǒ chē kuài dào le.", english: "The train is almost here."),
      WordExample(hanzi: "我们坐火车回家。", pinyin: "Wǒ men zuò huǒ chē huí jiā.", english: "We take the train home."),
    ],
    "飞机": [
      WordExample(hanzi: "我坐飞机去北京。", pinyin: "Wǒ zuò fēi jī qù Běi jīng.", english: "I take a plane to Beijing."),
      WordExample(hanzi: "飞机要起飞了。", pinyin: "Fēi jī yào qǐ fēi le.", english: "The plane is about to take off."),
    ],
    "公共汽车": [
      WordExample(hanzi: "公共汽车来了。", pinyin: "Gōng gòng qì chē lái le.", english: "The bus is coming."),
      WordExample(hanzi: "我每天坐公共汽车。", pinyin: "Wǒ měi tiān zuò gōng gòng qì chē.", english: "I take the bus every day."),
    ],
    "地铁": [
      WordExample(hanzi: "我们坐地铁去吧。", pinyin: "Wǒ men zuò dì tiě qù ba.", english: "Let's take the subway."),
      WordExample(hanzi: "我坐地铁上班。", pinyin: "Wǒ zuò dì tiě shàng bān.", english: "I take the subway to work."),
    ],
    "自行车": [
      WordExample(hanzi: "我的自行车是新的。", pinyin: "Wǒ de zì xíng chē shì xīn de.", english: "My bicycle is new."),
      WordExample(hanzi: "他骑自行车上班。", pinyin: "Tā qí zì xíng chē shàng bān.", english: "He rides a bike to work."),
    ],
    "出租车": [
      WordExample(hanzi: "出租车在门口等你。", pinyin: "Chū zū chē zài mén kǒu děng nǐ.", english: "The taxi is waiting for you at the door."),
      WordExample(hanzi: "请帮我叫一辆出租车。", pinyin: "Qǐng bāng wǒ jiào yí liàng chū zū chē.", english: "Please call me a taxi."),
    ],
    "船": [
      WordExample(hanzi: "我们坐船过河。", pinyin: "Wǒ men zuò chuán guò hé.", english: "We cross the river by boat."),
      WordExample(hanzi: "这条船很大。", pinyin: "Zhè tiáo chuán hěn dà.", english: "This boat is very big."),
    ],
    "路": [
      WordExample(hanzi: "路上车很多。", pinyin: "Lù shang chē hěn duō.", english: "There are many cars on the road."),
      WordExample(hanzi: "我认识这条路。", pinyin: "Wǒ rèn shi zhè tiáo lù.", english: "I know this road."),
    ],
    "是": [
      WordExample(hanzi: "他是我的老师。", pinyin: "Tā shì wǒ de lǎo shī.", english: "He is my teacher."),
      WordExample(hanzi: "这是你的书吗？", pinyin: "Zhè shì nǐ de shū ma?", english: "Is this your book?"),
    ],
    "有": [
      WordExample(hanzi: "我有两个孩子。", pinyin: "Wǒ yǒu liǎng gè hái zi.", english: "I have two children."),
      WordExample(hanzi: "你有时间吗？", pinyin: "Nǐ yǒu shí jiān ma?", english: "Do you have time?"),
    ],
    "去": [
      WordExample(hanzi: "我们一起去吧。", pinyin: "Wǒ men yì qǐ qù ba.", english: "Let's go together."),
      WordExample(hanzi: "他去超市买东西。", pinyin: "Tā qù chāo shì mǎi dōng xi.", english: "He is going to the supermarket to buy things."),
    ],
    "来": [
      WordExample(hanzi: "他明天来北京。", pinyin: "Tā míng tiān lái Běi jīng.", english: "He is coming to Beijing tomorrow."),
      WordExample(hanzi: "你什么时候来？", pinyin: "Nǐ shén me shí hou lái?", english: "When are you coming?"),
    ],
    "想": [
      WordExample(hanzi: "我想回家休息。", pinyin: "Wǒ xiǎng huí jiā xiū xi.", english: "I want to go home and rest."),
      WordExample(hanzi: "你想吃什么？", pinyin: "Nǐ xiǎng chī shén me?", english: "What do you want to eat?"),
    ],
    "要": [
      WordExample(hanzi: "我要一杯咖啡。", pinyin: "Wǒ yào yì bēi kā fēi.", english: "I want a cup of coffee."),
      WordExample(hanzi: "我们要迟到了。", pinyin: "Wǒ men yào chí dào le.", english: "We are going to be late."),
    ],
    "说": [
      WordExample(hanzi: "请你说慢一点。", pinyin: "Qǐng nǐ shuō màn yì diǎn.", english: "Please speak a little more slowly."),
      WordExample(hanzi: "他说得很好。", pinyin: "Tā shuō de hěn hǎo.", english: "He speaks very well."),
    ],
    "看": [
      WordExample(hanzi: "我在看报纸。", pinyin: "Wǒ zài kàn bào zhǐ.", english: "I am reading the newspaper."),
      WordExample(hanzi: "你看，下雨了。", pinyin: "Nǐ kàn, xià yǔ le.", english: "Look, it's raining."),
    ],
    "听": [
      WordExample(hanzi: "你听，谁在唱歌？", pinyin: "Nǐ tīng, shuí zài chàng gē?", english: "Listen, who is singing?"),
      WordExample(hanzi: "他在听广播。", pinyin: "Tā zài tīng guǎng bō.", english: "He is listening to the radio."),
    ],
    "写": [
      WordExample(hanzi: "我在给妈妈写信。", pinyin: "Wǒ zài gěi mā ma xiě xìn.", english: "I am writing a letter to Mom."),
      WordExample(hanzi: "这个字怎么写？", pinyin: "Zhè ge zì zěn me xiě?", english: "How do you write this character?"),
    ],
    "读": [
      WordExample(hanzi: "请读这个句子。", pinyin: "Qǐng dú zhè ge jù zi.", english: "Please read this sentence."),
      WordExample(hanzi: "他每天读报纸。", pinyin: "Tā měi tiān dú bào zhǐ.", english: "He reads the newspaper every day."),
    ],
    "学": [
      WordExample(hanzi: "我想学做中国菜。", pinyin: "Wǒ xiǎng xué zuò Zhōng guó cài.", english: "I want to learn to cook Chinese food."),
      WordExample(hanzi: "他学得很快。", pinyin: "Tā xué de hěn kuài.", english: "He learns quickly."),
    ],
    "做": [
      WordExample(hanzi: "你做什么工作？", pinyin: "Nǐ zuò shén me gōng zuò?", english: "What work do you do?"),
      WordExample(hanzi: "妈妈在做晚饭。", pinyin: "Mā ma zài zuò wǎn fàn.", english: "Mom is making dinner."),
    ],
    "买": [
      WordExample(hanzi: "我买了两张票。", pinyin: "Wǒ mǎi le liǎng zhāng piào.", english: "I bought two tickets."),
      WordExample(hanzi: "你去买点水果吧。", pinyin: "Nǐ qù mǎi diǎn shuǐ guǒ ba.", english: "Go buy some fruit."),
    ],
    "爱": [
      WordExample(hanzi: "她很爱她的家人。", pinyin: "Tā hěn ài tā de jiā rén.", english: "She loves her family very much."),
      WordExample(hanzi: "孩子们都爱他。", pinyin: "Hái zi men dōu ài tā.", english: "The children all love him."),
    ],
    "喜欢": [
      WordExample(hanzi: "我喜欢这只小狗。", pinyin: "Wǒ xǐ huan zhè zhī xiǎo gǒu.", english: "I like this little dog."),
      WordExample(hanzi: "你喜欢这本书吗？", pinyin: "Nǐ xǐ huan zhè běn shū ma?", english: "Do you like this book?"),
    ],
    "会": [
      WordExample(hanzi: "你会开车吗？", pinyin: "Nǐ huì kāi chē ma?", english: "Can you drive?"),
      WordExample(hanzi: "我妹妹会弹钢琴。", pinyin: "Wǒ mèi mei huì tán gāng qín.", english: "My little sister can play the piano."),
    ],
    "能": [
      WordExample(hanzi: "你能帮我吗？", pinyin: "Nǐ néng bāng wǒ ma?", english: "Can you help me?"),
      WordExample(hanzi: "我今天不能去。", pinyin: "Wǒ jīn tiān bù néng qù.", english: "I can't go today."),
    ],
    "认识": [
      WordExample(hanzi: "我认识他的姐姐。", pinyin: "Wǒ rèn shi tā de jiě jie.", english: "I know his older sister."),
      WordExample(hanzi: "你认识她吗？", pinyin: "Nǐ rèn shi tā ma?", english: "Do you know her?"),
    ],
    "知道": [
      WordExample(hanzi: "我不知道他的名字。", pinyin: "Wǒ bù zhī dào tā de míng zi.", english: "I don't know his name."),
      WordExample(hanzi: "你知道怎么走吗？", pinyin: "Nǐ zhī dào zěn me zǒu ma?", english: "Do you know how to get there?"),
    ],
    "住": [
      WordExample(hanzi: "你住在哪里？", pinyin: "Nǐ zhù zài nǎ lǐ?", english: "Where do you live?"),
      WordExample(hanzi: "他住在我家旁边。", pinyin: "Tā zhù zài wǒ jiā páng biān.", english: "He lives next to my house."),
    ],
    "给": [
      WordExample(hanzi: "他给了我一个苹果。", pinyin: "Tā gěi le wǒ yí gè píng guǒ.", english: "He gave me an apple."),
      WordExample(hanzi: "妈妈给我买了书。", pinyin: "Mā ma gěi wǒ mǎi le shū.", english: "Mom bought me a book."),
    ],
    "拿": [
      WordExample(hanzi: "他手里拿着一本书。", pinyin: "Tā shǒu lǐ ná zhe yì běn shū.", english: "He is holding a book in his hand."),
      WordExample(hanzi: "请帮我拿一下。", pinyin: "Qǐng bāng wǒ ná yí xià.", english: "Please hold this for me for a moment."),
    ],
    "送": [
      WordExample(hanzi: "他送我一本书。", pinyin: "Tā sòng wǒ yì běn shū.", english: "He gave me a book."),
      WordExample(hanzi: "我送你回家吧。", pinyin: "Wǒ sòng nǐ huí jiā ba.", english: "Let me walk you home."),
    ],
    "帮助": [
      WordExample(hanzi: "他常常帮助同学。", pinyin: "Tā cháng cháng bāng zhù tóng xué.", english: "He often helps his classmates."),
      WordExample(hanzi: "我能帮助你吗？", pinyin: "Wǒ néng bāng zhù nǐ ma?", english: "Can I help you?"),
    ],
    "告诉": [
      WordExample(hanzi: "他告诉我一个好消息。", pinyin: "Tā gào su wǒ yí gè hǎo xiāo xi.", english: "He told me some good news."),
      WordExample(hanzi: "别告诉他这件事。", pinyin: "Bié gào su tā zhè jiàn shì.", english: "Don't tell him about this."),
    ],
    "问": [
      WordExample(hanzi: "我问老师一个问题。", pinyin: "Wǒ wèn lǎo shī yí gè wèn tí.", english: "I asked the teacher a question."),
      WordExample(hanzi: "你去问问他吧。", pinyin: "Nǐ qù wèn wen tā ba.", english: "Go and ask him."),
    ],
    "回答": [
      WordExample(hanzi: "他回答得很好。", pinyin: "Tā huí dá de hěn hǎo.", english: "He answered very well."),
      WordExample(hanzi: "这个问题很难回答。", pinyin: "Zhè ge wèn tí hěn nán huí dá.", english: "This question is hard to answer."),
    ],
    "找": [
      WordExample(hanzi: "你在找什么？", pinyin: "Nǐ zài zhǎo shén me?", english: "What are you looking for?"),
      WordExample(hanzi: "我找不到我的钥匙。", pinyin: "Wǒ zhǎo bu dào wǒ de yào shi.", english: "I can't find my keys."),
    ],
    "等": [
      WordExample(hanzi: "我在等公共汽车。", pinyin: "Wǒ zài děng gōng gòng qì chē.", english: "I am waiting for the bus."),
      WordExample(hanzi: "请你等我十分钟。", pinyin: "Qǐng nǐ děng wǒ shí fēn zhōng.", english: "Please wait for me for ten minutes."),
    ],
    "开": [
      WordExample(hanzi: "我爸爸会开车。", pinyin: "Wǒ bà ba huì kāi chē.", english: "My dad can drive."),
      WordExample(hanzi: "请把窗户打开。", pinyin: "Qǐng bǎ chuāng hu dǎ kāi.", english: "Please open the window."),
    ],
    "关": [
      WordExample(hanzi: "睡觉前请关灯。", pinyin: "Shuì jiào qián qǐng guān dēng.", english: "Please turn off the light before going to bed."),
      WordExample(hanzi: "他把电视关了。", pinyin: "Tā bǎ diàn shì guān le.", english: "He turned off the TV."),
    ],
    "坐": [
      WordExample(hanzi: "请坐在我旁边。", pinyin: "Qǐng zuò zài wǒ páng biān.", english: "Please sit next to me."),
      WordExample(hanzi: "我们坐飞机去上海。", pinyin: "Wǒ men zuò fēi jī qù Shàng hǎi.", english: "We are taking a plane to Shanghai."),
    ],
    "站": [
      WordExample(hanzi: "他站在门口。", pinyin: "Tā zhàn zài mén kǒu.", english: "He is standing at the door."),
      WordExample(hanzi: "别站在外面。", pinyin: "Bié zhàn zài wài miàn.", english: "Don't stand outside."),
    ],
    "走": [
      WordExample(hanzi: "你走得太快了。", pinyin: "Nǐ zǒu de tài kuài le.", english: "You walk too fast."),
      WordExample(hanzi: "时间不早了，走吧。", pinyin: "Shí jiān bù zǎo le, zǒu ba.", english: "It's getting late, let's go."),
    ],
    "跑": [
      WordExample(hanzi: "孩子们在跑步。", pinyin: "Hái zi men zài pǎo bù.", english: "The children are running."),
      WordExample(hanzi: "你别跑那么快。", pinyin: "Nǐ bié pǎo nà me kuài.", english: "Don't run so fast."),
    ],
    "飞": [
      WordExample(hanzi: "飞机飞得很高。", pinyin: "Fēi jī fēi de hěn gāo.", english: "The plane flies very high."),
      WordExample(hanzi: "那只鸟飞走了。", pinyin: "Nà zhī niǎo fēi zǒu le.", english: "That bird flew away."),
    ],
    "用": [
      WordExample(hanzi: "我可以用你的笔吗？", pinyin: "Wǒ kě yǐ yòng nǐ de bǐ ma?", english: "May I use your pen?"),
      WordExample(hanzi: "这个用英语怎么说？", pinyin: "Zhè ge yòng Yīng yǔ zěn me shuō?", english: "How do you say this in English?"),
    ],
    "让": [
      WordExample(hanzi: "妈妈让我早点回家。", pinyin: "Mā ma ràng wǒ zǎo diǎn huí jiā.", english: "Mom told me to come home early."),
      WordExample(hanzi: "请让我说完。", pinyin: "Qǐng ràng wǒ shuō wán.", english: "Please let me finish."),
    ],
    "带": [
      WordExample(hanzi: "别忘了带护照。", pinyin: "Bié wàng le dài hù zhào.", english: "Don't forget to bring your passport."),
      WordExample(hanzi: "他带孩子去公园。", pinyin: "Tā dài hái zi qù gōng yuán.", english: "He is taking his child to the park."),
    ],
    "回家": [
      WordExample(hanzi: "你什么时候回家？", pinyin: "Nǐ shén me shí hou huí jiā?", english: "When are you going home?"),
      WordExample(hanzi: "他下班就回家。", pinyin: "Tā xià bān jiù huí jiā.", english: "He goes home right after work."),
    ],
    "出去": [
      WordExample(hanzi: "外面下雨，别出去。", pinyin: "Wài miàn xià yǔ, bié chū qù.", english: "It's raining outside, don't go out."),
      WordExample(hanzi: "他刚出去买东西。", pinyin: "Tā gāng chū qù mǎi dōng xi.", english: "He just went out to buy something."),
    ],
    "回来": [
      WordExample(hanzi: "你什么时候回来？", pinyin: "Nǐ shén me shí hou huí lái?", english: "When will you come back?"),
      WordExample(hanzi: "爸爸晚上七点回来。", pinyin: "Bà ba wǎn shang qī diǎn huí lái.", english: "Dad comes back at seven in the evening."),
    ],
    "睡觉": [
      WordExample(hanzi: "你几点睡觉？", pinyin: "Nǐ jǐ diǎn shuì jiào?", english: "What time do you go to bed?"),
      WordExample(hanzi: "孩子已经睡觉了。", pinyin: "Hái zi yǐ jīng shuì jiào le.", english: "The child is already asleep."),
    ],
    "起床": [
      WordExample(hanzi: "你每天几点起床？", pinyin: "Nǐ měi tiān jǐ diǎn qǐ chuáng?", english: "What time do you get up every day?"),
      WordExample(hanzi: "周末我喜欢晚点起床。", pinyin: "Zhōu mò wǒ xǐ huan wǎn diǎn qǐ chuáng.", english: "On weekends I like to get up a little later."),
    ],
    "见面": [
      WordExample(hanzi: "我们几点见面？", pinyin: "Wǒ men jǐ diǎn jiàn miàn?", english: "What time shall we meet?"),
      WordExample(hanzi: "我们下午见面吧。", pinyin: "Wǒ men xià wǔ jiàn miàn ba.", english: "Let's meet in the afternoon."),
    ],
  };

  /// All examples for [word]: the primary one plus any extra examples.
  static List<WordExample> forWord(Word word) {
    final extras = extra[word.id];
    return <WordExample>[
      word.example,
      if (extras != null) ...extras,
    ];
  }
}
