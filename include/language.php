<?php
    $lang = "en";
    
    //言語配列を持つ
    $title        = array('en' => 'WCADB.NET',   'jp' => 'WCADB.JP');
    $records      = array('en' => 'Records',     'jp' => '記録');
    $rankings     = array('en' => 'Rankings',    'jp' => 'ランキング');
    $competitions = array('en' => 'Competitions','jp' => '大会');
    $persons      = array('en' => 'Persons',     'jp' => '競技者');
    $other        = array('en' => 'Other',       'jp' => 'その他');
    
    $Lcontinents  = array('en' => 'Continents',  'jp' => '大陸別');
    $Lcountries   = array('en' => 'Countries',   'jp' => '国別');
    $Lsubmitrec   = array('en' => 'Submit',      'jp' => '表示');
    $Lsubmit      = array('en' => 'Submit',      'jp' => '検索');
    $Ltype        = array('en' => 'Type',        'jp' => '形式');
    $Lrecord      = array('en' => 'Record',      'jp' => '記録');
    $Ltime        = array('en' => 'Time',        'jp' => '記録');
    $Lperson      = array('en' => 'Person',      'jp' => '名前');
    $Lregion      = array('en' => 'Region',      'jp' => '地域');
    $Lregion2     = array('en' => 'Region',      'jp' => '国籍');
    $Lcompetition = array('en' => 'Competition', 'jp' => '大会');
    $Ldate        = array('en' => 'Date',        'jp' => '日付');
    $Lrank        = array('en' => 'Rank',        'jp' => '順位');
    $Lsingle      = array('en' => 'Single',      'jp' => '単発');
    $Laverage     = array('en' => 'Average',     'jp' => '平均');
    $Levent       = array('en' => 'Event',       'jp' => '種目');
    $Lgender      = array('en' => 'Gender',      'jp' => '性別');
    $Lshow        = array('en' => 'Show',        'jp' => '件数');
    $Lall         = array('en' => "All",         'jp' => "すべて");
    $L100         = array('en' => "100 Persons", 'jp' => "100位まで");
    $L1000        = array('en' => "1000 Persons",'jp' => "1000位まで");
    $Lcurrent     = array('en' => 'Current',     'jp' => '200件まで');
    $Lyear        = array('en' => 'Year',        'jp' => '年');
    $Lname        = array('en' => 'Name',        'jp' => '名前');
    $Lcname       = array('en' => 'Name',        'jp' => '大会名');
    $Lcountry     = array('en' => 'Country',     'jp' => '国');
    $Lcity        = array('en' => 'City',        'jp' => '都市');
    $Llink        = array('en' => 'LInk',        'jp' => 'リンク');
    $Ltop3        = array('en' => 'Top 3',       'jp' => '入賞');
    $LallResults  = array('en' => 'All Results', 'jp' => '結果');
    $Lscramble    = array('en' => 'Scramble',    'jp' => 'スクランブル');
    $L1st         = array('en' => '1st',         'jp' => '優勝');
    $L2nd         = array('en' => '2nd',         'jp' => '準優勝');
    $L3rd         = array('en' => '3rd',         'jp' => '3位');
    $Lplace       = array('en' => 'Place',       'jp' => '順位');
    $Lbest        = array('en' => 'Best',        'jp' => '単発');
    $LresultDetails = array('en' => 'Result Details','jp' => '結果詳細');
    $Lgroup       = array('en' => 'Group',       'jp' => 'グループ');
    $Lround       = array('en' => 'Round',       'jp' => 'ラウンド');
    $Lhistory     = array('en' => 'History',     'jp' => '履歴');
    $Lcomnum      = array('en' => 'Competitions','jp' => '大会参加数');
    $Lpodium      = array('en' => 'Podium',      'jp' => '世界大会');
    $Llackeve     = array('en' => 'Lacking Event','jp' => '残り種目');
    $Lscore       = array('en' => 'Score'        ,'jp' => 'スコア');
    
    $event333     = array('en' => "Rubik's Cube",    'jp' => "ルービックキューブ");
    $event444     = array('en' => "4x4 Cube",        'jp' => "4x4キューブ");
    $event555     = array('en' => "5x5 Cube",        'jp' => "5x5キューブ");
    $event222     = array('en' => "2x2 Cube",        'jp' => "2x2キューブ");
    $event333bf   = array('en' => "3x3 blindfolded", 'jp' => "3x3目隠し");
    $event333oh   = array('en' => "3x3 one-handed",  'jp' => "3x3片手");
    $event333fm   = array('en' => "3x3 fewest moves",'jp' => "3x3最少手数");
    $event333ft   = array('en' => "3x3 with feet",   'jp' => "3x3足");
    $eventMinx    = array('en' => "Megaminx",        'jp' => "メガミンクス");
    $eventPyram   = array('en' => "Pyraminx",        'jp' => "ピラミンクス");
    $eventSq1     = array('en' => "Square-1",        'jp' => "スクエア1");
    $eventClock   = array('en' => "Rubik's Clock",   'jp' => "ルービッククロック");
    $eventSkewb   = array('en' => "Skewb",           'jp' => "スキューブ");
    $event666     = array('en' => "6x6 Cube",        'jp' => "6x6キューブ");
    $event777     = array('en' => "7x7 Cube",        'jp' => "7x7キューブ");
    $event444bf   = array('en' => "4x4 blindfolded", 'jp' => "4x4目隠し");
    $event555bf   = array('en' => "5x5 blindfolded", 'jp' => "5x5目隠し");
    $event333mbf  = array('en' => "3x3 multi blind", 'jp' => "3x3複数目隠し");
    $eventMagic   = array('en' => "Rubik's Magic",   'jp' => "ルービックマジック");
    $eventMmagic  = array('en' => "Master Magic",    'jp' => "マスターマジック");
    $event333mbo  = array('en' => "3x3 multi blind old",'jp' => "旧3x3複数目隠し");
    
    $Lmale   = array('en' => "Male",  'jp' => "男性");
    $Lfemale = array('en' => "Female",'jp' => "女性");
    
    $roundH = array('en' => "Combined qualification",'jp' => "複合予選");
    $round0 = array('en' => "Qualification round",   'jp' => "予選");
    $roundD = array('en' => "Combined First round",  'jp' => "複合1回戦");
    $round1 = array('en' => "First round",           'jp' => "1回戦");
    $roundB = array('en' => "B Final",               'jp' => "決勝B");
    $round2 = array('en' => "Second round",          'jp' => "2回戦");
    $roundE = array('en' => "Combined Second round", 'jp' => "複合2回戦");
    $roundG = array('en' => "Combined Third round",  'jp' => "複合3回戦");
    $round3 = array('en' => "Semi Final",            'jp' => "準決勝");
    $roundC = array('en' => "Combined Final",        'jp' => "複合決勝");
    $roundF = array('en' => "Final",                 'jp' => "決勝");
    
    $wpodium   = array('en' => "World Championship Podiums",     'jp' => "世界大会入賞歴");
    $epodium   = array('en' => "Euro Championship Podiums",      'jp' => "ヨーロッパ大会入賞歴");
    $apodium   = array('en' => "Asian Championship Podiums",     'jp' => "アジア大会入賞歴");
    $jpodium   = array('en' => "Japan Open Podiums",             'jp' => "日本大会入賞歴");
    $historyWR = array('en' => "History of World Records",       'jp' => "世界記録歴");
    $historyCR = array('en' => "History of Continental Records", 'jp' => "大陸記録歴");
    $historyNR = array('en' => "History of National Records",    'jp' => "国内記録歴");
	
	$kinchAll    = array('en' => "All Events",         'jp' => "全競技");
	$kinchMain   = array('en' => "Main Events",        'jp' => "メイン競技");
	$kinchBig    = array('en' => "Big Cube Events",    'jp' => "多分割競技");
	$kinch333    = array('en' => "3x3 Cube Events",    'jp' => "3x3競技");
	$kinchBld    = array('en' => "Blindfolded Events", 'jp' => "目隠し競技");
	$kinchVar    = array('en' => "Various Pazzles",    'jp' => "変則パズル競技");

    $pmatch    = array('en' => ' persons matching.',                                  'jp' => '人見つかりました');
    $error1    = array('en' => 'No results found.',                                   'jp' => '一致する結果がありません');	
    $error2    = array('en' => 'There are too much search results (more than 3,000).','jp' => '検索結果が多すぎます（3000件以上）');	
    $error3    = array('en' => 'More than 3000 results aren\'t indicated.',           'jp' => '3000件以上は表示できません');
    $error4    = array('en' => 'Results are not yet posted.',                                'jp' => '大会結果がまだありません');
 
    $aweccP    = array('en' => '(all possible fields above "History (Map)": All Single+Average, World Championship Podiums, History of World Records, History of Continental Records)',
                       'jp' => '（すべての単発記録、平均記録を保持、世界大会入賞、世界記録、大陸記録樹立）');
    $aweccG    = array('en' => '(All Single+Average and additional continental/world achievement)',
                       'jp' => '（すべての単発記録、平均記録を保持、世界大会入賞、世界記録、大陸記録樹立のいずれかを所持）');
    $aweccS    = array('en' => '(All Single+Average)',
                       'jp' => '（すべての単発記録、平均記録を保持）');
    $aweccB    = array('en' => '(All Single)',
                       'jp' => '（すべての単発記録を保持）');
    $aweccM    = array('en' => '(People who achieved the records of 17 events (and the lacking event)',
                       'jp' => '（Silver memberまであと1種目）');
?>
