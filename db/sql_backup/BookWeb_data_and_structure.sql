/*
 Navicat Premium Data Transfer

 Source Server         : BookWeb (dev)
 Source Server Type    : SQLite
 Source Server Version : 3007005
 Source Database       : main

 Target Server Type    : SQLite
 Target Server Version : 3007005
 File Encoding         : utf-8

 Date: 05/03/2011 21:46:58 PM
*/

PRAGMA foreign_keys = false;

-- ----------------------------
--  Table structure for "categories"
-- ----------------------------
DROP TABLE IF EXISTS "categories";
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "parent_id" integer, "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Records of "categories"
-- ----------------------------
BEGIN;
INSERT INTO "categories" VALUES (1, 'albumy', null, null, null);
INSERT INTO "categories" VALUES (2, 'przyroda', 1, null, null);
INSERT INTO "categories" VALUES (3, 'sztuka', 1, null, null);
INSERT INTO "categories" VALUES (4, 'science fiction', 6, null, null);
INSERT INTO "categories" VALUES (5, 'fantasy', 6, null, null);
INSERT INTO "categories" VALUES (6, 'fantastyka', null, null, null);
INSERT INTO "categories" VALUES (7, 'komiksy', null, null, null);
INSERT INTO "categories" VALUES (8, 'nauka', null, null, null);
INSERT INTO "categories" VALUES (9, 'informatyka', 8, null, null);
INSERT INTO "categories" VALUES (10, 'ruby', 9, null, null);
INSERT INTO "categories" VALUES (11, 'html', 9, null, null);
INSERT INTO "categories" VALUES (12, 'css', 9, null, null);
INSERT INTO "categories" VALUES (13, 'kryminał i sensacja', null, null, null);
INSERT INTO "categories" VALUES (14, 'obcojęzyczne', null, null, null);
INSERT INTO "categories" VALUES (15, 'angielskie', 14, null, null);
INSERT INTO "categories" VALUES (16, 'niemieckie', 14, null, null);
INSERT INTO "categories" VALUES (17, 'francuskie', 14, null, null);
INSERT INTO "categories" VALUES (18, 'literatura i fikcja', null, null, null);
INSERT INTO "categories" VALUES (19, 'humorystyczne', 18, null, null);
INSERT INTO "categories" VALUES (20, 'przygodowe', 4, null, null);
INSERT INTO "categories" VALUES (21, 'opowiadania', 4, null, null);
COMMIT;

-- ----------------------------
--  Table structure for "contributions"
-- ----------------------------
DROP TABLE IF EXISTS "contributions";
CREATE TABLE "contributions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "role_id" integer, "person_id" integer, "contributable_id" integer, "contributable_type" varchar(255), "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Records of "contributions"
-- ----------------------------
BEGIN;
INSERT INTO "contributions" VALUES (1, 1, 1, 1, 'Publication', null, null);
INSERT INTO "contributions" VALUES (2, 2, 1, 1, 'Publication', null, null);
INSERT INTO "contributions" VALUES (3, 3, 2, 1, 'Edition', null, null);
INSERT INTO "contributions" VALUES (4, 1, 1, 2, 'Publication', null, null);
INSERT INTO "contributions" VALUES (5, 2, 1, 2, 'Publication', null, null);
INSERT INTO "contributions" VALUES (6, 3, 2, 2, 'Edition', null, null);
INSERT INTO "contributions" VALUES (7, 1, 1, 3, 'Publication', null, null);
INSERT INTO "contributions" VALUES (8, 2, 1, 3, 'Publication', null, null);
INSERT INTO "contributions" VALUES (9, 3, 2, 3, 'Edition', null, null);
INSERT INTO "contributions" VALUES (10, 1, 4, 4, 'Publication', null, null);
INSERT INTO "contributions" VALUES (11, 2, 3, 4, 'Publication', null, null);
INSERT INTO "contributions" VALUES (12, 3, 5, 4, 'Edition', null, null);
INSERT INTO "contributions" VALUES (13, 1, 6, 5, 'Publication', null, null);
INSERT INTO "contributions" VALUES (14, 2, 6, 5, 'Publication', null, null);
INSERT INTO "contributions" VALUES (15, 3, 7, 5, 'Edition', null, null);
INSERT INTO "contributions" VALUES (16, 3, 7, 6, 'Edition', null, null);
INSERT INTO "contributions" VALUES (17, 1, 8, 6, 'Publication', null, null);
INSERT INTO "contributions" VALUES (18, 2, 6, 6, 'Publication', null, null);
INSERT INTO "contributions" VALUES (19, 3, 9, 7, 'Edition', null, null);
INSERT INTO "contributions" VALUES (20, 1, 10, 8, 'Publication', null, null);
INSERT INTO "contributions" VALUES (21, 2, 11, 8, 'Publication', null, null);
INSERT INTO "contributions" VALUES (22, 3, 10, 9, 'Edition', null, null);
INSERT INTO "contributions" VALUES (23, 1, 10, 7, 'Publication', null, null);
INSERT INTO "contributions" VALUES (24, 2, 11, 7, 'Publication', null, null);
INSERT INTO "contributions" VALUES (25, 3, 10, 8, 'Edition', null, null);
INSERT INTO "contributions" VALUES (26, 1, 12, 9, 'Publication', null, null);
INSERT INTO "contributions" VALUES (27, 2, 13, 9, 'Publication', null, null);
INSERT INTO "contributions" VALUES (28, 3, 14, 10, 'Edition', null, null);
INSERT INTO "contributions" VALUES (29, 1, 15, 10, 'Publication', null, null);
INSERT INTO "contributions" VALUES (30, 1, 15, 11, 'Publication', null, null);
COMMIT;

