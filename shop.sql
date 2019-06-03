/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2019-05-16 10:04:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_`
-- ----------------------------
DROP TABLE IF EXISTS `admin_`;
CREATE TABLE `admin_` (
  `aid` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `pwd` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `aimage` varchar(20) default NULL,
  `sex` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_
-- ----------------------------
INSERT INTO `admin_` VALUES ('1', 'admin', '123456', '13411693333', 'RycoYwTGZV.jpg', null, 'test2@qq.com');
INSERT INTO `admin_` VALUES ('2', '白白', '123456', '13145612312', null, null, null);

-- ----------------------------
-- Table structure for `car_`
-- ----------------------------
DROP TABLE IF EXISTS `car_`;
CREATE TABLE `car_` (
  `cid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_
-- ----------------------------
INSERT INTO `car_` VALUES ('10', '1', '11', '1');
INSERT INTO `car_` VALUES ('11', '1', '12', '1');

-- ----------------------------
-- Table structure for `collect_`
-- ----------------------------
DROP TABLE IF EXISTS `collect_`;
CREATE TABLE `collect_` (
  `collect_id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY  (`collect_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect_
-- ----------------------------
INSERT INTO `collect_` VALUES ('2', '1', '7');
INSERT INTO `collect_` VALUES ('3', '1', '9');

-- ----------------------------
-- Table structure for `orderitem_`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem_`;
CREATE TABLE `orderitem_` (
  `orderitem_id` int(11) NOT NULL auto_increment,
  `orderNum` varchar(20) NOT NULL,
  `pid` int(11) NOT NULL,
  `pnum` int(11) NOT NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`orderitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem_
-- ----------------------------
INSERT INTO `orderitem_` VALUES ('53', '20190510190747685', '5', '1', '6');
INSERT INTO `orderitem_` VALUES ('54', '20190510190747685', '7', '1', '6');
INSERT INTO `orderitem_` VALUES ('55', '20190510190747685', '9', '1', '6');
INSERT INTO `orderitem_` VALUES ('56', '20190516100041429', '28', '2', '1');
INSERT INTO `orderitem_` VALUES ('57', '20190516100041429', '7', '1', '1');

-- ----------------------------
-- Table structure for `order_`
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `oid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `time` varchar(30) default NULL,
  `status_id` int(11) default NULL,
  `total` int(11) default NULL,
  `orderNum` varchar(30) NOT NULL,
  `uname` varchar(20) default NULL,
  `uphone` varchar(20) default NULL,
  `address` varchar(50) default NULL,
  `paytime` varchar(30) default NULL,
  PRIMARY KEY  (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('39', '6', '2019.05.10 19:07:47', '2', '43', '20190510190747685', '玲玲', '13112244569', '小小村街尾010号', '2019.05.10 19:07:47');
INSERT INTO `order_` VALUES ('40', '1', '2019.05.16 10:00:41', '2', '222', '20190516100041429', '雏田', '13200000234', '化州丽江别墅108号', '2019.05.16 10:00:41');

-- ----------------------------
-- Table structure for `product_`
-- ----------------------------
DROP TABLE IF EXISTS `product_`;
CREATE TABLE `product_` (
  `pid` int(11) NOT NULL auto_increment,
  `pname` varchar(20) NOT NULL,
  `pdesc` varchar(1000) default NULL,
  `price` int(11) default NULL,
  `pimage` varchar(20) default NULL,
  `pnum` int(11) default NULL,
  `tid` int(11) NOT NULL,
  `rid` int(11) default NULL,
  `pdeta` varchar(1000) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_
-- ----------------------------
INSERT INTO `product_` VALUES ('2', '苹果', '苹果是一种低热量食物，每100克产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称。它有利于溶解硫元素，使皮肤润滑柔嫩。', '23', '5.jpg', '256', '2', null, null);
INSERT INTO `product_` VALUES ('3', '濑尿虾', '皮皮虾在中国大陆地区的正式名称写作“虾蛄”，英文俗名为“Mantis Shrimp（螳螂虾）”，为节肢动物门，甲壳动物亚门，软甲纲，掠虾亚纲，口足目（这个亚纲下面就一个目）旗下物种的统称', '30', 'lnxia.jpg', '344', '3', null, null);
INSERT INTO `product_` VALUES ('4', '梨', '梨的果实通常用来食用，不仅味美汁多，甜中带酸，而且营养丰富，含有多种维生素和纤维素，不同种类的梨味道和质感都完全不同。梨既可生食，也可蒸煮后食用。在医疗功效上，梨可以通便秘，利消化，对心血管也有好处。在民间，梨还有一种疗效，把梨去核，放入冰糖，蒸煮过后食用还可以止咳；除了作为水果食用以外，梨还可以作观赏之用。', '23', '12.jpg', '122', '2', null, null);
INSERT INTO `product_` VALUES ('5', '红椒', '红辣椒只是一种成熟的绿色甜椒。随着它的成熟，它变得更甜和更温和，到它成熟时，它实际上充满了营养。事实上，甜红辣椒被认为是你可以消耗的营养最密集的蔬菜之一。像所有辣椒一样，它们含有非常高的抗氧化维生素A和C，可以对抗体内细胞损伤，对健康的眼睛和皮肤尤为重要。红辣椒是含有番茄红素的少量食物之一，番茄红素是一种降低各种癌症风险的类胡萝卜素。', '15', '8.jpg', '5', '1', null, null);
INSERT INTO `product_` VALUES ('6', '草莓', '原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。', '16', '9.jpg', '90', '2', null, null);
INSERT INTO `product_` VALUES ('7', '豌豆', '原产地中海和中亚细亚地区，是世界重要的栽培作物之一。种子及嫩荚、嫩苗均可食用；种子含淀粉、油脂，可作药用，有强壮、利尿、止泻之效；茎叶能清凉解暑，并作绿肥、饲料或燃料。', '18', '22.jpg', '60', '1', null, null);
INSERT INTO `product_` VALUES ('9', '甜玉米', '甜玉米（Sweet corn）是玉米的一个种，又称蔬菜玉米，禾本科，玉米属。甜玉米是欧美、韩国和日本等发达国家的主要蔬菜之一。因其具有丰富的营养、甜、鲜、脆、嫩的特色而深受各阶层消费者青睐。超甜玉米由于含糖量高、适宜采收期长而得到广泛种植。中国是糯玉米的世界起源中心，栽培历史悠久。糯玉米营养丰富，食用价值高，被当今世界广泛用作营养食物。', '10', '25.jpg', '20', '1', null, null);
INSERT INTO `product_` VALUES ('10', '西红柿', '西红柿，学名叫番茄，是茄科番茄属中以成熟多汁浆果为产品的草木植物。我国栽培的番茄是从国外引种的，果实多为红色，样子像柿子，故俗称西红柿，洋柿子，古代也有叫六月柿、喜极三元等。花果期夏秋季。它既含有丰富多样的营养，又有着美观迷人的外形；它既是菜中佳味，又是果中美品，有多种功用，被称为神奇的菜中之果。', '5', '21.jpg', '110', '1', null, null);
INSERT INTO `product_` VALUES ('11', '西兰花', '西兰花，俗称青花菜。原产意大利，是常见蔬菜。通称绿花菜，也被称为西兰花。二年生草本植物，是甘蓝的一种变种。叶子大，主茎顶端形成肥大的花球，绿色或紫绿色，表面的小花蕾不密集在一起，侧枝的顶端各生小花球。', '54', '18.jpg', '10', '1', null, null);
INSERT INTO `product_` VALUES ('12', '胡萝卜', '根作蔬菜食用，并含多种维生素甲、乙、丙及胡萝卜素。', '46', '19.jpg', '20', '1', null, null);
INSERT INTO `product_` VALUES ('14', '白菜', '白菜营养丰富，菜叶可供炒食、生食、盐腌、酱渍，外层脱落的菜叶尚可作饲料，具有一定的药用价值。', '10', '16.jpg', '24', '1', null, null);
INSERT INTO `product_` VALUES ('15', '辣椒', '红辣椒只是一种成熟的绿色甜椒。随着它的成熟，它变得更甜和更温和，到它成熟时，它实际上充满了营养。事实上，甜红辣椒被认为是你可以消耗的营养最密集的蔬菜之一。像所有辣椒一样，它们含有非常高的抗氧化维生素A和C，可以对抗体内细胞损伤，对健康的眼睛和皮肤尤为重要。红辣椒是含有番茄红素的少量食物之一，番茄红素是一种降低各种癌症风险的类胡萝卜素。', '10', '17.jpg', '54', '1', null, null);
INSERT INTO `product_` VALUES ('16', '橙子', '橙子（学名：Citrus sinensis 英语：orange），是芸香科柑橘属植物橙树的果实，亦称为黄果、柑子、金环、柳丁。橙子是一种柑果，有很高的食用，药用价值。', '10', '11.jpg', '58', '2', null, null);
INSERT INTO `product_` VALUES ('17', '桃子', '桃（学名：Amygdalus persica L.）：蔷薇科、桃属植物。落叶小乔木；叶为窄椭圆形至披针形，长15厘米，宽4厘米，先端成长而细的尖端，边缘有细齿，暗绿色有光泽，叶基具有蜜腺；树皮暗灰色，随年龄增长出现裂缝；花单生，从淡至深粉红或红色，有时为白色，有短柄，直径4厘米，早春开花；近球形核果，表面有毛茸，肉质可食，为橙黄色泛红色，直径7.5厘米，有带深麻点和沟纹的核，内含白色种子。', '10', '6.jpg', '35', '2', null, null);
INSERT INTO `product_` VALUES ('18', '凤梨', '凤梨（学名：Ananas comosus (Linn.) Merr.），茎短。叶多数，莲座式排列，剑形，顶端渐尖，全缘或有锐齿，腹面绿色，背面粉绿色，边缘和顶端常带褐红色，生于花序顶部的叶变小，常呈红色。花序于叶丛中抽出，状如松球；苞片基部绿色，上半部淡红色，三角状卵形；萼片宽卵形，肉质，顶端带红色；花瓣长椭圆形，端尖，上部紫红色，下部白色。聚花果肉质。花期夏季至冬季 。', '10', '14.jpg', '35', '2', null, null);
INSERT INTO `product_` VALUES ('19', '香蕉', '香蕉（学名：Musa nana Lour.）芭蕉科芭蕉属植物，又指其果实，热带地区广泛种植。香蕉味香、富含营养。', '10', 'banana.jpg', '58', '2', null, null);
INSERT INTO `product_` VALUES ('20', '石榴', '性味甘、酸涩、温，具有杀虫、收敛、涩肠、止痢等功效。石榴果实营养丰富，维生素C含量比苹果、梨要高出一二倍。', '10', '7.jpg', '122', '2', null, null);
INSERT INTO `product_` VALUES ('21', '百香果', '果可生食或作蔬菜、饲料。入药具有兴奋、强壮之效。果瓤多汁液，加入重碳酸钙和糖，可制成芳香可口的饮料，还可用来添加在其他饮料中以提高饮料的品质。种子榨油，可供食用和制皂、制油漆等。花大而美丽，没有香味，可作庭园观赏植物。在中国以外的其他地区，鸡蛋果有“果汁之王”、“摇钱树”等美称。', '10', 'baixiangguo.jpg', '123', '2', null, null);
INSERT INTO `product_` VALUES ('22', '猕猴桃', '猕猴桃的质地柔软，口感酸甜。味道被描述为草莓、香蕉、菠萝三者的混合。猕猴桃除含有猕猴桃碱、蛋白水解酶、单宁果胶和糖类等有机物，以及钙、钾、硒、锌、锗等微量元素和人体所需17种氨基酸外，还含有丰富的维生素C、葡萄酸、果糖、柠檬酸、苹果酸、脂肪。', '10', '27.jpg', '23', '2', null, null);
INSERT INTO `product_` VALUES ('23', '西瓜', '西瓜为夏季之水果，果肉味甜，能降温去暑；种子含油，可作消遣食品；果皮药用，有清热、利尿、降血压之效。', '10', 'xigua.jpg', '434', '2', null, null);
INSERT INTO `product_` VALUES ('24', '荔枝', '荔枝味甘、酸、性温，入心、脾、肝经；可止呃逆，止腹泻，是顽固性呃逆及五更泻者的食疗佳品，同时有补脑健身，开胃益脾，有促进食欲之功效。因性热，多食易上火。荔枝木材坚实，纹理雅致，耐腐，历来为上等名材。', '105', 'lizhi.jpg', '343', '2', null, null);
INSERT INTO `product_` VALUES ('26', '海虹', '贻贝（学名：Mytilus edulis）亦称海虹，也叫青口，煮熟后加工成干品——淡菜，是一种双壳类软体动物，壳黑褐色，生活在海滨岩石上。分布于中国黄海、渤海沿岸。 贻贝壳呈楔形，前端尖细，后端宽广而圆。一般壳长6～8厘米，壳长小于壳高的2倍。壳薄。壳顶近壳的最前端。两壳相等，左右对称，壳面紫黑色，具有光泽，生长纹细密而明显，自顶部起呈环形生长。', '104', 'haihong.jpg', '34', '3', null, null);
INSERT INTO `product_` VALUES ('27', '斑鱼', '斑鱼（学名：Channa argus）又称黑鱼、团鱼、乌棒、生鱼、蛇头鱼、孝鱼、墨头鱼、财鱼等，是中国一种常见的食用鱼，个体大、生长快、经济价值高。黑鱼骨刺少，含肉率高，而且营养丰富，比鸡肉、牛肉所含的蛋白质高。', '103', 'banyu.jpg', '54', '3', null, null);
INSERT INTO `product_` VALUES ('28', '鲍鱼', '鲍鱼是名贵的“海珍品”之一，味道鲜美，营养丰富，被誉为海洋“软黄金”。鲍鱼是名贵的海洋食用贝类，被誉为“餐桌黄金，海珍之冠”，其肉质细嫩、营养丰富。', '102', 'baoyu.jpg', '54', '3', null, null);
INSERT INTO `product_` VALUES ('29', '大龙虾', '大龙虾体内对人体有益的矿物质含量十分丰富，并且胆固醇含量极少，是一种名副其实的低胆固醇营养佳品。出肉率达60%~67%，平均l00g蛋白质中含有人体必须氨基酸31.60mg。肉质与味道优于海水成虾。', '101', 'dlxia.jpg', '343', '3', null, null);
INSERT INTO `product_` VALUES ('30', '东星斑', '东星斑，Plectropomus leopardus (Lacepède, 1802)，鮨科鳃棘鲈属的一种鱼类。东星斑颜色鲜艳，很适合饲养在凶猛鱼的混养缸。石斑是很凶猛的掠食者，会吞掉任何它能吞掉的鱼。需要经常提供一些活食，足够的营养会保持它的色彩。', '102', 'dxb.jpg', '232', '3', null, null);
INSERT INTO `product_` VALUES ('31', '鱿鱼', '鱿鱼，也称柔鱼、枪乌贼，是软体动物门头足纲鞘亚纲十腕总目管鱿目开眼亚目的动物。体圆锥形，体色苍白，有淡褐色斑，头大，前方生有触足10条，尾端的肉鳍呈三角形，常成群游弋于深约20米的海洋中。', '102', 'youyu.jpg', '232', '3', null, null);
INSERT INTO `product_` VALUES ('32', '牛蛙', '牛蛙(Rana catesbiana Shaw)属于两栖纲（Amphibia）、无尾目(Anura)、蛙科(Ranidae)，是一种大型食用蛙，其肉质细嫩，味道鲜美，营养丰富，具有一定的药用价值。牛蛙，俗名美国水蛙，个体硕大，生长快，产量高，原产于北美洲和墨西哥等地，目前己遍及世界各大洲，是各地食用蛙中的主要养殖种类。', '103', 'niuwa.jpg', '44', '3', null, null);
INSERT INTO `product_` VALUES ('33', '帝王蟹', '帝王蟹又名石蟹或岩蟹，即石蟹科的甲壳类，不是真正的螃蟹，它们主要分布在寒冷的海域。因其体型巨大而得名，素有“蟹中之王”的美誉。帝王蟹属于深海蟹类，生存深度达850米之深，生存水温在2-5℃。帝王蟹能够生存的最低水温是1.4摄氏度。', '410', 'diwangxie.jpg', '33', '3', null, null);
INSERT INTO `product_` VALUES ('34', '海参', '海参同人参、燕窝、鱼翅齐名，是世界八大珍品之一。海参不仅是珍贵的食品，也是名贵的药材。据《本草纲目拾遗》中记载：海参，味甘咸，补肾，益精髓，摄小便，壮阳疗痿，其性温补，足敌人参，故名海参。海参具有提高记忆力、延缓性腺衰老，防止动脉硬化以及抗肿瘤等作用。随着海参价值知识的普及，海参逐渐进入百姓餐桌。生活环境决定海参品质。', '410', 'haishen.jpg', '33', '3', null, null);
INSERT INTO `product_` VALUES ('35', '河豚', '河鲀为暖温带及热带近海底层鱼类，栖息于海洋的中、下层，有少数种类进入淡水江河中，当遇到外来危险时使整个身体呈球状浮上水面，同时皮肤上的小刺竖起，借以自卫。', '420', 'hetun.jpg', '22', '3', null, null);
INSERT INTO `product_` VALUES ('36', '白蛤', '白蛤学名为四角蛤蜊（Mactra veneriformis，Reeue），是我国沿海常见的底栖经济贝类，肉细味美、营养丰富。', '22', 'baihe.jpg', '33', '3', null, null);
INSERT INTO `product_` VALUES ('37', '大花虾', '大花虾，色彩光鲜，生的时候和熟的时候一样的色彩斑斓，该特点与龙虾相似。大花虾在虾类生物里面个头比较大，比较直观的区别是——比基围虾、九节虾大许多。', '56', 'dahuaxia.jpg', '44', '3', null, null);
INSERT INTO `product_` VALUES ('38', '海螺', '海螺贝壳边缘轮廓略呈四方形，大而坚厚，壳高达10厘米左右，螺层6级。它富含蛋白质、维生素和人体必需的氨基酸和微量元素，是典型的高蛋白、低脂肪、高钙质的天然动物性食品', '33', 'hailuo.jpg', '233', '3', null, null);
INSERT INTO `product_` VALUES ('39', '彩色花椰菜', '彩色花椰菜为十字花科甘蓝类草本植物。包括紫球花椰菜、黄球花椰菜、淡绿球花椰菜等，是从花椰菜中选出的一类品种。花椰菜成熟的花球横径一般为20～30厘米，直径10～20厘米，由肥嫩的主轴和众多的肉质花梗组成。 彩色花椰菜除了按普通花椰菜栽培，作商品销售外，还可以进行上盆作家庭小菜园栽培或观赏栽培，前景看好。', '10', 'huaye.jpg', '55', '1', null, null);
INSERT INTO `product_` VALUES ('40', '软浆叶', '软浆叶豆腐菜是我国的古老蔬菜。因为它的叶子近似圆形，肥厚而黏滑，好像木耳的感觉，所以俗称木耳菜，木耳菜的嫩叶烹调后清香鲜美，口感嫩滑，深受南方居民的喜爱。', '11', 'ruanjiang.jpg', '67', '1', null, null);
INSERT INTO `product_` VALUES ('41', '水空心菜', '水空心菜属旋科草本植物，又名蕹菜、竹叶菜、通心菜，因菜梗中空而得其名，是夏秋季节主要的绿叶菜之一。空心菜含有多种营养物质，是一种高产优质的绿叶蔬菜。须根系，根浅，再生能力强，植株高20~60厘米，它的营养主要在茎叶上。最大的特点就是耐涝、耐光、抗高温，但不耐寒，遇霜茎叶就会枯死。对霜霉病、软腐病抗性较强，而且适应性强，南北方都可以种植。', '9', 'kongxin.jpg', '56', '1', null, null);
INSERT INTO `product_` VALUES ('42', '芦笋', '芦笋（拉丁学名：Asparagus officinalis L.）是天门冬科天门冬属多年生草本植物石刁柏的幼苗，可供蔬食。未出土的呈白色称为白笋， 出土后呈绿色称为绿笋。即使生产地域不同，但不管是哪款芦笋品种，只要照到阳光就会变成绿芦笋，埋在土中或遮蔽阳光，就会让芦笋色泽偏白。', '12', 'lus.jpg', '65', '1', null, null);
INSERT INTO `product_` VALUES ('43', '秋葵', '咖啡黄葵性喜温暖，原产地印度，广泛栽培于热带和亚热带地区。中国湖南、湖北、广东等省栽培面积也极广。素有蔬菜王之称，有极高的经济用途和食用等价值。', '13', 'qiukui.jpg', '45', '1', null, null);
INSERT INTO `product_` VALUES ('44', '人参果', '其果肉清香多汁，腹内无核，风味独特，具有高蛋白、低脂肪、低糖等特点，同时富含蛋白质、氨基酸以及微量元素、维生素与矿物元素，具有保健功效。它是一种营养较为全面的蔬果两用食品。食用能补充人体所需，具有营养保健价值。中国四大名著之一《西游记》中提及此果并加入了神话色彩。', '100', 'renshen.jpg', '65', '2', null, null);
INSERT INTO `product_` VALUES ('45', '鸡蛋果', '果可生食或作蔬菜、饲料。入药具有兴奋、强壮之效。果瓤多汁液，加入重碳酸钙和糖，可制成芳香可口的饮料，还可用来添加在其他饮料中以提高饮料的品质。种子榨油，可供食用和制皂、制油漆等。花大而美丽，没有香味，可作庭园观赏植物。在中国以外的其他地区，鸡蛋果有“果汁之王”、“摇钱树”等美称。', '15', 'jidanguo.jpg', '56', '2', null, null);
INSERT INTO `product_` VALUES ('46', '阳桃', '阳桃（学名：Averrhoa carambola L.）是酢浆草科阳桃属植物，乔木，高可达12米，分枝甚多；树皮暗灰色，内皮淡黄色。奇数羽状复叶，互生，全缘，卵形或椭圆形。花小，微香，数朵至多朵组成聚伞花序或圆锥花序，自叶腋出或着生于枝干上，花枝和花蕾深红色。浆果肉质，下垂。种子黑褐色。花期4-12月，果期7-12月。', '8', 'yangtao.jpg', '78', '2', null, null);

-- ----------------------------
-- Table structure for `recommend_`
-- ----------------------------
DROP TABLE IF EXISTS `recommend_`;
CREATE TABLE `recommend_` (
  `rid` int(11) NOT NULL auto_increment,
  `rname` varchar(20) default NULL,
  PRIMARY KEY  (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend_
-- ----------------------------
INSERT INTO `recommend_` VALUES ('1', '热销');
INSERT INTO `recommend_` VALUES ('2', '新品');
INSERT INTO `recommend_` VALUES ('3', '精品');

-- ----------------------------
-- Table structure for `status_`
-- ----------------------------
DROP TABLE IF EXISTS `status_`;
CREATE TABLE `status_` (
  `status_id` int(11) NOT NULL auto_increment,
  `statusName` varchar(20) default NULL,
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status_
-- ----------------------------
INSERT INTO `status_` VALUES ('1', '未付款');
INSERT INTO `status_` VALUES ('2', '已付款');
INSERT INTO `status_` VALUES ('3', '未发货');
INSERT INTO `status_` VALUES ('4', '已发货');

-- ----------------------------
-- Table structure for `type_`
-- ----------------------------
DROP TABLE IF EXISTS `type_`;
CREATE TABLE `type_` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(20) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_
-- ----------------------------
INSERT INTO `type_` VALUES ('1', '蔬菜');
INSERT INTO `type_` VALUES ('2', '水果');
INSERT INTO `type_` VALUES ('3', '海鲜');

-- ----------------------------
-- Table structure for `user_`
-- ----------------------------
DROP TABLE IF EXISTS `user_`;
CREATE TABLE `user_` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(20) default NULL,
  `upwd` varchar(20) NOT NULL,
  `uphone` varchar(20) NOT NULL,
  `usex` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `uimage` varchar(20) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_
-- ----------------------------
INSERT INTO `user_` VALUES ('1', '雏田', '123456', '13200000234', '女', 'test1@qq.com', '化州丽江别墅108号', '11111.jpg');
INSERT INTO `user_` VALUES ('2', '小樱', '123456', '13400000001', '女', 'test2@qq.com', '化州丽江别墅9号', '22222.jpg');
INSERT INTO `user_` VALUES ('3', '鸣人', '1', '18100000001', '男', 'test3@qq.com', '化州丽江别墅9号', 'user_008.jpg');
INSERT INTO `user_` VALUES ('4', '黑黑', '123456', '13800000000', '男', 'test3@qq.com', '化州丽江别墅9号', 'user_001.png');
INSERT INTO `user_` VALUES ('5', '黑子', '123456', '13411000000', '男', 'test5@qq.com', '化州丽江别墅95号', 'user_005.jpg');
INSERT INTO `user_` VALUES ('6', '玲玲', '123456', '13112244569', '女', 'test6@qq.com', '小小村街尾010号', 'user_006.jpg');
INSERT INTO `user_` VALUES ('7', '大大', '123456', '13749682125', '男', 'test7@qq.com', '大大村街尾010号', 'user_008.jpg');
INSERT INTO `user_` VALUES ('8', '小小', '123456', '13546952311', '女', 'test8@qq.com', '小小村街尾020号', 'user_003.jpeg');
INSERT INTO `user_` VALUES ('10', '刀客', '123456', '13411694444', '男', 'test10qq.com', '种种村街头10号', 'user_008.jpg');
INSERT INTO `user_` VALUES ('12', '妹妹', '123456', '131', null, null, null, 'user_11.jpg');
INSERT INTO `user_` VALUES ('13', '剑士', '123456', '13411111112', null, null, null, 'user_12.jpg');

-- ----------------------------
-- Table structure for `word_`
-- ----------------------------
DROP TABLE IF EXISTS `word_`;
CREATE TABLE `word_` (
  `wid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `time` varchar(30) NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY  (`wid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of word_
-- ----------------------------
INSERT INTO `word_` VALUES ('1', '6', '5', '2019.05.10 19:08:40', '很新鲜，不错哦');
