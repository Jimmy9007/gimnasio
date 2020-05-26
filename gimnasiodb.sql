-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2020 a las 21:12:00
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasiodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `pk_asistencia_id` int(10) unsigned NOT NULL,
  `FECHA_ASIS` datetime NOT NULL,
  `fk_usuario_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`pk_asistencia_id`, `FECHA_ASIS`, `fk_usuario_id`) VALUES
(1, '2019-09-22 13:45:55', 4),
(2, '2019-09-22 13:46:33', 2),
(3, '2019-09-22 13:46:40', 8),
(4, '2019-09-22 13:46:51', 59),
(5, '2019-10-20 13:34:17', 4),
(6, '2020-01-11 09:02:38', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `pk_chat_id` int(10) unsigned NOT NULL,
  `fk_usuariologin_id` int(10) unsigned NOT NULL,
  `fk_usuario_id` int(10) unsigned NOT NULL,
  `mensaje` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

CREATE TABLE IF NOT EXISTS `ejercicios` (
  `pk_ejercicio_id` int(10) unsigned NOT NULL,
  `NOM_EJER` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DESC_EJER` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `RUTA_IMG_EJER` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `zonaMuscular` enum('Abdominales','Pierna','Gemelos','Sóleos','Muslo','Femoral','Cuádriceps','Aductores','Antebrazo','Brazo','Bíceps','Tríceps','Espalda','Lats Dorsales','Erectores Espinales','Pecho','Pecho Superior','Pecho Inferior','Pecho Interno','Pecho Externo','Pecho Caja Torácica','Pecho Serrato','Hombro','Deltoides Anterior','Deltoides Medio','Deltoides Posterior','Gluteo','Gluteo Medio','Trapecio','Cardio') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT INTO `ejercicios` (`pk_ejercicio_id`, `NOM_EJER`, `DESC_EJER`, `RUTA_IMG_EJER`, `zonaMuscular`) VALUES