-- ----------------------------
--  Table structure for "editions"
-- ----------------------------
DROP TABLE IF EXISTS "editions";
CREATE TABLE "editions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "isbn" varchar(255), "issue_number" varchar(255), "publication_id" integer, "created_at" datetime, "updated_at" datetime, "description" text, "cover_id" integer, "editor_id" integer, "edition_date" date, "series" varchar(255), "original_price" varchar(255), "page_count" integer, "cover_type" varchar(255), "dimentions_width" integer, "dimentions_height" integer);

-- ----------------------------
--  Records of "editions"
-- ----------------------------
BEGIN;
INSERT INTO "editions" VALUES (1, '978-83-237-2995-2', '', 1, null, null, 'Album mistrza amerykańskiego komiksu Willa Eisnera. Autor, uważany za ojca powieści graficznej, przedstawia nam osobistą, szczególną wizję Nowego Jorku - miasta, które zainspirowało jego pionierskie dzieła. Porzuciwszy świat kamienic czynszowych na Bronksie (znanych z Umowy z Bogiem), w Nowym Jorku Eisner oddaje cześć wielkiemu miastu w całej jego chwale. Ten album jest tak samo pełen hałasu, życia, a przede wszystkim "ludzkich historii", jak Broadway w godzinach szczytu.W tomie zebrano cztery bardzo ważne dzieła Eisnera: Nowy Jork. Wielkie miasto (1981), Budynek (1987), Notatki o ludziach z miasta (1989) i Niewidzialnych ludzi (2000). Te historie dowodzą, że żaden inny rysownik nie potrafi uchwycić melancholijnej mroczności Nowego Jorku równie sprawnie, jak Eisner, który poznał to miasto niczym własną kieszeń. Niektóre opowieści budzą w czytelniku dreszcz swoim "milczeniem", inne ogłuszają, ale wszystkie tętnią wielkomiejską żywotnością i bolesnym patosem, tak typowym dla sztuki Eisnera.Album uznany przez krytykę za arcydzieło w dziedzinie realistycznego komiksu obyczajowego.', 1, 1, X'30332e32303038', 'mistrzowie komiksu', '89,00', 440, 'twarda', 170, 260);
INSERT INTO "editions" VALUES (2, '978-83-237-3632-5', '', 2, null, null, 'Intymny autoportret i kronika kariery człowieka, dzięki któremu komiks stał się sztuką./nWill Eisner zaczął rysować komiksy w czasach wielkiego kryzysu. Stworzył ponad dwadzieścia powieści graficznych, dziesiątki książek instruktażowych i setki publikowanych co tydzień historii komiksowych, w tym serię Spirit, która ukazywała się najdłużej./nNa każdym etapie swojej ponadsiedemdziesięcioletniej kariery Eisner wytyczał nowe granice wybranemu przez siebie medium, nadając komiksowi status prawdziwej sztuki, sobie zaś - miano jednego z wielkich amerykańskich gawędziarzy XX wieku. W ostatnich latach życia zebrał najbardziej osobiste historie i wydał je w tomie Życie w obrazkach./n Trzy powieści graficzne i dwie krótsze historie, ułożone w takiej kolejności, w jakiej powstawały, tworzą dzieło zbliżone do autobiografii. Tom rozpoczyna Zmierzch w Mieście Słońca, oda do wspomnień i tęsknoty, wywołanych przejściem Eisnera na emeryturę w roku 1985 i przeprowadzką na Florydę./n Marzyciel, stworzony w roku 1986, to rodzaj powieści z kluczem, opisującej wczesne lata branży komiksowej przed II wojną światową./n Historia własnej rodziny, a także rodziny żony Ann, ukazana jest w dwóch powieściach graficznych, W środek burzy i Cel gry, przedstawiających zarazem historię Żydów w Ameryce. /nOstatnia opowieść w tomie, Dzień, w którym zostałem profesjonalistą, mówi najwięcej o tożsamości artystycznej autora. /nWill Eisner, twórca postaci Wonder Mana i komiksu Spirit, autor Umowy z Bogiem, pionier powieści graficznej, wielka legenda sztuki komiksowej dwudziestego wieku.', 6, 1, X'30382e32303039', 'mistrzowie komiksu', '99,00', 496, 'twarda', 170, 250);
INSERT INTO "editions" VALUES (3, '978-83-237-2858-0', '', 3, null, null, 'Legendarna trylogia Willa Eisnera (1917-2005), autora, którego imieniem nazwano najważniejszą nagrodę komiksową w USA! Pierwsze wydanie Umowy z Bogiem ukazało się w 1978 roku, gdy Eisner miał sześćdziesiąt jeden lat, i stało się punktem zwrotnym zarówno w życiu tego wybitnego twórcy, jak i w historii całej sztuki komiksowej. Oznaczało narodziny "powieści graficznej" i początek epoki, w której poważni rysownicy mogli odrzucić ograniczenia wynikające z obowiązującego dotychczas w Ameryce formatu zeszytowego. Pod koniec życia Eisner wybrał spośród swoich późniejszych dzieł dwa: Siłę życiową i Dropsie Avenue, które wraz z Umową z Bogiem opublikowano w formie trylogii.Przekład tego właśnie wydania prezentujemy polskim czytelnikom.Trylogia Umowa z Bogiem to niezwykła kronika amerykańskich doświadczeń prezentująca indywidualne i zbiorowe losy kilku pokoleń mieszkańców Dropsie Avenue w Nowym Jorku. To zarazem najbardziej znaczące i ponadczasowe dzieło Willa Eisnera, w którym zawarł wiele własnych wspomnień, przeżyć i refleksji.', 12, 1, X'30312e32303037', 'mistrzowie komiksu', '99,00', 512, 'twarda', 170, 260);
INSERT INTO "editions" VALUES (4, '978-83-237-9648-0', '', 4, null, null, '', 14, 1, X'30372e32303033', 'mistrzowie komiksu', '24,90', 80, 'twarda', 221, 294);
INSERT INTO "editions" VALUES (5, '978-83-237-2873-3', 30, 5, null, null, '', null, 1, X'30352e32303037', 'asteriks', '19,90', 56, 'miękka', 215, 290);
INSERT INTO "editions" VALUES (6, '978-83-237-2872-6', 30, 5, null, null, 'Legendarni bohaterowie Asteriks i Obeliks ponownie wyruszają na poszukiwanie przygody! Obeliks po raz pierwszy od czasów dzieciństwa dostaje możliwość wypicia cudownego napoju magicznego, który dodaje siły. Ale, jak to on, nie zna umiaru i wypija cały kocioł napoju! Efekty są opłakane - zamienia się w kamień. Aby odczynić czar, druid Panoramiks przygotowuje kolejny magiczny wywar, tyle że pod jego wpływem Obeliks zamienia się w dziecko...opiero po tym zdarzeniu rozpoczynają się prawdziwe przygody Galów, którzy, by przywrócić Obeliksowi jego dawną postać, muszą wyruszyć w daleką morską wędrówkę. Zawędrują nawet na Atlantydę...bum został rozszerzony o leksykon, który wyjaśnia czytelnikowi wszelkie aluzje i nawiązania, które Uderzo umieścił w swoim komiksie.', null, 1, X'30352e32303037', 'asteriks', '24,90', 56, 'twarda', 215, 290);
INSERT INTO "editions" VALUES (7, '978-83-237-2460-5', 8, 6, null, null, 'Jak co roku Panoramiks udaje się na zjazd druidów odbywający się w Puszczy Karnutyjskiej. Jest to spotkanie wszystkich galijskich druidów połączone z konkursem na najlepszego Druida Roku. Łatwo się domyślić, że dzięki wynalezieniu magicznego wywaru Panoramiks wygrywa konkurs i otrzymuje złoty menhir. Na kogoś takiego właśnie czekali zaczajeni w lesie Goci, którzy porywają zwycięzcę, by jego magiczne zdolności wykorzystać do podbicia imperium rzymskiego i Galii. Śladami porywaczy wyruszają Asteriks i Obeliks...', 15, 1, X'30342e32303131', 'asteriks', '19,99', 48, 'miękka', 215, 290);
INSERT INTO "editions" VALUES (8, '978-83-237-2932-7', 1, 7, null, null, 'Marzi to opowieść o Polsce lat 80. widzianej oczami kilkuletniej dziewczynki. Niepowiązane fabularnie historie ukazują świat, którego logikę narzuca wola przetrwania. Kolejki, zapisy na towary, zakupy na zapas, zabawy dzieci, pielgrzymka papieża, czołgi na ulicach. Nie ma tu wielkiej polityki, martyrologii ani sentymentalizmu, jest natomiast szczerość w portretowaniu postaci i relacji rodzinnych oraz dbałość o szczegóły.Marzi odwołuje się do emocji i wspomnień czytelników. Trafia do starszych i bardzo młodych. Pierwszym uzmysławia, ile się w Polsce zmieniło, drugim opowiada, jak było.Marzena Sowa mieszka i pracuje we Francji. Marzi powstała z myślą o czytelnikach nieznających realiów PRL i mimo dużych barier społeczno-kulturowych została ciepło przyjęta przez krytykę.', 19, 1, X'30312e32303038', 'marzi', '35,00', 96, 'twarda', 165, 223);
INSERT INTO "editions" VALUES (9, '978-83-237-2524-4', 2, 8, null, null, 'Drugi tom wspomnień Marzeny Sowy, młodej scenarzystki komiksowej, która zadebiutowała na rynku frankofońskim. Tom zbudowany jest podobnie do pierwszego - z niepowiązanych ze sobą fabularnie krótkich historii. Marzi to opowieść o Polsce lat 80. widzianej oczami kilkuletniej dziewczynki. Poszczególne epizody bez natrętnych komentarzy ukazują świat zapamiętany przez wielu z nas. Strajki, pacyfikacje zakładów pracy, bieda i niepokój o przyszłość. Wśród codziennych zdarzeń szczególnie uwypuklona została niezwykła atmosfera końca lat 80, kiedy to po niemal dekadzie politycznego marazmu ludzie poczuli nadzieję na zmiany. Marzi jest komiksem zarówno dla dorosłych, jak i dla starszych dzieci. Pierwszym uzmysławia, ile się w Polsce zmieniło, drugim opowiada, jak było. Nie pozostawia czytelnika obojętnym, przywołuje wspomnienia, zaciekawia, śmieszy. Komiks powstał z myślą o czytelnikach nieznających realiów PRL i mimo dużych barier społeczno-kulturowych został bardzo ciepło przyjęty przez krytyków i czytelników. Dowodem jest nominacja Marzi do nagrody na Międzynarodowym Festiwalu w Angouleme we Francji w 2008 roku.', 20, 1, X'31312e32303030', 'marzi', '39,00', 98, 'twarda', 165, 223);
INSERT INTO "editions" VALUES (10, '978-83-237-2816-0', '', 9, null, null, 'Kolejny komiks ze scenariuszem giganta komiksu anglosaskiego, Neila Gaimana (autora m.in. serii "Sandman"), który ukazuje się w prestiżowej kolekcji Mistrzowie Komiksu. Jest to inny niż większość dzieł rynku amerykańskiego album. Wprawdzie opowiada o superbohaterce, tytułowej Czarnej Orchidei, ale wcale nie przypomina typowych historii o herosach w pelerynach. Nie ma tutaj zbawiania świata, nie ma triumfu dobra nad demonicznymi siłami zła. Jest za to znakomita opowieść, która rozpoczyna się w bardzo nietypowy sposób - od śmierci głównej bohaterki... Album stał się przełomowym dziełem w historii komiksu współczesnego. Jak mówi sam autor, jeśli wejdziecie do tego świata, znajdziecie się w miejscu, gdzie wszystkie przyjęte tradycje gatunkowe zostały odrzucone, a zamiast nich pojawiła się nowa mitologia, bliższa mrocznym snom i ciemniejszej stronie życia.Komiks został narysowany przez Dave''a McKeana, jednego z najbardziej cenionych grafików naszych czasów. Jego niezwykłe prace znają wszyscy miłośnicy serii "Sandman".', null, 1, X'31302e32303036', 'mistrzowie komiksu', '79,00', 160, 'twarda', 170, 260);
INSERT INTO "editions" VALUES (11, '978-83-241-2753-5', '', 10, null, null, 'Powieść lata 2006. 100 % inteligentnej rozrywki dla każdego - do czytania w każdym wieku i w każdym nastroju. /nFilozoficzna powieść kryminalna. Po Folwarku zwierzęcym i wodnikowym Wzgórzu zwierzęta znów przemówiły w światowym bestsellerze i powiedziały o ludziach więcej, niż sami wiemy o sobie. /nJeszcze wczoraj był zdrowy - powiedziała Matylda, nerwowo strzygąc uszami. /nTo nie ma nic do rzeczy - zauważył Sir Ritchfield, najstarszy tryk w stadzie. - Nie umarł na chorobę. Szpadel to nie choroba. Pasterz leżal w bujnej irlandzkiej trawie obok stodoły. Leżał i ani drgnąl. Owce odbywały naradę nieco dalej, prawie na skraju urwiska. /nRankiem, gdy znalazly pasterza, niezwykle zimnego i zupełnie martwego, zachowały spokój i były z tego niezmiernie dumne. W pierwszym przypływie trwogi zabrzmiało oczywiście kilka rozpaczliwych okrzyków - "Kto nam teraz będzie przynosił siano?", "Wilk! Tu jest wilk! - lecz panna Maple szybko stłumiła panikę. Wytłumaczyła im, że tu, na najzieleńszych i najsoczystszych pastwiskach w całej Irlandii, tylko idiota jadłby siano w środku lata, i że nawet najbardziej wyrafinowane wilki nie przebijają szpadlem swoich ofiar. Bo nie ulegało wątpliwości, że to właśnie szpadel sterczał z wnętrzności pasterza.', 23, 2, X'32303037', 'złota seria', '', 264, 'twarda', 145, 205);
INSERT INTO "editions" VALUES (12, '978-83-241-3887-6', '', 10, null, null, 'Jak w Folwarku zwierzęcym i Wodnikowym Wzgórzu zwierzęta przemówiły w Sprawiedliwości owiec. I powiedziały o ludziach więcej, niż sami wiemy o sobie. A że mówiły prawdę mądrze, śmiesznie i wzruszająco, powieść stała się rewelacją literacką. Największy przebój roku 2006 w Polsce w kategorii proza obca, sprzedany w 70 tysiącach egzemplarzy!/nSprawiedliwość owiec przez 7 tygodni zajmowała 1. miejsce na listach bestsellerów "Newsweek Polska"./nRadiowa Trójka przez całe lato 2006 codziennie nadawała wspaniałe słuchowisko - adaptację powieści./nPrawa do publikacji kupili najwięksi wydawcy w 25 krajach. W Niemczech sprzedano ponad 2 miliony egzemplarzy - powieść ponad trzy i pół roku pozostawała na listach bestsellerów./nWytwórnia UFA Cinema kupiła prawa do ekranizacji.', 22, 2, X'30322e32303131', '', '', 384, 'miękka', 130, 205);
INSERT INTO "editions" VALUES (13, '978-83-241-3876-0', '', 11, null, null, 'Owce wracają!/nKontynuacja rewelacji literackiej Sprawiedliwość owiec, największego przeboju roku w Polsce 2006 w kategorii proza obca, sprzedanego w 70 tysiącach egzemplarzy./nTeraz znowu głos mają owce. Ale nie tylko.../nDo gry wkraczają również kozy, obcy niestrzyżony baran i tajemniczy Garou.../nTriumf owiec to bestseller w Niemczech już w pierwszym tygodniu sprzedaży [lista 3. msc."Der Spiegel" 22 lipca 2010]/nOwce z Glennkill opuszczają bujne zielone łąki Irlandii i przybywają do zaśnieżonej Francji z nową pasterką Rebeką, córką zamordowanego starego pasterza George''a. Rebece towarzyszy jej matka, zwariowana tarocistka, uwielbiająca likierek i ciągle kłócąca się z córką./nZatrzymują się na zimowym pastwisku w pobliżu starego zamczyska, w którym kiedyś mieścił się zakład dla obłąkanych. Matka Rebeki wróży, że stanie się coś złego (czemu trudno się dziwić, bo w jej talii brakuje wielu kart zwiastujących dobre zdarzenia). I rzeczywiście zaczyna się coś dziać. Owce dowiadują się od swoich nielubianych sąsiadek kóz (które zdaniem owiec cuchną i są szalone), że w okolicy grasuje tajemniczy potwór zwany Garou.... Kim jest Garou? Może wilkiem. Może wilkołakiem. A może kimś znacznie bardziej niebezpiecznym... Prawdę o nim odkryją owce po dramatycznym śledztwie. I wtedy znowu będzie sprawiedliwość. I triumf owiec. Jak w Folwarku zwierzęcym i Wodnikowym Wzgórzu zwierzęta przemówiły w Sprawiedliwości owiec. I powiedziały o ludziach więcej, niż sami wiemy o sobie. A że mówiły prawdę mądrze, śmiesznie i wzruszająco, powieść stała się rewelacją literacką./nSprawiedliwość owiec wydano w 25 krajach. W Niemczech sprzedano ponad 2 miliony egzemplarzy. W Polsce - 70 tysięcy egzemplarzy. Przez 7 tygodni zajmowała 1. miejsce na liście bestsellerów "Newsweek Polska". Leonie Swann studiowała psychologię marketingu i reklamy, filozofię i literaturoznawstwo (literatura angielska) w Monachium i w Berlinie, gdzie obecnie mieszka. Tematem jej pracy doktorskiej była rola zwierząt w literaturze angielskiej, co zainspirowało ją do napisania filozoficznej powieści kryminalnej Sprawiedliwość owiec. Obie powieści Leonie Swann dają wyrafinowaną intelektualną rozrywkę najwyższej próby, ale i czystą rozrywkę.', null, 2, X'30322e32303131', '', '', 464, 'twarda', 130, 205);
INSERT INTO "editions" VALUES (14, '978-83-241-3873-9', '', 11, null, null, 'Owce wracają!/nKontynuacja rewelacji literackiej Sprawiedliwość owiec, największego przeboju roku w Polsce 2006 w kategorii proza obca, sprzedanego w 70 tysiącach egzemplarzy./nTeraz znowu głos mają owce. Ale nie tylko.../nDo gry wkraczają również kozy, obcy niestrzyżony baran i tajemniczy Garou.../nTriumf owiec to bestseller w Niemczech już w pierwszym tygodniu sprzedaży [lista 3. msc."Der Spiegel" 22 lipca 2010]/nOwce z Glennkill opuszczają bujne zielone łąki Irlandii i przybywają do zaśnieżonej Francji z nową pasterką Rebeką, córką zamordowanego starego pasterza George''a. Rebece towarzyszy jej matka, zwariowana tarocistka, uwielbiająca likierek i ciągle kłócąca się z córką./nZatrzymują się na zimowym pastwisku w pobliżu starego zamczyska, w którym kiedyś mieścił się zakład dla obłąkanych. Matka Rebeki wróży, że stanie się coś złego (czemu trudno się dziwić, bo w jej talii brakuje wielu kart zwiastujących dobre zdarzenia). I rzeczywiście zaczyna się coś dziać. Owce dowiadują się od swoich nielubianych sąsiadek kóz (które zdaniem owiec cuchną i są szalone), że w okolicy grasuje tajemniczy potwór zwany Garou.... Kim jest Garou? Może wilkiem. Może wilkołakiem. A może kimś znacznie bardziej niebezpiecznym... Prawdę o nim odkryją owce po dramatycznym śledztwie. I wtedy znowu będzie sprawiedliwość. I triumf owiec. Jak w Folwarku zwierzęcym i Wodnikowym Wzgórzu zwierzęta przemówiły w Sprawiedliwości owiec. I powiedziały o ludziach więcej, niż sami wiemy o sobie. A że mówiły prawdę mądrze, śmiesznie i wzruszająco, powieść stała się rewelacją literacką./nSprawiedliwość owiec wydano w 25 krajach. W Niemczech sprzedano ponad 2 miliony egzemplarzy. W Polsce - 70 tysięcy egzemplarzy. Przez 7 tygodni zajmowała 1. miejsce na liście bestsellerów "Newsweek Polska". Leonie Swann studiowała psychologię marketingu i reklamy, filozofię i literaturoznawstwo (literatura angielska) w Monachium i w Berlinie, gdzie obecnie mieszka. Tematem jej pracy doktorskiej była rola zwierząt w literaturze angielskiej, co zainspirowało ją do napisania filozoficznej powieści kryminalnej Sprawiedliwość owiec. Obie powieści Leonie Swann dają wyrafinowaną intelektualną rozrywkę najwyższej próby, ale i czystą rozrywkę.', 21, 2, X'30322e32303131', '', '', 464, 'miękka', 130, 205);
COMMIT;

