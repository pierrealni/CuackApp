-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2015 a las 01:37:32
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `receta_cuack`
--

DROP DATABASE IF EXISTS receta_cuack;
CREATE DATABASE receta_cuack;
USE receta_cuack;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE IF NOT EXISTS `calificacion` (
  `idreceta` int(11) NOT NULL,
  `idusuario` tinyint(4) NOT NULL,
  `idnivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`idreceta`, `idusuario`, `idnivel`) VALUES
(1, 1, 0),
(1, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `item` int(11) NOT NULL,
  `idreceta` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`item`, `idreceta`, `idusuario`, `descripcion`, `fecha_creacion`) VALUES
(1, 1, 4, 'Tu receta es un buena, cuando repites otra? chiquitaah. ;)', '2015-10-04 15:56:31'),
(5, 1, 9, 'holiii', '2015-10-04 16:16:37'),
(6, 2, 10, 'comentario', '2015-10-26 04:50:55'),
(7, 3, 10, 'comentario prueba', '2015-10-26 04:54:40'),
(8, 4, 10, 'comentario 1', '2015-10-26 04:56:12'),
(9, 4, 10, 'comentario 2', '2015-10-26 04:56:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncia`
--

CREATE TABLE IF NOT EXISTS `denuncia` (
  `idreceta` int(11) NOT NULL,
  `idusuario` tinyint(4) NOT NULL,
  `idtipodenuncia` int(11) NOT NULL,
  `fecha_denuncia` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(1) DEFAULT 'x'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `denuncia`
--

INSERT INTO `denuncia` (`idreceta`, `idusuario`, `idtipodenuncia`, `fecha_denuncia`, `estado`) VALUES
(5, 1, 2, '2015-11-03 08:29:50', 'x'),
(19, 2, 3, '2015-11-03 06:55:52', 'x'),
(19, 10, 1, '2015-11-03 07:01:41', 'x'),
(21, 1, 2, '2015-11-03 08:30:40', 'x'),
(21, 2, 2, '2015-11-03 08:31:08', 'x'),
(23, 2, 3, '2015-11-04 01:33:47', 'x'),
(26, 2, 2, '2015-11-03 06:55:03', 'x'),
(27, 2, 2, '2015-11-03 08:27:54', 'x'),
(28, 1, 2, '2015-11-04 00:17:35', 'x'),
(28, 2, 2, '2015-11-04 01:36:40', 'x'),
(30, 2, 2, '2015-11-03 06:55:36', 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE IF NOT EXISTS `etiqueta` (
  `idetiqueta` int(11) NOT NULL,
  `nombreetiqueta` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Lista de todas las etiquetas.';

--
-- Volcado de datos para la tabla `etiqueta`
--

INSERT INTO `etiqueta` (`idetiqueta`, `nombreetiqueta`, `estado`) VALUES
(1, 'PESCADO', 1),
(2, 'COMIDA COSTEÑA', 1),
(3, 'COMIDA DE LA SIERRA', 1),
(4, 'COMIDAS INTERNACIONALES', 1),
(5, 'COMIDA SELVÁTICA', 1),
(6, 'COMIDA NORTEÑA', 1),
(7, 'TIPICAS', 1),
(8, 'CHIFA', 1),
(9, 'POLLO', 1),
(10, 'RES', 1),
(11, 'CERDO', 1),
(12, 'SALSAS', 1),
(13, 'SOPAS', 1),
(14, 'AJI DE COCONA', 1),
(15, 'CEVICHE', 1),
(16, 'COCONA', 1),
(17, 'COMIDA DE LA SELVA', 1),
(18, 'COMIDA PERUANA', 1),
(19, 'COMIDA TIPICA', 1),
(20, 'DONCELLA', 1),
(21, 'RECETAS', 1),
(22, 'PAPA', 1),
(23, 'TACACHO', 1),
(24, 'ANTICUCHO', 1),
(25, 'MARISCOS', 1),
(26, 'CARNERO', 1),
(27, 'CHOCLO', 1),
(28, 'HUEVOS', 1),
(29, 'CUY', 1),
(30, 'FRIJOLES', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

CREATE TABLE IF NOT EXISTS `favorito` (
  `idusuario` int(11) NOT NULL,
  `idreceta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `favorito`
--

INSERT INTO `favorito` (`idusuario`, `idreceta`) VALUES
(1, 1),
(2, 1),
(2, 3),
(2, 4),
(2, 6),
(2, 19),
(10, 1),
(10, 2),
(10, 3),
(10, 5),
(11, 1),
(11, 2),
(11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `idnivel` tinyint(4) NOT NULL,
  `descripcion` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`idnivel`, `descripcion`) VALUES
(3, 'Bueno'),
(5, 'Excelente'),
(2, 'Malo'),
(4, 'Muy bueno'),
(1, 'Muy malo'),
(6, 'No tiene calificacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL,
  `nombrepais` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `nombrepais`, `estado`) VALUES
(1, 'Peru', 1),
(2, 'Ecuador', 1),
(3, 'Colombia', 1),
(4, 'Brazil', 1),
(5, 'Bolivia', 1),
(6, 'España', 1),
(7, 'Venezuela', 1),
(8, 'Rusia', 1),
(9, 'Mexico', 1),
(10, 'Estados Unidos', 1),
(11, 'Canadá', 1),
(12, 'Chile', 1),
(13, 'Uruguay', 1),
(14, 'Paraguay', 1),
(15, 'Portugal', 1),
(16, 'Ukrania', 1),
(17, 'China', 1),
(18, 'Japón', 1),
(19, 'Australia', 1),
(20, 'Francia', 1),
(21, 'Israel', 1),
(22, 'Arabia Saudita', 1),
(23, 'Bélgica', 1),
(24, 'Dinamarca', 1),
(25, 'Alemania', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE IF NOT EXISTS `receta` (
  `idreceta` int(11) NOT NULL,
  `nombrereceta` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(300) COLLATE latin1_spanish_ci DEFAULT NULL,
  `ingredientes` varchar(1000) COLLATE latin1_spanish_ci NOT NULL,
  `procedimiento` mediumtext COLLATE latin1_spanish_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `idusuario` int(11) NOT NULL,
  `calificacion_promedio` tinyint(4) NOT NULL DEFAULT '6',
  `favoritos` int(11) NOT NULL DEFAULT '0',
  `comentarios` int(11) NOT NULL DEFAULT '0',
  `denuncias` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Receta de un usuario';

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`idreceta`, `nombrereceta`, `descripcion`, `ingredientes`, `procedimiento`, `fecha_creacion`, `fecha_modificacion`, `estado`, `idusuario`, `calificacion_promedio`, `favoritos`, `comentarios`, `denuncias`) VALUES
(1, 'Pescado Frito', 'Preparación del pescado frito', 'Pescado, Arroz, Aceite', 'Freir el pescado y servirlo con arroz', '2015-09-13 05:00:00', '2015-10-20 07:11:52', 1, 2, 3, 4, 2, 0),
(2, 'Lomo Saltado', 'Preparación del Lomo Saltado', '300 gr. de carne de res (lomo).\r\n1 ½ cebolla.\r\n1 ½ tomate.\r\n1 aji limo.\r\n1 aji amarillo.\r\n1 cucharita de ajo molido.\r\n1 chorro de vinagre tinto.\r\n2 cucharadas de sillao.\r\n2 ramitas de perejil picado.\r\nSal y pimienta al gusto.', 'Cortemos el lomo en trozos rectangulares y medianos (medida aprox. 2cm. x 1 cm.), le agregamos pimienta y un poco de sal, no mucha porque al final le aumentaremos un poco más para lograr la sazón que queremos.\r\n\r\nLuego tomamos la cebolla de preferencia roja, porque tiene sabor mas fuerte, la pelamos y la cortamos en ocho partes. De igual manera cortamos el tomate, eso sí antes procedemos a quitarle todas las pepas.\r\n\r\nCon los ajíes lo que hacemos es, primero cortar un ají limo en pequeños trozos, no muy pequeños, para poder sentirlo y el medio ají amarillo en tiras para darle sabor y color al plato. La cantidad de ají varía según el gusto de cada uno.\r\n\r\nEl perejil será el elemento que le brinde a nuestro plato un agradable aroma y presentación, para esto tomamos un par de ramitas de perejil, les sacamos las hojas y las picamos finamente.\r\n\r\nYa que tenemos listos todos los ingredientes que intervendrán en este delicioso plato empecemos con la cocción.\r\n\r\nCocción:\r\n\r\nEn una sartén a fuego alto echamos un chorro de aceite, dejemos que esté bien caliente, doramos en él una cucharita de ajo molido, luego echamos la carne en trozos y la movemos constantemente hasta que se dore, le agregamos el ají limo.\r\n\r\nDespués de mover por unos minutos la carne y el ají, agregamos la cebolla, solo la dejamos cocer por unos minutos hasta que alcance su punto, crocante al morderla. Una vez que la cebolla esta a punto le añadimos el ají amarillo. Siempre moviendo dejemos unos minutos. Al final de la cocción agregamos el tomate para que no se deshaga. Unos momentos más al fuego y agregamos un chorro de vinagre tinto y luego un chorrito de sillao. Terminamos de salpimentar, lo sacamos del fuego y vertemos la preparación sobre un plato, finalmente le esparcimos el perejil picado.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 2, 3, 2, 1, 0),
(3, 'Causa Rellena', 'Preparación de la Causa Rellena', '\r\n3/4 kg de papa amarilla\r\n1 taza de mayonesa\r\n1/2 taza de cebolla picada\r\n1 lata de atún\r\n1 palta\r\n3 huevos\r\n1 limón\r\n1/2 cdta ají amarillo limpio y licuado (opcional)\r\n', 'Cocinamos las papas en agua con sal, luego las pelamos y pasamos por un prensapapas. Dejamos enfriar. Añadimos la mitad de la mayonesa y la cebolla curtida en vinagre, el limón y el ají. Mezclamos el atún con la mayonesa restante y cortamos la palta en rodajas.\r\n\r\nEn un molde aceitado, colocamos capas alternadas de papa, tajadas de palta, atún y ruedas de huevo duro. Desmoldamos la causa y la decoramos con mayonesa y verduras frescas.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 2, 3, 3, 1, 0),
(4, 'Picante de Mariscos', 'Preparación del Picante de Mariscos', '1 kg de camarones\r\n24 machas\r\n24 choros\r\n6 cangrejos\r\n1 tarro de leche evaporada\r\n8 tajadas de pan de molde\r\n1/2 taza de aceite\r\n1 taza de cebolla\r\n1 cdta de ajos molidos\r\n2 cdtas de ají colorado\r\n1 taza de arvejitas cocidas\r\nNueces o pecanas, sal y pimienta', 'Mezclamos la leche con igual cantidad de agua y remojamos ahí el pan. Lavamos los mariscos, los hervimos por 3 minutos y los escurrimos. Separamos la parte carnosa, la sazonamos con sal y dejamos reposar.\r\n\r\nEchamos el aceite en una olla, dejamos que caliente y agregamos la cebolla en cuadraditos y los ajos. Cuando estén a medio dorar añadimos el ají, sal y pimienta. Vertemos el pan licuado y dejamos cocinar hasta que espese, moviendo constantemente. Finalmente, añadimos las arvejitas, nueces o pecanas, los mariscos y retiramos del fuego. Servir con arroz.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 2, 3, 1, 2, 0),
(5, 'Rocoto Relleno', 'Preparación del Rocoto Relleno', '10 rocotos\r\n10 papas\r\n1/2 taza de aceite\r\n1/2 Kg pulpa de carne de chancho, sin quitarle la grasa\r\n1/2 Kg de cebolla picada en cuadritos\r\n100 grs de maní tostado y molido\r\n1 cda de ají molido\r\n1 pqte de galletas de soda\r\n1 tomate pelado y picado\r\n5 rodajas de queso mantecoso\r\nSal, pimienta, perejil', 'Cortamos las tapas de los rocotos. Limpiamos cada rocoto con un cuchillo filudo, sacando toda la vena y las pepas con cuidado; no debe quedar nada de vena. Los enjuagamos y lavamos en agua fría varias veces. Luego los ponemos a remojar por dos horas en agua con un puñado de sal y vinagre. Los escurrimos y lavamos para ponerlos al fuego en una olla con agua y un poco de sal hasta que rompa el hervor. Si es necesario, se vuelve a hervir, poniéndolos esta vez en el agua hirviendo y cuidando de que no se abran. Luego se escurren y se les añade aceite, usando uno de los rocotos a manera de cuchara.\r\n\r\nPara la preparación del relleno, se fríe la carne (cortada en cuadraditos pequeños) en un poco de aceite. Cuando esté un poco cocida se agrega la cebolla, luego el tomate, el ají colorado y al final, la galleta molida y el maní tostado y molido.\r\n\r\nSe rellenan los rocotos y se van colocando en un molde, intercalándolos con las papas sancochadas. Luego se cubren con rodajas de queso fresco mantecoso, rociando con leche, aceite y sal. Se llevan a gratinar por 15 minutos aproximadamente.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 2, 3, 1, 0, 1),
(6, 'Seco de Pollo', 'Preparación del Seco de Pollo', '1 kilo de pollo trozado en presas\r\n½ atado de culantro\r\n2 tazas de agua\r\n1 cubito de caldo de carne (también puede ser sobrecito)\r\n3 cucharadas de ají verde molido\r\n3 cucharadas de cebolla rallada\r\n2 cucharaditas de ajo, finamente picado o molido\r\n1 taza de arvejas cocidas\r\n3 papas sancochadas\r\nAceite en cantidad necesaria\r\nUna pizca de comino\r\nSal y pimienta al gusto', 'Licuar el culantro con ½ taza de agua. Calentar una olla con aceite y freír las presas de pollo. Cuando estén doradas retirarlas y en la misma grasa freír la cebolla con los ajos. Añadir el ají molido y el culantro. Dejar cocinar unos minutos e incorporar el agua restante, el comino, pimienta, sal, las presas y el cubito de caldo. Cuando haya roto el hervor, dejar a cocinar a fuego lento con la olla tapada.\r\nCuando el pollo este tierno, agregar las arvejas y las papas sancochadas. Mezclar y sacar del fuego. Se sirve con arroz blanco graneado.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 2, 3, 1, 0, 0),
(7, 'Causa Rellena de Mariscos', 'Preparación de la Causa Rellena de Mariscos', 'Una taza de cebolla picada\r\nUn cuarto de taza de aceite\r\nUna cucharada de ajo picado\r\nCuatro ajíes verdes\r\nUna cucharadita de palillo\r\nMedia cucharadita de comino\r\nUna ramita de hierba buena\r\n300 gramos de mariscos variados\r\nUn cuarto de taza de arvejas\r\nUn kilo de papa blanca\r\nJugo de un limón\r\nDos tazas de caldo\r\nSal y pimienta\r\nPerejil picado', 'Licuar en media taza de agua los ajíes sin venas ni pepas. Freír la cebolla con el ajo, añadir el palillo y sazonar al gusto.\r\n\r\nAgregar el ají licuado, la rama de hierbabuena y dejar hervir durante dos minutos. Verter el caldo y dejar hervir nuevamente, agregar la papa picada.\r\n\r\nDejar que espese y luego agregar los mariscos cuando la papa esté prácticamente cocida, las arvejas, la zanahoria cocida y picada. Esperar que cocinen los mariscos unos minutos y agregar el jugo de limón.\r\n\r\nRetirar del fuego y servir. Espolvorear perejil picado.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 2, 3, 0, 0, 0),
(8, 'Cerdo a la Cerveza', 'Preparación del Cerdo a la Cerveza', 'Un kilo de chuletas de cerdo en un solo trozo\r\nSal y pimienta\r\nTres cucharadas de margarina\r\nMedia taza de aceite\r\nDos dientes de ajo picado\r\nUn hinojo picado (opcional)\r\nDos tazas de cerveza', 'Salpimentar la carne y freír en la margarina y el aceite calientes. Incorporar el ajo y el hinojo. Agregar la cerveza poco a poco y llevar al horno por una hora y media aproximadamente. Servir con arroz o puré de papas y ensalada.\r\n', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(9, 'Ensalada de Sardina', 'Preparación de la Ensalada de Sardina', 'Una lechuga\r\nDos latas chicas de sardinas\r\nDos cucharadas de cebolla picada\r\nDos cucharadas de perejil picado\r\nCuatro aceitunas negras de botija\r\nCuatro rebanadas de beterraga\r\nCuatro huevos duros en rodajas\r\nMayonesa\r\n', 'Colocamos la lechuga sobre los platos de ensalada y en el centro de ponen las sardinas, se espolvorea con cebolla y perejil, se adorna con aceituna. Alrededor se coloca rebanadas de huevo y beterraga. Servir con mayonesa al gusto.\r\n\r\n', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(10, 'Cuy Chactado', 'Preparación del Cuy Chactado', 'Un cuy entero\r\n200 g. de harina de maíz\r\n500 ml de aceite vegetal\r\n3 dientes de ajos\r\nComino\r\nPimienta\r\nSal yodada\r\nLimón', 'Lava el cuy con agua y luego pásale limón por todo el cuerpo, dentro y fuera. Déjalo reposar una hora y luego enjuagalo y déjalo secar por dos horas.\r\n\r\nMuele los granos de maíz blanco tostado con sal hasta lograr los 100 gramos necesarios.\r\nEn una tabla y ayudada de una piedra, o mortero, muele los dientes de ajo con la sal, la pimienta y el comino.\r\n\r\nUna vez seca la carne, procede a sazonarla con la mezcla anterior y luego pasa la presa por la harina de maiz previamente tamizada.\r\n\r\nCalienta el aceite y fríe enseguida la presa, tapando bien; una vez dorado ambos lados, resérvalos en papel absorbente.\r\nSirve el plato acompañado de papas sancochadas doradas, ensaladas o la guarnición que elijas.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(11, 'Torreja de Coliflor', 'Preparación de la Torreja de Coliflor', '1/2 cabeza de coliflor.\r\n3 cucharas de harina sin preparar.\r\n1/2 cucharadita de polvo de hornear.\r\n4 huevos.\r\n1 cebolla mediana pelada.\r\n1 cucharada de perejil.\r\nAceite en cantidad necesaria.\r\nSal y pimienta al gusto.', 'Poner en una olla a cocer la cabeza de coliflor, mientras cernimos la harina junto con el polvo de hornear en un recipiente.\r\n\r\nEn una batidora, o en un bowl con la ayuda de un batidor globo, agregamos solo las claras y las batimos con la finalidad de llegar a punto de nieve, en el proceso agregamos las yemas una a una.\r\n\r\nPicamos la cebolla, el perejil y la coliflor, y los agregamos en la mezcla de huevos, sazonamos con sal y pimienta al gusto, y agregamos por último la harina con el polvo de hornear, revolvemos bien para unir todos nuestros ingredientes en el recipiente.\r\n\r\nPonemos sobre el fuego la sartén y la dejamos calentar, agregamos la cantidad necesaria de aceite, y con la ayuda de una cuchara sopera tomamos una cantidad pequeña de la mezcla y la agregamos en nuestra sartén en forma circular u ovalada.\r\n\r\nVoltear las torrejas cada cierto tiempo para su cocción en ambos lados. Finalizamos, sacándolas de la sartén poniéndolas sobre un plato con papel absorbente.\r\n\r\nServimos el plato de torrejas decorando con cebolla picada, o con ensalada y arroz bien graneado.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(12, 'Sopa Criolla', 'Preparación de la Sopa Criolla', '1 cebolla pequeña picada.\r\n3 dientes de ajo finamente picados o molidos.\r\n½ kilo (1 lb) de carne de lomo cortada en trocitos pequeños.\r\n3 tomates pelados y picados.\r\n1 cucharada de ají panca.\r\n1 cucharadita de orégano.\r\n1½ litro de agua.\r\n4 papas peladas y cortadas.\r\n150 gramos (5¼ oz) de fideos cabello de ángel.\r\n4 huevos.\r\n1½ taza de leche.\r\n4 rebanadas de pan.\r\n3 cucharadas de aceite.\r\nSal y pimienta a gusto.', 'Calienta el aceite y fríe la carne sazonada con sal y pimienta. Después agrega los ajos con la cebolla, el ají panca y luego incorpora la carne, los tomates y el orégano restregado. Rehoga unos minutos, y agrega agua y sal al gusto. Deja hervir durante 15 minutos.\r\n\r\nEn seguida incorpora las papas; cuando estén cocidas, agrega los fideos. Cuando estén listos apaga el fuego, agrega la leche y los huevos uno por uno; por último agrega el resto del orégano restregándolo.\r\n\r\nCuando todo esté listo, sirve caliente agregando el pan tostado y una rebanada de ají sin venas, cuidando que en cada plato se sirva cada uno de los huevos.\r\n\r\nPuedes hacer la presentación más interesante si le colocas un plato tendido como base y uns hojitas de culantro como decoración. Este plato debe comerse caliente, pues un plato de invierno, y es el acompañamiento ideal para el día de la Independencia.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(13, 'Quinua a la Jardinera', 'Preparación de la Quinua a la Jardinera', '2 tazas de quinua\r\n2 papas medianas\r\n2 zanahorias medianas\r\n1/2 taza de vainitas\r\n3/4 de taza de arverjitas frescas\r\n5 dientes de ajo o manteca\r\nSal al gusto', 'Lavamos bien la quinua (si nos es seleccionada) y la ponemos a cocer en tres litros de agua a fuego lento durante 45 minutos.\r\n\r\nAparte preparamos el aderezo con el aceite, ajos y un poquito de sal. Añadimos las arvejas, las vainitas picadas, las zanahorias y las papas picadas en cuadraditos. Agregamos dos tazas de agua y dejamos hervir hasta que estén cocidas las zanahorias y las arvejas.\r\n\r\nA la mezcla anterior le vertemos la quinua cocida y dejamos que granee. Servimos moldeando con una taza o plato hondo.\r\n', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(14, 'Pepian de Choclo', 'Preparación del Pepian de Choclo', '6 choclos\r\n1/2 kg de carne de chancho\r\n1 cda de sal\r\n3 dientes de ajo\r\n1/2 cdta de comino\r\n6 cdas de ají especial\r\n6 cdas de manteca\r\n1/2 taza de cebolla picada\r\n1 ramita de perejil', 'Rallamos los choclos (casi secos). Luego freímos en trozos la carne de chancho. Seguidamente doramos la cebolla picada, los ajos, comino y el ají colorado con la sal. Le añadimos el chancho y el choclo rallado. Echamos a este guiso cuatro tazas de agua, removiendo constantemente con una cuchara de palo por espacio de media hora hasta que esté espeso. Para servir se adorna con perejil picado.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 1, 3, 0, 0, 0),
(15, 'Papa a la Huancaina', 'Preparación de la Papa a la Huancaina', 'Salsa Huancaina:\r\n4 yemas duras\r\n6 ajíes verdes\r\n1/4 kilo queso fresco\r\njugo de limón (¡con un chorrito basta !)\r\n\r\nSalsa fresca:\r\nperejil picado\r\ncebolla picada\r\nají verde\r\naceite, sal y pimienta\r\n4 claras picadas\r\n\r\n1 kilo de papas cocidas\r\nHojas de lechuga\r\nAceitunas', 'Empecemos por la salsa huancaína. Les quitamos las pepas a los ajíes y los hervimos bien. Luego los licuamos con las yemas, el queso, la leche, limón y aceite hasta obtener una salsa de mediana consistencia.\r\n\r\nEn una fuente acomodamos las papas cocidas, peladas y cortadas en rodajas. Las cubrimos con la salsa huancaína y sobre ella esparcimos la salsa fresca, hecha con la mezcla (no licuado) de las claras, ají, perejil, aceite, sal y pimienta.\r\n\r\nPara la decoración podemos colocar hojas de lechuga y aceitunas alrededor. El ají verde lo puedes distribuir de la forma que prefieras entre las dos salsas. Te sugerimos 5 ajíes para la huancaína y el restante para la fresca. !Provecho!\r\n', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 0, 0, 0),
(16, 'Frijoles Peruanos', 'Preparación de los Frijoles Peruanos', '1 kg de frejol canario, remojado por 24 horas\r\n2 kg de tomate pelados y sin pepas\r\n1 botella de aceite\r\n1 paquete de chuletas ahumadas (4 piezas aprox)\r\n1 chorizo rojo\r\n1 pedazo de tocino\r\n1 pechuga de gallina\r\nCulantro, sal, pimienta, comino\r\n', 'En una olla a presión colocamos una capa de tomate y luego una de frejol. Encima el culantro y chuletas de chancho con chorizo y un poco de tocino. Cubrimos con frejol y echamos un poco de aceite. Continuamos así hasta terminar el frejol, echando siempre sal y pimienta en cada capa.\r\n\r\nCalentamos a fuego fuerte por 1/4 de hora y luego a fuego lento hasta cocinarse; en total 1 hora y media aproximadamente.\r\n\r\nVaceamos el frejol en una fuente resistente al calor, lo cubrimos con la gallina y colocamos parte del tocino restante sobre ésta. Llevamos al horno a 300ºF por 1/4 de hora. Servimos mezclando con pedazos de tocino.\r\n', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 0, 0, 0),
(17, 'Huevos a la Rusa', 'Preparación de los Huevos a la Rusa', '8 huevos.\r\n3 papas medianas.\r\n1/2 taza de alverjas verdes.\r\n2 zanahorias pequeñas.\r\n1/2 taza de mayonesa.\r\n3 tomates.\r\n8 hojas de lechuga.\r\nCantidad necesaria de ketchup para decorar.\r\nSal y pimienta al gusto.', 'Poner una olla a hervir los huevos durante 4 a 5 minutos aproximadamente. En otra olla, poner los vegetales que necesitan cocción, como las papas y las zanahorias, y aparte en una olla pequeñita cocer las alverjas.\r\n\r\nDespués de la cocción, empezamos a descascarar los huevos, y pelar las papas y las zanahorias, y cortamos estos últimos en cubitos. Dejamos enfriar nuestros vegetales por unos 10 a 15 minutos.\r\n\r\nTomamos un bowl grande y agregamos las papas, las zanahorias y las alverjas sancochadas, inmediatamente incorporamos 1/2 taza de mayonesa, se condimenta con sal y pimienta al gusto. Tomamos un cucharón grande y empezamos a mezclarlo bien para unir todos los sabores.\r\n\r\nPara empezar a armar nuestros platos necesitamos partir los huevos duros a la mitad, de la misma manera cortamos nuestros tomates en rodajas pequeñas.\r\n\r\nTomamos un plato y servimos una porción de la mezcla de los vegetales con la mayonesa, agregamos 2 mitades de un huevo, poniendo la yema hacia abajo sobre la ensalada.\r\n\r\nPara decorar, ponemos a un lado del plato una hoja de lechuga, y sobre ella 3 a 4 rodajas de tomate y por último agregamos unas gotitas de ketchup sobre los huevos.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 0, 0, 0),
(18, 'Mondonguito a la Italiana', 'Preparación del Mondonguito a la Italiana', '1/2 kilo de mondongo fresco.\r\n6 papas blancas.\r\n1 taza de aceite.\r\n1 taza de vino blanco seco.\r\n1 taza de caldo de mondongo.\r\n1 vasito de pisco.\r\n1 cebolla picada en forma de pluma.\r\n2 zanahorias cortadas en tiras.\r\n1 cucharadita de perejil picado.\r\n3 ramitas de perejil.\r\n1 puñado de arvejas.\r\n4 cucharadas de salsa de tomate.\r\n3 cucharadas de queso parmesano rallado (natural o empaque).\r\n1 cucharada de ají molido.\r\n2 cucharaditas de azúcar.\r\n4 hongos secos.\r\n2 hojas de laurel.\r\nSal y pimienta (al gusto).', 'Poner una olla a hervir los huevos durante 4 a 5 minutos aproximadamente. En otra olla, poner los vegetales que necesitan cocción, como las papas y las zanahorias, y aparte en una olla pequeñita cocer las alverjas.\r\n\r\nDespués de la cocción, empezamos a descascarar los huevos, y pelar las papas y las zanahorias, y cortamos estos últimos en cubitos. Dejamos enfriar nuestros vegetales por unos 10 a 15 minutos.\r\n\r\nTomamos un bowl grande y agregamos las papas, las zanahorias y las alverjas sancochadas, inmediatamente incorporamos 1/2 taza de mayonesa, se condimenta con sal y pimienta al gusto. Tomamos un cucharón grande y empezamos a mezclarlo bien para unir todos los sabores.\r\n\r\nPara empezar a armar nuestros platos necesitamos partir los huevos duros a la mitad, de la misma manera cortamos nuestros tomates en rodajas pequeñas.\r\n\r\nTomamos un plato y servimos una porción de la mezcla de los vegetales con la mayonesa, agregamos 2 mitades de un huevo, poniendo la yema hacia abajo sobre la ensalada.\r\n\r\nPara decorar, ponemos a un lado del plato una hoja de lechuga, y sobre ella 3 a 4 rodajas de tomate y por último agregamos unas gotitas de ketchup sobre los huevos.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 0, 0, 0),
(19, 'Arroz con pollo a la Mexicana', 'Preparación del Arroz con pollo a la Mexicana', 'Un pollo en presas\r\nUn tercio de taza de aceite\r\nDos tazas de arroz\r\nUna cebolla\r\nUn pimiento\r\nUn diente de ajo\r\nCuatro tomates cortados en cuatro cada uno\r\nUna taza de arverjas cocidas\r\nTres tazas de agua\r\nPimentón, sal y pimienta al gusto\r\n', 'Dorar el pollo en el aceite, retirarlo y colocarlo en una fuente para horno. En el mismo aceite, dorar el arroz, agregar la cebolla, el pimiento, el ajo y cocinar por cinco minutos. Agregar los tomates, arverjas, condimentos y agua.\r\n\r\nVolcar la mezcla sobre el pollo, tapar y hornear a 400 grados por treinta minutos. Destapar y dejar cuarenta minutos o hasta que el pollo esté suave', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 1, 0, 1),
(20, 'Ceviche de Doncella', 'Preparación del Ceviche de Doncella', '1 k. de doncella\r\n1 cucharadita de de ajo molido\r\nJugo de 10 limones\r\n1/2 taza de caldo de pescado\r\n2 cebollas rojas picadas en juliana\r\n8 hojas de bijao\r\n50 g de cocona picada en cuadraditos pequeños\r\n1 taza de jugo de cocona\r\n2 cucharadas de hojas de sachaculantro picado\r\nDos cucharadas de rocoto picado\r\n2 cucharadas de ají charapita molido\r\nSal y pimienta al gusto', 'Corta en cubitos medianos los filetes de doncella y colócalos en un tazón grande con los cubitos de cocona (despepitado previamente), el ajo, el ají charapita, el rocoto, el sachaculantro y el jugo de cocona. Revuélvelo bien y deja reposar por cinco minutos.\r\n\r\nLuego agrega el caldo de pescado, el jugo de limón, la sal, la pimienta y el sachaculantro. Después, arma los platos colocando dos hojas de bijao en forma de cruz y colocando el preparado en el centro.\r\nAntes de servir, coloca las porciones servidas sobre una parrilla caliente y agrega más caldo a cada porción. Déjalo unos minutos y sírvelos inmediatamente.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 0, 0, 0),
(21, 'Papa Rellena', 'Preparación de la Papa Rellena', '10 Papas blancas cocidas\r\n250 gramos de carne molida\r\n2 huevos duros picados\r\n2 huevos crudos\r\n100 gramos de pasas\r\n1 cucharada de ají panca molido\r\n1 cebolla grande picada en cubitos pequeños\r\n5 aceitunas de botija sin pepas y picadas (aceitunas negras)\r\n1 cucharada de ajo molido\r\n1 taza harina\r\n¼ litro de aceite\r\nSal y pimienta al gusto', 'En una olla ponemos las papas y las cubrimos con agua. Las dejamos hervir con sal hasta que estén suaves al pincharlas con un tenedor. Calentamos en una satén dos cucharadas de aceite y freímos los ajos y la cebolla y salpimentamos. Tenemos que freír hasta que la cebolla se ponga transparente. Añadimos el ají panca y removemos bien.\r\n\r\nEn esta preparación volcamos la carne molida, y la freímos hasta que dore y seque bien. Verificamos la sazón, luego incorporamos las aceitunas, las pasas y los huevos duros picados.\r\n\r\nPrensamos las papas y hervidas y tibias, agregamos sal y las mezclamos con los huevos crudos batidos.\r\n\r\nDividimos la masa en porciones grandes y rellenamos cada una con el preparado anterior. Encerramos el relleno con la misma para, haciendo como una pelota achatadita.\r\n\r\nPasamos las papas por harina, para evitar que se nos peguen al freírlas. Calentamos una sartén honda con abundante aceite, y doramos las papas.\r\n\r\nServimos calientes, las podemos acompañar con salsa de cebolla.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 10, 3, 0, 0, 2),
(22, 'Tacacho con Cecina', 'Preparación del Tacacho con Cecina', '500 g. Cecina de la selva (cerdo)\r\n8 und. Plátano verde (bellaco)\r\n300 g. Carne de chicharrón\r\n300 g. Grasa de cerdo\r\n4 und. Plátano maduro (bellaco)\r\n', 'Pela y corta en rectángulos el plátano, luego fríe los trozos en aceite hasta que estén cocidos por dentro. Resérvalos en papel absorbente y luego machácalos con un mazo. Una vez listo, agrégale los plátanos maduros y vuelve a machacarlo todo.\r\n\r\nAparte troza el chicharrón en cuadrados pequeños (que se puedan masticar sin problemas) y agrégalos al plátano machacado. Después de integrar bien los alimentos, con las manos elabora unas bolas medianas o grandes (dependiendo de la cantidad de porciones que desees preparar) y mételos al horno pre calentado a 160º C por cinco minutos.\r\n\r\nEn una sartén caliente agrega unas gotas de aceite y fríe la cecina por ambas caras; en caso uses la parrilla, coloca la cecina directamente cuidando de que no se queme. Sirve el plato colocando dos o tres bolas de cecina con un triángulo de cecina y listo.\r\n\r\nLa manteca es para freír la carne de cerdo y poder hacer el chicharrón con el que se preparan las bolas; para ahorrar tiempo puedes comprarlo listo.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 0),
(23, 'La Carapulcra', 'Preparación de La Carapulcra', '01 kg de papa blanca o rosada cocida y picada en cuadritos\r\n750 g de carne de cerdo cortada en trozos\r\n50 g de aji panca molido sin picante\r\n06 dientes de ajo grandes picados diminuto\r\n01 cda de comino tostado y molido\r\nAceite vegetal al gusto\r\n04 tazas de caldo de ave o de res\r\nPimienta de chapa y sal al gusto', 'En una olla de presión,coloca la carne de cerdo limpia con una taza de agua y dos dientes de ajo picados o machacados y sal. Séllalo bien y déjalo a fuego medio-alto por 35 a 40 minutos, o hasta que la olla suelte el primer pitazo. Enfría la olla, destapa y saca las presas aparte.\r\n\r\nLuego, en una olla grande fríe el ajo, el comino y el aji panca hasta que ya no sientas el olor a crudo; enseguida agrégale las presas de cerdo y dóralas ligeramente. Después agrégale el caldo y la sal.\r\n\r\nPor último, una vez dado un hervor, agrégale las papas picadas. Prueba nuevamente la sal y déjalo hervir hasta tomar punto.\r\n\r\nAcompaña el plato con yuca sancochada, arroz y una ensalada de cebollas finas.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 1),
(24, 'Anticucho de corazón', 'Preparación del Anticucho de corazón', '1 corazón de vaca\r\n1/2 taza de vinagre\r\n1 cucharada de ajos molidos\r\nComino c/n\r\nSal c/n\r\nPimienta c/n\r\n2 cucharaditas de orégano\r\n4 cucharadas de ají panca molido\r\n1 taza de cerveza negra\r\nPalitos de madera (los que se usan para las brochetas)\r\n1 brocha hecha de las hojas del choclo o panca (para untar el aceite y aderezo)\r\n2 cucharadas de ají panca molido (aderezo)\r\n1 pizca de sal (aderezo)\r\n1 taza de aceite (aderezo)', 'Lo primero que debemos hacer es limpiar el corazón de vaca para luego trozarlo en pedazos de tamaño regular, o si deseas, en trozos pequeños. Después de esto, debemos mezclar en un bowl de tamaño regular el ají panca, los ajos, la sal, pimienta, comino, orégano, vinagre y cerveza, cuando la mezcla esté homogénea introducimos los trozos de corazón, que deberán macerarse como mínimo un par de horas.\r\n\r\nMientras los trozos se maceran, aprovechamos para ir preparando el aderezo que nos ayudará en la cocción. En un pequeño bowl colocamos las 2 cucharadas de ají panca, la pizca de sal y la taza de aceite, mezclando bien. Este será el aderezo que iremos untando a los anticuchos mientras están en la parrilla.\r\n\r\nCuando ya hayan tomado sabor los trozos de corazón, podemos ir ensartándolos en los palitos, colocando entre 3 y 4 pedazos por palito. Después de esto los llevamos a la parrilla, y los cocemos por ambos lados, para esto nos ayudamos con la brocha, pues con esta iremos untando el aderezo y así se cocinan con más sabor.\r\n\r\nLos anticuchos de corazón pueden servirse acompañados de un trozo de choclo sancochado y de mitades de papa sancochada. Un truquito para que la papa quede más rica, es después de sancocharlas, las pelamos, cortamos en mitades y las colocamos en la parrilla mientras cocinamos los anticuchos, de esta manera quedarán doraditas al momento de servirlas. Y jamás te olvides de colocar un pote con ajicito.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 0),
(25, 'Inchicapi', 'Preparación del Inchicapi', 'Una gallina en trozos.\r\nUna taza de maní molido.\r\n1/4 de kilo de harina de maíz.\r\nUna cebolla picada.\r\nDos dientes de ajo.\r\n1/2 taza de culantro licuado.\r\n1/2 kilo de yuca sancochada y trozada.\r\n2 1/2 litros de agua.\r\nSal al gusto.', 'El primer paso es hervir la gallina con el agua hasta hacer una sustancia; una vez listo el caldo, reserva una parte y enfríala. Con esta parte se licúa el maní con la harina de maíz, el ajo, la cebolla y el culantro.\r\n\r\nDespués agrégale al caldo que debe seguir hirviendo. En seguida agrégale la sal, comprobando el punto preciso con una cuchara de madera. Cuando la carne esté suave al contacto con el tenedor, incorpórale la yuca y listo.\r\n\r\nPuedes acompañar este plato con un poco de ají o salsa de rocoto. Este plato, pese a ser un caldo y contener harina de maíz, se puede disfrutar en toda estación. Contiene gran cantidad de calorías y proteínas, siendo un plato infaltable para la mesa familiar.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 0),
(26, 'Adobo de Cerdo', 'Preparación del Adobo de Cerdo', '½ k de lomo de cerdo, cortado en trozos grandes.\r\n4 ajíes colorados, molidos.\r\n2 dientes de ajo.\r\n3 cebollas\r\n1 botella de chicha de jora\r\n2 cucharadas de vinagre\r\n1 rama de ruda\r\nSal, comino y orégano al gusto', 'En principio, debemos macerar por varios horas (o incluso hasta el día siguiente) el cerdo con la sal, el vinagre, el ají molido, los ajos, el comino, la ruda, el orégano, las cebollas cortadas en rebanadas gruesas y la chicha de jora necesaria para cubrir la carne.\r\n\r\nCuando todo esté suficientemente macerado, debemos voltear la mezcla en un olla y cocinar a fuego lento con la cebolla que sobró, la cual se agrega a la mitad de la cocción.\r\n\r\nUna vez que la carne se pueda atravesar fácilmente con un tenedor y el jugo resultante de la maceración tenga una consistencia espesa, podremos decir que el adobo de cerdo está en su punto y listo para servir. Si quieren hacerlo al estilo arequipeño, les recomiendo invitarlo en el desayuno con pan tres puntas y un poco de anisado para su mejor digestión. ¡Provecho!', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 1),
(27, 'Conchitas a la Parmesana', 'Preparación de las Conchitas a la Parmesana', '2 a 3 docenas de conchas de abanico.\r\n200 gr. de queso parmesano (rallado natural o de empaque).\r\n5 limones.\r\n1 paquete de mantequilla.\r\n1 porción pequeña de perejil picado finamente.\r\n1 vasito de salsa inglesa o Worcestershire.\r\nSal y pimienta blanca al gusto.', 'Limpie bien las conchas y sepárelas del caparazón, lave los caparazones y colóquelos nuevamente en cada concha. Corté un limón y rocíe unas gotitas a cada una, después haga lo mismo con la salsa inglesa. Sazone con sal, pimienta, perejil picado y agréguele un cubito pequeño de mantequilla y abundante queso parmesano.\r\n\r\nColoquélas en una fuente cada una en fila y llévelas al horno durante 10 minutos a 300 grados Cº hasta que se observe que el queso se haya gratinado o derretido.\r\n\r\nDespués que haya terminado la cocción, saqué la bandeja con cuidado y deje enfriar por 5 minutos, después, sirva caliente a sus invitados.\r\n\r\nSi desea puede poner sobre la mesa un recipiente de jugo de limón y un pequeño plato con cubitos de mantequilla si sus invitados desean servirse más de estos productos en sus entradas.\r\n\r\nEsta receta rinde para 6 a 10 personas.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 1),
(28, 'Seco de Carnero', 'Preparación del Seco de Carnero', '1 kg. de carne de carnero en trozos\r\n1/4 de litro de chicha de jora\r\n1 cda. de ají panca molido\r\n1/2 taza de aceite\r\n1/2 kg. de cebolla\r\n2 dientes de ajo picado\r\n2 cdas. de culantro molido\r\n1 rodaja de zapallo loche rallado\r\nSal, pimienta y comino al gusto', '\r\nPrimero tienes que dejar macerar la carne en un tazón con la chicha de jora (esta debe tapar la carne por completo), el ají panca, comino, pimienta y sal al gusto por 3 horas.\r\n\r\nLuego, cuando ya estés cerca de que se cumplan las 3 horas de maceración de la carne, ve friendo bien la cebolla con los ajos y el culantro molido en una sartén.\r\n\r\nCuando ya tengas todo esto listo agrega en una olla la mezcla anterior con la carne, el líquido de la maceración y el zapallo loche. Cocina todo a fuego lento hasta que la cocción esté completa.\r\n\r\nLa carne debe estar suave y para ver si ya está bien cocinada híncala con un tenedor o corta un pedazo con un cuchillo.\r\n\r\nFinalmente, puedes completar este plato con yucas sancochadas, frijoles o arroz blanco. Además, puedes acompañarlo con zarza de cebolla o adornar el plato con una hojitas de culantro.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 2),
(29, 'Sopa a la Minuta', 'Preparación de la Sopa a la Minuta', '\r\n1/2 kg de carne molida\r\n1/4 kg de cebollas\r\n1/4 kg de tomates\r\n1 cdta de ajos molidos\r\n1 cdta de orégano\r\n1/4 cdta de pimienta molida\r\n1 kg de papa amarilla\r\n1/2 taza de aceite\r\n1 cda de sal\r\n4 litros de agua\r\n1/8 kg de fideos cabello de ángel', 'En una olla grande ponemos a calentar el aceite. Le echamos la cebolla finamente picada, los ajos molidos con el orégano, el tomate pelado y picado, pimienta y los tomates pelados despepitados y licuados.\r\n\r\nTodo se fríe moviendo constantemente. Luego se le echa el agua fría, la sal, la carne molida, y las papas peladas y enteras. Tan pronto éstas se cocinen, echamos los fideos y dejamos que de un hervor. Se prueba la sal y se retira del fuego.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 0),
(30, 'Ají de Gallina', 'Preparación del Ají de Gallina ', '2 pechugas de pollo o gallina\r\n1 cebolla picada\r\n1 cucharadita de pimienta\r\n1 cucharadita de cominos\r\n1 cucharada de ajos molidos\r\n5 cucharadas de ají mirasol molido\r\n1 pecana\r\n1/2 pan remojado en agua\r\nsal\r\nleche\r\n½ kg  papas sancochadas y cortadas por la mitad.\r\nDecoración: Lechuga, huevo duro, aceitunas de botija.  ', 'En una olla con aceite freír la cebolla picada orallada, el comido, la pimienta, los ajos y el ají mirasol, cuando este bien frito se leecha un poquito de  caldo, echar las pechugas deshilachadas, las pecanas chancadas, el pan remojado y licuado remover bien verificar lasal y de por último echar la leche. Las papas sancochadas se cubren con esta, adornándola.Si desea se puede acompañar con arroz blanco\r\n\r\nObservación: Se sancochan las pechugas en agua con sal. Una vez frías las pechugas se deshilachan. El caldo de las pechugas se guarda para licuar el ají mirasol, el pan remojado y exprimido.\r\n\r\nNota:El pan se remoja en agua luego se exprime para sacar el ácido de la levadura, al ají mirasol se le saca las pepas y venas, luego se remojan en agua de un día para otro, después se licua.', '2015-09-13 05:00:00', '2015-10-21 01:44:07', 1, 11, 3, 0, 0, 1),
(31, 'Caldo de Gallina', 'Sierra', 'Muchos', 'Se prepara', '2015-09-20 05:07:02', '2015-10-21 01:44:07', 1, 2, 3, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_etiqueta`
--

CREATE TABLE IF NOT EXISTS `receta_etiqueta` (
  `idreceta` int(11) NOT NULL,
  `idetiqueta` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Tabla relacional entre las recetas con las etiquetas';

--
-- Volcado de datos para la tabla `receta_etiqueta`
--

INSERT INTO `receta_etiqueta` (`idreceta`, `idetiqueta`, `estado`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 7, 1),
(1, 18, 0),
(1, 19, 0),
(1, 21, 1),
(2, 2, 1),
(2, 7, 1),
(2, 10, 1),
(2, 18, 1),
(2, 19, 1),
(2, 21, 1),
(3, 2, 1),
(3, 18, 1),
(3, 21, 1),
(3, 22, 1),
(4, 2, 1),
(4, 18, 1),
(4, 21, 1),
(4, 25, 1),
(5, 2, 1),
(5, 7, 1),
(5, 14, 1),
(5, 16, 1),
(5, 18, 1),
(5, 19, 1),
(5, 21, 1),
(6, 2, 1),
(6, 9, 1),
(6, 18, 1),
(6, 21, 1),
(7, 2, 1),
(7, 6, 1),
(7, 7, 1),
(7, 18, 1),
(7, 19, 1),
(7, 21, 1),
(7, 25, 1),
(8, 2, 1),
(8, 11, 1),
(8, 18, 1),
(8, 21, 1),
(9, 1, 1),
(9, 2, 1),
(9, 12, 1),
(9, 18, 1),
(9, 21, 1),
(10, 2, 1),
(10, 6, 1),
(10, 18, 1),
(10, 21, 1),
(10, 29, 1),
(11, 2, 1),
(11, 18, 1),
(11, 21, 1),
(11, 28, 1),
(12, 2, 1),
(12, 13, 1),
(12, 18, 1),
(12, 21, 1),
(13, 3, 1),
(13, 18, 1),
(13, 21, 1),
(14, 3, 1),
(14, 18, 1),
(14, 21, 1),
(14, 27, 1),
(15, 3, 1),
(15, 18, 1),
(15, 21, 1),
(15, 22, 1),
(16, 3, 1),
(16, 6, 1),
(16, 18, 1),
(16, 21, 1),
(16, 30, 1),
(17, 4, 1),
(17, 21, 1),
(18, 4, 1),
(18, 21, 1),
(19, 4, 1),
(19, 9, 1),
(19, 21, 1),
(20, 3, 1),
(20, 7, 1),
(20, 15, 1),
(20, 18, 1),
(20, 19, 1),
(20, 20, 1),
(20, 21, 1),
(21, 3, 1),
(21, 7, 1),
(21, 18, 1),
(21, 19, 1),
(21, 21, 1),
(21, 22, 1),
(22, 4, 1),
(22, 5, 1),
(22, 17, 1),
(22, 18, 1),
(22, 21, 1),
(22, 23, 1),
(23, 5, 1),
(23, 17, 1),
(23, 18, 1),
(23, 21, 1),
(24, 5, 1),
(24, 7, 1),
(24, 10, 1),
(24, 17, 1),
(24, 18, 1),
(24, 19, 1),
(24, 21, 1),
(24, 24, 1),
(25, 5, 1),
(25, 18, 1),
(25, 21, 1),
(26, 2, 1),
(26, 11, 1),
(26, 18, 1),
(26, 21, 1),
(27, 2, 1),
(27, 18, 1),
(27, 21, 1),
(28, 2, 1),
(28, 10, 1),
(28, 18, 1),
(28, 21, 1),
(28, 26, 1),
(29, 2, 1),
(29, 13, 1),
(29, 18, 1),
(29, 21, 1),
(30, 2, 1),
(30, 14, 1),
(30, 18, 1),
(30, 21, 1),
(31, 18, 1),
(31, 21, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL,
  `nombrerol` varchar(30) COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Rol del usuario';

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombrerol`) VALUES
(2, 'administrador'),
(1, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguirusuario`
--

CREATE TABLE IF NOT EXISTS `seguirusuario` (
  `idusuario` int(11) NOT NULL,
  `idusuarioseguido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seguirusuario`
--

INSERT INTO `seguirusuario` (`idusuario`, `idusuarioseguido`) VALUES
(2, 10),
(2, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodenuncia`
--

CREATE TABLE IF NOT EXISTS `tipodenuncia` (
  `idtipodenuncia` tinyint(4) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipodenuncia`
--

INSERT INTO `tipodenuncia` (`idtipodenuncia`, `descripcion`) VALUES
(1, 'Copia de mi receta'),
(2, 'Contenido inapropiado'),
(3, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `nombreusuario` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `contrasenha` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `idrol` int(11) NOT NULL DEFAULT '1',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idpais` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='Tabla de todos los usuarios del sistema';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `estado`, `nombre`, `apellidos`, `correo`, `nombreusuario`, `contrasenha`, `idrol`, `fecha_creacion`, `idpais`) VALUES
(1, 1, 'Paola', 'Velez Aguinaga', 'polalua@gmail.com', 'user', 'user', 1, '2015-09-13 05:00:00', 1),
(2, 1, 'Jean Pierre', 'Alejandria Niño', 'pierre.alni@gmail.com', 'user2', 'user2', 2, '2015-09-13 05:00:00', 1),
(10, 1, 'Pedro', 'Guevara Niño', 'peter@hotmail.com', 'user3', 'user3', 1, '2015-10-20 04:03:19', 1),
(11, 1, 'Suley', 'Guevara Niño', 'suley@gmail.com', 'user4', 'user4', 1, '2015-10-20 04:03:53', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`idreceta`,`idusuario`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`item`);

--
-- Indices de la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD PRIMARY KEY (`idreceta`,`idusuario`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`idetiqueta`),
  ADD UNIQUE KEY `nombreetiqueta` (`nombreetiqueta`),
  ADD UNIQUE KEY `nombreetiqueta_2` (`nombreetiqueta`),
  ADD UNIQUE KEY `idetiqueta` (`idetiqueta`),
  ADD UNIQUE KEY `nombreetiqueta_3` (`nombreetiqueta`);

--
-- Indices de la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`idusuario`,`idreceta`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idnivel`),
  ADD UNIQUE KEY `idnivel` (`idnivel`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`),
  ADD UNIQUE KEY `nombrepais` (`nombrepais`),
  ADD UNIQUE KEY `idpais` (`idpais`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`idreceta`),
  ADD UNIQUE KEY `idreceta` (`idreceta`);

--
-- Indices de la tabla `receta_etiqueta`
--
ALTER TABLE `receta_etiqueta`
  ADD PRIMARY KEY (`idreceta`,`idetiqueta`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `nombrerol` (`nombrerol`),
  ADD UNIQUE KEY `idrol` (`idrol`),
  ADD UNIQUE KEY `nombrerol_2` (`nombrerol`);

--
-- Indices de la tabla `seguirusuario`
--
ALTER TABLE `seguirusuario`
  ADD PRIMARY KEY (`idusuario`,`idusuarioseguido`);

--
-- Indices de la tabla `tipodenuncia`
--
ALTER TABLE `tipodenuncia`
  ADD PRIMARY KEY (`idtipodenuncia`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD UNIQUE KEY `correo` (`correo`,`nombreusuario`),
  ADD UNIQUE KEY `correo_2` (`correo`),
  ADD UNIQUE KEY `nombreusuario` (`nombreusuario`),
  ADD UNIQUE KEY `nombreusuario_2` (`nombreusuario`),
  ADD UNIQUE KEY `idusuario` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `item` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `idetiqueta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `nivel`
--
ALTER TABLE `nivel`
  MODIFY `idnivel` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idpais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `idreceta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipodenuncia`
--
ALTER TABLE `tipodenuncia`
  MODIFY `idtipodenuncia` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