(1, 'EXTENSION DE PIERNAS EN MAQUINA', 'Debemos sentarnos en la máquina específica para tal fin y colocar los pies debajo de las almohadillas o rodillos acolchados, de manera tal que las rodillas queden alineadas con la articulación de la máquina.', '7BB6DD31570A2766BABBB9AAED6DCFE0.jpg', 'Cuádriceps'),
(2, 'SENTADILLAS EN HACK', 'Permanece completamente apoyada en el respaldo de la maquina, hay que bajar controlando el peso y sin rebotar, al momento de bajar las rodillas no deben estar por delante de las puntas de los pies.', '9A21C656158EDB105536A9521C669DE8.jpg', 'Cuádriceps'),
(3, 'Curl femoral acostado', 'Tumbados boca abajo con los tobillos justo debajo de los cojines. Comenzamos inspirando mientras flexionamos las rodillas para elevar con los tobillos el peso cargado.', '1C02D16BCDC5CE240507F6627AAB0682.png', 'Femoral'),
(4, 'Press de banco plano con barra', 'Túmbate sobre un banco plano. Los glúteos deben estar sobre el banco y los pies en el suelo. Coge la barra con las manos en pronación. La separación entre las manos debe ser un poco mayor a la altura de los hombros.', 'D29C7626F843DAF90CFE16ED9157F17C.jpeg', 'Pecho'),
(5, 'Press de banco inclinado con barra', 'Acostados sobre un banco inclinado en ángulo aproximado de 30 a 45°. Separad las piernas ligeramente apoyando los pies sobre el suelo. Las caderas, hombros y cabeza deben reposar sobre el banco. Agarrad una barra con agarre prono. Las manos deben estar algo más abiertas que la anchura de nuestros hombros. Bajad la barra a la parte superior del pecho.', 'ED59C8CB34C726C08623942ECF498990.jpg', 'Pecho Superior'),
(6, 'Press francés en banco plano con mancuernas', 'Deberás estirarte sobre un plano horizontal con una mancuerna en cada mano, los codos flexionados, inspirar y efectuar una extensión de los codos, espirar al final del movimiento.\r\n\r\nDebes contraer los tríceps en la parte superior del movimiento por un segundo. Al exhalar deberás llevar las mancuernas a la posición inicial.', '7CD671A5B1FA320D32142174A92F2920.jpg', 'Tríceps'),
(7, 'Aductores en máquina', 'Juntamos los muslos de manera que las rodillas o los cojines que están delante de ellas se unan en el centro, delante nuestro. Sostenemos la posición unos segundos y lentamente regresamos a la posición inicial, sin movimientos bruscos y conservando durante todo el recorrido la espalda bien apoyada en la máquina.', 'DC686FF01912266F71403547EE506B8B.png', 'Aductores'),
(8, 'Elevación de talones de pie en máquina', 'Realizamos una extensión de los pies elevando los talones y empujando con nuestros pies el cuerpo hacia arriba. La espalda debe permanecer recta en todo momento y el cuerpo debe subir y bajar por la extensión de los pies.', '7CCDDEA56BDD657768E6A9941ED802CC.jpg', 'Gemelos'),
(9, 'Patadas de glúteo en el suelo', 'La postura que vamos a adoptar consistirá en apoyarnos sobre las manos y rodillas, manteniendo la espalda recta, sin curvarla.\r\nAhora llevamos la pierna flexionada hacia atrás hasta realizar una extensión completa de la cadera.\r\nPara finalizar retomamos la pierna al punto de partida y volvemos a ejecutar el movimiento para una nueva repetición.', '30A4E3963585B0471CCCA042C9B34765.jpg', 'Gluteo'),
(10, 'Pull over con polea alta brazos extendidos', 'De pie y de cara a la polea alta con las piernas ligeramente separadas. Tomamos con ambas manos en pronación la barra, extendemos los brazos delante nuestro sujetando la polea.', '4682AE1B3D9944F5334165546B10CBD9.jpg', 'Espalda'),
(11, 'Extensiones de tríceps en polea alta', 'Debemos posicionarnos de pie frente al aparato de polea alta, y habiendo seleccionado el peso a utilizar, debemos tomar con las manos el mago de manera que las palmas miren hacia el suelo. Con los brazos pegados al torso y los codos siempre alineados con el cuerpo, comenzamos el movimiento.\r\nRealizamos una extensión de los codos, llevando el mango de la polea hacia abajo, sin despegar los codos de los lados del cuerpo y únicamente movilizando el antebrazo. Espiramos al final del movimiento y regresamos lentamente a la posición inicial.', 'EF3A4F3A86C3961608D07074C691D412.jpg', 'Tríceps'),
(12, 'Curl de bíceps con barra', 'Con la espalda recta, las rodillas ligeramente flexionadas y los pies separados del ancho de los hombros, con agarre en supinación. Las manos deben estar separadas en la barra un poco más allá de la anchura de los hombros.\r\n\r\n', '8511D31614BB9906358BA8238733AB26.jpg', 'Bíceps'),
(13, 'Curl de antebrazo con barra en pronacion', 'Flexionar las muñecas hacia arriba.\r\nDescender la barra a la posición inicial, para comenzar  nuevamente la flexión.\r\nRepetir el movimiento.\r\nRecordar que únicamente se debe realizar el movimiento a  nivel  de las muñecas y no se deberá levantar los antebrazos de los muslos durante cada ejecución.', 'B663A95E774A63A920686BEC7CEA8D4D.jpg', 'Antebrazo'),
(14, 'Elevacion lateral de los brazos con mancuernas', 'Debemos colocarnos de pie, con las piernas ligeramente flexionadas y separadas del ancho de la cadera. La espalda debe permanecer recta y en cada mano debemos sujetar una mancuerna, mientras los brazos permanecen a los lados del cuerpo o delante de los muslos, levemente flexionados.\r\nTomando aire elevamos las mancuernas hasta que los brazos queden alineados con los hombros y desde allí bajamos lentamente mientras exhalamos.', '3AD2DFC34036DD8217CFDD3639381CB0.jpg', 'Hombro'),
(15, 'Remo al cuello con manos separadas', 'De pie con las piernas ligeramente separadas, espalda recta y agarre en pronación. Inspiramos y subimos la barra hasta la altura de la barbilla aproximadamente, llevando la barra hacia arriba paralela al cuerpo y elevando los codos lo máximo posible.', '408528AD088E4C3E7442584EA13AA609.jpg', 'Trapecio'),
(16, 'Remo en polea baja', 'Los brazos en la posición inicial deben quedar extendidos, sujetados a la polea baja mediante el maneral y el torso debe permanecer erguido. Sin movilizar el torso, jalamos del maneral llevando hacia atrás los codos mientras inspiramos, hasta que el maneral queda justo frente al esternón.', '42731672DBE2BB57DFA195996CB60C73.jpg', 'Lats Dorsales'),
(17, 'Elevaciones de tronco en banco inclinado', 'Inspiramos y cuando exhalamos elevamos el tronco del banco mediante la contracción del abdomen, nos detenemos allí unos segundos y regresamos inhalando hacia la posición inicial, sin recostarnos por completo en la tabla nuevamente, sino conservando una leve curvatura de la espalda.', 'A7FD82B6F0C1DCAB156A3ED2F6CF1129.jpg', 'Abdominales'),
(18, 'Peck Deck', 'Nos sentamos en la máquina apoyando la espalda en el respaldo. Agarramos las empuñaduras, colocando los brazos de manera que formen un ángulo de 90 grados, apoyando el antebrazo en la parte acolchada de la máquina. Junta los brazos haciendo una contracción de los pectorales, sin que lleguen a chocar los mangos. Aguanta la contracción unos instantes y luego separa de nuevo las manos, sin que lleguen a chocar las placas al bajar.', '4EA499F5D527E77883D520E3AB89C3F0.jpg', 'Pecho'),
(19, 'Zancadas', 'Antes de flexionar las rodillas, apretemos los músculos del abdomen y de la espalda baja, para hacer el ejercicio con más facilidad. Posteriormente, procederemos a dar un paso hacia adelante doblando las dos piernas hasta que la rodilla de atrás consiga tocar el suelo, y ambas rodillas estén dobladas a un ángulo de 90 grados. Para evitar lastimarnos cuando daño toquemos el suelo.', '9721D712231B64618FA1F2098F52161A.jpg', 'Gluteo'),
(20, 'extension de la cadera en polea baja', 'Para comenzar con la realización del ejercicio debemos colocarnos de pie, frente a una polea y sujetar la polea baja a uno de los tobillos, adelantamos la pierna contraria, nos sujetamos por las manos a la máquina, y con la espalda bien recta y la pelvis levemente adelantada, comenzamos a llevar la pierna que carga el peso hacia atrás sin variar la flexión de la rodilla, de manera de elevar el peso mientras realizamos la extensión de la cadera.', '06C6D8B5E7CC0E30642CB014E6800D02.jpg', 'Gluteo'),
(21, 'Elevación de la pelvis', 'debemos colocarnos estirados en el suelo sobre la espalda, con los brazos apoyados a los lados del cuerpo y las rodillas flexionadas. Inspiramos y empujamos con los pies para separar los glúteos del suelo y elevarlos. Mantenemos allí unos segundos la posición y exhalamos mientras descendemos la pelvis lentamente sin llegar a apoyar los glúteos en la superficie.', '5ED13447ABFF38860C43EFC084E70666.jpg', 'Gluteo'),
(22, 'curl de bíceps alternos con supinación', 'Sentado, y con una mancuerna en cada mano y cogidas en semipronación debes realizar los ejercicios de este modo: Inspirar y flexionar los codos efectuando una rotación externa de la muñeca antes de que los antebrazos alcancen la horizontal; Al finalizar la flexión deberás elevar los codos, y ahí puedes soltar el aire, recién al final del movimiento.', 'B1EB0FE35104D59EC6B3DA33EBB7C8B4.jpg', 'Bíceps'),
(23, 'curl de bíceps concentrado con apoyo en el muslo', 'Sentado, con una mancuerna cogida en supinación y el codo apoyado en la cara interna del muslo, inspirar y efectuar una flexión del codo, espirar al final del esfuerzo. Este ejercicio de aislamiento permite el control del movimiento en amplitud, velocidad y rectitud. En este ejercicio se trabajan zonas muy específicas del brazo, principalmente, el bíceps y el braquial anterior.', '47E6A48EAC8B4E537683F01FCC900B9F.jpg', 'Bíceps'),
(24, 'curl de bíceps alterno tipo martillo', 'Debes coger una mancuerna en cada mano en semipronación. Ahora debéis hacer una flexión de los codos de forma simultánea o alternando los brazos, siempre espirando al final de cada movimiento.', '33D45B572F375F89B2D5FBFC5031C665.jpg', 'Bíceps'),
(25, 'curl de bíceps con polea', ' ponte de pie frente al aparato. Coge el mango en supinación (posición de la mano con la palma hacia arriba). inspira y haz una flexión del antebrazo. Espira cuando acabes el movimiento.', 'A5F0A0F8AF02E94AAFECFB336220284E.jpg', 'Bíceps'),
(26, 'biceps brazos en cruz polea alta', 'debes situarte de pie en medio de la polea alta o sentado si las poleas tienen poca altura. En cada mano sujetas la polea de los respectivos lados conservando la palma de la mano hacia arriba, es decir, con agarre en supinación. Con los brazos ligeramente flexionados se logra la posición inicial del ejercicio.', '651191F3C60B6FC24CC76DA2F7CF897A.jpg', 'Bíceps'),
(27, 'Extensión de tríceps en polea alta, agarre inverti', 'Debemos colocarnos de pie, piernas separadas y levemente flexionadas, frente a la máquina de polea alta y previa selección del peso a cargar, cogemos con ambas manos la polea alta con las manos en supinación es decir, de manera tal que las palmas miren hacia arriba.', '04DC870A820F686B96C2891ED1666848.jpg', 'Tríceps'),
(28, 'biceps en el banco scott', 'Sentados sobre la máquina, apoyamos la totalidad de los brazos sobre el pupitre del banco scott y cogemos una barra Z o dos mancuernas con las manos, de manera que las palmas miren hacia arriba. Sin movilizar los brazos y con los mismos estirados mientras sostenemos el peso, comenzamos el ejercicio.', 'D6F18DA3ADBBB9421E34F356DFCB237D.jpg', 'Bíceps'),
(29, 'curl de biceps con barra y agarre en pronacion', 'De pie, piernas ligeramente separadas, brazos extendidos, manos en pronación, inspirar y flexionar los codos, espirar al final del movimiento.', 'CBC16E40080F63DA8EF6BC659153C92A.jpg', 'Bíceps'),
(30, 'curl de antebrazo con barra en pronacion', 'siéntate y apoya los antebrazos sobre un banco o sobre los muslos. Agarra la barra con las manos en pronación (movimiento del antebrazo que hace girar la mano de fuera a dentro presentando el dorso de ella), las muñecas colocadas en flexión pasiva.', '9F68A8CF237A404AC5A1FE9340271685.jpg', 'Antebrazo'),
(31, 'curl de antebrazos con barra agarre en supinación', 'Siéntese en un banco y coloque los antebrazos apoyados sobre los muslos o también puede arrodillarse para que tu cuerpo este detrás del banco plano.\r\nUtilice sus brazos para agarrar la barra con un agarre supinación (palmas hacia arriba) y coloque los antebrazos apoyados contra el banco plano (o sobre sus rodillas si se encuentra sentado). Las muñecas deben estar colgando sobre el borde del banco o las rodillas.', '8EDB1E762F0AB6452D25510D9132C5E5.gif', 'Antebrazo'),
(32, 'extensión alternada de los codos en polea alta man', 'Ponerse de pie mirando el aparato, los brazos deben estar en paralelo al cuerpo. Tomar la polea mediante la agarradera con las manos en supinación, \r\nFlexionar los codos y mantener las manos por encima de las muñecas. ', 'A05789D1F87F4CA7915EBF6B6B3714AF.jpg', 'Tríceps'),
(33, 'Press frances en banco plano', 'Debemos recostarnos con la espalda apoyada sobre un banco plano y tomar con las manos una barra, las palmas de la mano deben mirar hacia arriba mientras los brazos están flexionados y la barra queda detrás del cuerpo.', '5BB4277B9A1DA76A0FEB9476F6E7B982.jpg', 'Tríceps'),
(34, 'Extensión vertical alternada de los codos con manc', 'Debemos tomar en una mano una mancuerna y elevar el brazo que posee la carga por el lateral de la cabeza, manteniendo el codo semiflexionado. Desde allí debemos inhalar y descender lentamente sin mover el brazo, por la flexión del codo, la mancuerna por detrás de la cabeza.', '4FF8979053B7D4BFF74C8D1940308D04.jpg', 'Tríceps'),
(35, 'Extension de los codos sentado con una mancuerna', 'Sentado con la mancuerna cogida con las dos manos por detrás de la nuca, inspirar y efectuar una extensión de los codos. Espirar al final del movimiento. La posición vertical del brazo estira con fuerza la porción larga del músculo favoreciendo una buena solicitación de esta región durante su contracción. Es importante contraer la banda abdominal para evitar curvar demasiado la espalda.', '8EDD2ABFC9CE42C258BA4DAB5CDFE751.jpg', 'Tríceps'),
(36, 'Extensión de los codos sentado con barra', 'Sentarse de pie, con la barra tomada por detrás de la nuca. Llevar los brazos directamente sobre la cabeza con las manos alineadas con los antebrazos. Manos en pronación, tomar la barra con las manos cerca.', 'C1DE9DFD790EBB14BCE84B6A530E9C50.bmp', 'Tríceps'),
(37, 'Extension codos mancuerna inclinado', 'Debemos colocarnos de pie con las piernas ligeramente flexionadas y adelantamos una de ellas sobre la cual apoyamos la palma de la mano del mismo lado y así, apoyados sobre ésta inclinamos el torso hacia adelante con la espalda derecha.', '9BFD6BDBF9351B98846B8330E243C8F4.png', 'Tríceps'),
(38, 'Dipping entre dos bancos', 'Debemos flexionar los codos al mismo tiempo que inspiramos y el cuerpo desciende mientras los brazos se flexionan hasta formar un ángulo de 90 grados. Regresamos a la posición inicial sin extender por completo los codos para mantener la contracción muscular y exhalamos el aire al final del movimiento.', '69221FDC23D2CBE85C489791E6427EDC.jpg', 'Tríceps'),
(39, 'Jumping Jacks', 'Mientras estás moviendo las piernas hacia afuera, levanta los brazos por encima de tu cabeza y aplaude tus manos juntas. Los brazos deberán estar ligeramente flexionados a lo largo de todo el movimiento en el aire. A continuación, salta de nuevo a la posición inicial.', '229FF85EF8671C66FFA53ACD6ADF38F8.jpg', 'Cardio'),
(40, 'Bicicleta Estatica', 'Ajustar la altura de sillín a la altura de la cadera.', '9F387921DEB7122B3D2B75CA852ECF83.jpg', 'Cardio'),
(41, 'Press Trasnuca Con Barra', 'Sientante en un banco  con la espalda bien recta. Coge la barra y posicionala detrás de la nuca con la manos en pronación. Inspira y eleva la barra por detrás de la nuca  hasta   estirar los brazos  casi por completo  sin anclar los codos y dejando  una pequeña flexión de brazos.', 'C5133EF9BCDA5DBD569E0643BE960478.jpg', 'Hombro'),
(42, 'Press frontal con barra', 'Sentados con una barra cogida en pronación. Las manos deben estar sobre la barra algo más separadas que la anchura de los hombros. Con la espalda bien recta, llevamos la barra con las manos hasta la parte alta del pecho, casi a la altura de los hombros y desde allí comenzamos el ejercicio.', '0ACDEA1EE376733F678DE033395EE28E.jpg', 'Hombro'),
(43, 'Press sentado con mancuernas', 'Sentados en un banco, con la espalda bien recta y tomaremos en ambas manos una mancuerna. Llevaremos las mismas a la altura de los hombros por los laterales del cuerpo mientras flexionamos los codos y las palmas de la mano miran hacia adelante.', '86CB7151266D9DCE4D7F75380313CD07.jpg', 'Hombro'),
(44, 'Press frontal con ROTACIÓN de muñeca', 'Nos sentamos en el banco y tomamos las mancuernas a la altura de los hombros en supinación. Inspiramos y elevamos las mancuernas hasta estirar los brazos totalmente, teniendo en cuenta de ir rotando la muñeca en el transcurso del movimiento hasta dejarla en pronación.', 'A587F4200C9C4902611BB5502ACCD44A.jpg', 'Hombro'),
(45, 'elevaciones laterales, tronco inclinado adelante', 'Debemos colocarnos de pie con las piernas separadas del ancho de los hombros o poco menos y las rodillas ligeramente flexionadas. Con mancuernas asidas en ambas manos inclinamos el tronco hacia adelante manteniendo la espalda recta.', 'CF10D438B199F661AAE733476ACD9716.jpg', 'Deltoides Posterior'),
(46, 'Elevación frontal alternada con mancuerna', 'Debemos colocarnos de pie, con los pies ligeramente separados y mancuernas asidas con las manos en pronación. Las mancuernas deben apoyarse junto a las manos sobre los muslos, ligeramente hacia los costados. Comenzamos a contraer los músculos para elevar un brazo hacia adelante.', 'CD9878C758E51C13BCBCD3C96A40BAB5.jpg', 'Deltoides Anterior'),
(47, 'Elevacion lateral acostado de lado', 'Estirado de lado en el suelo o sobre un banco, una mancuerna cogida en pronación, inspirar y elevar el brazo hasta la vertical. Espirar al final del movimiento.', '33E5BEA01ABDA3061AB8BE50A335B108.jpg', 'Hombro'),
(48, 'Elevaciones laterales alternas con polea baja', 'De pie al lado derecho de la polea baja. Use su mano izquierda para agarrar la manija unida a la polea baja con un agarre en pronación. Apoye el brazo en frente de usted y paralelo al tronco. La mano derecha debe agarrar la máquina para una mejor compatibilidad y el equilibrio.', 'E06C5C7FD59384058FABE828C9B89031.jpg', 'Deltoides Medio'),
(49, 'Elevaciones frontales alternas con polea baja', 'Debemos colocarnos de pie con las piernas ligeramente separadas y de espaldas a la máquina de polea baja, con una mano tomamos el mago previa carga de la polea, de manera que la palma en pronación.', '1B96965A19F82E5D05145C3ED135C191.jpg', 'Deltoides Anterior'),
(50, 'Pájaro en polea baja', 'De pie, los pies separados, piernas ligeramente flexionadas, tronco inclinado hacia delante, manteniendo la espalda recta, los brazos colgando, un mango en cada mano, los cables las dos poleas cruzados, inspirar y elevar los brazos hasta la horizontal. Espirar al final del movimiento.', 'AFD406A1797CB18D22770FF1A143CD0F.jpg', 'Deltoides Posterior'),
(51, 'Elevaciones frontales con barra', 'Con los codos ligeramente flexionados, contraer la porción anterior del deltoides para elevar la barra por delante del cuerpo hasta que los brazos queden paralelos con el suelo.', '83000E53E78641A3D2B574699F5A4E49.jpg', 'Hombro'),
(52, 'Press de banca plano manos juntas', 'Sujete la barra con las manos juntas a una distancia de unos 15 cm y las palmas hacia arriba. La barra debe estar situada en la parte superior del pecho. Levántela hasta bloquear los codos. Vuelva lentamente a la posición inicial.', 'BEB13D549D42D597E9C25BD9D936299F.jpg', 'Pecho'),
(53, 'Press de banca declinado', 'En un banco más o menos inclinado (entre 20º y 40º), pies fijos para evitar deslizamientos, asir la barra con las manos en pronación y separadas en una distancia igual o superior a la anchura de los hombros. bajar la barra sobre la parte baja de los pectorales.', '2702230964F678DE0A0AC41352FEB2FC.jpg', 'Pecho Inferior'),
(54, 'Flexiones de brazos en el suelo', 'Debemos colocarnos en el suelo, boca hacia abajo. Apoyamos las manos en el suelo, justo por debajo de los hombros y separadas de este ancho. Despegamos el torso del suelo impulsándonos con los brazos y el pecho.', '4863C7F95499D724C0B12721647DD40C.jpg', 'Pecho'),
(55, 'Dips o fondos en paralelas', 'El tronco ligeramente inclinado hacia adelante. Lexionamos los codos de manera de que el pecho descienda hasta el nivel de las barras, siempre conservando las piernas y el torso inmóvil.', 'D4F331237CFD21461F556A247CB81A9B.jpg', 'Pecho'),
(56, 'Press con mancuernas en banco plano', 'Tumbate sobre un banco plano y apoya los pies en el suelo para tener mayor estabilidad. Extiende los brazos verticalmente. Las manos frente a frente en semi-pronación y agarrando las mancuernas.', '8F1C1320BDB4CA7D2F65B41965766162.jpg', 'Pecho'),
(57, 'Aperturas con mancuernas en banco plano', 'Sobre un banco plano. Con mancuernas cuyas palmas deben mirar hacia el centro del cuerpo y manteniendo los brazos levemente flexionados en vertical al cuerpo, sobre el pecho, separamos los brazos del cuerpo hasta llegar a la altura de los hombros.', 'A5F4EA93F7DA097355AF70F6C7A05AE0.jpg', 'Pecho Externo'),
(58, 'Press con mancuerna en banco inclinado', ' Un banco cuya inclinación sea entre 30 y 45 grados. Con mancuerna llévalas a la altura del hombro, con los nudillos mirando hacia el techo. Mantén los codos hacia los lados, en el mismo plano que los hombros.', '49A917DCF02ECEB9E4C94223B341FDCE.jpg', 'Pecho Superior'),
(59, 'Apertura con mancuerna en banco inclinado', 'Sentado en un banco inclinado entre 45° y 60º, brazos extendidos y codos ligeramente flexionados para aliviar la articulación. Esta será su posición inicial.', '5A1D5A7A3315AA7610C70442D9FC06D9.jpg', 'Pecho Externo'),
(60, 'Cruces de pie con polea', 'En medio de una polea alta Inclinamos u poco el torso hacia adelante, flexionamos ligeramente los codos. sin modificar la flexión de los codos, movilizamos los brazos desde arriba hacia adelante del torso mientras realizamos un cruce de polea, pasando una mano por encima de otra.', 'D7D7E9055FCFBFB8848DF774C87E04C5.jpg', 'Pecho Externo'),
(61, 'Pullover con mancuerna', 'Debemos colocarnos tumbados sobre un banco, con los pies apoyados sobre el suelo, y sujetando con ambas manos una mancuerna mientras conservamos los brazos extendidos verticalmente sobre el pecho.', 'B19C3B52FF8DD000A01B42324E1A61B3.jpg', 'Pecho'),
(62, 'Pullover con barra en banco plano', 'En un banco, los brazos estirados, agarar la barra con las manos en pronación y separadas en una distancia igual a la anchura de los hombros.\r\nbajar la barra por detrás de la cabeza flexionando ligeramente los codos.', 'C1F7A389261EA411B54EBBB71C17D196.jpg', 'Pecho'),
(63, 'Tracción o dominadas en barra fija', 'Con las manos de manera que las mismas queden separadas más allá del ancho de los hombros y las palmas miren hacia afuera, desde allí, con las rodillas flexionadas pero con las piernas relajadas.', '79F4D971DB7A2D87D11E41DCD690A8AD.jpg', 'Espalda'),
(64, 'Tracción o dominadas en barra fija en supinacion', 'En la barra fija manos en supinación separadas una longitud igual a la anchura de los hombros y llevar el mentón a la altura de la barra.', 'D5F10489ADFDF0074FAA79072678D6E7.jpg', 'Espalda'),
(65, 'Polea al pecho', 'Con las manos en pronación, de manera que las palmas miren hacia abajo, separadas más allá del ancho de los hombros Con la espalda recta tiramos de la barra mientras flexionamos los codos y los descendemos por los lados del cuerpo hasta que la barra llegue a la altura del esternón.', '1C347F7F69AA4A9A85AB4A715380C2DD.jpg', 'Espalda'),
(66, 'Polea trasnuca', 'Coge la barra en pronación con las manos muy separadas entre sí. Lleva la barra hasta la nuca. Al mismo tiempo dirige los codos hacia el tronco.', '1B9295442FB2ECA06A2C2486E729E51F.jpg', 'Espalda'),
(67, 'Polea al pecho con agarre cerrado', 'Sentado de cara al aparato, rodillas fijadas, inspirar y llevar el mango hasta el esternón ensanchando el pecho e inclinando ligeramente el tronco hacia atrás. Espirar al final del movimiento.', '7431C4DAF1749682F7FB46CA17891318.jpg', 'Lats Dorsales'),
(68, 'Remo horizontal a una mano con mancuerna', 'Tomando una mancuerna con una mano y apoyando la rodilla y la palma de la mano del lado opuesto sobre un banco plano. La espalda estará fija y el brazo que posee el peso debe quedar extendido por el lateral del cuerpo.', 'AFB7AB91903EF9ED460018F0E3719608.jpg', 'Espalda'),
(69, 'Remo horizontal con barra manos en pronación', 'De pie con las rodillas ligeramente flexionadas y el tronco inclinado formando con las piernas un ángulo de 45º. Con la espalda recta y la barra tomada en pronación, separamos las manos de la anchura de los hombros, y dejamos caer los brazos frente al torso.', 'D20D3A594A8F48B77949029A88AFDD0F.jpg', 'Espalda'),
(70, 'Remo barra t con apoyo al pecho', 'De pie, rodillas ligeramente flexionadas, barra pasando entre las piernas, espalda bien recta, tronco inclinado a 45º o apoyado ventralmente sobre el banco inclinado y llevar la barra, cogida en pronación, hasta el pecho.', '93C0DEA777A062A7517D86F3557D4857.jpg', 'Espalda'),
(71, 'Peso muerto piernas semirrígidas', 'Pies y manos colocados a la anchura de los hombros. Al bajar, la barra debe llegar hasta el suelo, para lo cual tendremos que flexionar las rodillas hasta llegar aproximadamente a los 90 grados. La cadera atrás y el pecho arriba son las dos indicaciones básicas de este ejercicio.', 'CF72DC5974E13B58AA812CD5EFB63004.jpg', 'Femoral'),
(72, 'Peso muerto estilo sumo', 'De pie de carra a la barra piernas ligeramente separadas punta de los pies hacia el exterior siempre en el eje de las rodillas. Flexionar las rodilla hasta que las rodillas alcance la horizontal, coger la barra con los brazos extendidos.', '3B166F81E30EAE01177C597F74671215.jpg', 'Aductores'),
(73, 'hiperextensiones', 'Apoyar el cuerpo sobre el banco en la articulación de la cadera y el fémur, ya que el pubis debe quedar fuera del banco. Desde allí tendremos que flexionar el torso hasta que nuestro cuerpo forme un ángulo de 90 grados. Las manos deben cruzarse delante del torso y mantenerse así durante todo el recorrido.', '12CFC2AA9CBA859B57FA18B980B52504.jpg', 'Gluteo'),
(74, 'Remo al cuello con manos juntas', 'Debemos colocarnos de pie con las piernas ligeramente separadas y la espalda bien recta. Con las palmas en pronación, debemos tomar una barra con ambas manos con una separación inferior al ancho de los hombros.', '7543D5A3A9ACFCDF76D335A940811A35.jpg', 'Trapecio'),
(75, 'Encogimientos de hombros con barra', 'Cogemos la barra con las manos en pronación, con una separación un poco superior a la anchura de los hombros; brazos relajados, espalda bien recta, abdominales contraídos. Y levantamos los hombros.', '142028DDEFD710A15CE32A5EB8553B97.jpg', 'Trapecio'),
(76, 'Encogimiento y rotacion de hombros con mancuernas', 'Debemos efectuar una rotación desde adelante hacia atrás (antero-posterior) del hombro mientras encogemos los mismos, para después volver a la posición inicial. ', '6DF72749AEBBB5DA151233F73B8BAB8B.jpg', 'Trapecio'),
(77, 'Elevaciones Laterales, En Banca ', 'Tumbado boca abajo en un banco, con los brazos por los costados del cuerpo. Realiza las aperturas hacia arriba y atrás con los brazos, aumentando la flexión de los codos al final del movimiento. Junta los omoplatos y tensa la musculatura de la espalda al final del movimiento.', '0D59B471FC870536615C1B9D7A8B9E00.jpg', 'Deltoides Posterior'),
(78, 'Encogimiento de hombros con máquina', 'De pie, de cara al aparato, coger la barra en pronación con las manos separadas una distancia un poco mayor a la anchura de los hombros, cabeza y espalda bien rectas, efectuar encogimientos de hombros.', '320FD355BC387F90940BAF3256654C33.jpg', 'Trapecio'),
(79, 'flexion de rodillas con mancuernas', 'De pie, con los pies ligeramente separados (la separación de los hombros o algo menos), mirada al frente y una mancuerna en cada mano.', '0750D4A413800C898C3DAD19ED2351FA.jpg', 'Cuádriceps'),
(80, 'El squat o sentadillas', 'Espalda recta, mientras los pies se separan del ancho de los hombros. La barra utilizada debe situarse justo encima de los trapecios. Sin curvar la espalda, debemos descender los glúteos flexionando la rodilla y la cadera, la rodilla no pase de la punta del pie ni sobrepase los 90 grados de flexión.', 'EDBA64824A310D9FF4C7A54A63AD69D9.jpg', 'Cuádriceps'),
(81, 'Squat o Sentadillas Frontales Con Barra', 'Colocando la barra por delante del cuerpo, tal y como la realizan los atletas de halterofilia.', 'B7BDDC7F5C1A97001E4E1F607A9847EE.jpg', 'Cuádriceps'),
(82, 'hammer hombro', 'El movimiento está totalmente delimitado por la máquina, que será la que nos guiará en todo momento.', '27D15B35538394BC0A5A861B947418C5.jpg', 'Hombro'),
(83, 'Squat o sentadillas piernas separadas', 'De pie, con las piernas separadas más allá del ancho de los hombros y las puntas de los pies mirando hacia afuera.', '9FD52F0910C0BD576235D03041C8DCEB.jpg', 'Aductores'),
(84, 'Prensa de piernas inclinada', 'Nos colocaremos con la espalda bien apoyada en el respaldo de la máquina llamada prensa inclinada a 45 grados y los pies sobre la plataforma que debemos empujar, medianamente separados entre sí.', '7222D58612287341C65BC2513493C424.jpg', 'Cuádriceps'),
(85, 'Curl de piernas alterno de pie en maquina', 'Con un pie apoyado en la plataforma de la máquina y el tobillo contrario ubicado bajo el cojín, apoyamos el muslo de la pierna flexionada en su respectivo soporte y realizamos una flexión de rodilla y elevamos el rodillo hacia el glúteo. ', '59FBB96DE2F73ED12B84B03CCBE61BBD.jpg', 'Femoral'),
(86, 'Curl de piernas sentado en máquina', 'Alinear el eje de rotación de la máquina con el eje de flexión de la rodilla. Posteriormente, nos sentaremos con la espalda completamente apoyada en el respaldar y pasaremos los tobillos por encima de los cojines.', 'D806DAD8FBDC291DAC346B9C89EDC961.jpg', 'Femoral'),
(87, 'Flexion del tronco al frente', 'De pie con los pies separados entre sí por la anchura de los hombros aproximadamente. Cogemos una barra con las manos y la llevamos por detrás de la cabeza para apoyarla sobre los trapecios o poco más abajo, entre el cuello y las escápulas.', '9C1315857AB8E0FB46C7077AA5741600.jpg', 'Gluteo'),
(88, 'Aductores en polea baja', 'De pie y de lado frente a una máquina de polea. sujetamos la polea al tobillo de la pierna inmediata a la máquina. Nos sujetamos con las manos para ayudarnos a conservar el equilibrio. Sin movilizar el torso, despegamos la pierna que sujeta el peso del suelo y la llevamos desde la máquina hacia el centro del cuerpo, por delante de la otra pierna que está apoyada en el suelo.', '1254EEF9AB975D84AAC4A9CFEB5C00DE.jpg', 'Aductores'),
(89, 'elevación de un talón con mancuerna', 'De pie, apoyado sólo sobre una pierna. La punta del pie que está apoyado, colócala sobre una cuña. Con la mano del lado del pie apoyado, coge una mancuerna. Con la otra mano coge algún soporte que te ayude a mantener el equilibrio.', '304C5A1821CEEBB532FE89A31817D7DB.jpg', 'Gemelos'),
(90, 'Extensión de talones sentado en maquina', 'Siéntate sobre la máquina y apoya la parte alta de los muslos sobre el asiento. La punta de los pies sobre la calza y los tobillos en flexión pasiva.', '835E1225AC2A4B2E68A6B7AFAFAD99AC.jpg', 'Gemelos'),
(91, 'Elevación de talones sentado con barra', 'Debemos sentarnos en una silla o banco y colocar la punta de los pies sobre una cuña para poder subir y bajar los talones. Las piernas flexionadas a 90 grados y sobre el muslo.', 'E4D526DCDC105773212C93747B504DE5.jpg', 'Gemelos'),
(92, 'aductores sentado en maquina', 'Debemos sentarnos en la máquina específica para su realización previa carga del peso a utilizar. Colocamos las piernas juntas y flexionadas y en la cara externa de las mismas, justo a la altura de las rodillas, deben quedar los cojines de la máquina.', '026C7C0282F4B6561D5D26DB505DED80.jpg', 'Gluteo'),
(93, 'Encogimientos abdominales con pies apoyados', 'En banco apoyar nuestras piernas, de manera que éstas queden a 90 grados, con el torso apoyado en el suelo y la cadera a 90 grados con los glúteos lo más cerca posible del banco. Colocamos las manos detrás de la cabeza o cruzadas delante del pecho.', 'DD625026997F635A754E9613A415F044.jpg', 'Abdominales'),
(94, 'Crunch abdominal sobre fitball', 'Apoyar nuestra espalda. Con los pies apoyados en el piso, las rodillas flexionadas a 90 grados y las manos detrás y a los lados de la cabeza. Con la espalda casi en su totalidad apoyada sobre el fitball excepto la cabeza y columna dorsal que deben estar levemente despegadas del objeto, ', '1273617C429ECF5341331C1F1994609E.jpg', 'Abdominales'),
(95, 'Puente lateral o estabilización lateral', 'De lado sobre el suelo, apoya el antebrazo y la mano del mismo lado en el mismo. Posiciona una pierna encima de la otra y despega el cuerpo del suelo de manera que sólo quede en contacto el pie y el antebrazo del mismo lado.', '58F778FAEB40081EAEA40E1848954584.jpg', 'Abdominales'),
(96, 'ElEvaciones de piernas extendidas en el suelo', 'en el suelo, con la espalda totalmente apoyada en el mismo. Posiciona las manos debajo de los glúteos y eleva las piernas extendidas de manera que queden perpendicular al cuerpo.', '8AEE215F03353E44F48C91620823AB88.jpg', 'Abdominales'),
(97, 'Oblicuos sobre fitball', 'Apóyate de lado sobre el fitball, extiende las piernas y apoya los pies de lado, uno detrás de otro sobre el suelo. Coloca las manos detrás y a los lados de la cabeza', '662780C92A269DBE5BDFE145522023A3.jpg', 'Abdominales'),
(98, 'Elevaciones de tronco en el suelo', 'El movimientos se realiza en superficies estables, y en lo posible, con la espalda siempre apoyada en el suelo.', '745E9FFB96C869F217CCBB91994EE6D2.jpg', 'Abdominales'),
(99, 'Escalador de montañas', 'En una posición de tabla con los brazos y las piernas largos. Pon tu rodilla derecha en tu pecho. Cambie rápidamente y tire de la rodilla izquierda hacia adentro. Continúa cambiando las rodillas.', '31EF491F623367C6024F8A7B3308D88F.jpg', 'Cardio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entreno`
--

CREATE TABLE IF NOT EXISTS `entreno` (
  `pk_entreno_id` int(10) NOT NULL,
  `nombreUsuario` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fechaHoraEntreno` datetime NOT NULL,
  `valor` decimal(10,0) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `entreno`
--

INSERT INTO `entreno` (`pk_entreno_id`, `nombreUsuario`, `fechaHoraEntreno`, `valor`) VALUES
(1, 'Cristian Jesus Nuñez Astudillo', '2018-09-22 18:44:49', '3000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE IF NOT EXISTS `evento` (
  `pk_evento_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `start` datetime NOT NULL,
  `color` varchar(255) NOT NULL,
  `textColor` varchar(255) NOT NULL,
  `end` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`pk_evento_id`, `title`, `descripcion`, `start`, `color`, `textColor`, `end`) VALUES
(1, 'Entregar Software', 'Gym Mr Olimpia', '2018-11-03 08:00:00', '#FF0F0', '#FFFFFF', '2018-11-03 13:00:00'),
(2, 'Fiesta de hallowen', 'Fista de los niños', '2018-10-31 16:00:00', '#ff8000', '#000000', '2018-10-31 22:00:00'),
(3, 'Día de la VELitas', 'Fiesta de la virgen', '2018-12-07 21:00:00', '#80ffff', '#000000', '2018-12-07 23:59:00'),
(4, 'Feliz Navidad', 'Nacimiento de jesus', '2018-12-25 00:00:00', '#ff0000', '#008000', '2018-12-25 23:59:00'),
(5, 'Año Nuevo', 'Bienvenido el año 2019', '2019-01-01 00:00:00', '#008040', '#ffff00', '2019-01-01 23:59:00'),
(6, 'Competencia Fisiculturismo', 'con jimmy', '2018-11-04 08:45:00', '#e77edb', '#000000', '2018-11-04 09:57:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE IF NOT EXISTS `instructor` (
  `pk_instructor_id` int(10) unsigned NOT NULL,
  `NOM_INST` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `APELL_INST` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IDENTIFICACION` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `FECHA_NAC_INST` date NOT NULL,
  `CORREO_INST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TEL_INST` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR_INST` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEXO_INST` enum('Masculino','Femenino') COLLATE utf8_unicode_ci NOT NULL,
  `LOGIN` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORDSEGURO` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tipoUsuarioPersonal` enum('Instructor','Administrador') COLLATE utf8_unicode_ci NOT NULL,
  `ESTADO` enum('Activo','Eliminado') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`pk_instructor_id`, `NOM_INST`, `APELL_INST`, `IDENTIFICACION`, `FECHA_NAC_INST`, `CORREO_INST`, `TEL_INST`, `DIR_INST`, `SEXO_INST`, `LOGIN`, `PASSWORD`, `PASSWORDSEGURO`, `tipoUsuarioPersonal`, `ESTADO`) VALUES
(1, 'Gildardo', 'Tenorio', '71121003', '1960-06-09', 'gildardo@gmail.com', '3117939110', '', 'Masculino', 'gtenorio123', '7412369', '', 'Instructor', 'Activo'),
(2, 'Andres', 'Riascos', '123321123', '1975-07-14', 'riascos123@gmail.com', '3217135012', '', 'Masculino', 'ariascos123', '7412369', '', 'Instructor', 'Activo'),
(3, 'Apollo', 'Creed', '0000000000', '2018-10-26', 'apollocreed@gmail.com', '0000000000', '', 'Masculino', 'acreed123', '1e7d6d330662236cf309e91d05695868', 'acreed123', 'Instructor', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE IF NOT EXISTS `medidas` (
  `pk_medida_id` int(10) unsigned NOT NULL,
  `ESTATURA` decimal(6,2) NOT NULL,
  `PESO` decimal(6,2) NOT NULL,
  `PECHO` decimal(6,2) NOT NULL,
  `BICEPS` decimal(6,2) NOT NULL,
  `HOMBRO` decimal(6,2) NOT NULL,
  `ANTEBRAZO` decimal(6,2) NOT NULL,
  `CINTURA` decimal(6,2) NOT NULL,
  `CADERA` decimal(6,2) NOT NULL,
  `PIERNA` decimal(6,2) NOT NULL,
  `piernaB` decimal(6,2) NOT NULL,
  `PANTORRILLA` decimal(6,2) NOT NULL,
  `IMC` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ponerPliegues` tinyint(1) NOT NULL,
  `tricipital` decimal(6,2) NOT NULL,
  `subescapular` decimal(6,2) NOT NULL,
  `supraliaco` decimal(6,2) NOT NULL,
  `plieAbdominal` decimal(6,2) NOT NULL,
  `cuadricipital` decimal(6,2) NOT NULL,
  `peroneal` decimal(6,2) NOT NULL,
  `porGrasa` decimal(6,2) NOT NULL,
  `PGC` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PGK` decimal(6,2) NOT NULL,
  `PMK` decimal(6,2) NOT NULL,
  `FECHA_MED_USU` date NOT NULL,
  `fk_usuario_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`pk_medida_id`, `ESTATURA`, `PESO`, `PECHO`, `BICEPS`, `HOMBRO`, `ANTEBRAZO`, `CINTURA`, `CADERA`, `PIERNA`, `piernaB`, `PANTORRILLA`, `IMC`, `ponerPliegues`, `tricipital`, `subescapular`, `supraliaco`, `plieAbdominal`, `cuadricipital`, `peroneal`, `porGrasa`, `PGC`, `PGK`, `PMK`, `FECHA_MED_USU`, `fk_usuario_id`) VALUES
(1, '1.60', '60.00', '90.00', '32.00', '100.00', '20.00', '75.00', '96.00', '58.00', '55.00', '36.00', 'Peso Normal', 1, '9.00', '14.00', '20.00', '19.00', '8.00', '7.00', '15.57', 'Excelente', '9.34', '50.66', '2016-06-22', 2),
(2, '1.75', '64.34', '90.00', '30.00', '110.00', '22.00', '74.00', '87.00', '52.00', '0.00', '33.00', 'Peso Normal', 1, '5.00', '10.00', '10.00', '14.00', '6.00', '6.00', '11.85', 'Atleta', '7.63', '56.71', '2016-06-22', 3),
(3, '1.70', '73.00', '110.00', '38.00', '120.00', '29.00', '82.00', '92.00', '57.00', '0.00', '36.00', 'Sobrepeso', 1, '7.00', '14.00', '16.00', '19.00', '8.00', '7.00', '10.53', 'Bueno', '7.68', '65.32', '2016-09-30', 1),
(9, '1.80', '80.00', '99.00', '38.00', '110.00', '25.00', '80.00', '92.00', '60.00', '0.00', '38.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2016-11-23', 5),
(20, '1.60', '80.00', '99.00', '30.00', '110.00', '26.00', '98.00', '99.00', '60.00', '0.00', '38.00', 'Obesidad Tipo 1', 1, '20.00', '50.00', '60.00', '65.00', '25.00', '18.00', '38.59', 'Sobrepeso', '30.88', '49.12', '2016-11-24', 8),
(21, '1.85', '75.00', '92.00', '34.00', '100.00', '23.00', '75.00', '85.00', '54.25', '0.00', '32.00', 'Peso Normal', 1, '6.00', '13.00', '15.00', '18.00', '6.00', '6.00', '9.85', '0', '0.00', '0.00', '2016-11-24', 9),
(22, '1.60', '75.00', '95.00', '34.00', '100.00', '23.00', '89.00', '90.00', '54.00', '0.00', '32.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2016-11-25', 4),
(23, '1.75', '65.00', '100.00', '38.00', '110.00', '25.00', '79.00', '90.00', '56.00', '0.00', '38.00', 'Peso Normal', 1, '5.00', '10.00', '13.00', '15.00', '5.00', '5.00', '10.62', '0', '0.00', '0.00', '2017-03-12', 3),
(24, '1.68', '65.00', '90.00', '23.00', '100.00', '20.00', '70.00', '85.00', '53.00', '0.00', '32.00', 'Peso Normal', 1, '5.00', '12.00', '14.00', '15.00', '6.00', '6.00', '9.27', '0', '0.00', '0.00', '2017-03-13', 10),
(25, '1.60', '70.00', '100.00', '35.00', '100.00', '22.00', '80.00', '90.00', '56.00', '0.00', '35.00', 'Sobrepeso', 1, '8.00', '15.00', '17.00', '20.00', '8.00', '8.00', '13.08', '0', '0.00', '0.00', '2017-03-13', 4),
(26, '1.85', '85.00', '100.00', '35.00', '100.00', '23.00', '85.00', '90.00', '55.00', '0.00', '35.00', 'Peso Normal', 1, '8.00', '15.00', '17.00', '20.00', '8.00', '8.00', '13.08', '0', '0.00', '0.00', '2017-03-13', 6),
(27, '1.90', '50.00', '70.00', '20.00', '90.00', '18.00', '40.00', '60.00', '30.00', '0.00', '20.00', 'Desnutrido', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 11),
(28, '1.67', '70.00', '103.50', '37.50', '118.50', '27.00', '82.00', '95.00', '56.70', '0.00', '38.20', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 12),
(29, '1.59', '53.00', '87.00', '27.20', '96.40', '22.00', '69.20', '91.70', '53.00', '0.00', '33.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 13),
(30, '1.75', '64.00', '92.00', '29.00', '111.00', '24.00', '74.50', '89.00', '55.00', '0.00', '33.70', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 14),
(31, '1.70', '61.00', '94.00', '29.00', '107.00', '25.00', '73.00', '89.00', '47.50', '0.00', '34.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 15),
(32, '1.56', '50.00', '83.20', '24.70', '95.80', '22.70', '69.00', '90.00', '51.00', '0.00', '31.90', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 16),
(33, '1.77', '79.00', '100.00', '36.00', '116.00', '29.00', '84.00', '98.00', '60.00', '0.00', '39.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 17),
(34, '1.70', '75.00', '111.00', '38.90', '118.00', '28.10', '85.00', '96.00', '54.00', '0.00', '36.50', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 18),
(35, '1.72', '76.00', '104.00', '39.00', '116.00', '28.00', '86.00', '101.00', '60.00', '0.00', '36.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 19),
(36, '1.75', '78.00', '109.00', '38.50', '121.00', '28.50', '88.00', '100.00', '59.00', '0.00', '37.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 20),
(37, '1.55', '74.00', '103.50', '31.00', '106.50', '25.00', '94.00', '111.00', '62.50', '0.00', '40.20', 'Obesidad Tipo 1', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-08', 21),
(38, '1.63', '73.00', '103.50', '36.50', '121.30', '27.70', '89.00', '101.00', '58.50', '0.00', '38.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-15', 22),
(39, '1.65', '68.00', '97.00', '35.50', '120.00', '29.00', '83.00', '94.50', '49.50', '0.00', '36.50', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-15', 23),
(40, '1.56', '74.00', '106.50', '32.00', '103.00', '27.50', '95.00', '106.00', '63.00', '0.00', '38.00', 'Obesidad Tipo 1', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-15', 24),
(41, '1.73', '79.00', '103.20', '36.00', '117.50', '27.90', '103.20', '103.00', '58.00', '0.00', '38.20', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-15', 25),
(42, '1.68', '78.00', '106.80', '37.00', '121.00', '28.00', '95.00', '100.00', '57.00', '0.00', '35.20', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-15', 26),
(43, '1.72', '76.00', '101.50', '36.50', '125.50', '28.20', '82.90', '102.00', '62.00', '0.00', '36.40', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-15', 27),
(44, '1.60', '77.00', '103.00', '36.10', '109.00', '27.00', '93.00', '117.00', '66.00', '0.00', '39.50', 'Obesidad Tipo 1', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 28),
(45, '1.60', '54.00', '91.70', '25.00', '99.00', '22.90', '74.50', '91.20', '52.70', '0.00', '33.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 30),
(46, '1.75', '70.00', '96.50', '36.00', '118.20', '31.00', '72.00', '97.00', '56.00', '0.00', '37.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 31),
(47, '1.77', '94.00', '111.00', '40.00', '120.00', '34.00', '110.00', '100.00', '57.00', '0.00', '38.00', 'Obesidad Tipo 1', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 32),
(48, '1.63', '62.00', '95.50', '31.50', '113.20', '28.00', '82.00', '93.00', '54.00', '0.00', '34.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 33),
(49, '1.64', '54.00', '85.00', '27.00', '96.50', '24.00', '72.50', '93.50', '58.00', '0.00', '32.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 34),
(50, '1.72', '88.00', '107.00', '39.50', '126.50', '30.20', '97.00', '105.00', '59.20', '0.00', '38.50', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 35),
(51, '1.82', '84.00', '105.50', '38.20', '123.20', '28.50', '93.00', '111.00', '61.00', '0.00', '37.70', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-19', 36),
(52, '1.60', '74.00', '107.00', '31.30', '112.00', '26.00', '91.50', '110.00', '60.00', '0.00', '39.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 37),
(53, '1.76', '65.00', '89.60', '34.00', '109.00', '28.50', '80.50', '95.00', '54.50', '0.00', '33.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 38),
(54, '1.70', '57.00', '85.00', '29.50', '102.20', '24.00', '76.50', '88.00', '47.00', '0.00', '31.50', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 39),
(55, '1.65', '59.00', '92.00', '31.00', '106.50', '24.50', '74.40', '91.90', '51.00', '0.00', '32.50', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 40),
(56, '1.74', '56.00', '81.00', '28.00', '103.50', '24.00', '73.00', '89.00', '50.00', '0.00', '31.70', 'Bajo De Peso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 41),
(57, '1.68', '60.00', '91.00', '32.00', '110.00', '24.70', '82.00', '92.00', '54.00', '0.00', '33.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 42),
(58, '1.80', '75.00', '92.00', '33.00', '110.00', '26.60', '86.00', '106.00', '55.00', '0.00', '36.50', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 43),
(59, '1.56', '65.00', '99.00', '28.50', '106.50', '24.00', '81.00', '107.50', '65.00', '0.00', '37.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 44),
(60, '1.66', '75.00', '102.30', '30.90', '98.00', '26.50', '89.00', '111.00', '63.50', '0.00', '40.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 45),
(61, '1.65', '48.00', '81.00', '27.20', '97.50', '23.50', '68.00', '84.50', '48.00', '0.00', '32.00', 'Bajo De Peso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 46),
(62, '1.66', '50.00', '83.00', '26.00', '96.00', '22.50', '68.00', '84.00', '46.00', '0.00', '31.00', 'Bajo De Peso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 47),
(63, '1.80', '88.00', '108.50', '32.00', '114.00', '27.00', '101.00', '105.50', '53.50', '0.00', '39.00', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 48),
(64, '1.59', '68.00', '103.50', '36.00', '118.50', '27.90', '89.90', '94.00', '54.00', '0.00', '33.20', 'Sobrepeso', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 25),
(65, '1.74', '66.00', '95.50', '32.00', '111.40', '26.40', '77.00', '94.00', '54.20', '0.00', '33.40', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 14),
(66, '1.67', '85.00', '105.00', '34.50', '116.00', '28.00', '101.50', '110.00', '61.50', '0.00', '42.00', 'Obesidad Tipo 1', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 51),
(67, '1.55', '56.00', '84.50', '33.00', '97.00', '26.20', '72.00', '96.20', '56.20', '0.00', '35.50', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 52),
(68, '1.55', '60.00', '98.00', '27.50', '98.00', '25.00', '80.00', '97.00', '55.50', '0.00', '36.00', 'Peso Normal', 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '2017-05-20', 53),
(69, '1.88', '80.00', '120.00', '42.00', '130.00', '30.00', '80.00', '95.00', '65.00', '0.00', '45.00', 'Peso Normal', 1, '7.00', '14.00', '16.00', '18.00', '9.00', '7.00', '10.53', 'Excelente', '8.42', '71.58', '2017-06-13', 54),
(70, '1.70', '68.00', '100.00', '36.00', '110.00', '28.00', '70.00', '90.00', '56.00', '0.00', '34.00', 'Peso Normal', 1, '7.00', '14.00', '17.00', '8.00', '10.00', '7.00', '9.75', 'Excelente', '6.63', '61.37', '2018-03-14', 58),
(71, '1.60', '65.00', '100.00', '28.00', '110.00', '20.00', '70.00', '98.00', '60.00', '56.00', '34.00', 'Sobrepeso', 1, '7.00', '14.00', '16.00', '18.00', '20.00', '10.00', '16.72', 'Excelente', '10.86', '54.14', '2018-07-02', 2),
(72, '1.60', '65.00', '100.00', '30.00', '110.00', '28.00', '78.00', '100.00', '60.00', '57.00', '38.00', 'Sobrepeso', 1, '20.00', '20.00', '20.00', '20.00', '20.00', '20.00', '21.72', 'Bueno', '14.12', '50.88', '2018-08-14', 2),
(73, '1.69', '80.00', '120.00', '40.00', '130.00', '28.00', '90.00', '90.00', '60.00', '0.00', '40.00', 'Sobrepeso', 1, '20.00', '20.00', '20.00', '20.00', '20.00', '20.00', '15.28', 'Bueno', '12.22', '67.78', '2018-09-05', 7),
(74, '1.70', '69.00', '98.00', '34.00', '108.00', '23.00', '75.00', '85.00', '54.00', '0.00', '34.00', 'Peso Normal', 1, '7.00', '14.00', '20.00', '30.00', '15.00', '10.00', '12.95', 'Bueno', '8.94', '60.06', '2018-10-17', 59),
(75, '1.70', '70.00', '100.00', '35.00', '110.00', '28.00', '78.00', '90.00', '54.00', '0.00', '34.00', 'Peso Normal', 2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '11.90', 'Bueno', '8.33', '61.67', '2018-10-30', 1),
(76, '1.75', '72.00', '100.00', '38.00', '110.00', '28.00', '70.00', '90.00', '60.00', '0.00', '40.00', 'Peso Normal', 2, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '4.00', 'Atleta', '2.88', '69.12', '2018-10-31', 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensualidad`
--

CREATE TABLE IF NOT EXISTS `mensualidad` (
  `pk_mensualidad_id` int(11) unsigned NOT NULL,
  `FECHA_MENS` date NOT NULL,
  `FECHA_MENS_FIN` date NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `fechaUltPreaviso` datetime NOT NULL,
  `fk_usuario_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensualidad`
--

INSERT INTO `mensualidad` (`pk_mensualidad_id`, `FECHA_MENS`, `FECHA_MENS_FIN`, `valor`, `fechaUltPreaviso`, `fk_usuario_id`) VALUES
(1, '2019-09-22', '2019-10-22', '35000', '0000-00-00 00:00:00', 2),
(3, '2019-09-22', '2019-10-22', '35000', '0000-00-00 00:00:00', 8),
(4, '2019-09-22', '2019-10-22', '35000', '0000-00-00 00:00:00', 59),
(5, '2020-01-11', '2020-02-11', '30000', '0000-00-00 00:00:00', 4);

--
-- Disparadores `mensualidad`
--
DELIMITER $$
CREATE TRIGGER `reporteMensualidad` AFTER INSERT ON `mensualidad`
 FOR EACH ROW INSERT INTO reportemensualidad SET
reportemensualidad.fk_mensualidad_id =
NEW.pk_mensualidad_id,
reportemensualidad.fechaReporte = NEW.FECHA_MENS,
reportemensualidad.fechaFinReporte = NEW.FECHA_MENS_FIN,
reportemensualidad.valorReporte = NEW.valor
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reporteUpdate` AFTER UPDATE ON `mensualidad`
 FOR EACH ROW IF(NEW.fechaUltPreaviso != OLD.fechaUltPreaviso) THEN
INSERT INTO reportemensualidad SET
reportemensualidad.fk_mensualidad_id =
NEW.pk_mensualidad_id,
reportemensualidad.fechaReporte = NEW.FECHA_MENS,
reportemensualidad.fechaFinReporte = NEW.FECHA_MENS_FIN,
reportemensualidad.valorReporte = 0;

ELSE

INSERT INTO reportemensualidad SET
reportemensualidad.fk_mensualidad_id =
NEW.pk_mensualidad_id,
reportemensualidad.fechaReporte = NEW.FECHA_MENS,
reportemensualidad.fechaFinReporte = NEW.FECHA_MENS_FIN,
reportemensualidad.valorReporte = NEW.valor;

END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proballuvia`
--

CREATE TABLE IF NOT EXISTS `proballuvia` (
  `pk_proballuvia_id` int(11) NOT NULL,
  `dias` int(11) NOT NULL,
  `lluviosos` int(11) NOT NULL,
  `probabilidad` varchar(256) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proballuvia`
--

INSERT INTO `proballuvia` (`pk_proballuvia_id`, `dias`, `lluviosos`, `probabilidad`) VALUES
(1, 5, 5, 'Alta'),
(2, 8, 6, 'Alta'),
(3, 10, 5, 'Alta'),
(4, 20, 3, 'Media'),
(5, 20, 7, 'Media'),
(6, 25, 4, 'Media'),
(7, 40, 2, 'Baja'),
(8, 40, 5, 'Baja'),
(9, 45, 1, 'Baja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `pk_producto_id` int(10) unsigned NOT NULL,
  `codigoBarras` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nombreProducto` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int(10) NOT NULL,
  `precioCosto` decimal(10,0) NOT NULL,
  `precioVenta` decimal(10,0) NOT NULL,
  `fechaadquisicion` date NOT NULL,
  `proveedor` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `numfactura` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `estado` enum('Activo','Eliminado') COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fechahorareg` datetime NOT NULL,
  `fechahoramod` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`pk_producto_id`, `codigoBarras`, `nombreProducto`, `descripcion`, `cantidad`, `precioCosto`, `precioVenta`, `fechaadquisicion`, `proveedor`, `numfactura`, `estado`, `imagen`, `fechahorareg`, `fechahoramod`) VALUES
(1, '7702090044294', 'Agua Cristal', '300ml', 200, '300', '1000', '2018-09-23', 'Jumbo', '0000000000', 'Activo', '4FC70223EA8B49CA64A3A04C351EF83A.jpg', '2018-09-23 18:19:09', '2020-05-22 20:56:02'),
(2, '7702192224051', 'Gatorade maracuyá', 'Bebida isotónica 500ml', 200, '2100', '3000', '2018-09-23', 'Jumbo', '0000000000', 'Activo', 'sin_foto.png', '2018-09-23 18:28:34', '2020-05-22 20:55:40'),
(3, '1234567890', 'Proteina Megaplex Creatine Power', '10 Libras', 10, '75000', '115000', '2018-09-24', 'Body Evolution ', '0000000000', 'Activo', 'sin_foto.png', '2018-09-23 21:43:30', '2020-05-22 20:55:24'),
(4, '0987654321', 'Acetyl L Carnitina Dymatize Quemador', ' 90 Capsulas ', 40, '29000', '49000', '2018-09-24', 'Body Evolution ', '0000000000', 'Activo', 'sin_foto.png', '2018-09-23 21:46:14', '0000-00-00 00:00:00'),
(5, '7702914114004', 'ChocoRamo', '70g', 200, '800', '3000', '2020-05-21', 'Jumbo', '1472583690', 'Activo', '437A21B00415E3AB40DD1515A609522E.png', '2020-05-21 19:38:40', '2020-05-22 20:55:00'),
(6, '7702025113217', 'Galleta Tipo Leche', 'noel', 37, '200', '500', '2020-05-22', 'Jumbo', '3737', 'Activo', '7BED3040B60473BB91B93FBA35F35871.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportemensualidad`
--

CREATE TABLE IF NOT EXISTS `reportemensualidad` (
  `pk_reporte_id` int(10) unsigned NOT NULL,
  `fechaReporte` date NOT NULL,
  `fechaFinReporte` date NOT NULL,
  `valorReporte` decimal(10,0) NOT NULL,
  `fk_mensualidad_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reportemensualidad`
--

INSERT INTO `reportemensualidad` (`pk_reporte_id`, `fechaReporte`, `fechaFinReporte`, `valorReporte`, `fk_mensualidad_id`) VALUES
(1, '2018-09-11', '2018-10-11', '35000', 1),
(3, '2018-09-05', '2018-10-05', '35000', 3),
(4, '2018-10-05', '2018-11-05', '35000', 3),
(6, '2018-10-11', '2018-11-11', '35000', 1),
(7, '2018-10-17', '2018-11-17', '35000', 4),
(8, '2018-10-05', '2018-11-05', '0', 3),
(9, '2018-10-05', '2018-11-05', '0', 3),
(10, '2019-02-11', '2019-03-11', '35000', 3),
(11, '2019-02-11', '2019-03-11', '0', 3),
(12, '2019-02-11', '2019-03-11', '0', 3),
(13, '2019-02-11', '2019-03-11', '0', 3),
(14, '2019-09-22', '2018-10-22', '35000', 4),
(15, '2019-09-22', '2019-10-22', '35000', 4),
(16, '2019-09-23', '2019-10-23', '18500', 5),
(17, '2019-09-23', '2019-10-23', '30000', 5),
(18, '2019-09-21', '2019-10-21', '30000', 5),
(19, '2019-09-22', '2019-10-22', '35000', 3),
(20, '2019-09-22', '2019-10-22', '35000', 1),
(21, '2019-10-20', '2019-11-20', '30000', 5),
(22, '2020-01-13', '2020-02-13', '30000', 5),
(23, '2019-12-12', '2020-01-12', '30000', 5),
(24, '2020-01-11', '2020-02-11', '30000', 5),
(25, '2019-09-22', '2019-10-22', '0', 3),
(26, '2019-09-22', '2019-10-22', '0', 3),
(27, '2019-09-22', '2019-10-22', '0', 3),
(28, '2019-09-22', '2019-10-22', '0', 3),
(29, '2019-09-22', '2019-10-22', '0', 3),
(30, '2019-09-22', '2019-10-22', '0', 3),
(31, '2019-09-22', '2019-10-22', '0', 3),
(32, '2019-09-22', '2019-10-22', '0', 3),
(33, '2019-09-22', '2019-10-22', '0', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE IF NOT EXISTS `rutinas` (
  `pk_rutina_id` int(10) unsigned NOT NULL,
  `DESCRIP_RUTINA` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fechaRutina` datetime NOT NULL,
  `fk_instructor_id` int(10) unsigned NOT NULL,
  `fk_usuario_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`pk_rutina_id`, `DESCRIP_RUTINA`, `fechaRutina`, `fk_instructor_id`, `fk_usuario_id`) VALUES
(1, 'Rutina Para Tonificar', '2018-09-24 12:43:48', 1, 2),
(2, 'Rutina para volumen', '2018-09-24 12:52:32', 1, 58),
(3, 'Rutina Para Ganar Masa Muscular', '2018-10-17 12:21:59', 2, 59),
(4, 'Rutina PAra ganar masa muscular A1', '2020-02-16 22:53:19', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas_ejercicios`
--

CREATE TABLE IF NOT EXISTS `rutinas_ejercicios` (
  `pk_rutina_id` int(10) unsigned NOT NULL,
  `pk_ejercicio_id` int(10) unsigned NOT NULL,
  `DIAS` set('Lun','Mar','Mie','Jue','Vie','Sab','Dom') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `REPETICION` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ordenEjercicio` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutinas_ejercicios`
--

INSERT INTO `rutinas_ejercicios` (`pk_rutina_id`, `pk_ejercicio_id`, `DIAS`, `REPETICION`, `ordenEjercicio`) VALUES
(1, 1, 'Lun,Jue', '20x15x10x5', 1),
(1, 2, 'Lun,Jue', '4x10', 2),
(1, 3, 'Lun,Jue', '4x10', 4),
(1, 5, 'Mar,Vie', '3x15', 1),
(1, 8, 'Lun,Jue', '4x15', 5),
(1, 9, 'Mar,Vie', '4x10', 1),
(1, 19, 'Mar,Vie', '4x10', 2),
(1, 20, 'Mar,Vie', '3x10', 5),
(1, 40, 'Lun,Mar,Mie,Jue,Vie', '15 Minutos', 1),
(1, 73, 'Mar,Vie', '3x15', 3),
(1, 84, 'Lun,Jue', '3x15', 3),
(1, 92, 'Mar,Vie', '3x15', 4),
(1, 93, 'Lun,Mie,Vie', '4x20', 2),
(2, 1, 'Mar,Vie', '4x10', 1),
(3, 1, 'Mar,Vie', '4x10', 1),
(3, 2, 'Mar,Vie', '3x15', 2),
(3, 3, 'Mar,Vie', '3x15', 5),
(3, 4, 'Lun', '1', 1),
(3, 5, 'Lun', '1', 1),
(3, 6, 'Lun', '1', 1),
(3, 7, 'Lun', '1', 1),
(3, 8, 'Lun', '4x15', 5),
(3, 9, 'Lun,Sab', '1', 1),
(3, 10, 'Mie', '1', 1),
(3, 11, 'Jue', '4x15', 4),
(3, 12, 'Mar,Sab', '1', 1),
(3, 13, 'Lun,Sab', '1', 1),
(3, 14, 'Lun', '4x10', 2),
(3, 15, 'Mie,Sab', '1', 1),
(3, 16, 'Mar', '1', 1),
(3, 17, 'Dom', '1', 1),
(3, 18, 'Lun', '1', 1),
(3, 19, 'Mar,Vie', '4x10', 4),
(3, 20, 'Mie', '1', 1),
(3, 21, 'Mie,Dom', '1', 1),
(3, 22, 'Mie,Vie', '1', 1),
(3, 23, 'Dom', '1', 1),
(3, 24, 'Dom', '1', 1),
(3, 25, 'Lun', '1', 1),
(3, 26, 'Lun', '1', 1),
(3, 27, 'Lun,Vie', '1', 1),
(3, 28, 'Lun', '1', 1),
(3, 29, 'Mar,Vie', '1', 1),
(3, 30, 'Dom', '1', 1),
(3, 31, 'Lun', '1', 1),
(3, 32, 'Mie,Dom', '1', 1),
(3, 33, 'Lun,Sab', '1', 1),
(3, 34, 'Dom', '1', 1),
(3, 35, 'Mie,Dom', '1', 1),
(3, 36, 'Vie', '1', 1),
(3, 37, 'Jue,Dom', '1', 1),
(3, 38, 'Jue', '4x15', 5),
(3, 39, 'Lun,Mie,Vie', '4x25', 1),
(3, 40, 'Lun,Mar,Mie,Jue,Vie', '15 minutos', 1),
(3, 41, 'Lun,Dom', '1', 1),
(3, 51, 'Lun', '3x15', 3),
(3, 65, 'Jue', '4x10', 1),
(3, 68, 'Jue', '4x10', 3),
(3, 70, 'Jue', '3x15', 2),
(3, 78, 'Lun', '4x10', 4),
(3, 82, 'Lun', '4x10', 1),
(3, 85, 'Mar,Vie', '4x10', 6),
(3, 90, 'Lun', '3x15', 6),
(4, 8, 'Lun', '4x10', 1),
(4, 40, 'Lun,Mar,Mie,Jue,Vie', '15 Minutos', 1),
(4, 51, 'Lun', '4x10', 2),
(4, 75, 'Lun', '4x10', 5),
(4, 78, 'Lun', 'Piramide', 3),
(4, 82, 'Lun', '4x10', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `pk_usuario_id` int(10) unsigned NOT NULL,
  `NOM_USU` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `APELL_USU` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `IDENTIFICACION` varchar(20) NOT NULL,
  `FECHA_NAC_USU` date NOT NULL,
  `ocupacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `CORREO_USU` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TEL_USU` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `DIR_USU` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `LOGIN` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORDSEGURO` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ESTADO` enum('Activo','Eliminado') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TIPO_USUARIO` enum('Administrador','Cliente','Asistencia') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SEXO` enum('Masculino','Femenino') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `condicionFisica` enum('Normal','Deportista','Sedentaria') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `OBJETIVOS` enum('Bajar de peso','Ganar masa muscular','Tonificar el musculo','Mejorar la condición fisica','Terapia') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `rutaFotoPerfil` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`pk_usuario_id`, `NOM_USU`, `APELL_USU`, `IDENTIFICACION`, `FECHA_NAC_USU`, `ocupacion`, `CORREO_USU`, `TEL_USU`, `DIR_USU`, `LOGIN`, `PASSWORD`, `PASSWORDSEGURO`, `ESTADO`, `TIPO_USUARIO`, `SEXO`, `condicionFisica`, `OBJETIVOS`, `rutaFotoPerfil`) VALUES
(1, 'Jimmy Andrés', 'Núñez Astudillo', '1061730370', '1990-07-10', 'Estudiante', 'jimmy-9010@hotmail.com', '3206048323', 'Car 20A # 2-14 B/Pandiguando   ', 'Administrador', '7dddedc0548c617cfe6a9662b48607cb', '1061730370', 'Activo', 'Administrador', 'Masculino', 'Deportista', 'Ganar masa muscular', 'jn90.jpg'),
(2, 'Beatriz Eugenia ', 'Cucuñame Valencia ', '25279114', '1979-02-19', 'Auxiliar de enfermeria', 'beatrizeu2006@gmail.com', '3166168147', 'Manzana 13-7 B/Tomas Cipriano', '25279114', 'cd4eeb3742af62b49ca7e372e1871ea2', '25279114', 'Activo', 'Cliente', 'Femenino', 'Deportista', 'Tonificar el musculo', 'B49BF64B6D9636EF79F2AA0757D0F40A.jpg'),
(3, 'Edwin', 'Erazo Mozquera', '10297849', '1984-05-12', 'Ingeniero de sistemas', 'mail@correo.com', '320', 'Abajo Del Puente', 'eerazo', '0adeaddd67ab342cd65f2f3dd35934a1', '7412369', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(4, 'José Gilberto', 'Núñez Serrano ', '13440392', '1956-07-20', 'Pensionado', 'jognuse@hotmail.com', '3105059015', 'Car20A #2-14 B/Pandiguando', 'jognuse', 'e1b533fe0d6e22da51a9ac024ac84c34', '13440392', 'Activo', 'Cliente', 'Masculino', 'Sedentaria', 'Bajar de peso', '91816899B3DB8616347394E8628195EE.jpg'),
(5, 'Oscar Adrian', 'Ramirez Ramirez', '23456767', '1984-12-11', 'Estudiante', 'oaramirez@misena.com', '3205674534', 'adasf', 'oaramirez', '0adeaddd67ab342cd65f2f3dd35934a1', '7412369', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Bajar de peso', 'perfilHombre.png'),
(6, 'Rodrigo Alberto', 'Ojeda Hurtado ', '12789234', '1969-11-27', 'Estudiante', 'rodrigo@hotmail.es', '3214567890', 'Carr', 'rojeda', '0adeaddd67ab342cd65f2f3dd35934a1', '7412369', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(7, 'José Iván', 'Núñez Astudillo', '1061744911', '1992-01-21', 'Asesor comercial', 'ivancho909@hotmail.com', '3128778526', 'Car 20A #2-14 B/Pandiguando', 'ivancho', '607719368ef4b5d6ba298a7970cd4f4b', '1061744911', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Tonificar el musculo', '98139C66C99ED7018A3B912105509906.jpg'),
(8, 'Rubiela ', 'Astudillo Espinosa', '34550334', '1960-07-18', 'Ama de casa', 'rubiela600718@gmail.com', '3206053503', 'Car20A #2-14 B/Pandiguando', 'RAstudillo34', 'd90a7ac000efccba97606c1b4427595e', '34550334', 'Activo', 'Cliente', 'Femenino', 'Sedentaria', 'Bajar de peso', '7C74668F0474E06AA6B3BD3B324E17FD.jpg'),
(9, 'Pepito', 'Perez', '000000000', '1992-11-24', 'Estudiante', 'pepito@gmail.com', '3000000000', 'Car 00 #00-00 B/Barrio', 'pepe123', 'ac1776f4ff12efe60a9664e2fd722ad5', 'pepe123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(10, 'Cristian Jesus', 'Núñez Astudillo', '1061790706', '1996-05-27', 'Estudiante', 'cjnacris@gmail.com', '3216547878', 'Car 20A #2-14 B/Pandiguando', '1061790706', 'd8de79841a5126bed9e93fc067b0b054', '1061790706', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', '0247D4893CA797F76B7BC1F1300E3A9B.jpg'),
(11, 'Nadie', 'Ninguno', '1061000000', '2017-05-08', 'flaco', 'flaco@gmail.com', '3000000000', 'cielo', 'flaco123', '4982eeda63714755e8aa5e8705212e0b', '123', 'Activo', 'Cliente', 'Masculino', 'Sedentaria', 'Ganar masa muscular', 'perfilHombre.png'),
(12, 'Gildardo ', 'Tenorio', '123321', '1969-05-08', 'Instructor', 'gil@gmail.com', '32123', '123bb', 'gildardo123', 'fcda22db910dbe20a2783c69140ab91c', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(13, 'Astrid', 'Ibarra', '123321', '1992-03-02', 'Estudiante', 'ibarra@gmail.com', '123321', '123321', 'ibarra123', 'a9f20c418673e526ecb5426ea4e67cb4', '123', 'Activo', 'Cliente', 'Femenino', 'Deportista', 'Tonificar el musculo', 'perfilMujer.png'),
(14, 'Kevin', 'Chamarro', '123321', '2000-06-05', 'Estudiante', 'kevin@gmail.com', '123321', '123321', 'kevin123', '5c22f84041c292d65459c17beccea677', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(15, 'Harol', 'Perez', '12321', '2001-03-30', 'estudiante', 'harol@gmail.com', '123321', '123321', 'harol123', 'dcf55ab407fd8e761f65f9dab28e3386', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Mejorar la condición fisica', 'perfilHombre.png'),
(16, 'Ana Barrera', 'Hidalgo', '123321', '2000-03-08', 'estudiante', 'ana@gmail.com', '123321', '123321', 'ana123', 'e3d2959afaa53817d3b39448656b3aa4', '123', 'Activo', 'Cliente', 'Femenino', 'Normal', 'Ganar masa muscular', 'perfilMujer.png'),
(17, 'Nilson', 'Cabanilla', '123321', '1994-09-03', 'policia', 'nilson@gmail.com', '123321', '123321', 'nilson123', '0b3b3ebec8a1388a39369d2dbcb8e4b2', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(18, 'luis ', 'Arrebalo', '123321', '1970-12-12', 'Comerciante', 'luis@gmail.com', '30123', '123321', 'luis123', 'f41ab22d32c67ff3d17fa6ad7f95994c', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(19, 'William', 'Orrego', '1123321', '1994-05-05', 'bombero', 'william@gmail.com', '113321', '123321', 'williamorrego123', '57609484c5eafd14af6fbd03879ec3cc', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(20, 'Andres ', 'Basante', '123321', '1992-05-12', 'Medico', 'andres@gmail.com', '321456', '123456', 'andresbasante123', '1921fb12675f81fece978135d81f1837', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(21, 'Isleny', 'Monsalbe', '1236554', '1995-02-02', 'ama de casa', 'isleny@gmail.com', '321456', '123456', 'islenymonsalbe123', '68b504fffebf4e922aba0a5a8a712983', '123', 'Activo', 'Cliente', 'Femenino', 'Sedentaria', 'Bajar de peso', 'perfilMujer.png'),
(22, 'Andres', 'Riascos', '123321', '1978-09-03', 'Instructor', 'andres@gmail.com', '3213213232', '123321', 'andresriascos123', '8934e30d9726760dae27cf543d461f08', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Bajar de peso', 'perfilHombre.png'),
(23, 'Daniel ', 'Martinez', '123321123', '1955-03-20', 'Profesor', 'danielMar@gmail.com', '123321', '123321', 'danielmartinez123', '62e4b96302beb20f5f7163864accd313', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(24, 'Maricel', 'Alvaran', '123321123', '1978-07-02', 'Ama de casa', 'maricel@hotmail.com', '321456987', '123654', 'maricelAlvaran123', 'd9a744f937f3d0806b9d523338300d38', '123', 'Activo', 'Cliente', 'Femenino', 'Normal', 'Bajar de peso', 'perfilMujer.png'),
(25, 'Antonio', 'Silva', '123321123', '1969-10-20', 'Profesor', 'antonio@gmail.com', '3214456987', '321456987', 'antoniosilva123', 'e6dbe596dbcb52115fd698a7b6b13580', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(26, 'Alex', 'falta', '123654', '1982-01-20', 'Auxiliar de enfermeria', 'alex@gmail.com', '321456987', '123654', 'alexfalta123', 'f076e38dfe0ba8b71087d92387c08ade', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Bajar de peso', 'perfilHombre.png'),
(27, 'Gabriel', 'Muñoz', '123456789', '1983-10-20', 'Instructor de gym', 'gabriel@gmail.com', '321456987', '3214569787', 'gabrielmuñoz123', 'e98e1389b2412b9ef0762066528df6a1', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(28, 'Johana ', 'Gomez', '1061791123', '1996-06-03', 'Estudiante', 'Jhoana@gmail.com', '312131', 'bhchchh', 'johana123', '2797a1db28baf2c9c3f94ed18b425470', '123', 'Activo', 'Cliente', 'Femenino', 'Sedentaria', 'Bajar de peso', 'perfilMujer.png'),
(30, 'Lizbet Juliana', 'Gomez', '1061123123', '1999-10-29', 'Estudiante', 'LizbetJuliana@gmail.com', '312876678', 'car1233', 'lisbetjuliana123', '3849878d3e7c43aeba35f9193263f9e5', '123', 'Activo', 'Cliente', 'Femenino', 'Normal', 'Ganar masa muscular', 'perfilMujer.png'),
(31, 'Jesus Antonio', 'Hurtado Montaño', '1234567', '1993-03-08', 'Barberia', 'jesus@gmail.com', '32183636', 'vhbdnjdjdj', 'jesusantonio123', '31b8f3cb3a9f9bed2a3bc507e581aeca', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(32, 'Libardo Antonio', 'Palacios', '1234567', '1974-12-01', 'metologo del depoprte', 'libardoTenorio@xn--gmail-sta.com', '32154567', 'callr5262626', 'libartoantonio123', '352f06d2c086193b38f007f296e5f6f1', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Mejorar la condición fisica', 'perfilHombre.png'),
(33, 'Milton cesar', 'Garzon', '123455', '1977-07-30', 'Independiente', 'milton@gmail.com', '131313413', 'yhsgfhadbhj', 'miltoncesar123', 'b4c232c13119672c2735408cfa2c6940', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(34, 'Liseth Fernanda', 'Montaño Obando', '121314156788', '1995-11-13', 'Estudiante', 'li@gmail.comn', '43436537387', 'call5657yu', 'lisethfernandez123', '4142f9478b1cc0d0a9aa7459ef8fa192', '123', 'Activo', 'Cliente', 'Femenino', 'Deportista', 'Ganar masa muscular', 'perfilMujer.png'),
(35, 'Luis Andres', 'Salasar Capote', '133333333', '1976-08-15', 'Independiente', 'andres@gmail.com', '4252727', 'callr5ty', 'luisandres123', 'eb7f5906adae7f95fa6bdaec197cfbf5', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(36, 'Fabian Andres', 'Agredo Gutierrz', '5353535335', '1986-11-19', 'Fisioterapeuta', 'andres@gmail.copm', '5325353535', 'bdvchjdvghj', 'fabianandres123', '04786b2c9a182c8be8c77a9973a40b78', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(37, 'Andrea', 'Navarro Muñoz', '1234567', '1983-11-04', 'Jefe de venta', 'andrea@gmail.com', '3272727', 'call7889', 'andreanavarro123', '3de023e521c4d89fa28b5f50b17069b1', '123', 'Activo', 'Cliente', 'Femenino', 'Sedentaria', 'Bajar de peso', 'perfilMujer.png'),
(38, 'Jesus', 'Burbano Flores', '12141516', '1981-01-20', 'Manteminto', 'jesus@gmail.com', '43453253535', 'cvaklkkkj', 'jesusburbano123', '2f099053f9d2900daeb6268f690e1fdf', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(39, 'Hector ', 'Garcia Molina', '1213141556', '1993-08-30', 'Estudiante', 'hector@gmail.com', '435363667', 'vdhjvshbvh7777', 'hectorgarcia123', '98392cb50151aa6e63d8ecad8538a133', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Ganar masa muscular', 'perfilHombre.png'),
(40, 'Pablo', 'Pantoja Meneces', '42142424', '1994-09-24', 'Estudiante', 'pablo@gmail.com', '5353653465', 'vhjgchjdbhjd77777', 'pablopantoja123', 'd73d17418c582c7f45096bf950227b25', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(41, 'Andres Santiago', 'Bermudez Muñoz', '51512525', '2000-11-10', 'estudiante', 'andres@gmail.com', '4324343434', 'cal56367', 'andressantiagob123', 'f8fc0001d2a2988e7d7dd03ed4cf5aef', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Tonificar el musculo', 'perfilHombre.png'),
(42, 'Angel', 'Gomez Cortez', '131515615', '1990-06-26', 'Estudiante', 'angel@gmail.com', '525252525', 'cagaha677', 'angelgomezcortez123', 'c882e504d9225f0a6b32c18298a2e91f', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(43, 'Ricardo ', 'Vela Lopez', '4252525', '1995-11-10', 'Estudiante', 'ricardo@gmail.com', '5265263636', 'calleghjfchv', 'ricardovela123', '36c9cbb28e7864a184d6769b78c83a58', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(44, 'Ana valeria', 'Tose', '777777777', '2001-10-19', 'Estudiante', 'ana@gmail.com', '525253535', 'calle424525256', 'anavaleria123', '61b089df0d2f8ececa8fbdb4c118a894', '123', 'Activo', 'Cliente', 'Femenino', 'Sedentaria', 'Bajar de peso', 'perfilMujer.png'),
(45, 'Adriana del pilar', 'Navarro', '5151515125', '1982-08-01', 'Auxiliar administrativo', 'adriana@gmail.com', '53563636736', 'calll1223', 'adrianadelpilar123', 'eb444a63e69942ebcef8f6742a94701a', '123', 'Activo', 'Cliente', 'Femenino', 'Normal', 'Ganar masa muscular', 'perfilMujer.png'),
(46, 'Andres camilo', 'illera pizo', '41412424', '1998-05-19', 'Estudiante', 'andres@gmail.com', '555555', 'cccaka55', 'andrescamilloillera1', 'f7256c19744d897ad020d987ebd4c7a6', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', 'perfilHombre.png'),
(47, 'Angel Hernando', 'GArzon sarzosa', '5252525', '2001-09-14', 'Estudiante', 'angel@gmail.com', '6535353535', 'calle55555', 'angelhernando123', 'ad45b8e5717ba1d06858c4c622cf7525', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(48, 'Reinaldo', 'mejia hurbano ', '1234567', '1964-06-10', 'comerciante', 'reinaldo@gmail.com', '321567878', 'calle44555', 'reinaldomejiah321', '52ae2d7b441731ceac85e68cd7737ffb', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Bajar de peso', 'perfilHombre.png'),
(49, 'MAnuel ', 'silva toruma', '43243434', '1961-09-24', 'Empleado', 'manuel@gmail.com', '5354545', 'calle1414144', 'manuelsilva321', '39b1b1b6ec02a25c5cee6bf0dd659e04', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(50, 'Kevien stiven', 'Chamorro Daza', '131313', '1999-10-21', 'Estudiante', 'kevin@gmaIL.COM', '131313131', 'CALLE31313', 'KEVINSTIVENCH321', '50649ecd3cb4a2d499afc43f5b974125', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(51, 'Victor', 'Basquez Victoria', '123456', '1999-03-31', 'vENDEDOR', 'VICTOR@GMAIL.COM', '345624', 'CAR20RRRR', 'victorbasquez321', 'a582eba38a807df559cb3d5a5d86b86c', '123', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(52, 'Vanesa', 'Rojas Dias', '1061123123', '2001-01-03', 'Estudiante', 'vanesalaquemeloendsereza@gmail.com', '324242424', 'calle4567', 'vanesarojasdias3212', '19cb76c3c99394721190164f76e96a60', '123', 'Activo', 'Cliente', 'Femenino', 'Normal', 'Tonificar el musculo', 'perfilMujer.png'),
(53, 'Laura', 'Chaguendo', '123456', '1995-08-13', 'Estudiante', 'lauraq@gmail.com', '312345645', 'calle 6', 'laurachaguendo890', '35bfed1231ec291c255d9cbceff0ff0b', '123', 'Activo', 'Cliente', 'Femenino', 'Normal', 'Tonificar el musculo', 'perfilMujer.png'),
(54, 'Arnold Alois', 'Schwarzeneger', '12345678', '1947-07-30', 'Actor', 'arnolch@gmail.com', '8366328', 'California', 'arnoldcd123', '8feb58d4c0a703bdc7af238f37b7f839', '123', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', '916BBCC47DF3601FAD8BD4D7041CF814.jpg'),
(57, 'Asistencia', 'Asistencia', '000000000', '2017-12-05', 'Asistencia del gym', 'Asistencia@gmail.com', '0000000000', '00000', 'Asistencia123', '0cdf6432e4358b46d7912b7f596e3caf', '123', 'Activo', 'Asistencia', 'Masculino', 'Normal', 'Terapia', 'perfilHombre.png'),
(58, 'Oscar Andres', 'Ospino Astudillo', '1061000000', '1987-03-14', 'Policia', 'oscar@gmail.com', '000000', '000000', 'aospino123', 'df671e7568c6f38be308afc7d811bc80', '7412369', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', 'perfilHombre.png'),
(59, 'Rocky', 'Nuñez', '3206048323', '2011-01-20', 'Cuidador de casas', 'rocky@gmail.com', '123', 'Car20A #2-14 B/Pandiguando', '3206048323', 'e65b412ed26d5068874638df2372d36d', '3206048323', 'Activo', 'Cliente', 'Masculino', 'Normal', 'Ganar masa muscular', '62801F65A31D2E42476040ACE18E89A8.jpg'),
(60, 'Gokú', 'Kakaroto', '3166168147', '1990-10-20', 'Salvador del mundo', 'gokuss4@gmail.com', '123', 'Planeta cayosama', '3166168147', '42883679020543795fbe18177830fe4e', '3166168147', 'Activo', 'Cliente', 'Masculino', 'Deportista', 'Tonificar el musculo', '5FD86B1F85285EDFB1A4BFA3F0FB23C7.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_rutinas`
--

CREATE TABLE IF NOT EXISTS `usuario_rutinas` (
  `pk_usuario_id` int(10) unsigned NOT NULL,
  `pk_rutina_id` int(10) unsigned NOT NULL,
  `fechaAsignacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_rutinas`
--

INSERT INTO `usuario_rutinas` (`pk_usuario_id`, `pk_rutina_id`, `fechaAsignacion`) VALUES
(2, 3, '2020-02-17 03:32:28'),
(58, 4, '2020-02-17 04:00:27'),
(60, 3, '2020-02-17 03:29:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE IF NOT EXISTS `venta` (
  `pk_venta_id` int(10) unsigned NOT NULL,
  `cantidadVenta` int(10) DEFAULT NULL,
  `valorTotal` decimal(10,0) DEFAULT NULL,
  `ganancia` decimal(10,0) DEFAULT NULL,
  `fechaVenta` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`pk_venta_id`, `cantidadVenta`, `valorTotal`, `ganancia`, `fechaVenta`) VALUES
(1, 2, '4000', '1600', '2020-05-21 17:08:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_producto`
--

CREATE TABLE IF NOT EXISTS `venta_producto` (
  `pk_venta_id` int(10) unsigned NOT NULL,
  `pk_producto_id` int(10) unsigned NOT NULL,
  `cantidadVenta` int(10) NOT NULL,
  `monto` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta_producto`
--

INSERT INTO `venta_producto` (`pk_venta_id`, `pk_producto_id`, `cantidadVenta`, `monto`) VALUES
(1, 1, 1, '1000'),
(1, 2, 1, '3000');

--
-- Disparadores `venta_producto`
--
DELIMITER $$
CREATE TRIGGER `insertarDatos` AFTER INSERT ON `venta_producto`
 FOR EACH ROW BEGIN
        UPDATE venta SET 
		venta.valorTotal = venta.valorTotal + NEW.monto
        WHERE 
        venta.pk_venta_id = NEW.pk_venta_id;
          
        UPDATE venta SET 
		venta.cantidadVenta = venta.cantidadVenta + NEW.cantidadVenta
        WHERE 
        venta.pk_venta_id = NEW.pk_venta_id;
        
        UPDATE producto SET 
		producto.cantidad = producto.cantidad - NEW.cantidadVenta
        WHERE 
        producto.pk_producto_id = NEW.pk_producto_id;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`pk_asistencia_id`),
  ADD KEY `ID_USU` (`fk_usuario_id`);

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`pk_chat_id`),
  ADD KEY `fk_usuariologin_id` (`fk_usuariologin_id`) USING BTREE,
  ADD KEY `fk_usuario_id` (`fk_usuario_id`) USING BTREE;

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`pk_ejercicio_id`);

--
-- Indices de la tabla `entreno`
--
ALTER TABLE `entreno`
  ADD PRIMARY KEY (`pk_entreno_id`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`pk_evento_id`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`pk_instructor_id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`pk_medida_id`),
  ADD KEY `fk_usuario_id` (`fk_usuario_id`) USING BTREE;

--
-- Indices de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD PRIMARY KEY (`pk_mensualidad_id`),
  ADD KEY `ID_USU` (`fk_usuario_id`);

--
-- Indices de la tabla `proballuvia`
--
ALTER TABLE `proballuvia`
  ADD PRIMARY KEY (`pk_proballuvia_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`pk_producto_id`);

--
-- Indices de la tabla `reportemensualidad`
--
ALTER TABLE `reportemensualidad`
  ADD PRIMARY KEY (`pk_reporte_id`),
  ADD KEY `fk_mensualidad_id` (`fk_mensualidad_id`);

--
-- Indices de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`pk_rutina_id`),
  ADD KEY `ID_USU` (`fk_usuario_id`),
  ADD KEY `ID_INST` (`fk_instructor_id`) USING BTREE;

--
-- Indices de la tabla `rutinas_ejercicios`
--
ALTER TABLE `rutinas_ejercicios`
  ADD PRIMARY KEY (`pk_rutina_id`,`pk_ejercicio_id`) USING BTREE,
  ADD KEY `ID_EJER` (`pk_ejercicio_id`) USING BTREE;

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`pk_usuario_id`);

--
-- Indices de la tabla `usuario_rutinas`
--
ALTER TABLE `usuario_rutinas`
  ADD PRIMARY KEY (`pk_usuario_id`,`pk_rutina_id`) USING BTREE,
  ADD KEY `pk_rutina_id` (`pk_rutina_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`pk_venta_id`);

--
-- Indices de la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD PRIMARY KEY (`pk_venta_id`,`pk_producto_id`),
  ADD KEY `pk_producto_id` (`pk_producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `pk_asistencia_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `pk_chat_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  MODIFY `pk_ejercicio_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT de la tabla `entreno`
--
ALTER TABLE `entreno`
  MODIFY `pk_entreno_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `pk_evento_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `pk_instructor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `pk_medida_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT de la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  MODIFY `pk_mensualidad_id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `proballuvia`
--
ALTER TABLE `proballuvia`
  MODIFY `pk_proballuvia_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `pk_producto_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `reportemensualidad`
--
ALTER TABLE `reportemensualidad`
  MODIFY `pk_reporte_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  MODIFY `pk_rutina_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `pk_usuario_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `pk_venta_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuario` (`pk_usuario_id`);

--
-- Filtros para la tabla `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`fk_usuariologin_id`) REFERENCES `usuario` (`pk_usuario_id`),
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuario` (`pk_usuario_id`);

--
-- Filtros para la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD CONSTRAINT `medidas_ibfk_1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuario` (`pk_usuario_id`);

--
-- Filtros para la tabla `mensualidad`
--
ALTER TABLE `mensualidad`
  ADD CONSTRAINT `mensualidad_ibfk_1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuario` (`pk_usuario_id`);

--
-- Filtros para la tabla `reportemensualidad`
--
ALTER TABLE `reportemensualidad`
  ADD CONSTRAINT `reportemensualidad_ibfk_1` FOREIGN KEY (`fk_mensualidad_id`) REFERENCES `mensualidad` (`pk_mensualidad_id`);

--
-- Filtros para la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD CONSTRAINT `rutinas_ibfk_1` FOREIGN KEY (`fk_instructor_id`) REFERENCES `instructor` (`pk_instructor_id`),
  ADD CONSTRAINT `rutinas_ibfk_2` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuario` (`pk_usuario_id`);

--
-- Filtros para la tabla `rutinas_ejercicios`
--
ALTER TABLE `rutinas_ejercicios`
  ADD CONSTRAINT `rutinas_ejercicios_ibfk_1` FOREIGN KEY (`pk_rutina_id`) REFERENCES `rutinas` (`pk_rutina_id`),
  ADD CONSTRAINT `rutinas_ejercicios_ibfk_2` FOREIGN KEY (`pk_ejercicio_id`) REFERENCES `ejercicios` (`pk_ejercicio_id`);

--
-- Filtros para la tabla `usuario_rutinas`
--
ALTER TABLE `usuario_rutinas`
  ADD CONSTRAINT `usuario_rutinas_ibfk_1` FOREIGN KEY (`pk_usuario_id`) REFERENCES `usuario` (`pk_usuario_id`),
  ADD CONSTRAINT `usuario_rutinas_ibfk_2` FOREIGN KEY (`pk_rutina_id`) REFERENCES `rutinas` (`pk_rutina_id`);

--
-- Filtros para la tabla `venta_producto`
--
ALTER TABLE `venta_producto`
  ADD CONSTRAINT `venta_producto_ibfk_1` FOREIGN KEY (`pk_venta_id`) REFERENCES `venta` (`pk_venta_id`),
  ADD CONSTRAINT `venta_producto_ibfk_2` FOREIGN KEY (`pk_producto_id`) REFERENCES `producto` (`pk_producto_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