-- ----------------------------
--  Table structure for "editors"
-- ----------------------------
DROP TABLE IF EXISTS "editors";
CREATE TABLE "editors" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Records of "editors"
-- ----------------------------
BEGIN;
INSERT INTO "editors" VALUES (1, 'Egmont Polska', null, null);
INSERT INTO "editors" VALUES (2, 'Amber', null, null);
COMMIT;

-- ----------------------------
--  Table structure for "people"
-- ----------------------------
DROP TABLE IF EXISTS "people";
CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "date_of_birth" date, "date_of_death" date, "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Records of "people"
-- ----------------------------
BEGIN;
INSERT INTO "people" VALUES (1, 'Bill', 'Eisner', null, null, null, null);
INSERT INTO "people" VALUES (2, 'Jacek', 'Drewnowski', null, null, null, null);
INSERT INTO "people" VALUES (3, 'Enki', 'Bilal', null, null, null, null);
INSERT INTO "people" VALUES (4, 'Pierre', 'Christin', null, null, null, null);
INSERT INTO "people" VALUES (5, 'Bartek', 'Chaciński', null, null, null, null);
INSERT INTO "people" VALUES (6, 'Albert', 'Uderzo', null, null, null, null);
INSERT INTO "people" VALUES (7, 'Marek', 'Puszczewicz', null, null, null, null);
INSERT INTO "people" VALUES (8, 'René', 'Goscinny', null, null, null, null);
INSERT INTO "people" VALUES (9, 'Jarosław', 'Kilian', null, null, null, null);
INSERT INTO "people" VALUES (10, 'Marzena', 'Sowa', null, null, null, null);
INSERT INTO "people" VALUES (11, 'Sylvian', 'Savoia', null, null, null, null);
INSERT INTO "people" VALUES (12, 'Neil', 'Gaiman', null, null, null, null);
INSERT INTO "people" VALUES (13, 'Dave', 'McKean', null, null, null, null);
INSERT INTO "people" VALUES (14, 'Paulina', 'Braiter', null, null, null, null);
INSERT INTO "people" VALUES (15, 'Leonie', 'Swann', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for "pictures"
-- ----------------------------
DROP TABLE IF EXISTS "pictures";
CREATE TABLE "pictures" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "image" varchar(255), "edition_id" integer, "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Records of "pictures"
-- ----------------------------
BEGIN;
INSERT INTO "pictures" VALUES (1, 'will.eisner-nowy-jork.jpeg.png', 1, null, null);
INSERT INTO "pictures" VALUES (2, 'will.eisner-nowy-jork-133.jpeg.png', 1, null, null);
INSERT INTO "pictures" VALUES (3, 'will.eisner-nowy-jork-151.jpeg.png', 1, null, null);
INSERT INTO "pictures" VALUES (4, 'will.eisner-nowy-jork-312.jpeg.png', 1, null, null);
INSERT INTO "pictures" VALUES (5, 'will.eisner-nowy-jork-369.jpeg.png', 1, null, null);
INSERT INTO "pictures" VALUES (6, 'will.eisner-zycie.w.obrazkach.jpeg.png', 2, null, null);
INSERT INTO "pictures" VALUES (7, 'will.eisner-zycie.w.obrazkach-69.jpeg.png', 2, null, null);
INSERT INTO "pictures" VALUES (8, 'will.eisner-zycie.w.obrazkach-105.jpeg.png', 2, null, null);
INSERT INTO "pictures" VALUES (9, 'will.eisner-zycie.w.obrazkach-171.jpeg.png', 2, null, null);
INSERT INTO "pictures" VALUES (10, 'will.eisner-zycie.w.obrazkach-369.jpeg.png', 2, null, null);
INSERT INTO "pictures" VALUES (11, 'will.eisner-zycie.w.obrazkach-455.jpeg.png', 2, null, null);
INSERT INTO "pictures" VALUES (12, 'will.eisner-umowa.z.bogiem.jpeg.png', 3, null, null);
INSERT INTO "pictures" VALUES (13, 'will.eisner-umowa.z.bogiem-last.jpeg.png', 3, null, null);
INSERT INTO "pictures" VALUES (14, 'enki.bilal-falangi.czarnego.porz__dku.jpeg.png', 4, null, null);
INSERT INTO "pictures" VALUES (15, 'rene.goscinny-asteriks.i.goci.jpeg.png', 7, null, null);
INSERT INTO "pictures" VALUES (16, 'rene.goscinny-asteriks.i.goci-9.jpeg.png', 7, null, null);
INSERT INTO "pictures" VALUES (17, 'rene.goscinny-asteriks.i.goci-24.jpeg.png', 7, null, null);
INSERT INTO "pictures" VALUES (18, 'rene.goscinny-asteriks.i.goci-33.jpeg.png', 7, null, null);
INSERT INTO "pictures" VALUES (19, 'marzena.sowa-dzieci.i.ryby.glosu.nie.maja.jpeg.png', 8, null, null);
INSERT INTO "pictures" VALUES (20, 'marzena.sowa-halasy.duzych.miast.jpeg.png', 9, null, null);
INSERT INTO "pictures" VALUES (21, 'leonie.swann-triumf.owiec.jpeg.png', 14, null, null);
INSERT INTO "pictures" VALUES (22, 'leonie.swann-sprawiedliwosc.owiec.jpeg.png', 12, null, null);
INSERT INTO "pictures" VALUES (23, 'leonie.swann-sprawiedliwosc.owiec-_1_.jpeg.png', 11, null, null);
COMMIT;

-- ----------------------------
--  Table structure for "publications"
-- ----------------------------
DROP TABLE IF EXISTS "publications";
CREATE TABLE "publications" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "created_at" datetime, "updated_at" datetime, "original_title" varchar(255));

-- ----------------------------
--  Records of "publications"
-- ----------------------------
BEGIN;
INSERT INTO "publications" VALUES (1, 'Nowy Jork', null, null, '');
INSERT INTO "publications" VALUES (2, 'Życie w obrazkach. Opowieści autobiograficzne.', null, null, '');
INSERT INTO "publications" VALUES (3, 'Umowa z bogiem', null, null, '');
INSERT INTO "publications" VALUES (4, 'Falangi czarnego porządku', null, null, '');
INSERT INTO "publications" VALUES (5, 'Galera Obeliksa', null, null, '');
INSERT INTO "publications" VALUES (6, 'Asteriks i Goci', null, null, '');
INSERT INTO "publications" VALUES (7, 'Dzieci i ryby głosu nie mają.', null, null, '');
INSERT INTO "publications" VALUES (8, 'Hałasy dużych miast.', null, null, '');
INSERT INTO "publications" VALUES (9, 'Czarna Orchidea', null, null, '');
INSERT INTO "publications" VALUES (10, 'Sprawiedliwość owiec', null, null, '');
INSERT INTO "publications" VALUES (11, 'Triumf owiec', null, null, 'Garou: Ein Schaf-Thriller');
COMMIT;

-- ----------------------------
--  Table structure for "roles"
-- ----------------------------
DROP TABLE IF EXISTS "roles";
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Records of "roles"
-- ----------------------------
BEGIN;
INSERT INTO "roles" VALUES (1, 'Autor', null, null);
INSERT INTO "roles" VALUES (2, 'Ilustrator', null, null);
INSERT INTO "roles" VALUES (3, 'Tłumacz', null, null);
COMMIT;

-- ----------------------------
--  Table structure for "schema_migrations"
-- ----------------------------
DROP TABLE IF EXISTS "schema_migrations";
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);

-- ----------------------------
--  Records of "schema_migrations"
-- ----------------------------
BEGIN;
INSERT INTO "schema_migrations" VALUES (20110409112947);
INSERT INTO "schema_migrations" VALUES (20110409113606);
INSERT INTO "schema_migrations" VALUES (20110409115018);
INSERT INTO "schema_migrations" VALUES (20110409164350);
INSERT INTO "schema_migrations" VALUES (20110409181513);
INSERT INTO "schema_migrations" VALUES (20110411141603);
INSERT INTO "schema_migrations" VALUES (20110413192003);
INSERT INTO "schema_migrations" VALUES (20110413212932);
INSERT INTO "schema_migrations" VALUES (20110413222349);
INSERT INTO "schema_migrations" VALUES (20110413234357);
INSERT INTO "schema_migrations" VALUES (20110414162107);
INSERT INTO "schema_migrations" VALUES (20110423120233);
INSERT INTO "schema_migrations" VALUES (20110425210707);
COMMIT;

-- ----------------------------
--  Table structure for "users"
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "email" varchar(255), "encrypted_password" varchar(255), "salt" varchar(255), "created_at" datetime, "updated_at" datetime);

-- ----------------------------
--  Indexes structure for table "schema_migrations"
-- ----------------------------
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");

-- ----------------------------
--  Indexes structure for table "users"
-- ----------------------------
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");

PRAGMA foreign_keys = true;
