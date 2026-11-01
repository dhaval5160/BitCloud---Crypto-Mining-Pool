import 'package:cloud_mining_farm/theme/config.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    // TODO english Translation
    'en_US': {
      'save': 'save',
      'bh': 'Home',
      'bs': 'Store',
      'bw': 'Wallet',
      'bp': 'Setting',
      'mpith': 'Total Mining Power',
      'mpit':
          'To keep your miner active, you must manually activate it once each day. Once activated, it will automatically mine Bitcoin on our cloud servers, and you’ll receive real-time updates. Please note that mining power gradually depreciates over time; however, you can minimize this effect by completing ad-based tasks. You can also increase your mining power by watching ads or instantly boost it by purchasing a mining plan.',
      "nn": "Not Now",
      "wad": "Watch Now",
      "wadlb": "Close",
      "wadlt": "You’ve already reached this booster. It will automatically renew after 4 hours.",

      // splash page
      'sht': 'Mine Bitcoin Instantly, No Setup Needed',
      'shs': 'One tap to start — track hashrate and earnings live from your phone.',
      'sb': 'Get Started',

      // singIn Page
      'snrh': 'Enter Referral Code (Optional)',
      'snlw': 'Login With',
      'sncwg': 'Continue with Google',
      'sntu': 'Terms of Use',
      'snpp': 'Privacy Policy',
      'snwgs':
          'Our platform utilizes cloud-based mining technology. Your mobile device is not used as a mining tool',
      "cics": "Initializing Cloud Server",
      "cisc": "Setup Complete",
      "cisyr": "Select Your Region",
      "cicr": "Choose Region",
      "ci": "Initializing...",
      "csc": "All done! Your cloud mining server is ready in @selectedRegion region",
      "cscr": "You’ve received @reward of free cloud mining power to start your mining journey.",
      "cyrs": "Your cloud mining server will be initialized based on the region you choose.",
      "ccb": "Continue",
       "csre":"⚠️ Choose your region to continue",
      "src": "Congratulations",
      "srsubone": "As part of our commitment, we’ve added a free reward to get you started ",
      "srsubtwo": " cloud mining boost to your account!",
      "srls": "Let's Start",
      "srdh": "Watch this ad to claim your free @value BTC welcome bonus in your wallet.",
      "srdnt": "No Thanks",

      // home page
      'hsb': 'START',
      'hcb': 'Current Balance',
      'hms': 'Speed',
      'hsc': 'Super Coin',
      'ham': 'Active Miners',
      'hpub': 'Power Up',
      "hab": "Active Booster",
      "hadr": "Read More",
      'hdr': 'Increase Time',
      'hdrst': 'You can increase your mining time by up to @inTime.',
      'hdqr': 'Speed Booster',
      'hdqrst': 'Increase your mining speed up to @spBooster to earn faster!',
      "hbdht": "Mining Speed Boost",
      "htdht": "Mining Time Boost",
      "htrwd": "Mining Reward",
      "hbdhst": "Watch this ad to earn more by boosting your mining power up to @power.",
      "htdhst": "Watch this ad to earn more by extending your mining time up to @time.",
      "htdhat": "You have @attempt free attempt remaining.",
      "hbrwd": "Watch this ad to unlock a bonus mining reward and earn more.\n@reward",
      'hdqrhs':
          '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Standard Boost\nAutomatically renews every 24 hours – don’t miss a day! ⏳',
      "scat": "Super Coin",
      "scht": "Meet SuperCoin! Our special way of saying thank you for being part of our app.",
      "scab": "Available Balance",
      "scuscb": "Use SuperCoin",
      "scone": "1 SuperCoin",
      "scn1":
          "SuperCoin is a bonus reward from us. To convert it into BTC, you need to have a withdrawable @cbtcb BTC balance.",
     "sccer":"Sorry, you have insufficient balance to convert SuperCoin.",
      "htbar":"Action Required",
      "htbarst":"Mining is not active. Start mining to increase time.",
      'rzsb': "Done",
      'rztc': "Task Completed!",
      'rztm': "Congratulations! You’ve received @massage reward 🎉",
      "hsmt": "🎥 Watch this ad to start cloud mining instantly \nYour current hashrate is @ch",
      "sccs":"SuperCoin conversion completed successfully.",
      "isc":"Invalid SuperCoin balance",


      // store page
      "srz": "Rewards Zone! 🎉",
      "srzst": "Complete simple tasks to unlock valuable rewards 🎁",
      'sspeed': 'Speed',
      'ssst': 'Move the slider to set your mining speed, or choose a ready-made plan below.',
      "smuo": "Mining Unit Overview",
      "sms": "Mining Speed",
      "sbms": "Bonus Mining Speed",
      "smp": "Mining Power",
      'smb': 'Mining Boost',
      'sam': 'Allocated Miners',
      "sbutton": "Details & Benefits",
      'sob': 'Watch Ad & Boost',
      "est":"Secure, effortless BTC mining — available anytime.",
      "sssp": "Standard Price",
      "ssda": "Discount Applied",
      "ssfp": "Final Price",
      "rwh": "Rewards",
      "rzhw": "How It Works",
      "rzar": "Available Rewards",
      "rzrc": "Completed",
      "rwt": "Task:",
      "rwr": "Reward:",
      "rwcb": "Claim",
      "rwcdb": "Claimed",
      "rwcloseb": "Close",
      "rwcm":
          "➤  One reward at a time — claim now and get the next after the timer.\n\n➤  Please wait until the current reward timer ends. You can track it on the Home Page under 'Active Booster'.\n\n➤  Once the current reward timer ends, other rewards will unlock automatically.",
      "rhrsw": "How the Rewards System Works",
      "rsdt": "Earn a free speed boost to increase your mining power!",
      "rsdst":
          "The Rewards system allows you to earn small, free mining speed boosts for a limited time by completing simple tasks such as watching ads, leaving reviews, or completing offers. It’s a fun way to start mining without spending any money!",
      "rsdst1":
          "🔁 You can claim unlimited time free mining speed with the “Free Reward” task — no limits!",
      "rsdst2":
          "⚠️ Free mining speed boosts are less powerful than paid mining speed boosts — they’re designed to give you a small boost, not full performance.",
      "rzst": "Mine free Bitcoin by completing simple tasks",
      "rzst1":
          "Complete simple tasks like watching ads and leaving reviews to earn points and start mining at no cost.Grow your earnings effortlessly—no investment required.",
      "rat":"Available in @atime",

      'sh': 'Hashing Power',
      'smr': 'Mining Rig',
      'sv': 'Duration',
      'smc': 'Miner Count',
      'sdp': 'Your Discount',
      'sbv': 'Benchmark Value',
      'sa': 'Total Price',
      'sd': 'Save Price',
      'ss': 'Subscribe',
      'spd': 'Plan Details',
      'sav': 'View',
      'suyh': 'Upgrade Your HashRate',
      'sas': 'Details & Benefits',
      's1': 'Get 100% uptime—backed by your dedicated miner, even during system downtimes.',
      's2':
          'By subscribing, you agree to be charged. Your subscription auto-renews at the same price and duration unless canceled. You also agree to our ',
      'sspd':
          'Subscription will be automatically renewed based on your plan until you cancel. You can manage it anytime on Google Play.',
      "sslo": "Limited Offer",

      // wallet page
      'wwb': 'Withdraw',
      'wwc': 'Claim Rewards',
      'wh': 'History',
      'wm': 'Mining',
      'wr': 'Referral',
      'whr': 'You haven’t made any withdrawals yet.',
      'wmbc': 'Complete Setup',
      'wmh': 'BALANCE',
      'wmte': 'Total Earnings:',
      'wmw': 'WITHDRAW',
      'wrrb': 'REFERRAL BALANCE',
      'wrse': 'Share to Earn',
      'wrati': 'All Time Income:',
      'wmcyas': 'Complete Your Account Setup',
      'wmprdcw':
          'Provide the required details to complete your account setup and enable fund withdrawal.',
      'wrgr':
          'Grow your Referral balance every time someone joins using your referral code and earns BTC.',

      //setting page
      'ssgr': 'Referral Rewards',
      'sr': 'Mining Record',
      'sru': 'Rate Us',
      'sl': 'Miner Stats',
      'sp': 'Profile',
      'svam': 'View Active Miner',
      'svas': 'View Active Subscription',
      'scs': 'Customer Support',
      'sShare': 'Share',
      'srs': 'Restore Subscription',
      'spp': 'Privacy Policy',
      'sda': 'Delete Account',
      'slo': 'Log Out',
      'st': 'Theme Settings',
      'sth': 'Interface',
      'stas': 'Appearance Settings',
      'sla': 'Language',
      'scss': 'Submit Request',
      'sf': 'Feedback',
      'sf1': 'Thanks for being with us! 🫶 Enjoying the app? A ⭐ rating means a lot to us.',
      'sttr': "Rate Us",
      'smrht': "You haven’t mined anything yet.",
      'sadh': "Are you sure you want to delete your account?",
      'sads': "This will permanently erase all your data. This action cannot be undone.",
      'sadby': "Yes",
      'sadbn': "No",
      'salh': "Are you sure you want to log out of your account?",
      'sallo': "Log Out",
      'salc': "Cancel",
      'salcsd': "✅ Your account has been deleted and all data cleared.",
      "sissm": "🎉 Congratulations! Your @hashrate has been Successfully Subscribed for @day",
      "srt":
          "Restore previously purchased subscriptions linked to your Google account. No charges will occur when restoring.",
      "srwt":
          "Please don’t close the app or press the back button while we restore your subscription. This may take a few seconds.",
      "srsm":
          "Your subscription has been successfully restored. Your mining power is up, and you can continue earning without any interruptions.",
      "snasfua": "No active subscription found in your account.",
      'srd': "Done",
      'rsb': "Restore",

      // active miner
      'amh': 'Active Miner',
      'amyc': 'You currently don’t own any miner NFTs.',
      'amsc': 'No active subscriptions found.',
      'ash': 'Active Subscription',

      // profile page
      'ph': 'Profile',
      'pub': 'UPDATE',
      'pn': 'Name',
      'pe': 'Email',
      'pwa': 'Wallet Address',
      'ppn': 'Phone Number',
      'pne': 'Name is required.',
      'pee': 'Email is required.',
      'ppne': 'Phone number is required.',
      'pwae': 'Wallet Address is required.',
      'pwh': 'Enter Wallet Address',
      'csm': 'Message',
      'csmh': 'Enter your message',

      // payout page
      'prbw': 'You must have at least @rbtc BTC to withdraw.',
      'pop': 'Please read carefully before withdrawa',
      'pod1':
          'Withdrawing Bitcoin (BTC) involves transferring your funds from the exchange or wallet to another BTC address. Before proceeding, ensure that the withdrawal amount meets the platform’s minimum requirement and that your balance is sufficient to cover the network fee.',
      'pod2':
          'The network (miner) fee is dynamic and depends on blockchain traffic. It will be deducted from your total amount. Please double-check the recipient’s Bitcoin address—BTC transactions are irreversible and cannot be reversed if sent to the wrong address.',
      'pod3':
          'As a security measure, all withdrawal requests may require verification steps, such as two-factor authentication (2FA) and email confirmation. We prioritize your security—unauthorized or suspicious withdrawal attempts will be automatically blocked.',
      'pomw': '* Minimum Withdrawal ',
      'pook': 'Okay',
      'poe1': 'Please update your profile before making a withdrawal.',
      'pows': 'Your withdrawal process has begun. You will receive your withdrawal shortly.',

      // Look & UnLook
      "lh": "Lock",
      "lvl": "VAULT LOCKED",
      "lel": "ENABLE LOCK",
      "lclst":
          "Secure channel active Unlock the vault now to claim @lvbalance BTC Lock once. Relax always. Your Bitcoin stays protected.",
      "lptl": "Watch this ad to secure your mined @tolockbtc BTC on a secure, encrypted channel.",
      "lPbsm": "Your mined @lockedbtc BTC is securely locked on a secure channel.",
      "ulh": "Unlock",
      "uvull": "VAULT UNLOCKED",
      "uslst":
          "Secure channel engaged. Unlock the vault now to access your @ulvbalance BTC. Secure access. Full control.",
      'lUPtl':
          "Watch this ad to unlock your vault and access your mined @tounlockbtc BTC instantly.",
      'lUPbsm': "Your @unlockedbtc BTC is now unlocked and ready to claim.",

      // recode page
      'rh': 'Mining Record',
      'rmb': 'Mined BTC',
      'rrb': 'Referral BTC',
      'rkh': 'Top Miners',

      //
      'ssc': 'Select Country',

      // FAQ

      // 🟢 GENERAL
      'q1': 'How to Start Mining?',
      'a1':
          'Go to the home screen and tap on the "Start Mining" button. The mining process will start immediately.',

      'q2': 'Is it possible to collect more USDT?',
      'a2': 'Yes, you can collect more USDT by increasing mining time and boosting Gh/s.',

      'q3': 'How to increase mining time?',
      'a3':
          'Start mining and tap the Hourglass icon. A modal will appear where you can increase mining time up to 2 hours.',

      'q4': 'How to boost mining Gh/s?',
      'a4':
          'Start mining and tap the Boost icon. A modal will appear where you can boost mining speed up to 100 Gh/s.',

      // 🟡 REWARD
      'q5': 'What is a super coin?',
      'a5':
          'A super coin is a special coin used to upgrade mining rig, time, and speed. You can also convert it into USDT.',

      'q6': 'How can I collect super coins?',
      'a6':
          'You can collect super coins daily from the mystery box or by playing the Flip & Win game in the Rewards tab.',

      'q7': 'How to convert super coins into USDT?',
      'a7': 'Go to Profile > Convert Super Coins to convert your super coins into Gold.',

      // 🔵 UPGRADE
      'q8': 'Why should I upgrade rig, speed, and time?',
      'a8': 'Upgrading improves mining performance and allows you to earn more coins faster.',

      'q9': 'How to upgrade rig, speed, and time?',
      'a9': 'You can upgrade using USDT and super coins to enhance your mining performance.',

      'q10': 'Does upgrading affect daily earnings?',
      'a10': 'Yes, upgrading your rig, speed, and time increases your daily mining rewards.',
    },

    // TODO German Translation
    'de_DE': {
      'save': 'Speichern',
      'bh': 'Home',
      'bs': 'Store',
      'bw': 'Wallet',
      'bp': 'Einstellungen',
      'mpith': 'Gesamte Mining-Power',
      'mpit':
      'Um Ihren Miner aktiv zu halten, müssen Sie ihn einmal täglich manuell aktivieren. Nach der Aktivierung schürft er automatisch Bitcoin auf unseren Cloud-Servern, und Sie erhalten Echtzeit-Updates. Bitte beachten Sie, dass die Mining-Power mit der Zeit abnimmt; Sie können diesen Effekt jedoch durch das Abschließen von werbebasierten Aufgaben minimieren. Sie können Ihre Mining-Power auch durch das Ansehen von Werbung erhöhen oder sie sofort durch den Kauf eines Mining-Plans steigern.',
      "nn": "Nicht jetzt",
      "wad": "Jetzt ansehen",
      "wadlb": "Schließen",
      "wadlt": "Sie haben diesen Booster bereits erreicht. Er wird nach 4 Stunden automatisch erneuert.",

      // splash page
      'sht': 'Bitcoin sofort minen, keine Einrichtung erforderlich',
      'shs': 'Ein Fingertipp zum Start – verfolgen Sie Hashrate und Einnahmen live auf Ihrem Handy.',
      'sb': 'Jetzt starten',

      // singIn Page
      'snrh': 'Empfehlungscode eingeben (optional)',
      'snlw': 'Anmelden mit',
      'sncwg': 'Weiter mit Google',
      'sntu': 'Nutzungsbedingungen',
      'snpp': 'Datenschutzbestimmungen',
      'snwgs':
      'Unsere Plattform nutzt Cloud-basierte Mining-Technologie. Ihr mobiles Gerät wird nicht als Mining-Tool verwendet.',
      "cics": "Cloud-Server wird initialisiert",
      "cisc": "Einrichtung abgeschlossen",
      "cisyr": "Wählen Sie Ihre Region",
      "cicr": "Region wählen",
      "ci": "Initialisierung...",
      "csc": "Alles erledigt! Ihr Cloud-Mining-Server ist in der Region @selectedRegion bereit.",
      "cscr": "Sie haben @reward kostenlose Cloud-Mining-Power erhalten, um Ihre Mining-Reise zu beginnen.",
      "cyrs": "Ihr Cloud-Mining-Server wird basierend auf der von Ihnen gewählten Region initialisiert.",
      "ccb": "Weiter",
      "csre": "⚠️ Wählen Sie Ihre Region, um fortzufahren",

      // home page
      'hsb': 'START',
      'hcb': 'Aktueller Kontostand',
      'hms': 'Geschwindigkeit',
      'hsc': 'Super Coin',
      'ham': 'Aktive Miner',
      'hpub': 'Power Up',
      "hab": "Aktiver Booster",
      "hadr": "Mehr lesen",
      'hdr': 'Zeit erhöhen',
      'hdrst': 'Sie können Ihre Mining-Zeit um bis zu @inTime erhöhen.',
      'hdqr': 'Geschwindigkeits-Booster',
      'hdqrst': 'Erhöhen Sie Ihre Mining-Geschwindigkeit auf bis zu @spBooster, um schneller zu verdienen!',
      "hbdht": "Mining-Speed Boost",
      "htdht": "Mining-Zeit Boost",
      "htrwd": "Mining-Belohnung",
      "hbdhst": "Sehen Sie diese Anzeige, um mehr zu verdienen, indem Sie Ihre Mining-Power auf bis zu @power steigern.",
      "htdhst": "Sehen Sie diese Anzeige, um mehr zu verdienen, indem Sie Ihre Mining-Zeit auf bis zu @time verlängern.",
      "htdhat": "Sie haben noch @attempt freie Versuche.",
      "hbrwd": "Sehen Sie diese Anzeige, um eine Bonus-Mining-Belohnung freizuschalten und mehr zu verdienen.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Standard-Boost\nWird alle 24 Stunden automatisch erneuert – verpassen Sie keinen Tag! ⏳',
      "scat": "Super Coin",
      "scht": "Das ist der SuperCoin! Unsere besondere Art, uns für Ihre Treue zu bedanken.",
      "scab": "Verfügbares Guthaben",
      "scuscb": "SuperCoin verwenden",
      "scone": "1 SuperCoin",
      "scn1":
      "SuperCoin ist eine Bonus-Belohnung von uns. Um sie in BTC umzuwandeln, benötigen Sie ein auszahlbares Guthaben von @cbtcb BTC.",
      "sccer": "Entschuldigung, Ihr Guthaben reicht nicht aus, um SuperCoins umzuwandeln.",
      "htbar": "Aktion erforderlich",
      "htbarst": "Mining ist nicht aktiv. Starten Sie das Mining, um die Zeit zu erhöhen.",
      'rzsb': "Fertig",
      'rztc': "Aufgabe abgeschlossen!",
      'rztm': "Glückwunsch! Du hast eine Belohnung von @massage erhalten 🎉",
      "hsmt": "🎥 Schau dir diese Anzeige an, um sofort mit dem Cloud-Mining zu beginnen \nDeine aktuelle Hashrate beträgt @ch",
      "sccs": "SuperCoin-Umwandlung erfolgreich abgeschlossen.",
      "isc": "Ungültiges SuperCoin-Guthaben",


      // store page
      "srz": "Belohnungszone! 🎉",
      "srzst": "Erledigen Sie einfache Aufgaben, um wertvolle Belohnungen freizuschalten 🎁",
      'sspeed': 'Geschwindigkeit',
      'ssst': 'Nutzen Sie den Schieberegler, um Ihre Geschwindigkeit einzustellen, oder wählen Sie einen fertigen Plan.',
      "smuo": "Übersicht der Mining-Einheit",
      "sms": "Mining-Geschwindigkeit",
      "sbms": "Bonus-Mining-Geschwindigkeit",
      "smp": "Mining-Power",
      'smb': 'Mining-Boost',
      'sam': 'Zugewiesene Miner',
      "sbutton": "Details & Vorteile",
      'sob': 'Werbung ansehen & Boost erhalten',
      "est": "Sicheres, müheloses BTC-Mining – jederzeit verfügbar.",
      "sssp": "Standardpreis",
      "ssda": "Angewendeter Rabatt",
      "ssfp": "Endpreis",
      "rwh": "Belohnungen",
      "rzhw": "So funktioniert es",
      "rzar": "Verfügbare Belohnungen",
      "rzrc": "Abgeschlossen",
      "rwt": "Aufgabe:",
      "rwr": "Belohnung:",
      "rwcb": "Anfordern",
      "rwcdb": "Angefordert",
      "rwcloseb": "Schließen",
      "rwcm":
      "➤ Jeweils eine Belohnung – fordern Sie jetzt eine an und erhalten Sie die nächste nach Ablauf des Timers.\n\n➤ Bitte warten Sie, bis der aktuelle Timer abläuft. Sie können ihn auf der Startseite unter 'Aktiver Booster' verfolgen.\n\n➤ Sobald der Timer endet, werden andere Belohnungen automatisch freigeschaltet.",
      "rhrsw": "So funktioniert das Belohnungssystem",
      "rsdt": "Erhalten Sie einen kostenlosen Speed-Boost, um Ihre Mining-Power zu erhöhen!",
      "rsdst":
      "Das Belohnungssystem ermöglicht es Ihnen, zeitlich begrenzte, kostenlose Mining-Boosts zu verdienen, indem Sie Aufgaben wie Werbung ansehen oder Bewertungen abgeben erledigen. Ein toller Weg, ohne Geld zu starten!",
      "rsdst1":
      "🔁 Mit der Aufgabe „Kostenlose Belohnung“ können Sie unbegrenzt oft freie Mining-Zeit anfordern – ohne Limit!",
      "rsdst2":
      "⚠️ Kostenlose Boosts sind weniger leistungsstark als bezahlte Boosts – sie sind als kleiner Bonus gedacht, nicht für volle Performance.",
      "rzst": "Minen Sie kostenlos Bitcoin durch einfache Aufgaben",
      "rzst1":
      "Erledigen Sie Aufgaben wie Anzeigen ansehen, um Punkte zu sammeln und kostenlos zu minen. Steigern Sie Ihre Einnahmen ohne Investition.",
      "rat": "Verfügbar in @atime",

      'sh': 'Hashing-Power',
      'smr': 'Mining-Rig',
      'sv': 'Dauer',
      'smc': 'Anzahl der Miner',
      'sdp': 'Ihr Rabatt',
      'sbv': 'Benchmark-Wert',
      'sa': 'Gesamtpreis',
      'sd': 'Gesparter Preis',
      'ss': 'Abonnieren',
      'spd': 'Plan-Details',
      'sav': 'Ansehen',
      'suyh': 'HashRate upgraden',
      'sas': 'Details & Vorteile',
      's1': 'Erhalten Sie 100% Uptime – durch Ihren dedizierten Miner, auch bei Systemausfällen.',
      's2':
      'Mit dem Abonnement erklären Sie sich mit der Belastung einhergehend einverstanden. Ihr Abo verlängert sich automatisch zum gleichen Preis, sofern es nicht gekündigt wird. Sie stimmen auch unseren ',
      'sspd':
      'Das Abonnement wird automatisch basierend auf Ihrem Plan verlängert, bis Sie kündigen. Sie können es jederzeit in Google Play verwalten.',
      "sslo": "Limitiertes Angebot",

      // wallet page
      'wwb': 'Auszahlen',
      'wwc': 'Belohnungen anfordern',
      'wh': 'Verlauf',
      'wm': 'Mining',
      'wr': 'Empfehlung',
      'whr': 'Sie haben noch keine Auszahlungen vorgenommen.',
      'wmbc': 'Einrichtung abschließen',
      'wmh': 'GUTHABEN',
      'wmte': 'Gesamteinnahmen:',
      'wmw': 'AUSZAHLEN',
      'wrrb': 'EMPFEHLUNGS-GUTHABEN',
      'wrse': 'Teilen & Verdienen',
      'wrati': 'Gesamteinnahmen bisher:',
      'wmcyas': 'Kontoeinrichtung abschließen',
      'wmprdcw':
      'Geben Sie die erforderlichen Details an, um Ihr Konto zu vervollständigen und Auszahlungen zu ermöglichen.',
      'wrgr':
      'Erhöhen Sie Ihr Empfehlungsguthaben jedes Mal, wenn jemand über Ihren Code beitritt und BTC verdient.',

      //setting page
      'ssgr': 'Empfehlungs-Belohnungen',
      'sr': 'Mining-Protokoll',
      'sru': 'Bewerten Sie uns',
      'sl': 'Miner-Statistiken',
      'sp': 'Profil',
      'svam': 'Aktive Miner ansehen',
      'svas': 'Aktive Abonnements ansehen',
      'scs': 'Kundensupport',
      'sShare': 'Teilen',
      'srs': 'Abonnement wiederherstellen',
      'spp': 'Datenschutzrichtlinie',
      'sda': 'Konto löschen',
      'slo': 'Abmelden',
      'st': 'Theme-Einstellungen',
      'sth': 'Benutzeroberfläche',
      'stas': 'Erscheinungsbild',
      'sla': 'Sprache',
      'scss': 'Anfrage senden',
      'sf': 'Feedback',
      'sf1': 'Danke, dass Sie bei uns sind! 🫶 Gefällt Ihnen die App? Eine ⭐ Bewertung bedeutet uns viel.',
      'sttr': "Bewerten Sie uns",
      'smrht': "Sie haben noch nichts gemined.",
      'sadh': "Sind Sie sicher, dass Sie Ihr Konto löschen wollen?",
      'sads': "Dies wird alle Ihre Daten dauerhaft löschen. Dieser Vorgang kann nicht rückgängig gemacht werden.",
      'sadby': "Ja",
      'sadbn': "Nein",
      'salh': "Möchten Sie sich wirklich abmelden?",
      'sallo': "Abmelden",
      'salc': "Abbrechen",
      'salcsd': "✅ Ihr Konto wurde gelöscht und alle Daten entfernt.",
      "sissm": "🎉 Glückwunsch! Ihr @hashrate wurde erfolgreich für @day abonniert.",
      "srt":
      "Stellen Sie zuvor gekaufte Abonnements wieder her, die mit Ihrem Google-Konto verknüpft sind. Es fallen keine Kosten an.",
      "srwt":
      "Bitte schließen Sie die App nicht, während wir Ihr Abonnement wiederherstellen. Dies kann einige Sekunden dauern.",
      "srsm":
      "Ihr Abonnement wurde erfolgreich wiederhergestellt. Ihre Mining-Power ist aktiv.",
      "snasfua":"Kein aktives Abonnement in Ihrem Konto gefunden.",
      'srd': "Fertig",
      'rsb': "Wiederherstellen",

      // active miner
      'amh': 'Aktiver Miner',
      'amyc': 'Sie besitzen derzeit keine Miner-NFTs.',
      'amsc': 'Keine aktiven Abonnements gefunden.',
      'ash': 'Aktives Abonnement',

      // profile page
      'ph': 'Profil',
      'pub': 'AKTUALISIEREN',
      'pn': 'Name',
      'pe': 'E-Mail',
      'pwa': 'Wallet-Adresse',
      'ppn': 'Telefonnummer',
      'pne': 'Name ist erforderlich.',
      'pee': 'E-Mail ist erforderlich.',
      'ppne': 'Telefonnummer ist erforderlich.',
      'pwae': 'Wallet-Adresse ist erforderlich.',
      'pwh': 'Wallet-Adresse eingeben',
      'csm': 'Nachricht',
      'csmh': 'Geben Sie Ihre Nachricht ein',

      // payout page
      'prbw': 'Sie müssen mindestens @rbtc BTC für eine Auszahlung haben.',
      'pop': 'Bitte vor der Auszahlung sorgfältig lesen',
      'pod1':
      'Die Auszahlung von Bitcoin (BTC) beinhaltet den Transfer von der Plattform an eine andere BTC-Adresse. Stellen Sie sicher, dass der Betrag das Minimum erfüllt und Ihr Guthaben die Netzwerkgebühren deckt.',
      'pod2':
      'Die Netzwerkgebühr ist dynamisch und hängt vom Blockchain-Verkehr ab. Sie wird vom Gesamtbetrag abgezogen. Bitte prüfen Sie die Zieladresse genau – BTC-Transaktionen sind unumkehrbar.',
      'pod3':
      'Als Sicherheitsmaßnahme können Verifizierungsschritte (wie 2FA) erforderlich sein. Wir priorisieren Ihre Sicherheit – verdächtige Versuche werden blockiert.',
      'pomw': '* Mindestauszahlung ',
      'pook': 'Okay',
      'poe1': 'Bitte aktualisieren Sie Ihr Profil vor einer Auszahlung.',
      'pows': 'Ihr Auszahlungsprozess hat begonnen. Sie erhalten Ihr Guthaben in Kürze.',

      // Look & UnLook
      "lh": "Sperren",
      "lvl": "TRESOR GESPERRT",
      "lel": "SPERRE AKTIVIEREN",
      "lclst":
      "Sicherer Kanal aktiv. Entsperren Sie den Tresor, um @lvbalance BTC zu beanspruchen. Einmal sperren, immer entspannt sein.",
      "lptl": "Anzeige ansehen, um Ihre geminten @tolockbtc BTC auf einem verschlüsselten Kanal zu sichern.",
      "lPbsm": "Ihre geminten @lockedbtc BTC sind sicher auf einem geschützten Kanal gesperrt.",
      "ulh": "Entsperren",
      "uvull": "TRESOR ENTSPERRT",
      "uslst":
      "Sicherer Kanal verbunden. Entsperren Sie den Tresor, um auf Ihre @ulvbalance BTC zuzugreifen.",
      'lUPtl':
      "Anzeige ansehen, um den Tresor zu öffnen und sofort auf Ihre @tounlockbtc BTC zuzugreifen.",
      'lUPbsm': "Ihre @unlockedbtc BTC sind nun entsperrt und bereit.",

      // record page
      'rh': 'Mining-Protokoll',
      'rmb': 'Geminte BTC',
      'rrb': 'Empfehlungs-BTC',
      'rkh': 'Top-Miner',

      //
      'ssc': 'Land auswählen',

      // FAQ
      // 🟢 ALLGEMEIN
      'q1': 'Wie starte ich das Mining?',
      'a1':
      'Gehen Sie zum Startbildschirm und tippen Sie auf „Start Mining“. Der Prozess beginnt sofort.',

      'q2': 'Ist es möglich, mehr USDT zu sammeln?',
      'a2': 'Ja, Sie können mehr USDT sammeln, indem Sie die Mining-Zeit erhöhen und die Gh/s boosten.',

      'q3': 'Wie erhöhe ich die Mining-Zeit?',
      'a3':
      'Starten Sie das Mining und tippen Sie auf das Sanduhr-Icon. Dort können Sie die Zeit um bis zu 2 Stunden verlängern.',

      'q4': 'Wie booste ich die Gh/s?',
      'a4':
      'Tippen Sie während des Minings auf das Boost-Icon. Dort können Sie die Geschwindigkeit auf bis zu 100 Gh/s erhöhen.',

      // 🟡 BELOHNUNG
      'q5': 'Was ist ein SuperCoin?',
      'a5':
      'Ein SuperCoin ist eine spezielle Münze, um Rig, Zeit und Speed zu upgraden oder sie in USDT umzuwandeln.',

      'q6': 'Wie sammle ich SuperCoins?',
      'a6':
      'Sie können SuperCoins täglich aus der Mystery Box oder durch das „Flip & Win“-Spiel im Belohnungs-Tab erhalten.',

      'q7': 'Wie tausche ich SuperCoins in USDT?',
      'a7': 'Gehen Sie zu Profil > SuperCoins umwandeln, um sie in Gold zu tauschen.',

      // 🔵 UPGRADE
      'q8': 'Warum sollte ich Rig, Speed und Zeit upgraden?',
      'a8': 'Upgrades verbessern die Mining-Leistung und lassen Sie schneller Coins verdienen.',

      'q9': 'Wie führe ich Upgrades durch?',
      'a9': 'Sie können USDT und SuperCoins verwenden, um Ihre Leistung zu steigern.',

      'q10': 'Beeinflussen Upgrades die täglichen Einnahmen?',
      'a10': 'Ja, Upgrades erhöhen Ihre täglichen Mining-Belohnungen direkt.',
    },

    // TODO French Translation
    'fr_FR': {
      'save': 'Enregistrer',
      'bh': 'Accueil',
      'bs': 'Boutique',
      'bw': 'Portefeuille',
      'bp': 'Paramètres',
      'mpith': 'Puissance de Minage Totale',
      'mpit':
      'Pour maintenir votre mineur actif, vous devez l\'activer manuellement une fois par jour. Une fois activé, il minera automatiquement du Bitcoin sur nos serveurs cloud, et vous recevrez des mises à jour en temps réel. Veuillez noter que la puissance de minage diminue progressivement avec le temps ; cependant, vous pouvez minimiser cet effet en accomplissant des tâches publicitaires. Vous pouvez également augmenter votre puissance de minage en regardant des publicités ou la booster instantanément en achetant un plan de minage.',
      "nn": "Pas maintenant",
      "wad": "Regarder maintenant",
      "wadlb": "Fermer",
      "wadlt": "Vous avez déjà atteint ce booster. Il se renouvellera automatiquement après 4 heures.",

      // splash page
      'sht': 'Minez du Bitcoin instantanément, sans configuration',
      'shs': 'Un seul clic pour démarrer — suivez votre hashrate et vos gains en direct sur votre téléphone.',
      'sb': 'Commencer',

      // singIn Page
      'snrh': 'Entrer le code de parrainage (Optionnel)',
      'snlw': 'Se connecter avec',
      'sncwg': 'Continuer avec Google',
      'sntu': 'Conditions d\'utilisation',
      'snpp': 'Politique de confidentialité',
      'snwgs':
      'Notre plateforme utilise la technologie de minage sur le cloud. Votre appareil mobile n\'est pas utilisé comme outil de minage.',
      "cics": "Initialisation du serveur Cloud",
      "cisc": "Configuration terminée",
      "cisyr": "Sélectionnez votre région",
      "cicr": "Choisir la région",
      "ci": "Initialisation...",
      "csc": "Tout est prêt ! Votre serveur de minage cloud est prêt dans la région @selectedRegion",
      "cscr": "Vous avez reçu @reward de puissance de minage cloud gratuite pour commencer votre aventure.",
      "cyrs": "Votre serveur de minage cloud sera initialisé en fonction de la région que vous choisissez.",
      "ccb": "Continuer",
      "csre": "⚠️ Choisissez votre région pour continuer",

      // home page
      'hsb': 'DÉMARRER',
      'hcb': 'Solde actuel',
      'hms': 'Vitesse',
      'hsc': 'Super Coin',
      'ham': 'Mineurs actifs',
      'hpub': 'Booster',
      "hab": "Booster actif",
      "hadr": "En savoir plus",
      'hdr': 'Augmenter le temps',
      'hdrst': 'Vous pouvez augmenter votre temps de minage jusqu\'à @inTime.',
      'hdqr': 'Booster de vitesse',
      'hdqrst': 'Augmentez votre vitesse de minage jusqu\'à @spBooster pour gagner plus vite !',
      "hbdht": "Boost de vitesse de minage",
      "htdht": "Boost de temps de minage",
      "htrwd": "Récompense de minage",
      "hbdhst": "Regardez cette publicité pour gagner plus en boostant votre puissance de minage jusqu'à @power.",
      "htdhst": "Regardez cette publicité pour gagner plus en prolongeant votre temps de minage jusqu'à @time.",
      "htdhat": "Il vous reste @attempt tentative(s) gratuite(s).",
      "hbrwd": "Regardez cette publicité pour débloquer une récompense bonus et gagner plus.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Boost Standard\nSe renouvelle automatiquement toutes les 24 heures – ne manquez pas un jour ! ⏳',
      "scat": "Super Coin",
      "scht": "Découvrez le SuperCoin ! Notre façon spéciale de vous remercier de faire partie de notre application.",
      "scab": "Solde disponible",
      "scuscb": "Utiliser SuperCoin",
      "scone": "1 SuperCoin",
      "scn1":
      "Le SuperCoin est une récompense bonus. Pour le convertir en BTC, vous devez avoir un solde de @cbtcb BTC retirable.",
      "sccer": "Désolé, votre solde est insuffisant pour convertir des SuperCoins.",
      "htbar": "Action requise",
      "htbarst": "Le minage n'est pas actif. Démarrez le minage pour augmenter le temps.",
      'rzsb': "Terminé",
      'rztc': "Tâche accomplie !",
      'rztm': "Félicitations ! Vous avez reçu une récompense de @massage 🎉",
      "hsmt": "🎥 Regardez cette publicité pour commencer le minage cloud instantanément \nVotre hashrate actuel est de @ch",
      "sccs": "Conversion de SuperCoin réussie.",
      "isc": "Solde de SuperCoin non valide",

      // store page
      "srz": "Zone de récompenses ! 🎉",
      "srzst": "Accomplissez des tâches simples pour débloquer des récompenses précieuses 🎁",
      'sspeed': 'Vitesse',
      'ssst': 'Déplacez le curseur pour régler votre vitesse, ou choisissez un plan prêt à l\'emploi ci-dessous.',
      "smuo": "Aperçu de l'unité de minage",
      "sms": "Vitesse de minage",
      "sbms": "Vitesse de minage bonus",
      "smp": "Puissance de minage",
      'smb': 'Boost de minage',
      'sam': 'Mineurs alloués',
      "sbutton": "Détails & Avantages",
      'sob': 'Regarder la pub & Boost',
      "est": "Minage de BTC sécurisé et sans effort — disponible à tout moment.",
      "sssp": "Prix standard",
      "ssda": "Remise appliquée",
      "ssfp": "Prix final",
      "rwh": "Récompenses",
      "rzhw": "Comment ça marche",
      "rzar": "Récompenses disponibles",
      "rzrc": "Terminé",
      "rwt": "Tâche :",
      "rwr": "Récompense :",
      "rwcb": "Réclamer",
      "rwcdb": "Réclamé",
      "rwcloseb": "Fermer",
      "rwcm":
      "➤ Une récompense à la fois — réclamez-la maintenant et obtenez la suivante après le minuteur.\n\n➤ Veuillez attendre la fin du minuteur actuel. Vous pouvez le suivre sur la page d'accueil sous 'Booster actif'.\n\n➤ Une fois le minuteur terminé, les autres récompenses se débloqueront automatiquement.",
      "rhrsw": "Comment fonctionne le système de récompenses",
      "rsdt": "Gagnez un boost de vitesse gratuit pour augmenter votre puissance !",
      "rsdst":
      "Le système de récompenses vous permet de gagner de petits boosts de vitesse gratuits pour une durée limitée en effectuant des tâches simples comme regarder des publicités ou laisser des avis. C'est une façon amusante de commencer sans dépenser d'argent !",
      "rsdst1":
      "🔁 Vous pouvez réclamer un temps de minage gratuit illimité avec la tâche « Récompense gratuite » — aucune limite !",
      "rsdst2":
      "⚠️ Les boosts gratuits sont moins puissants que les boosts payants — ils sont conçus pour donner un petit coup de pouce, pas une performance totale.",
      "rzst": "Minez du Bitcoin gratuitement en accomplissant des tâches",
      "rzst1":
      "Complétez des tâches simples pour gagner des points et commencer à miner sans frais. Augmentez vos gains sans investissement.",
      "rat": "Disponible dans @atime",

      'sh': 'Puissance de hachage',
      'smr': 'Rig de minage',
      'sv': 'Durée',
      'smc': 'Nombre de mineurs',
      'sdp': 'Votre remise',
      'sbv': 'Valeur de référence',
      'sa': 'Prix total',
      'sd': 'Économie',
      'ss': 'S\'abonner',
      'spd': 'Détails du plan',
      'sav': 'Voir',
      'suyh': 'Améliorer votre HashRate',
      'sas': 'Détails & Avantages',
      's1': 'Obtenez 100 % de disponibilité — soutenu par votre mineur dédié, même en cas d\'arrêt du système.',
      's2':
      'En vous abonnant, vous acceptez d\'être débité. Votre abonnement se renouvelle automatiquement au même prix et pour la même durée, sauf annulation. Vous acceptez également nos ',
      'sspd':
      'L\'abonnement sera automatiquement renouvelé selon votre plan jusqu\'à annulation. Vous pouvez le gérer à tout moment sur Google Play.',
      "sslo": "Offre limitée",

      // wallet page
      'wwb': 'Retirer',
      'wwc': 'Réclamer les récompenses',
      'wh': 'Historique',
      'wm': 'Minage',
      'wr': 'Parrainage',
      'whr': 'Vous n\'avez pas encore effectué de retrait.',
      'wmbc': 'Terminer la configuration',
      'wmh': 'SOLDE',
      'wmte': 'Gains totaux :',
      'wmw': 'RETRAIT',
      'wrrb': 'SOLDE DE PARRAINAGE',
      'wrse': 'Partager pour gagner',
      'wrati': 'Revenu total :',
      'wmcyas': 'Compléter la configuration du compte',
      'wmprdcw':
      'Fournissez les détails requis pour finaliser votre compte et activer le retrait de fonds.',
      'wrgr':
      'Augmentez votre solde de parrainage chaque fois que quelqu\'un rejoint l\'app via votre code.',

      //setting page
      'ssgr': 'Récompenses de parrainage',
      'sr': 'Historique de minage',
      'sru': 'Notez-nous',
      'sl': 'Stats du mineur',
      'sp': 'Profil',
      'svam': 'Voir le mineur actif',
      'svas': 'Voir l\'abonnement actif',
      'scs': 'Service client',
      'sShare': 'Partager',
      'srs': 'Restaurer l\'abonnement',
      'spp': 'Politique de confidentialité',
      'sda': 'Supprimer le compte',
      'slo': 'Déconnexion',
      'st': 'Paramètres du thème',
      'sth': 'Interface',
      'stas': 'Paramètres d\'apparence',
      'sla': 'Langue',
      'scss': 'Envoyer une demande',
      'sf': 'Commentaires',
      'sf1': 'Merci d\'être avec nous ! 🫶 Vous aimez l\'application ? Une note ⭐ signifie beaucoup pour nous.',
      'sttr': "Notez-nous",
      'smrht': "Vous n'avez encore rien miné.",
      'sadh': "Êtes-vous sûr de vouloir supprimer votre compte ?",
      'sads': "Cela effacera définitivement toutes vos données. Cette action est irréversible.",
      'sadby': "Oui",
      'sadbn': "Non",
      'salh': "Êtes-vous sûr de vouloir vous déconnecter ?",
      'sallo': "Déconnexion",
      'salc': "Annuler",
      'salcsd': "✅ Votre compte a été supprimé et toutes les données effacées.",
      "sissm": "🎉 Félicitations ! Votre @hashrate a été activé avec succès pour @day",
      "srt":
      "Restaurez les abonnements achetés précédemment liés à votre compte Google. Aucun frais ne sera appliqué lors de la restauration.",
      "srwt":
      "Veuillez ne pas fermer l'application ni appuyer sur le bouton retour pendant que nous restaurons votre abonnement.",
      "srsm":
      "Votre abonnement a été restauré avec succès. Votre puissance de minage est active.",
      "snasfua":"Aucun abonnement actif trouvé sur votre compte.",
      'srd': "Terminé",
      'rsb': "Restaurer",

      // active miner
      'amh': 'Mineur actif',
      'amyc': 'Vous ne possédez actuellement aucun NFT de mineur.',
      'amsc': 'Aucun abonnement actif trouvé.',
      'ash': 'Abonnement actif',

      // profile page
      'ph': 'Profil',
      'pub': 'METTRE À JOUR',
      'pn': 'Nom',
      'pe': 'E-mail',
      'pwa': 'Adresse du portefeuille',
      'ppn': 'Numéro de téléphone',
      'pne': 'Le nom est obligatoire.',
      'pee': 'L\'e-mail est obligatoire.',
      'ppne': 'Le numéro de téléphone est obligatoire.',
      'pwae': 'L\'adresse du portefeuille est obligatoire.',
      'pwh': 'Entrez l\'adresse du portefeuille',
      'csm': 'Message',
      'csmh': 'Entrez votre message',

      // payout page
      'prbw': 'Vous devez avoir au moins @rbtc BTC pour retirer.',
      'pop': 'Veuillez lire attentivement avant le retrait',
      'pod1':
      'Le retrait de Bitcoin (BTC) implique le transfert de vos fonds vers une autre adresse BTC. Assurez-vous que le montant respecte le minimum requis.',
      'pod2':
      'Les frais de réseau (mineur) sont dynamiques. Ils seront déduits de votre montant total. Vérifiez bien l\'adresse — les transactions BTC sont irréversibles.',
      'pod3':
      'Par mesure de sécurité, des étapes de vérification (2FA) peuvent être requises. Nous bloquons automatiquement les tentatives suspectes.',
      'pomw': '* Retrait minimum ',
      'pook': 'D\'accord',
      'poe1': 'Veuillez mettre à jour votre profil avant d\'effectuer un retrait.',
      'pows': 'Le processus de retrait a commencé. Vous recevrez vos fonds sous peu.',

      // Look & UnLook
      "lh": "Verrouiller",
      "lvl": "COFFRE VERROUILLÉ",
      "lel": "ACTIVER LE VERROUILLAGE",
      "lclst":
      "Canal sécurisé actif. Déverrouillez le coffre pour réclamer @lvbalance BTC.",
      "lptl": "Regardez cette publicité pour sécuriser vos @tolockbtc BTC minés sur un canal crypté.",
      "lPbsm": "Vos @lockedbtc BTC minés sont verrouillés en toute sécurité.",
      "ulh": "Déverrouiller",
      "uvull": "COFFRE DÉVERROUILLÉ",
      "uslst":
      "Canal sécurisé engagé. Déverrouillez le coffre pour accéder à vos @ulvbalance BTC.",
      'lUPtl':
      "Regardez cette publicité pour déverrouiller votre coffre et accéder instantanément à vos @tounlockbtc BTC.",
      'lUPbsm': "Vos @unlockedbtc BTC sont maintenant déverrouillés et prêts à être réclamés.",

      // record page
      'rh': 'Historique de minage',
      'rmb': 'BTC minés',
      'rrb': 'BTC parrainage',
      'rkh': 'Top Mineurs',

      //
      'ssc': 'Sélectionner le pays',

      // FAQ
      // 🟢 GÉNÉRAL
      'q1': 'Comment démarrer le minage ?',
      'a1':
      'Allez sur l\'écran d\'accueil et appuyez sur le bouton "Démarrer le minage". Le processus commence immédiatement.',

      'q2': 'Est-il possible de collecter plus d\'USDT ?',
      'a2': 'Oui, vous pouvez collecter plus d\'USDT en augmentant le temps de minage et en boostant les Gh/s.',

      'q3': 'Comment augmenter le temps de minage ?',
      'a3':
      'Démarrez le minage et appuyez sur l\'icône Sablier pour augmenter le temps jusqu\'à 2 heures.',

      'q4': 'Comment booster les Gh/s ?',
      'a4':
      'Appuyez sur l\'icône Boost pendant le minage pour augmenter la vitesse jusqu\'à 100 Gh/s.',

      // 🟡 RÉCOMPENSE
      'q5': 'Qu\'est-ce qu\'un SuperCoin ?',
      'a5':
      'Un SuperCoin est une pièce spéciale pour améliorer votre rig, le temps et la vitesse. Vous pouvez aussi le convertir.',

      'q6': 'Comment collecter des SuperCoins ?',
      'a6':
      'Vous pouvez en collecter via la boîte mystère quotidienne ou le jeu Flip & Win.',

      'q7': 'Comment convertir les SuperCoins en USDT ?',
      'a7': 'Allez dans Profil > Convertir les SuperCoins pour les transformer en Or.',

      // 🔵 AMÉLIORATION
      'q8': 'Pourquoi améliorer le rig, la vitesse et le temps ?',
      'a8': 'Cela améliore les performances et vous permet de gagner des pièces plus rapidement.',

      'q9': 'Comment effectuer une amélioration ?',
      'a9': 'Vous pouvez utiliser des USDT et des SuperCoins pour booster vos performances.',

      'q10': 'L\'amélioration affecte-t-elle les gains quotidiens ?',
      'a10': 'Oui, cela augmente vos récompenses de minage quotidiennes.',
    },

    // TODO Swahili Translation
    'sw_KE': {
      'save': 'Hifadhi',
      'bh': 'Nyumbani',
      'bs': 'Duka',
      'bw': 'Mkoba',
      'bp': 'Mipangilio',
      'mpith': 'Jumla ya Nguvu ya Uchimbaji',
      'mpit':
      'Ili kuweka mchimba mchimba wako (miner) akifanya kazi, lazima umwashe mwenyewe mara moja kila siku. Akishawashwa, atachimba Bitcoin moja kwa moja kwenye seva zetu za cloud, na utapokea taarifa za wakati halisi. Tafadhali kumbuka kuwa nguvu ya uchimbaji hupungua kidogo kidogo baada ya muda; hata hivyo, unaweza kupunguza hali hii kwa kukamilisha kazi za matangazo. Unaweza pia kuongeza nguvu yako ya uchimbaji kwa kutazama matangazo au kuiongeza papo hapo kwa kununua mpango wa uchimbaji.',
      "nn": "Sio Sasa",
      "wad": "Tazama Sasa",
      "wadlb": "Funga",
      "wadlt": "Tayari umefikia nyongeza hii. Itajisasisha kiotomatiki baada ya saa 4.",

      // splash page
      'sht': 'Chimba Bitcoin Papo Hapo, Hakuna Usanidi Unaohitajika',
      'shs': 'Gusa mara moja kuanza — fuatilia hashrate na mapato mubashara kutoka kwenye simu yako.',
      'sb': 'Anza Sasa',

      // singIn Page
      'snrh': 'Weka Nambari ya Rufaa (Hiari)',
      'snlw': 'Ingia Na',
      'sncwg': 'Endelea na Google',
      'sntu': 'Masharti ya Matumizi',
      'snpp': 'Sera ya Faragha',
      'snwgs':
      'Jukwaa letu linatumia teknolojia ya uchimbaji wa cloud. Simu yako haitumiwi kama zana ya uchimbaji.',
      "cics": "Inatayarisha Seva ya Cloud",
      "cisc": "Usanidi Umekamilika",
      "cisyr": "Chagua Eneo Lako",
      "cicr": "Chagua Eneo",
      "ci": "Inatayarisha...",
      "csc": "Imekamilika! Seva yako ya uchimbaji wa cloud iko tayari katika eneo la @selectedRegion",
      "cscr": "Umepokea @reward ya nguvu ya bure ya uchimbaji wa cloud ili kuanza safari yako.",
      "cyrs": "Seva yako ya uchimbaji itatayarishwa kulingana na eneo unalochagua.",
      "ccb": "Endelea",
      "csre":"⚠️ Chagua eneo lako ili kuendelea",

      // home page
      'hsb': 'ANZA',
      'hcb': 'Salio la Sasa',
      'hms': 'Kasi',
      'hsc': 'Super Coin',
      'ham': 'Wachimba Madini Amilifu',
      'hpub': 'Ongeza Nguvu',
      "hab": "Nyongeza Amilifu",
      "hadr": "Soma Zaidi",
      'hdr': 'Ongeza Muda',
      'hdrst': 'Unaweza kuongeza muda wako wa uchimbaji hadi @inTime.',
      'hdqr': 'Nyongeza ya Kasi',
      'hdqrst': 'Ongeza kasi yako ya uchimbaji hadi @spBooster ili upate haraka!',
      "hbdht": "Nyongeza ya Kasi ya Uchimbaji",
      "htdht": "Nyongeza ya Muda wa Uchimbaji",
      "htrwd": "Tuzo ya Uchimbaji",
      "hbdhst": "Tazama tangazo hili ili upate zaidi kwa kuongeza nguvu yako ya uchimbaji hadi @power.",
      "htdhst": "Tazama tangazo hili ili upate zaidi kwa kuongeza muda wako wa uchimbaji hadi @time.",
      "htdhat": "Umebakiza jaribio @attempt la bure.",
      "hbrwd": "Tazama tangazo hili ili kufungua tuzo ya ziada ya uchimbaji na upate zaidi.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Nyongeza ya Kawaida\nInajirejesha kiotomatiki kila baada ya saa 24 – usikose hata siku moja! ⏳',
      "scat": "Super Coin",
      "scht": "Kutana na SuperCoin! Njia yetu maalum ya kusema asante kwa kuwa sehemu ya programu yetu.",
      "scab": "Salio Linalopatikana",
      "scuscb": "Tumia SuperCoin",
      "scone": "SuperCoin 1",
      "scn1":
      "SuperCoin ni tuzo ya ziada kutoka kwetu. Ili kuibadilisha kuwa BTC, unahitaji kuwa na salio la @cbtcb BTC linaloweza kutolewa.",
      "sccer":"Samahani, huna salio la kutosha kubadilisha SuperCoin.",
      "htbar":"Hatua Inahitajika",
      "htbarst":"Uchimbaji haujawashwa. Anza uchimbaji ili kuongeza muda.",
      'rzsb': "Imekamilika",
      'rztc': "Kazi Imekamilika!",
      'rztm': "Hongera! Umepokea tuzo ya @massage 🎉",
      "hsmt": "🎥 Tazama tangazo hili ili kuanza uchimbaji wa cloud papo hapo \nKasi yako ya sasa ya hashrate ni @ch",
      "sccs": "Ubadilishaji wa SuperCoin umekamilika kwa mafanikio.",
      "isc": "Salio la SuperCoin si sahihi",

      // store page
      "srz": "Eneo la Zawadi! 🎉",
      "srzst": "Kamilisha kazi rahisi ili kufungua zawadi zenye thamani 🎁",
      'sspeed': 'Kasi',
      'ssst': 'Sogeza kitelezi ili kuweka kasi yako ya uchimbaji, au chagua mpango uliotayarishwa hapa chini.',
      "smuo": "Maelezo ya Kitengo cha Uchimbaji",
      "sms": "Kasi ya Uchimbaji",
      "sbms": "Kasi ya Ziada ya Uchimbaji",
      "smp": "Nguvu ya Uchimbaji",
      'smb': 'Nyongeza ya Uchimbaji',
      'sam': 'Wachimba Madini Waliotengwa',
      "sbutton": "Maelezo na Manufaa",
      'sob': 'Tazama Tangazo na Ongeza',
      "est":"Uchimbaji wa BTC salama na rahisi — unapatikana wakati wowote.",
      "sssp": "Bei ya Kawaida",
      "ssda": "Punguzo Limetumika",
      "ssfp": "Bei ya Mwisho",
      "rwh": "Zawadi",
      "rzhw": "Inavyofanya Kazi",
      "rzar": "Zawadi Zinazopatikana",
      "rzrc": "Imekamilika",
      "rwt": "Kazi:",
      "rwr": "Zawadi:",
      "rwcb": "Chukua",
      "rwcdb": "Imechuliwa",
      "rwcloseb": "Funga",
      "rwcm":
      "➤ Zawadi moja kwa wakati mmoja — chukua sasa na upate inayofuata baada ya kipima muda.\n\n➤ Tafadhali subiri hadi kipima muda cha sasa kiishe. Unaweza kukifuatilia kwenye Ukurasa wa Nyumbani chini ya 'Nyongeza Amilifu'.\n\n➤ Mara tu kipima muda kikiisha, zawadi nyingine zitafunguka kiotomatiki.",
      "rhrsw": "Jinsi Mfumo wa Zawadi Unavyofanya Kazi",
      "rsdt": "Jipatie nyongeza ya kasi ya bure ili kuongeza nguvu yako ya uchimbaji!",
      "rsdst":
      "Mfumo wa Zawadi hukuruhusu kupata nyongeza ndogo za kasi ya uchimbaji bure kwa muda mfupi kwa kukamilisha kazi rahisi kama kutazama matangazo, kutoa maoni, au kukamilisha ofa. Ni njia nzuri ya kuanza kuchimba bila kutumia pesa!",
      "rsdst1":
      "🔁 Unaweza kuchukua muda wa bure usio na kikomo wa kasi ya uchimbaji kwa kazi ya “Zawadi ya Bure” — hakuna kikomo!",
      "rsdst2":
      "⚠️ Nyongeza za kasi za bure zina nguvu kidogo kuliko zile za kulipia — zimeundwa kukupa msukumo mdogo, sio utendaji kamili.",
      "rzst": "Chimba Bitcoin bure kwa kukamilisha kazi rahisi",
      "rzst1":
      "Kamilisha kazi rahisi kama kutazama matangazo na kuacha maoni ili upate pointi na uanze kuchimba bila gharama. Kuza mapato yako kwa urahisi—hakuna uwekezaji unaohitajika.",
      "rat":"Inapatikana baada ya @atime",

      'sh': 'Nguvu ya Hashing',
      'smr': 'Mtambo wa Uchimbaji',
      'sv': 'Muda',
      'smc': 'Idadi ya Wachimbaji',
      'sdp': 'Punguzo Lako',
      'sbv': 'Thamani ya Kipimo',
      'sa': 'Jumla ya Bei',
      'sd': 'Okoa Bei',
      'ss': 'Jiandikishe',
      'spd': 'Maelezo ya Mpango',
      'sav': 'Angalia',
      'suyh': 'Boresha HashRate Yako',
      'sas': 'Maelezo na Manufaa',
      's1': 'Pata muda wa 100% wa kufanya kazi—ukisaidiwa na mchimba mchimba wako maalum, hata wakati wa hitilafu za mfumo.',
      's2':
      'Kwa kujiandikisha, unakubali kutozwa gharama. Usajili wako unajisasisha kiotomatiki kwa bei na muda ule ule isipokuwa ughairi. Pia unakubaliana na ',
      'sspd':
      'Usajili utajirejesha kiotomatiki kulingana na mpango wako hadi ughairi. Unaweza kuusimamia wakati wowote kwenye Google Play.',
      "sslo": "Ofa ya Muda Mfupi",

      // wallet page
      'wwb': 'Toa Pesa',
      'wwc': 'Chukua Zawadi',
      'wh': 'Historia',
      'wm': 'Uchimbaji',
      'wr': 'Rufaa',
      'whr': 'Bado haujatoa pesa yoyote.',
      'wmbc': 'Kamilisha Usanidi',
      'wmh': 'SALIO',
      'wmte': 'Jumla ya Mapato:',
      'wmw': 'TOA PESA',
      'wrrb': 'SALIO LA RUFAA',
      'wrse': 'Shiriki ili Upate',
      'wrati': 'Mapato ya Muda Wote:',
      'wmcyas': 'Kamilisha Usanidi wa Akaunti Yako',
      'wmprdcw':
      'Toa maelezo yanayohitajika ili kukamilisha usanidi wa akaunti yako na kuwezesha kutoa pesa.',
      'wrgr':
      'Kuza salio lako la Rufaa kila wakati mtu anapojiunga kwa kutumia nambari yako ya rufaa na kupata BTC.',

      //setting page
      'ssgr': 'Zawadi za Rufaa',
      'sr': 'Rekodi ya Uchimbaji',
      'sru': 'Tuthamini',
      'sl': 'Takwimu za Mchimba Madini',
      'sp': 'Wasifu',
      'svam': 'Angalia Mchimba Madini Amilifu',
      'svas': 'Angalia Usajili Amilifu',
      'scs': 'Huduma kwa Wateja',
      'sShare': 'Shiriki',
      'srs': 'Rejesha Usajili',
      'spp': 'Sera ya Faragha',
      'sda': 'Futa Akaunti',
      'slo': 'Ondoka',
      'st': 'Mipangilio ya Mandhari',
      'sth': 'Muonekano',
      'stas': 'Mipangilio ya Muonekano',
      'sla': 'Lugha',
      'scss': 'Tuma Ombi',
      'sf': 'Maoni',
      'sf1': 'Asante kwa kuwa nasi! 🫶 Unafurahia programu? Ukadiriaji wa ⭐ una maana kubwa kwetu.',
      'sttr': "Tuthamini",
      'smrht': "Bado haujachimba chochote.",
      'sadh': "Je, una uhakika unataka kufuta akaunti yako?",
      'sads': "Hii itafuta data zako zote kabisa. Kitendo hiki hakiwezi kubatilishwa.",
      'sadby': "Ndiyo",
      'sadbn': "Hapana",
      'salh': "Je, una uhakika unataka kuondoka kwenye akaunti yako?",
      'sallo': "Ondoka",
      'salc': "Ghairi",
      'salcsd': "✅ Akaunti yako imefutwa na data zote zimesafishwa.",
      "sissm": "🎉 Hongera! @hashrate yako imesajiliwa kwa mafanikio kwa @day",
      "srt":
      "Rejesha usajili uliionunua hapo awali uliyounganishwa na akaunti yako ya Google. Hakuna gharama zitakazotozwa wakati wa kurejesha.",
      "srwt":
      "Tafadhali usifunge programu au kubonyeza kitufe cha nyuma wakati tunarejesha usajili wako. Hii inaweza kuchukua sekunde chache.",
      "srsm":
      "Usajili wako umerejeshwa kwa mafanikio. Nguvu yako ya uchimbaji imeongezeka, na unaweza kuendelea kupata bila usumbufu wowote.",
     "snasfua": "Hakuna usajili unaotumika uliopatikana kwenye akaunti yako.",
      'srd': "Tayari",
      'rsb': "Rejesha",

      // active miner
      'amh': 'Mchimba Madini Amilifu',
      'amyc': 'Kwa sasa humiliki NFT zozote za mchimba madini.',
      'amsc': 'Hakuna usajili amilifu uliopatikana.',
      'ash': 'Usajili Amilifu',

      // profile page
      'ph': 'Wasifu',
      'pub': 'SASISHA',
      'pn': 'Jina',
      'pe': 'Barua Pepe',
      'pwa': 'Anwani ya Mkoba',
      'ppn': 'Nambari ya Simu',
      'pne': 'Jina linahitajika.',
      'pee': 'Barua pepe inahitajika.',
      'ppne': 'Nambari ya simu inahitajika.',
      'pwae': 'Anwani ya mkoba inahitajika.',
      'pwh': 'Weka Anwani ya Mkoba',
      'csm': 'Ujumbe',
      'csmh': 'Weka ujumbe wako',

      // payout page
      'prbw': 'Lazima uwe na angalau @rbtc BTC ili kutoa.',
      'pop': 'Tafadhali soma kwa makini kabla ya kutoa pesa',
      'pod1':
      'Kutoa Bitcoin (BTC) kunahusisha kuhamisha fedha zako kutoka kwenye soko au mkoba kwenda kwenye anwani nyingine ya BTC. Kabla ya kuendelea, hakikisha kiasi unachotoa kinafikia mahitaji ya chini ya jukwaa na salio lako linatosha kulipia ada ya mtandao.',
      'pod2':
      'Ada ya mtandao (mchimba madini) inabadilika na inategemea msongamano wa blockchain. Itakatwa kutoka kwenye kiasi chako cha jumla. Tafadhali kagua tena anwani ya Bitcoin ya mpokeaji—miamala ya BTC haiwezi kubatilishwa ikiwa imetumwa kwenye anwani isiyo sahihi.',
      'pod3':
      'Kama hatua ya usalama, maombi yote ya kutoa pesa yanaweza kuhitaji hatua za uhakiki, kama vile uthibitishaji wa sababu mbili (2FA) na uthibitisho wa barua pepe. Tunapa kipaumbele usalama wako—majaribio yasiyoruhusiwa au yenye kutiliwa shaka yatazuiwa kiotomatiki.',
      'pomw': '* Kiwango cha Chini cha Kutoa ',
      'pook': 'Sawa',
      'poe1': 'Tafadhali sasisha wasifu wako kabla ya kutoa pesa.',
      'pows': 'Mchakato wako wa kutoa pesa umeanza. Utapokea pesa zako hivi karibuni.',

      // Look & UnLook
      "lh": "Funga",
      "lvl": "VANTI IMEFUNGWA",
      "lel": "WEZESHA KUFUNGA",
      "lclst":
      "Chanzo salama kiko amilifu. Fungua vanti sasa ili uchukue @lvbalance BTC. Funga mara moja. Tulia daima. Bitcoin yako inabaki imelindwa.",
      "lptl": "Tazama tangazo hili ili kulinda @tolockbtc BTC zako ulizochimba kwenye chanzo salama na kilichosimbwa.",
      "lPbsm": "@lockedbtc BTC zako ulizochimba zimefungwa kwa usalama kwenye chanzo salama.",
      "ulh": "Fungua",
      "uvull": "VANTI IMEFUNGULIWA",
      "uslst":
      "Chanzo salama kimeunganishwa. Fungua vanti sasa ili upate @ulvbalance BTC zako. Ufikiaji salama. Udhibiti kamili.",
      'lUPtl':
      "Tazama tangazo hili ili kufungua vanti yako na upate @tounlockbtc BTC zako ulizochimba papo hapo.",
      'lUPbsm': "@unlockedbtc BTC zako sasa zimefunguliwa na ziko tayari kuchukuliwa.",

      // record page
      'rh': 'Rekodi ya Uchimbaji',
      'rmb': 'BTC Zilizochimbwa',
      'rrb': 'BTC za Rufaa',
      'rkh': 'Wachimba Madini Bora',

      //
      'ssc': 'Chagua Nchi',

      // FAQ

      // 🟢 GENERAL
      'q1': 'Jinsi ya Kuanza Uchimbaji?',
      'a1':
      'Nenda kwenye skrini ya nyumbani na uguse kitufe cha "Anza Uchimbaji". Mchakato wa uchimbaji utaanza mara moja.',

      'q2': 'Je, inawezekana kukusanya USDT zaidi?',
      'a2': 'Ndiyo, unaweza kukusanya USDT zaidi kwa kuongeza muda wa uchimbaji na kuongeza Gh/s.',

      'q3': 'Jinsi ya kuongeza muda wa uchimbaji?',
      'a3':
      'Anza uchimbaji na uguse aikoni ya Saa ya mchanga. Dirisha litatokea ambapo unaweza kuongeza muda wa uchimbaji hadi saa 2.',

      'q4': 'Jinsi ya kuongeza Gh/s za uchimbaji?',
      'a4':
      'Anza uchimbaji na uguse aikoni ya Boost. Dirisha litatokea ambapo unaweza kuongeza kasi ya uchimbaji hadi 100 Gh/s.',

      // 🟡 REWARD
      'q5': 'Super coin ni nini?',
      'a5':
      'Super coin ni sarafu maalum inayotumika kuboresha mtambo wa uchimbaji, muda, na kasi. Unaweza pia kuibadilisha kuwa USDT.',

      'q6': 'Ninawezaje kukusanya super coins?',
      'a6':
      'Unaweza kukusanya super coins kila siku kutoka kwenye sanduku la siri au kwa kucheza mchezo wa Flip & Win kwenye kichupo cha Zawadi.',

      'q7': 'Jinsi ya kubadilisha super coins kuwa USDT?',
      'a7': 'Nenda kwenye Wasifu > Badilisha Super Coins ili kubadilisha super coins zako kuwa Dhahabu.',

      // 🔵 UPGRADE
      'q8': 'Kwa nini niboreshe mtambo, kasi, na muda?',
      'a8': 'Kuboresha kunaongeza utendaji wa uchimbaji na kukuruhusu kupata sarafu zaidi haraka.',

      'q9': 'Jinsi ya kuboresha mtambo, kasi, na muda?',
      'a9': 'Unaweza kuboresha ukitumia USDT na super coins ili kuimarisha utendaji wako wa uchimbaji.',

      'q10': 'Je, kuboresha kunaathiri mapato ya kila siku?',
      'a10': 'Ndiyo, kuboresha mtambo wako, kasi, na muda kunaongeza tuzo zako za kila siku za uchimbaji.',
    },

    // TODO Malay Translation
    'ms_MY': {
      'save': 'Simpan',
      'bh': 'Utama',
      'bs': 'Kedai',
      'bw': 'Dompet',
      'bp': 'Tetapan',
      'mpith': 'Jumlah Kuasa Melombong',
      'mpit':
      'Untuk memastikan pelombong anda aktif, anda mesti mengaktifkannya secara manual sekali setiap hari. Setelah diaktifkan, ia akan melombong Bitcoin secara automatik pada pelayan awan kami, dan anda akan menerima kemas kini masa nyata. Sila ambil perhatian bahawa kuasa melombong merosot secara beransur-ansur dari semasa ke semasa; bagaimanapun, anda boleh meminimumkan kesan ini dengan melengkapkan tugasan berasaskan iklan. Anda juga boleh meningkatkan kuasa melombong anda dengan menonton iklan atau meningkatkannya secara serta-merta dengan membeli pelan perlombongan.',
      "nn": "Bukan Sekarang",
      "wad": "Tonton Sekarang",
      "wadlb": "Tutup",
      "wadlt": "Anda telah pun mencapai booster ini. Ia akan diperbaharui secara automatik selepas 4 jam.",

      // splash page
      'sht': 'Lombong Bitcoin Serta-merta, Tanpa Persediaan',
      'shs': 'Satu ketikan untuk bermula — jejak hashrate dan pendapatan secara langsung dari telefon anda.',
      'sb': 'Mula Sekarang',

      // singIn Page
      'snrh': 'Masukkan Kod Rujukan (Pilihan)',
      'snlw': 'Log Masuk Dengan',
      'sncwg': 'Teruskan dengan Google',
      'sntu': 'Syarat Penggunaan',
      'snpp': 'Dasar Privasi',
      'snwgs':
      'Platform kami menggunakan teknologi perlombongan berasaskan awan. Peranti mudah alih anda tidak digunakan sebagai alat perlombongan.',
      "cics": "Memulakan Pelayan Awan",
      "cisc": "Persediaan Selesai",
      "cisyr": "Pilih Wilayah Anda",
      "cicr": "Pilih Wilayah",
      "ci": "Memulakan...",
      "csc": "Semua selesai! Pelayan perlombongan awan anda sudah sedia di wilayah @selectedRegion",
      "cscr": "Anda telah menerima @reward kuasa perlombongan awan percuma untuk memulakan perjalanan perlombongan anda.",
      "cyrs": "Pelayan perlombongan awan anda akan dimulakan berdasarkan wilayah yang anda pilih.",
      "ccb": "Teruskan",
      "csre":"⚠️ Pilih wilayah anda untuk meneruskan",

      // home page
      'hsb': 'MULA',
      'hcb': 'Baki Semasa',
      'hms': 'Kelajuan',
      'hsc': 'Super Coin',
      'ham': 'Pelombong Aktif',
      'hpub': 'Tingkat Kuasa',
      "hab": "Booster Aktif",
      "hadr": "Baca Lagi",
      'hdr': 'Tambah Masa',
      'hdrst': 'Anda boleh menambah masa perlombongan anda sehingga @inTime.',
      'hdqr': 'Booster Kelajuan',
      'hdqrst': 'Tingkatkan kelajuan perlombongan anda sehingga @spBooster untuk menjana lebih pantas!',
      "hbdht": "Boost Kelajuan Melombong",
      "htdht": "Boost Masa Melombong",
      "htrwd": "Ganjaran Melombong",
      "hbdhst": "Tonton iklan ini untuk menjana lebih banyak dengan meningkatkan kuasa perlombongan sehingga @power.",
      "htdhst": "Tonton iklan ini untuk menjana lebih banyak dengan memanjangkan masa perlombongan sehingga @time.",
      "htdhat": "Anda mempunyai @attempt percubaan percuma berbaki.",
      "hbrwd": "Tonton iklan ini untuk membuka kunci ganjaran bonus perlombongan dan menjana lebih banyak.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Standard Boost\nDiperbaharui secara automatik setiap 24 jam – jangan terlepas sehari! ⏳',
      "scat": "Super Coin",
      "scht": "Kenali SuperCoin! Cara istimewa kami mengucapkan terima kasih kerana menjadi sebahagian daripada aplikasi kami.",
      "scab": "Baki Tersedia",
      "scuscb": "Guna SuperCoin",
      "scone": "1 SuperCoin",
      "scn1":
      "SuperCoin ialah ganjaran bonus daripada kami. Untuk menukarnya kepada BTC, anda perlu mempunyai baki @cbtcb BTC yang boleh dikeluarkan.",
      "sccer":"Maaf, baki anda tidak mencukupi untuk menukar SuperCoin.",
      "htbar":"Tindakan Diperlukan",
      "htbarst":"Perlombongan tidak aktif. Mula melombong untuk menambah masa.",
      'rzsb': "Selesai",
      'rztc': "Tugasan Selesai!",
      'rztm': "Tahniah! Anda telah menerima ganjaran @massage 🎉",
      "hsmt": "🎥 Tonton iklan ini untuk memulakan perlombongan awan serta-merta \nHashrate semasa anda ialah @ch",
      "sccs": "Penukaran SuperCoin berjaya dilengkapkan.",
      "isc": "Baki SuperCoin tidak sah",

      // store page
      "srz": "Zon Ganjaran! 🎉",
      "srzst": "Lengkapkan tugasan mudah untuk membuka ganjaran berharga 🎁",
      'sspeed': 'Kelajuan',
      'ssst': 'Gerakkan peluncur untuk menetapkan kelajuan perlombongan anda, atau pilih pelan sedia ada di bawah.',
      "smuo": "Gambaran Keseluruhan Unit Melombong",
      "sms": "Kelajuan Melombong",
      "sbms": "Bonus Kelajuan Melombong",
      "smp": "Kuasa Melombong",
      'smb': 'Boost Melombong',
      'sam': 'Pelombong Diperuntukkan',
      "sbutton": "Butiran & Faedah",
      'sob': 'Tonton Iklan & Boost',
      "est":"Perlombongan BTC yang selamat dan mudah — tersedia pada bila-bila masa.",
      "sssp": "Harga Standard",
      "ssda": "Diskaun Digunakan",
      "ssfp": "Harga Akhir",
      "rwh": "Ganjaran",
      "rzhw": "Cara Ia Berfungsi",
      "rzar": "Ganjaran Tersedia",
      "rzrc": "Selesai",
      "rwt": "Tugasan:",
      "rwr": "Ganjaran:",
      "rwcb": "Tuntut",
      "rwcdb": "Dituntut",
      "rwcloseb": "Tutup",
      "rwcm":
      "➤ Satu ganjaran pada satu masa — tuntut sekarang dan dapatkan yang seterusnya selepas pemasa.\n\n➤ Sila tunggu sehingga pemasa ganjaran semasa tamat. Anda boleh menjejakinya di Halaman Utama di bawah 'Booster Aktif'.\n\n➤ Sebaik sahaja pemasa ganjaran semasa tamat, ganjaran lain akan dibuka secara automatik.",
      "rhrsw": "Cara Sistem Ganjaran Berfungsi",
      "rsdt": "Dapatkan boost kelajuan percuma untuk meningkatkan kuasa perlombongan anda!",
      "rsdst":
      "Sistem Ganjaran membolehkan anda memperoleh boost kelajuan perlombongan percuma yang kecil untuk masa terhad dengan melengkapkan tugasan mudah seperti menonton iklan, memberi ulasan, atau melengkapkan tawaran. Ia adalah cara yang menyeronokkan untuk mula melombong tanpa mengeluarkan wang!",
      "rsdst1":
      "🔁 Anda boleh menuntut masa kelajuan perlombongan percuma tanpa had dengan tugasan “Ganjaran Percuma” — tiada had!",
      "rsdst2":
      "⚠️ Boost kelajuan perlombongan percuma adalah kurang berkuasa daripada boost perlombongan berbayar — ia direka untuk memberi anda sedikit peningkatan, bukan prestasi penuh.",
      "rzst": "Lombong Bitcoin percuma dengan melengkapkan tugasan mudah",
      "rzst1":
      "Lengkapkan tugasan mudah seperti menonton iklan dan memberi ulasan untuk memperoleh mata dan mula melombong tanpa kos. Tingkatkan pendapatan anda dengan mudah—tiada pelaburan diperlukan.",
      "rat":"Tersedia dalam @atime",

      'sh': 'Kuasa Hashing',
      'smr': 'Rig Melombong',
      'sv': 'Tempoh',
      'smc': 'Bilangan Pelombong',
      'sdp': 'Diskaun Anda',
      'sbv': 'Nilai Penanda Aras',
      'sa': 'Jumlah Harga',
      'sd': 'Harga Jimat',
      'ss': 'Langgan',
      'spd': 'Butiran Pelan',
      'sav': 'Lihat',
      'suyh': 'Naik Taraf HashRate Anda',
      'sas': 'Butiran & Faedah',
      's1': 'Dapatkan masa operasi 100%—disokong oleh pelombong dedikasi anda, walaupun semasa sistem terhenti.',
      's2':
      'Dengan melanggan, anda bersetuju untuk dikenakan bayaran. Langganan anda diperbaharui secara automatik pada harga dan tempoh yang sama melainkan dibatalkan. Anda juga bersetuju dengan kami ',
      'sspd':
      'Langganan akan diperbaharui secara automatik berdasarkan pelan anda sehingga anda membatalkannya. Anda boleh menguruskannya pada bila-bila masa di Google Play.',
      "sslo": "Tawaran Terhad",

      // wallet page
      'wwb': 'Pengeluaran',
      'wwc': 'Tuntut Ganjaran',
      'wh': 'Sejarah',
      'wm': 'Perlombongan',
      'wr': 'Rujukan',
      'whr': 'Anda belum membuat sebarang pengeluaran lagi.',
      'wmbc': 'Lengkapkan Persediaan',
      'wmh': 'BAKI',
      'wmte': 'Jumlah Pendapatan:',
      'wmw': 'PENGELUARAN',
      'wrrb': 'BAKI RUJUKAN',
      'wrse': 'Kongsi untuk Menjana',
      'wrati': 'Pendapatan Sepanjang Masa:',
      'wmcyas': 'Lengkapkan Persediaan Akaun Anda',
      'wmprdcw':
      'Berikan butiran yang diperlukan untuk melengkapkan persediaan akaun anda dan membolehkan pengeluaran dana.',
      'wrgr':
      'Tingkatkan baki Rujukan anda setiap kali seseorang menyertai menggunakan kod rujukan anda dan memperoleh BTC.',

      //setting page
      'ssgr': 'Ganjaran Rujukan',
      'sr': 'Rekod Perlombongan',
      'sru': 'Nilai Kami',
      'sl': 'Statistik Pelombong',
      'sp': 'Profil',
      'svam': 'Lihat Pelombong Aktif',
      'svas': 'Lihat Langganan Aktif',
      'scs': 'Sokongan Pelanggan',
      'sShare': 'Kongsi',
      'srs': 'Pulihkan Langganan',
      'spp': 'Dasar Privasi',
      'sda': 'Padam Akaun',
      'slo': 'Log Keluar',
      'st': 'Tetapan Tema',
      'sth': 'Antara Muka',
      'stas': 'Tetapan Penampilan',
      'sla': 'Bahasa',
      'scss': 'Hantar Permintaan',
      'sf': 'Maklum Balas',
      'sf1': 'Terima kasih kerana bersama kami! 🫶 Menikmati aplikasi ini? Penarafan ⭐ amat bermakna bagi kami.',
      'sttr': "Nilai Kami",
      'smrht': "Anda belum melombong apa-apa lagi.",
      'sadh': "Adakah anda pasti mahu memadamkan akaun anda?",
      'sads': "Ini akan memadamkan semua data anda secara kekal. Tindakan ini tidak boleh diubah.",
      'sadby': "Ya",
      'sadbn': "Tidak",
      'salh': "Adakah anda pasti mahu log keluar dari akaun anda?",
      'sallo': "Log Keluar",
      'salc': "Batal",
      'salcsd': "✅ Akaun anda telah dipadamkan dan semua data telah dibersihkan.",
      "sissm": "🎉 Tahniah! @hashrate anda telah Berjaya Dilanggan untuk @day",
      "srt":
      "Pulihkan langganan yang dibeli sebelum ini yang dikaitkan dengan akaun Google anda. Tiada bayaran akan dikenakan semasa memulihkan.",
      "srwt":
      "Sila jangan tutup aplikasi atau tekan butang kembali semasa kami memulihkan langganan anda. Ini mungkin mengambil masa beberapa saat.",
      "srsm":
      "Langganan anda telah berjaya dipulihkan. Kuasa perlombongan anda telah meningkat, dan anda boleh terus menjana tanpa sebarang gangguan.",
      "snasfua":"Tiada langganan aktif ditemui dalam akaun anda.",
      'srd': "Selesai",
      'rsb': "Pulihkan",

      // active miner
      'amh': 'Pelombong Aktif',
      'amyc': 'Anda pada masa ini tidak memiliki sebarang NFT pelombong.',
      'amsc': 'Tiada langganan aktif ditemui.',
      'ash': 'Langganan Aktif',

      // profile page
      'ph': 'Profil',
      'pub': 'KEMAS KINI',
      'pn': 'Nama',
      'pe': 'E-mel',
      'pwa': 'Alamat Dompet',
      'ppn': 'Nombor Telefon',
      'pne': 'Nama diperlukan.',
      'pee': 'E-mel diperlukan.',
      'ppne': 'Nombor telefon diperlukan.',
      'pwae': 'Alamat Dompet diperlukan.',
      'pwh': 'Masukkan Alamat Dompet',
      'csm': 'Mesej',
      'csmh': 'Masukkan mesej anda',

      // payout page
      'prbw': 'Anda mesti mempunyai sekurang-kurangnya @rbtc BTC untuk mengeluarkan wang.',
      'pop': 'Sila baca dengan teliti sebelum pengeluaran',
      'pod1':
      'Mengeluarkan Bitcoin (BTC) melibatkan pemindahan dana anda dari bursa atau dompet ke alamat BTC yang lain. Sebelum meneruskan, pastikan jumlah pengeluaran memenuhi keperluan minimum platform dan baki anda mencukupi untuk menampung yuran rangkaian.',
      'pod2':
      'Yuran rangkaian (pelombong) adalah dinamik dan bergantung pada trafik blockchain. Ia akan ditolak daripada jumlah keseluruhan anda. Sila semak semula alamat Bitcoin penerima—transaksi BTC tidak boleh dibatalkan dan tidak boleh dikembalikan jika dihantar ke alamat yang salah.',
      'pod3':
      'Sebagai langkah keselamatan, semua permintaan pengeluaran mungkin memerlukan langkah pengesahan, seperti pengesahan dua faktor (2FA) dan pengesahan e-mel. Kami mengutamakan keselamatan anda—percubaan pengeluaran tanpa kebenaran atau mencurigakan akan disekat secara automatik.',
      'pomw': '* Pengeluaran Minimum ',
      'pook': 'Okay',
      'poe1': 'Sila kemas kini profil anda sebelum membuat pengeluaran.',
      'pows': 'Proses pengeluaran anda telah bermula. Anda akan menerima pengeluaran anda tidak lama lagi.',

      // Look & UnLook
      "lh": "Kunci",
      "lvl": "BILIK KEBAL DIKUNCI",
      "lel": "AKTIFKAN KUNCI",
      "lclst":
      "Saluran selamat aktif. Buka kunci bilik kebal sekarang untuk menuntut @lvbalance BTC. Kunci sekali. Sentiasa tenang. Bitcoin anda kekal dilindungi.",
      "lptl": "Tonton iklan ini untuk mengamankan @tolockbtc BTC yang dilombong pada saluran yang selamat dan disulitkan.",
      "lPbsm": "@lockedbtc BTC yang dilombong dikunci dengan selamat pada saluran yang selamat.",
      "ulh": "Buka Kunci",
      "uvull": "BILIK KEBAL DIBUKA KUNCI",
      "uslst":
      "Saluran selamat diaktifkan. Buka kunci bilik kebal sekarang untuk mengakses @ulvbalance BTC anda. Akses selamat. Kawalan penuh.",
      'lUPtl':
      "Tonton iklan ini untuk membuka kunci bilik kebal anda dan mengakses @tounlockbtc BTC yang dilombong serta-merta.",
      'lUPbsm': "@unlockedbtc BTC anda kini dibuka kunci dan sedia untuk dituntut.",

      // record page
      'rh': 'Rekod Perlombongan',
      'rmb': 'BTC Dilombong',
      'rrb': 'BTC Rujukan',
      'rkh': 'Pelombong Teratas',

      //
      'ssc': 'Pilih Negara',

      // FAQ

      // 🟢 UMUM
      'q1': 'Bagaimana untuk Mula Melombong?',
      'a1':
      'Pergi ke skrin utama dan ketik pada butang "Mula Melombong". Proses perlombongan akan bermula serta-merta.',

      'q2': 'Adakah mungkin untuk mengumpul lebih banyak USDT?',
      'a2': 'Ya, anda boleh mengumpul lebih banyak USDT dengan menambah masa perlombongan dan meningkatkan Gh/s.',

      'q3': 'Bagaimana untuk menambah masa perlombongan?',
      'a3':
      'Mula melombong dan ketik ikon Jam Pasir. Satu tetingkap akan muncul di mana anda boleh menambah masa perlombongan sehingga 2 jam.',

      'q4': 'Bagaimana untuk meningkatkan Gh/s perlombongan?',
      'a4':
      'Mula melombong dan ketik ikon Boost. Satu tetingkap akan muncul di mana anda boleh meningkatkan kelajuan perlombongan sehingga 100 Gh/s.',

      // 🟡 GANJARAN
      'q5': 'Apakah itu super coin?',
      'a5':
      'Super coin ialah syiling istimewa yang digunakan untuk menaik taraf rig perlombongan, masa, dan kelajuan. Anda juga boleh menukarnya kepada USDT.',

      'q6': 'Bagaimanakah saya boleh mengumpul super coin?',
      'a6':
      'Anda boleh mengumpul super coin setiap hari daripada kotak misteri atau dengan bermain permainan Flip & Win di tab Ganjaran.',

      'q7': 'Bagaimana untuk menukar super coin kepada USDT?',
      'a7': 'Pergi ke Profil > Tukar Super Coin untuk menukar super coin anda kepada Emas.',

      // 🔵 NAIK TARAF
      'q8': 'Mengapa saya perlu menaik taraf rig, kelajuan, dan masa?',
      'a8': 'Menaik taraf meningkatkan prestasi perlombongan dan membolehkan anda memperoleh lebih banyak syiling dengan lebih pantas.',

      'q9': 'Bagaimana untuk menaik taraf rig, kelajuan, dan masa?',
      'a9': 'Anda boleh menaik taraf menggunakan USDT dan super coin untuk meningkatkan prestasi perlombongan anda.',

      'q10': 'Adakah menaik taraf menjejaskan pendapatan harian?',
      'a10': 'Ya, menaik taraf rig, kelajuan, dan masa anda meningkatkan ganjaran perlombongan harian anda.',
    },

    // TODO Filipino Translation
    'fil_PH': {
      'save': 'I-save',
      'bh': 'Home',
      'bs': 'Store',
      'bw': 'Wallet',
      'bp': 'Setting',
      'mpith': 'Kabuuang Mining Power',
      'mpit':
      'Upang manatiling aktibo ang iyong miner, dapat mo itong i-activate nang manual minsan bawat araw. Kapag na-activate na, awtomatiko itong magmi-mina ng Bitcoin sa aming mga cloud server, at makakatanggap ka ng real-time updates. Pakitandaan na ang mining power ay unti-unting bumababa sa paglipas ng panahon; gayunpaman, maaari mong bawasan ang epektong ito sa pamamagitan ng pagkumpleto ng mga ad-based tasks. Maaari mo ring dagdagan ang iyong mining power sa pamamagitan ng panonood ng ads o agad na i-boost ito sa pamamagitan ng pagbili ng mining plan.',
      "nn": "Huwag Muna",
      "wad": "Manood na Ngayon",
      "wadlb": "Isara",
      "wadlt": "Naabot mo na ang booster na ito. Awtomatiko itong magre-renew pagkatapos ng 4 na oras.",

      // splash page
      'sht': 'Mag-mina ng Bitcoin Agad, Walang Setup na Kailangan',
      'shs': 'Isang tap lang para magsimula — i-track ang hashrate at earnings nang live mula sa iyong phone.',
      'sb': 'Magsimula Na',

      // singIn Page
      'snrh': 'Ipasok ang Referral Code (Optional)',
      'snlw': 'Mag-login Gamit ang',
      'sncwg': 'Ipagpatuloy gamit ang Google',
      'sntu': 'Terms of Use',
      'snpp': 'Privacy Policy',
      'snwgs':
      'Ang aming platform ay gumagamit ng cloud-based mining technology. Ang iyong mobile device ay hindi ginagamit bilang tool sa pag-mina.',
      "cics": "Inihahanda ang Cloud Server",
      "cisc": "Setup Kumpleto Na",
      "cisyr": "Piliin ang Iyong Rehiyon",
      "cicr": "Pumili ng Rehiyon",
      "ci": "Inihahanda...",
      "csc": "Tapos na ang lahat! Ang iyong cloud mining server ay handa na sa @selectedRegion region",
      "cscr": "Nakatanggap ka ng @reward na libreng cloud mining power para simulan ang iyong mining journey.",
      "cyrs": "Ang iyong cloud mining server ay ihahanda base sa rehiyon na iyong pipiliin.",
      "ccb": "Ipagpatuloy",
      "csre":"⚠️ Pumili ng iyong rehiyon para magpatuloy",

      // home page
      'hsb': 'START',
      'hcb': 'Kasalukuyang Balance',
      'hms': 'Bilis',
      'hsc': 'Super Coin',
      'ham': 'Aktibong Miners',
      'hpub': 'Power Up',
      "hab": "Aktibong Booster",
      "hadr": "Magbasa Pa",
      'hdr': 'Dagdagan ang Oras',
      'hdrst': 'Maaari mong dagdagan ang iyong oras ng pag-mina ng hanggang @inTime.',
      'hdqr': 'Speed Booster',
      'hdqrst': 'Dagdagan ang iyong bilis sa pag-mina hanggang @spBooster para kumita nang mas mabilis!',
      "hbdht": "Mining Speed Boost",
      "htdht": "Mining Time Boost",
      "htrwd": "Mining Reward",
      "hbdhst": "Panoorin ang ad na ito para kumita pa lalo sa pamamagitan ng pag-boost ng mining power hanggang @power.",
      "htdhst": "Panoorin ang ad na ito para kumita pa lalo sa pamamagitan ng pagpapahaba ng oras ng pag-mina hanggang @time.",
      "htdhat": "Mayroon ka pang @attempt na natitirang libreng pagkakataon.",
      "hbrwd": "Panoorin ang ad na ito para i-unlock ang bonus mining reward at kumita pa.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Standard Boost\nAwtomatikong nagre-renew tuwing 24 oras – huwag palampasin ang bawat araw! ⏳',
      "scat": "Super Coin",
      "scht": "Kilalanin ang SuperCoin! Ang aming espesyal na paraan ng pasasalamat sa pagiging bahagi ng aming app.",
      "scab": "Balance na Pwedeng Gamitin",
      "scuscb": "Gamitin ang SuperCoin",
      "scone": "1 SuperCoin",
      "scn1":
      "Ang SuperCoin ay isang bonus reward mula sa amin. Upang ma-convert ito sa BTC, kailangan mong magkaroon ng withdrawable balance na @cbtcb BTC.",
      "sccer":"Paumanhin, kulang ang iyong balance para i-convert ang SuperCoin.",
      "htbar":"Kailangan ng Aksyon",
      "htbarst":"Hindi aktibo ang mining. Simulan ang mining para dagdagan ang oras.",

      // store page
      "srz": "Rewards Zone! 🎉",
      "srzst": "Kumpletuhin ang mga simpleng task para i-unlock ang mahahalagang rewards 🎁",
      'sspeed': 'Bilis',
      'ssst': 'I-drag ang slider para i-set ang iyong bilis sa pag-mina, o pumili ng ready-made plan sa ibaba.',
      "smuo": "Mining Unit Overview",
      "sms": "Bilis ng Pag-mina",
      "sbms": "Bonus Mining Speed",
      "smp": "Mining Power",
      'smb': 'Mining Boost',
      'sam': 'Allocated Miners',
      "sbutton": "Detalye at Benepisyo",
      'sob': 'Manood ng Ad at Mag-boost',
      "est":"Ligtas at madaling BTC mining — available anumang oras.",
      "sssp": "Standard na Presyo",
      "ssda": "May Discount",
      "ssfp": "Final na Presyo",
      "rwh": "Rewards",
      "rzhw": "Paano Ito Gumagana",
      "rzar": "Available na Rewards",
      "rzrc": "Tapos Na",
      "rwt": "Task:",
      "rwr": "Reward:",
      "rwcb": "I-claim",
      "rwcdb": "Na-claim Na",
      "rwcloseb": "Isara",
      "rwcm":
      "➤ Isang reward lang sa bawat pagkakataon — i-claim na ngayon at makuha ang susunod pagkatapos ng timer.\n\n➤ Mangyaring maghintay hanggang matapos ang kasalukuyang reward timer. Maaari mo itong i-track sa Home Page sa ilalim ng 'Active Booster'.\n\n➤ Kapag natapos na ang kasalukuyang reward timer, awtomatikong magbubukas ang ibang rewards.",
      "rhrsw": "Paano Gumagana ang Rewards System",
      "rsdt": "Kumuha ng libreng speed boost para dagdagan ang iyong mining power!",
      "rsdst":
      "Ang Rewards system ay nagbibigay-daan sa iyo na kumita ng maliit at libreng mining speed boosts sa limitadong oras sa pamamagitan ng pagkumpleto ng simpleng tasks gaya ng panonood ng ads, pag-iwan ng reviews, o pagtapos ng offers. Masayang paraan ito para makapagsimulang mag-mina nang walang ginagastos!",
      "rsdst1":
      "🔁 Maaari kang mag-claim ng unlimited na libreng mining speed gamit ang “Free Reward” task — walang limitasyon!",
      "rsdst2":
      "⚠️ Ang mga libreng mining speed boost ay mas mahina kumpara sa mga paid mining plans — disenyo ang mga ito para bigyan ka ng kaunting tulong, hindi full performance.",
      "rzst": "Mag-mina ng libreng Bitcoin sa pamamagitan ng pagkumpleto ng simpleng tasks",
      "rzst1":
      "Kumpletuhin ang mga simpleng gawain gaya ng panonood ng ads at pag-iwan ng reviews para kumita ng points at makapagsimulang mag-mina nang walang gastos. Palaguin ang iyong earnings nang walang kailangang investment.",
      "rat":"Available sa loob ng @atime",

      'sh': 'Hashing Power',
      'smr': 'Mining Rig',
      'sv': 'Tagal',
      'smc': 'Bilang ng Miner',
      'sdp': 'Iyong Discount',
      'sbv': 'Benchmark Value',
      'sa': 'Kabuuang Presyo',
      'sd': 'Natipid na Presyo',
      'ss': 'Mag-subscribe',
      'spd': 'Detalye ng Plan',
      'sav': 'Tingnan',
      'suyh': 'I-upgrade ang Iyong HashRate',
      'sas': 'Detalye at Benepisyo',
      's1': 'Makakuha ng 100% uptime—suportado ng iyong dedicated miner, kahit sa oras na may system downtime.',
      's2':
      'Sa pag-subscribe, sumasang-ayon ka na ma-charge. Ang iyong subscription ay awtomatikong magre-renew sa parehong presyo at tagal maliban kung i-cancel. Sumasang-ayon ka rin sa aming ',
      'sspd':
      'Ang subscription ay awtomatikong magre-renew base sa iyong plan hanggang sa i-cancel mo ito. Maaari mo itong i-manage anumang oras sa Google Play.',
      "sslo": "Limitadong Offer",

      // wallet page
      'wwb': 'Mag-withdraw',
      'wwc': 'I-claim ang Rewards',
      'wh': 'History',
      'wm': 'Mining',
      'wr': 'Referral',
      'whr': 'Wala ka pang nagagawang withdrawal.',
      'wmbc': 'Kumpletuhin ang Setup',
      'wmh': 'BALANCE',
      'wmte': 'Kabuuang Earnings:',
      'wmw': 'MAG-WITHDRAW',
      'wrrb': 'REFERRAL BALANCE',
      'wrse': 'I-share Para Kumita',
      'wrati': 'Kabuuang Kita:',
      'wmcyas': 'Kumpletuhin ang Iyong Account Setup',
      'wmprdcw':
      'Ibigay ang mga kinakailangang detalye para kumpletuhin ang iyong account setup at payagan ang pag-withdraw ng pondo.',
      'wrgr':
      'Palaguin ang iyong Referral balance sa tuwing may sumasali gamit ang iyong referral code at kumikita ng BTC.',

      //setting page
      'ssgr': 'Referral Rewards',
      'sr': 'Mining Record',
      'sru': 'I-rate Kami',
      'sl': 'Miner Stats',
      'sp': 'Profile',
      'svam': 'Tingnan ang Aktibong Miner',
      'svas': 'Tingnan ang Aktibong Subscription',
      'scs': 'Customer Support',
      'sShare': 'I-share',
      'srs': 'I-restore ang Subscription',
      'spp': 'Privacy Policy',
      'sda': 'I-delete ang Account',
      'slo': 'Mag-log Out',
      'st': 'Theme Settings',
      'sth': 'Interface',
      'stas': 'Appearance Settings',
      'sla': 'Wika',
      'scss': 'Mag-submit ng Request',
      'sf': 'Feedback',
      'sf1': 'Salamat sa pagsama sa amin! 🫶 Nag-e-enjoy sa app? Malaking bagay sa amin ang ⭐ rating mo.',
      'sttr': "I-rate Kami",
      'smrht': "Wala ka pang nami-mina.",
      'sadh': "Sigurado ka bang gusto mong i-delete ang iyong account?",
      'sads': "Permanente nitong buburahin ang lahat ng iyong data. Hindi na ito mababawi.",
      'sadby': "Oo",
      'sadbn': "Hindi",
      'salh': "Sigurado ka bang gusto mong mag-log out sa iyong account?",
      'sallo': "Mag-log Out",
      'salc': "I-cancel",
      'salcsd': "✅ Ang iyong account ay na-delete na at lahat ng data ay nabura.",
      "sissm": "🎉 Congratulations! Matagumpay kang naka-subscribe sa @hashrate para sa @day",
      "srt":
      "I-restore ang mga dating biniling subscription na naka-link sa iyong Google account. Walang charges na magaganap habang nagre-restore.",
      "srwt":
      "Mangyaring huwag isara ang app o pindutin ang back button habang nire-restore namin ang iyong subscription. Maaaring tumagal ito ng ilang segundo.",
      "srsm":
      "Matagumpay na na-restore ang iyong subscription. Tumaas na ang iyong mining power, at maaari mo nang ipagpatuloy ang pagkita nang walang abala.",
     "snasfua": "Walang nahanap na aktibong subscription sa iyong account.",
      'srd': "Tapos Na",
      'rsb': "I-restore",

      // active miner
      'amh': 'Aktibong Miner',
      'amyc': 'Kasalukuyan kang walang pagmamay-ari na miner NFTs.',
      'amsc': 'Walang nahanap na aktibong subscription.',
      'ash': 'Aktibong Subscription',

      // profile page
      'ph': 'Profile',
      'pub': 'I-UPDATE',
      'pn': 'Pangalan',
      'pe': 'Email',
      'pwa': 'Wallet Address',
      'ppn': 'Phone Number',
      'pne': 'Kailangan ang pangalan.',
      'pee': 'Kailangan ang email.',
      'ppne': 'Kailangan ang phone number.',
      'pwae': 'Kailangan ang Wallet Address.',
      'pwh': 'Ipasok ang Wallet Address',
      'csm': 'Mensahe',
      'csmh': 'Ipasok ang iyong mensahe',

      // payout page
      'prbw': 'Dapat kang magkaroon ng hindi bababa sa @rbtc BTC para makapag-withdraw.',
      'pop': 'Pakibasa nang mabuti bago mag-withdraw',
      'pod1':
      'Ang pag-withdraw ng Bitcoin (BTC) ay kinapapalooban ng paglilipat ng iyong pondo mula sa exchange o wallet patungo sa isa pang BTC address. Bago magpatuloy, tiyaking ang halaga ng withdrawal ay umaabot sa minimum requirement ng platform at ang iyong balance ay sapat para mabayaran ang network fee.',
      'pod2':
      'Ang network (miner) fee ay dynamic at nakadepende sa blockchain traffic. Ibabawas ito sa iyong kabuuang halaga. Pakisuri nang mabuti ang Bitcoin address ng tatanggap—ang mga BTC transaction ay irreversible at hindi na maibabalik kung naipadala sa maling address.',
      'pod3':
      'Bilang security measure, ang lahat ng withdrawal request ay maaaring mangailangan ng verification steps, gaya ng two-factor authentication (2FA) at email confirmation. Priyoridad namin ang iyong seguridad—ang mga hindi awtorisado o kahina-hinalang withdrawal attempts ay awtomatikong iba-block.',
      'pomw': '* Minimum Withdrawal ',
      'pook': 'Okay',
      'poe1': 'Mangyaring i-update ang iyong profile bago mag-withdraw.',
      'pows': 'Nagsimula na ang iyong withdrawal process. Matatanggap mo ang iyong withdrawal sa lalong madaling panahon.',

      // Look & UnLook
      "lh": "Lock",
      "lvl": "NAKASARANG VAULT",
      "lel": "I-ENABLE ANG LOCK",
      "lclst":
      "Aktibo ang secure channel. Buksan ang vault ngayon para i-claim ang @lvbalance BTC. I-lock lang. Manatiling kampante. Ang iyong Bitcoin ay laging protektado.",
      "lptl": "Panoorin ang ad na ito para i-secure ang iyong na-minang @tolockbtc BTC sa isang secure at encrypted channel.",
      "lPbsm": "Ang iyong na-minang @lockedbtc BTC ay ligtas na naka-lock sa isang secure channel.",
      "ulh": "Buksan",
      "uvull": "BUKAS NA VAULT",
      "uslst":
      "Gumagana ang secure channel. Buksan ang vault ngayon para ma-access ang iyong @ulvbalance BTC. Ligtas na access. Ganap na kontrol.",
      'lUPtl':
      "Panoorin ang ad na ito para buksan ang iyong vault at ma-access agad ang iyong na-minang @tounlockbtc BTC.",
      'lUPbsm': "Ang iyong @unlockedbtc BTC ay bukas na at handa nang i-claim.",

      // record page
      'rh': 'Mining Record',
      'rmb': 'Na-minang BTC',
      'rrb': 'Referral BTC',
      'rkh': 'Top Miners',

      //
      'ssc': 'Pumili ng Bansa',

      // FAQ

      // 🟢 GENERAL
      'q1': 'Paano Simulan ang Pag-mina?',
      'a1':
      'Pumunta sa home screen at i-tap ang "Start Mining" button. Agad na magsisimula ang proseso ng pag-mina.',

      'q2': 'Posible bang makakuha ng mas maraming USDT?',
      'a2': 'Oo, maaari kang makakuha ng mas maraming USDT sa pamamagitan ng pagdagdag ng oras ng pag-mina at pag-boost ng Gh/s.',

      'q3': 'Paano dagdagan ang oras ng pag-mina?',
      'a3':
      'Simulan ang pag-mina at i-tap ang Hourglass icon. May lalabas na modal kung saan maaari mong dagdagan ang oras hanggang 2 oras.',

      'q4': 'Paano i-boost ang mining Gh/s?',
      'a4':
      'Simulan ang pag-mina at i-tap ang Boost icon. May lalabas na modal kung saan maaari mong i-boost ang bilis hanggang 100 Gh/s.',

      // 🟡 REWARD
      'q5': 'Ano ang super coin?',
      'a5':
      'Ang super coin ay isang espesyal na coin na ginagamit para i-upgrade ang mining rig, oras, at bilis. Maaari mo rin itong i-convert sa USDT.',

      'q6': 'Paano ako makakakuha ng mga super coin?',
      'a6':
      'Maaari kang makakuha ng super coins araw-araw mula sa mystery box o sa paglalaro ng Flip & Win game sa Rewards tab.',

      'q7': 'Paano i-convert ang super coins sa USDT?',
      'a7': 'Pumunta sa Profile > Convert Super Coins para i-convert ang iyong mga super coin sa Gold.',

      // 🔵 UPGRADE
      'q8': 'Bakit ko dapat i-upgrade ang rig, bilis, at oras?',
      'a8': 'Ang pag-upgrade ay nagpapabuti sa mining performance at nagbibigay-daan sa iyo na kumita ng mas maraming coins nang mas mabilis.',

      'q9': 'Paano i-upgrade ang rig, bilis, at oras?',
      'a9': 'Maaari kang mag-upgrade gamit ang USDT at super coins para mapahusay ang iyong mining performance.',

      'q10': 'Nakakaapekto ba ang pag-upgrade sa araw-araw na kita?',
      'a10': 'Oo, ang pag-upgrade ng iyong rig, bilis, at oras ay nagpapataas sa iyong araw-araw na mining rewards.',
    },

    // TODO Spanish Translation
    'es_ES': {
      'save': 'Guardar',
      'bh': 'Inicio',
      'bs': 'Tienda',
      'bw': 'Billetera',
      'bp': 'Ajustes',
      'mpith': 'Poder de Minería Total',
      'mpit':
      'Para mantener su minero activo, debe activarlo manualmente una vez al día. Una vez activado, minará Bitcoin automáticamente en nuestros servidores en la nube y recibirá actualizaciones en tiempo real. Tenga en cuenta que el poder de minería disminuye gradualmente con el tiempo; sin embargo, puede minimizar este efecto completando tareas basadas en anuncios. También puede aumentar su poder de minería viendo anuncios o potenciarlo instantáneamente comprando un plan de minería.',
      "nn": "Ahora no",
      "wad": "Ver ahora",
      "wadlb": "Cerrar",
      "wadlt": "Ya has alcanzado este potenciador. Se renovará automáticamente después de 4 horas.",

      // splash page
      'sht': 'Mine Bitcoin al instante, sin configuración',
      'shs': 'Un toque para comenzar: siga la tasa de hash y las ganancias en vivo desde su teléfono.',
      'sb': 'Comenzar',

      // singIn Page
      'snrh': 'Ingrese código de referido (Opcional)',
      'snlw': 'Iniciar sesión con',
      'sncwg': 'Continuar con Google',
      'sntu': 'Términos de uso',
      'snpp': 'Política de privacidad',
      'snwgs':
      'Nuestra plataforma utiliza tecnología de minería en la nube. Su dispositivo móvil no se utiliza como herramienta de minería.',
      "cics": "Inicializando servidor en la nube",
      "cisc": "Configuración completada",
      "cisyr": "Seleccione su región",
      "cicr": "Elegir región",
      "ci": "Inicializando...",
      "csc": "¡Todo listo! Su servidor de minería en la nube está listo en la región @selectedRegion",
      "cscr": "Ha recibido @reward de poder de minería en la nube gratis para comenzar su viaje.",
      "cyrs": "Su servidor de minería en la nube se inicializará según la región que elija.",
      "ccb": "Continuar",
      "csre":"⚠️ Elija su región para continuar",

      // home page
      'hsb': 'INICIAR',
      'hcb': 'Saldo actual',
      'hms': 'Velocidad',
      'hsc': 'Super Coin',
      'ham': 'Mineros activos',
      'hpub': 'Potenciar',
      "hab": "Potenciador activo",
      "hadr": "Leer más",
      'hdr': 'Aumentar tiempo',
      'hdrst': 'Puede aumentar su tiempo de minería hasta @inTime.',
      'hdqr': 'Potenciador de velocidad',
      'hdqrst': '¡Aumente su velocidad de minería hasta @spBooster para ganar más rápido!',
      "hbdht": "Impulso de velocidad",
      "htdht": "Impulso de tiempo",
      "htrwd": "Recompensa de minería",
      "hbdhst": "Vea este anuncio para ganar más aumentando su poder de minería hasta @power.",
      "htdhst": "Vea este anuncio para ganar más extendiendo su tiempo de minería hasta @time.",
      "htdhat": "Le queda @attempt intento gratuito.",
      "hbrwd": "Vea este anuncio para desbloquear una recompensa de minería adicional y ganar más.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Boost Estándar\nSe renueva automáticamente cada 24 horas. ¡No pierda ni un día! ⏳',
      "scat": "Super Coin",
      "scht": "¡Conozca la SuperCoin! Nuestra forma especial de agradecerle por ser parte de nuestra aplicación.",
      "scab": "Saldo disponible",
      "scuscb": "Usar SuperCoin",
      "scone": "1 SuperCoin",
      "scn1":
      "SuperCoin es una recompensa adicional. Para convertirla a BTC, debe tener un saldo retirable de @cbtcb BTC.",
      "sccer":"Lo sentimos, no tiene saldo suficiente para convertir SuperCoin.",
      "htbar":"Acción requerida",
      "htbarst":"La minería no está activa. Inicie la minería para aumentar el tiempo.",

      // store page
      "srz": "¡Zona de recompensas! 🎉",
      "srzst": "Complete tareas sencillas para desbloquear valiosas recompensas 🎁",
      'sspeed': 'Velocidad',
      'ssst': 'Mueva el control deslizante para ajustar su velocidad o elija un plan predefinido abajo.',
      "smuo": "Resumen de la unidad de minería",
      "sms": "Velocidad de minería",
      "sbms": "Velocidad de minería adicional",
      "smp": "Poder de minería",
      'smb': 'Impulso de minería',
      'sam': 'Mineros asignados',
      "sbutton": "Detalles y beneficios",
      'sob': 'Ver anuncio e impulsar',
      "est":"Minería de BTC segura y sin esfuerzo, disponible en cualquier momento.",
      "sssp": "Precio estándar",
      "ssda": "Descuento aplicado",
      "ssfp": "Precio final",
      "rwh": "Recompensas",
      "rzhw": "Cómo funciona",
      "rzar": "Recompensas disponibles",
      "rzrc": "Completado",
      "rwt": "Tarea:",
      "rwr": "Recompensa:",
      "rwcb": "Reclamar",
      "rwcdb": "Reclamado",
      "rwcloseb": "Cerrar",
      "rwcm":
      "➤ Una recompensa a la vez: reclame ahora y obtenga la siguiente después del temporizador.\n\n➤ Espere hasta que finalice el temporizador de la recompensa actual. Puede seguirlo en la página de inicio bajo 'Potenciador activo'.\n\n➤ Una vez que termine el temporizador, otras recompensas se desbloquearán automáticamente.",
      "rhrsw": "Cómo funciona el sistema de recompensas",
      "rsdt": "¡Gane un impulso de velocidad gratis para aumentar su poder de minería!",
      "rsdst":
      "El sistema de recompensas le permite obtener pequeños impulsos de velocidad gratuitos por tiempo limitado al completar tareas simples como ver anuncios o dejar reseñas. ¡Es una forma divertida de comenzar a minar sin gastar dinero!",
      "rsdst1":
      "🔁 Puede reclamar tiempo de velocidad de minería gratuito ilimitado con la tarea “Recompensa gratuita”. ¡Sin límites!",
      "rsdst2":
      "⚠️ Los impulsos gratuitos son menos potentes que los planes de pago; están diseñados para dar un pequeño empuje, no el rendimiento total.",
      "rzst": "Mine Bitcoin gratis completando tareas sencillas",
      "rzst1":
      "Complete tareas como ver anuncios y dejar reseñas para ganar puntos y comenzar a minar sin costo. Aumente sus ganancias sin necesidad de inversión.",
      "rat":"Disponible en @atime",

      'sh': 'Poder de hash',
      'smr': 'Plataforma de minería',
      'sv': 'Duración',
      'smc': 'Cantidad de mineros',
      'sdp': 'Su descuento',
      'sbv': 'Valor de referencia',
      'sa': 'Precio total',
      'sd': 'Precio ahorrado',
      'ss': 'Suscribirse',
      'spd': 'Detalles del plan',
      'sav': 'Ver',
      'suyh': 'Mejore su tasa de hash',
      'sas': 'Detalles y beneficios',
      's1': 'Obtenga un 100% de tiempo de actividad, respaldado por su minero dedicado, incluso durante caídas del sistema.',
      's2':
      'Al suscribirse, acepta el cargo. Su suscripción se renueva automáticamente al mismo precio y duración a menos que se cancele. También acepta nuestra ',
      'sspd':
      'La suscripción se renovará automáticamente según su plan hasta que la cancele. Puede gestionarla en cualquier momento en Google Play.',
      "sslo": "Oferta limitada",

      // wallet page
      'wwb': 'Retirar',
      'wwc': 'Reclamar recompensas',
      'wh': 'Historial',
      'wm': 'Minería',
      'wr': 'Referido',
      'whr': 'Aún no ha realizado ningún retiro.',
      'wmbc': 'Completar configuración',
      'wmh': 'SALDO',
      'wmte': 'Ganancias totales:',
      'wmw': 'RETIRAR',
      'wrrb': 'SALDO DE REFERIDOS',
      'wrse': 'Compartir para ganar',
      'wrati': 'Ingresos históricos:',
      'wmcyas': 'Complete la configuración de su cuenta',
      'wmprdcw':
      'Proporcione los detalles requeridos para completar su cuenta y habilitar el retiro de fondos.',
      'wrgr':
      'Aumente su saldo de referidos cada vez que alguien se una usando su código y gane BTC.',

      //setting page
      'ssgr': 'Recompensas de referidos',
      'sr': 'Registro de minería',
      'sru': 'Califícanos',
      'sl': 'Estadísticas del minero',
      'sp': 'Perfil',
      'svam': 'Ver minero activo',
      'svas': 'Ver suscripción activa',
      'scs': 'Atención al cliente',
      'sShare': 'Compartir',
      'srs': 'Restaurar suscripción',
      'spp': 'Política de privacidad',
      'sda': 'Eliminar cuenta',
      'slo': 'Cerrar sesión',
      'st': 'Ajustes de tema',
      'sth': 'Interfaz',
      'stas': 'Ajustes de apariencia',
      'sla': 'Idioma',
      'scss': 'Enviar solicitud',
      'sf': 'Comentarios',
      'sf1': '¡Gracias por estar con nosotros! 🫶 ¿Disfruta la aplicación? Una calificación ⭐ significa mucho para nosotros.',
      'sttr': "Califícanos",
      'smrht': "Aún no ha minado nada.",
      'sadh': "¿Está seguro de que desea eliminar su cuenta?",
      'sads': "Esto borrará permanentemente todos sus datos. Esta acción no se puede deshacer.",
      'sadby': "Sí",
      'sadbn': "No",
      'salh': "¿Está seguro de que desea cerrar sesión?",
      'sallo': "Cerrar sesión",
      'salc': "Cancelar",
      'salcsd': "✅ Su cuenta ha sido eliminada y todos los datos borrados.",
      "sissm": "🎉 ¡Felicidades! Se ha suscrito con éxito a @hashrate por @day",
      "srt":
      "Restaure suscripciones compradas previamente vinculadas a su cuenta de Google. No habrá cargos al restaurar.",
      "srwt":
      "Por favor, no cierre la aplicación ni presione el botón atrás mientras restauramos su suscripción. Esto puede tardar unos segundos.",
      "srsm":
      "Su suscripción se ha restaurado con éxito. Su poder de minería ha subido y puede continuar ganando sin interrupciones.",
      "snasfua": "No se encontró ninguna suscripción activa en su cuenta.",
      'srd': "Hecho",
      'rsb': "Restaurar",

      // active miner
      'amh': 'Minero activo',
      'amyc': 'Actualmente no posee ningún NFT de minero.',
      'amsc': 'No se encontraron suscripciones activas.',
      'ash': 'Suscripción activa',

      // profile page
      'ph': 'Perfil',
      'pub': 'ACTUALIZAR',
      'pn': 'Nombre',
      'pe': 'Correo electrónico',
      'pwa': 'Dirección de billetera',
      'ppn': 'Número de teléfono',
      'pne': 'El nombre es obligatorio.',
      'pee': 'El correo es obligatorio.',
      'ppne': 'El número de teléfono es obligatorio.',
      'pwae': 'La dirección de billetera es obligatoria.',
      'pwh': 'Ingrese dirección de billetera',
      'csm': 'Mensaje',
      'csmh': 'Ingrese su mensaje',

      // payout page
      'prbw': 'Debe tener al menos @rbtc BTC para retirar.',
      'pop': 'Por favor, lea atentamente antes de retirar',
      'pod1':
      'Retirar Bitcoin (BTC) implica transferir sus fondos desde la plataforma o billetera a otra dirección de BTC. Antes de proceder, asegúrese de que el monto cumpla con el mínimo requerido y que su saldo cubra la tarifa de red.',
      'pod2':
      'La tarifa de red es dinámica y depende del tráfico de la cadena de bloques. Se deducirá de su monto total. Verifique la dirección de destino: las transacciones de BTC son irreversibles.',
      'pod3':
      'Como medida de seguridad, las solicitudes pueden requerir verificación (2FA o correo electrónico). Priorizamos su seguridad: los intentos sospechosos serán bloqueados automáticamente.',
      'pomw': '* Retiro mínimo ',
      'pook': 'Entendido',
      'poe1': 'Por favor, actualice su perfil antes de realizar un retiro.',
      'pows': 'Su proceso de retiro ha comenzado. Recibirá sus fondos en breve.',

      // Look & UnLook
      "lh": "Bloquear",
      "lvl": "BÓVEDA BLOQUEADA",
      "lel": "ACTIVAR BLOQUEO",
      "lclst":
      "Canal seguro activo. Desbloquee la bóveda ahora para reclamar @lvbalance BTC. Bloquee una vez, relájese siempre.",
      "lptl": "Vea este anuncio para asegurar sus @tolockbtc BTC minados en un canal seguro y cifrado.",
      "lPbsm": "Sus @lockedbtc BTC minados están bloqueados de forma segura.",
      "ulh": "Desbloquear",
      "uvull": "BÓVEDA DESBLOQUEADA",
      "uslst":
      "Canal seguro activado. Desbloquee la bóveda ahora para acceder a sus @ulvbalance BTC. Acceso seguro.",
      'lUPtl':
      "Vea este anuncio para desbloquear su bóveda y acceder a sus @tounlockbtc BTC minados al instante.",
      'lUPbsm': "Sus @unlockedbtc BTC ya están desbloqueados y listos para reclamar.",

      // record page
      'rh': 'Registro de minería',
      'rmb': 'BTC minado',
      'rrb': 'BTC por referidos',
      'rkh': 'Mejores mineros',

      //
      'ssc': 'Seleccionar país',

      // FAQ
      // 🟢 GENERAL
      'q1': '¿Cómo empezar a minar?',
      'a1':
      'Vaya a la pantalla de inicio y toque el botón "Iniciar minería". El proceso comenzará de inmediato.',

      'q2': '¿Es posible recolectar más USDT?',
      'a2': 'Sí, puede recolectar más USDT aumentando el tiempo de minería e impulsando los Gh/s.',

      'q3': '¿Cómo aumentar el tiempo de minería?',
      'a3':
      'Inicie la minería y toque el icono del reloj de arena. Aparecerá una ventana para aumentar el tiempo hasta 2 horas.',

      'q4': '¿Cómo impulsar los Gh/s?',
      'a4':
      'Inicie la minería y toque el icono Boost. Podrá aumentar la velocidad hasta 100 Gh/s.',

      // 🟡 RECOMPENSAS
      'q5': '¿Qué es una Super Coin?',
      'a5':
      'Es una moneda especial para mejorar su equipo, tiempo y velocidad. También puede convertirla a USDT.',

      'q6': '¿Cómo puedo recolectar Super Coins?',
      'a6':
      'Puede recolectarlas diariamente de la caja misteriosa o jugando Flip & Win en la pestaña de Recompensas.',

      'q7': '¿Cómo convertir Super Coins a USDT?',
      'a7': 'Vaya a Perfil > Convertir Super Coins para pasarlas a Oro.',

      // 🔵 MEJORAS
      'q8': '¿Por qué debería mejorar mi equipo, velocidad y tiempo?',
      'a8': 'Las mejoras aumentan el rendimiento de minería y le permiten ganar monedas más rápido.',

      'q9': '¿Cómo mejorar el equipo?',
      'a9': 'Puede usar USDT y Super Coins para mejorar su rendimiento de minería.',

      'q10': '¿Afectan las mejoras a las ganancias diarias?',
      'a10': 'Sí, mejorar su equipo, velocidad y tiempo aumenta sus recompensas diarias de minería.',
    },

    // TODO Portuguese Translation
    'pt_PT': {
      'save': 'Guardar',
      'bh': 'Início',
      'bs': 'Loja',
      'bw': 'Carteira',
      'bp': 'Definições',
      'mpith': 'Poder de Mineração Total',
      'mpit':
      'Para manter o seu minerador ativo, deve ativá-lo manualmente uma vez por dia. Assim que ativado, ele minerará automaticamente Bitcoin nos nossos servidores cloud, e receberá atualizações em tempo real. Por favor, note que o poder de mineração diminui gradualmente ao longo do tempo; no entanto, pode minimizar este efeito ao completar tarefas baseadas em anúncios. Também pode aumentar o seu poder de mineração ao ver anúncios ou aumentá-lo instantaneamente ao adquirir um plano de mineração.',
      "nn": "Agora Não",
      "wad": "Ver Agora",
      "wadlb": "Fechar",
      "wadlt": "Já atingiu este booster. Ele renovar-se-á automaticamente após 4 horas.",

      // splash page
      'sht': 'Mine Bitcoin Instantaneamente, Sem Configuração',
      'shs': 'Um toque para começar — acompanhe a hashrate e ganhos em direto no seu telemóvel.',
      'sb': 'Começar',

      // singIn Page
      'snrh': 'Inserir Código de Recomendação (Opcional)',
      'snlw': 'Entrar com',
      'sncwg': 'Continuar com Google',
      'sntu': 'Termos de Utilização',
      'snpp': 'Política de Privacidade',
      'snwgs':
      'A nossa plataforma utiliza tecnologia de mineração baseada em cloud. O seu dispositivo móvel não é usado como ferramenta de mineração.',
      "cics": "A Inicializar Servidor Cloud",
      "cisc": "Configuração Concluída",
      "cisyr": "Selecione a Sua Região",
      "cicr": "Escolher Região",
      "ci": "A inicializar...",
      "csc": "Tudo pronto! O seu servidor de mineração cloud está pronto na região @selectedRegion",
      "cscr": "Recebeu @reward de poder de mineração cloud gratuito para começar a sua jornada.",
      "cyrs": "O seu servidor de mineração cloud será inicializado com base na região que escolher.",
      "ccb": "Continuar",
      "csre":"⚠️ Escolha a sua região para continuar",

      // home page
      'hsb': 'INICIAR',
      'hcb': 'Saldo Atual',
      'hms': 'Velocidade',
      'hsc': 'Super Coin',
      'ham': 'Mineradores Ativos',
      'hpub': 'Aumentar Poder',
      "hab": "Booster Ativo",
      "hadr": "Ler Mais",
      'hdr': 'Aumentar Tempo',
      'hdrst': 'Pode aumentar o seu tempo de mineração até @inTime.',
      'hdqr': 'Booster de Velocidade',
      'hdqrst': 'Aumente a sua velocidade de mineração até @spBooster para ganhar mais rápido!',
      "hbdht": "Boost de Velocidade de Mineração",
      "htdht": "Boost de Tempo de Mineração",
      "htrwd": "Recompensa de Mineração",
      "hbdhst": "Veja este anúncio para ganhar mais ao aumentar o seu poder de mineração até @power.",
      "htdhst": "Veja este anúncio para ganhar mais ao prolongar o seu tempo de mineração até @time.",
      "htdhat": "Resta-lhe @attempt tentativa gratuita.",
      "hbrwd": "Veja este anúncio para desbloquear um bónus de mineração e ganhar mais.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Boost Padrão\nRenova-se automaticamente a cada 24 horas – não perca um dia! ⏳',
      "scat": "Super Coin",
      "scht": "Conheça a SuperCoin! A nossa forma especial de agradecer por fazer parte da nossa app.",
      "scab": "Saldo Disponível",
      "scuscb": "Usar SuperCoin",
      "scone": "1 SuperCoin",
      "scn1":
      "A SuperCoin é uma recompensa de bónus. Para convertê-la em BTC, precisa de ter um saldo de @cbtcb BTC disponível para levantamento.",
      "sccer":"Desculpe, não tem saldo suficiente para converter SuperCoin.",
      "htbar":"Ação Necessária",
      "htbarst":"A mineração não está ativa. Inicie a mineração para aumentar o tempo.",

      // store page
      "srz": "Zona de Recompensas! 🎉",
      "srzst": "Complete tarefas simples para desbloquear recompensas valiosas 🎁",
      'sspeed': 'Velocidade',
      'ssst': 'Mova o cursor para definir a velocidade de mineração, ou escolha um plano pronto abaixo.',
      "smuo": "Visão Geral da Unidade de Mineração",
      "sms": "Velocidade de Mineração",
      "sbms": "Bónus de Velocidade de Mineração",
      "smp": "Poder de Mineração",
      'smb': 'Boost de Mineração',
      'sam': 'Mineradores Alocados',
      "sbutton": "Detalhes e Benefícios",
      'sob': 'Ver Anúncio e Boost',
      "est":"Mineração de BTC segura e sem esforço — disponível a qualquer momento.",
      "sssp": "Preço Padrão",
      "ssda": "Desconto Aplicado",
      "ssfp": "Preço Final",
      "rwh": "Recompensas",
      "rzhw": "Como Funciona",
      "rzar": "Recompensas Disponíveis",
      "rzrc": "Concluído",
      "rwt": "Tarefa:",
      "rwr": "Recompensa:",
      "rwcb": "Reivindicar",
      "rwcdb": "Reivindicado",
      "rwcloseb": "Fechar",
      "rwcm":
      "➤ Uma recompensa de cada vez — reivindique agora e obtenha a próxima após o cronómetro.\n\n➤ Por favor, aguarde que o cronómetro da recompensa atual termine. Pode acompanhá-lo na Página Inicial em 'Booster Ativo'.\n\n➤ Assim que o cronómetro terminar, outras recompensas serão desbloqueadas automaticamente.",
      "rhrsw": "Como Funciona o Sistema de Recompensas",
      "rsdt": "Ganhe um boost de velocidade gratuito para aumentar o seu poder de mineração!",
      "rsdst":
      "O sistema de Recompensas permite-lhe obter pequenos boosts de velocidade gratuitos por tempo limitado ao completar tarefas simples como ver anúncios, deixar avaliações ou completar ofertas. É uma forma divertida de começar a minerar sem gastar dinheiro!",
      "rsdst1":
      "🔁 Pode reivindicar tempo de velocidade de mineração gratuito ilimitado com a tarefa “Recompensa Gratuita” — sem limites!",
      "rsdst2":
      "⚠️ Os boosts gratuitos são menos potentes do que os planos pagos — são desenhados para dar um pequeno empurrão, não o desempenho total.",
      "rzst": "Mine Bitcoin grátis ao completar tarefas simples",
      "rzst1":
      "Complete tarefas simples como ver anúncios e deixar avaliações para ganhar pontos e começar a minerar sem custos. Aumente os seus ganhos sem necessidade de investimento.",
      "rat":"Disponível em @atime",

      'sh': 'Poder de Hashing',
      'smr': 'Plataforma de Mineração',
      'sv': 'Duração',
      'smc': 'Contagem de Mineradores',
      'sdp': 'O Seu Desconto',
      'sbv': 'Valor de Referência',
      'sa': 'Preço Total',
      'sd': 'Preço Poupado',
      'ss': 'Subscrever',
      'spd': 'Detalhes do Plano',
      'sav': 'Ver',
      'suyh': 'Atualize a Sua HashRate',
      'sas': 'Detalhes e Benefícios',
      's1': 'Obtenha 100% de tempo de atividade—apoiado pelo seu minerador dedicado, mesmo durante falhas do sistema.',
      's2':
      'Ao subscrever, concorda em ser cobrado. A sua subscrição renova-se automaticamente ao mesmo preço e duração, a menos que seja cancelada. Também concorda com os nossos ',
      'sspd':
      'A subscrição será renovada automaticamente com base no seu plano até que cancele. Pode geri-la a qualquer momento no Google Play.',
      "sslo": "Oferta Limitada",

      // wallet page
      'wwb': 'Levantar',
      'wwc': 'Reivindicar Recompensas',
      'wh': 'Histórico',
      'wm': 'Mineração',
      'wr': 'Recomendação',
      'whr': 'Ainda não efetuou nenhum levantamento.',
      'wmbc': 'Concluir Configuração',
      'wmh': 'SALDO',
      'wmte': 'Ganhos Totais:',
      'wmw': 'LEVANTAR',
      'wrrb': 'SALDO DE RECOMENDAÇÃO',
      'wrse': 'Partilhar para Ganhar',
      'wrati': 'Rendimento de Sempre:',
      'wmcyas': 'Conclua a Configuração da Sua Conta',
      'wmprdcw':
      'Forneça os detalhes necessários para concluir a configuração da sua conta e permitir o levantamento de fundos.',
      'wrgr':
      'Aumente o seu saldo de Recomendação sempre que alguém se juntar usando o seu código e ganhar BTC.',

      //setting page
      'ssgr': 'Recompensas de Recomendação',
      'sr': 'Registo de Mineração',
      'sru': 'Avalie-nos',
      'sl': 'Estatísticas do Minerador',
      'sp': 'Perfil',
      'svam': 'Ver Minerador Ativo',
      'svas': 'Ver Subscrição Ativa',
      'scs': 'Apoio ao Cliente',
      'sShare': 'Partilhar',
      'srs': 'Restaurar Subscrição',
      'spp': 'Política de Privacidade',
      'sda': 'Eliminar Conta',
      'slo': 'Sair',
      'st': 'Definições de Tema',
      'sth': 'Interface',
      'stas': 'Definições de Aparência',
      'sla': 'Idioma',
      'scss': 'Enviar Pedido',
      'sf': 'Feedback',
      'sf1': 'Obrigado por estar connosco! 🫶 Está a gostar da app? Uma avaliação de ⭐ significa muito para nós.',
      'sttr': "Avalie-nos",
      'smrht': "Ainda não minerou nada.",
      'sadh': "Tem a certeza de que deseja eliminar a sua conta?",
      'sads': "Isto apagará permanentemente todos os seus dados. Esta ação não pode ser desfeita.",
      'sadby': "Sim",
      'sadbn': "Não",
      'salh': "Tem a certeza de que deseja sair da sua conta?",
      'sallo': "Sair",
      'salc': "Cancelar",
      'salcsd': "✅ A sua conta foi eliminada e todos os dados foram limpos.",
      "sissm": "🎉 Parabéns! A sua @hashrate foi subscrita com sucesso por @day",
      "srt":
      "Restaure subscrições compradas anteriormente associadas à sua conta Google. Não haverá cobranças ao restaurar.",
      "srwt":
      "Por favor, não feche a app nem pressione o botão voltar enquanto restauramos a sua subscrição. Isto pode demorar alguns segundos.",
      "srsm":
      "A sua subscrição foi restaurada com sucesso. O seu poder de mineração aumentou e pode continuar a ganhar sem interrupções.",
     "snasfua":"Nenhuma assinatura ativa encontrada em sua conta." ,
      'srd': "Concluído",
      'rsb': "Restaurar",

      // active miner
      'amh': 'Minerador Ativo',
      'amyc': 'Atualmente não possui nenhuns NFTs de minerador.',
      'amsc': 'Nenhuma subscrição ativa encontrada.',
      'ash': 'Subscrição Ativa',

      // profile page
      'ph': 'Perfil',
      'pub': 'ATUALIZAR',
      'pn': 'Nome',
      'pe': 'E-mail',
      'pwa': 'Endereço da Carteira',
      'ppn': 'Número de Telemóvel',
      'pne': 'O nome é obrigatório.',
      'pee': 'O e-mail é obrigatório.',
      'ppne': 'O número de telemóvel é obrigatório.',
      'pwae': 'O endereço da carteira é obrigatório.',
      'pwh': 'Inserir Endereço da Carteira',
      'csm': 'Mensagem',
      'csmh': 'Insira a sua mensagem',

      // payout page
      'prbw': 'Deve ter pelo menos @rbtc BTC para levantar.',
      'pop': 'Por favor, leia atentamente antes de levantar',
      'pod1':
      'Levantar Bitcoin (BTC) envolve transferir os seus fundos da exchange ou carteira para outro endereço BTC. Antes de prosseguir, certifique-se de que o valor do levantamento cumpre o requisito mínimo da plataforma e que o seu saldo é suficiente para cobrir a taxa de rede.',
      'pod2':
      'A taxa de rede (minerador) é dinâmica e depende do tráfego da blockchain. Será deduzida do seu valor total. Por favor, verifique bem o endereço Bitcoin do destinatário—as transações BTC são irreversíveis.',
      'pod3':
      'Como medida de segurança, todos os pedidos de levantamento podem exigir passos de verificação, como autenticação de dois fatores (2FA). Tentativas de levantamento não autorizadas serão bloqueadas automaticamente.',
      'pomw': '* Levantamento Mínimo ',
      'pook': 'OK',
      'poe1': 'Por favor, atualize o seu perfil antes de efetuar um levantamento.',
      'pows': 'O seu processo de levantamento começou. Receberá o seu levantamento em breve.',

      // Look & UnLook
      "lh": "Bloquear",
      "lvl": "COFRE BLOQUEADO",
      "lel": "ATIVAR BLOQUEIO",
      "lclst":
      "Canal seguro ativo. Desbloqueie o cofre agora para reivindicar @lvbalance BTC. Bloqueie uma vez. Relaxe sempre. A sua Bitcoin fica protegida.",
      "lptl": "Veja este anúncio para segurar as suas @tolockbtc BTC mineradas num canal seguro e encriptado.",
      "lPbsm": "As suas @lockedbtc BTC mineradas estão bloqueadas de forma segura num canal seguro.",
      "ulh": "Desbloquear",
      "uvull": "COFRE DESBLOQUEADO",
      "uslst":
      "Canal seguro ativado. Desbloqueie o cofre agora para aceder às suas @ulvbalance BTC. Acesso seguro. Controlo total.",
      'lUPtl':
      "Veja este anúncio para desbloquear o seu cofre e aceder às suas @tounlockbtc BTC mineradas instantaneamente.",
      'lUPbsm': "As suas @unlockedbtc BTC estão agora desbloqueadas e prontas a reivindicar.",

      // record page
      'rh': 'Registo de Mineração',
      'rmb': 'BTC Minerado',
      'rrb': 'BTC de Recomendação',
      'rkh': 'Melhores Mineradores',

      //
      'ssc': 'Selecionar País',

      // FAQ

      // 🟢 GERAL
      'q1': 'Como Começar a Minerar?',
      'a1':
      'Vá ao ecrã inicial e toque no botão "Iniciar Mineração". O processo de mineração começará imediatamente.',

      'q2': 'É possível recolher mais USDT?',
      'a2': 'Sim, pode recolher mais USDT ao aumentar o tempo de mineração e fazer boost de Gh/s.',

      'q3': 'Como aumentar o tempo de mineração?',
      'a3':
      'Inicie a mineração e toque no ícone da Ampulheta. Aparecerá um modal onde pode aumentar o tempo de mineração até 2 horas.',

      'q4': 'Como fazer boost de Gh/s de mineração?',
      'a4':
      'Inicie a mineração e toque no ícone Boost. Aparecerá um modal onde pode aumentar a velocidade de mineração até 100 Gh/s.',

      // 🟡 RECOMPENSA
      'q5': 'O que é uma super coin?',
      'a5':
      'Uma super coin é uma moeda especial usada para melhorar a plataforma de mineração, tempo e velocidade. Também pode convertê-la em USDT.',

      'q6': 'Como posso recolher super coins?',
      'a6':
      'Pode recolher super coins diariamente na caixa mistério ou ao jogar o jogo Flip & Win no separador de Recompensas.',

      'q7': 'Como converter super coins em USDT?',
      'a7': 'Vá a Perfil > Converter Super Coins para converter as suas super coins em Ouro.',

      // 🔵 UPGRADE
      'q8': 'Porque devo melhorar a plataforma, velocidade e tempo?',
      'a8': 'Melhorar aumenta o desempenho da mineração e permite-lhe ganhar mais moedas mais depressa.',

      'q9': 'Como melhorar a plataforma, velocidade e tempo?',
      'a9': 'Pode fazer o upgrade usando USDT e super coins para aumentar o seu desempenho de mineração.',

      'q10': 'Melhorar afeta os ganhos diários?',
      'a10': 'Sim, melhorar a sua plataforma, velocidade e tempo aumenta as suas recompensas diárias de mineração.',
    },

    // TODO Dutch Translation
    'nl_NL': {
      'save': 'Opslaan',
      'bh': 'Home',
      'bs': 'Winkel',
      'bw': 'Portefeuille',
      'bp': 'Instellingen',
      'mpith': 'Totale Mijnkracht',
      'mpit':
      'Om uw miner actief te houden, moet u deze eenmaal per dag handmatig activeren. Eenmaal geactiveerd, zal het automatisch Bitcoin minen op onze cloudservers en ontvangt u realtime updates. Houd er rekening mee dat de mijnkracht in de loop van de tijd geleidelijk afneemt; u kunt dit effect echter minimaliseren door advertentietaken te voltooien. U kunt uw mijnkracht ook verhogen door advertenties te bekijken of deze direct een boost geven door een mijnbouwplan te kopen.',
      "nn": "Niet nu",
      "wad": "Nu bekijken",
      "wadlb": "Sluiten",
      "wadlt": "U heeft deze booster al bereikt. Deze wordt na 4 uur automatisch vernieuwd.",

      // splash page
      'sht': 'Min Bitcoin direct, geen installatie nodig',
      'shs': 'Eén tik om te starten — volg uw hashrate en inkomsten live vanaf uw telefoon.',
      'sb': 'Nu beginnen',

      // singIn Page
      'snrh': 'Voer referentiecode in (Optioneel)',
      'snlw': 'Inloggen met',
      'sncwg': 'Doorgaan met Google',
      'sntu': 'Gebruiksvoorwaarden',
      'snpp': 'Privacybeleid',
      'snwgs':
      'Ons platform maakt gebruik van cloud-gebaseerde mijnbouwtechnologie. Uw mobiele apparaat wordt niet gebruikt als mijnbouwtool.',
      "cics": "Cloudserver initialiseren",
      "cisc": "Configuratie voltooid",
      "cisyr": "Selecteer uw regio",
      "cicr": "Regio kiezen",
      "ci": "Initialiseren...",
      "csc": "Alles gereed! Uw cloud-mijnbouwserver staat klaar in regio @selectedRegion",
      "cscr": "U heeft @reward gratis cloud-mijnkracht ontvangen om uw reis te beginnen.",
      "cyrs": "Uw cloud-mijnbouwserver wordt geïnitialiseerd op basis van de regio die u kiest.",
      "ccb": "Doorgaan",
      "csre":"⚠️ Kies uw regio om door te gaan",

      // home page
      'hsb': 'START',
      'hcb': 'Huidig saldo',
      'hms': 'Snelheid',
      'hsc': 'Super Coin',
      'ham': 'Actieve miners',
      'hpub': 'Power Up',
      "hab": "Actieve booster",
      "hadr": "Lees meer",
      'hdr': 'Tijd verlengen',
      'hdrst': 'U kunt uw mijnbouwtijd verlengen tot @inTime.',
      'hdqr': 'Snelheidsbooster',
      'hdqrst': 'Verhoog uw mijnbouwsnelheid tot @spBooster om sneller te verdienen!',
      "hbdht": "Mijnsnelheid boost",
      "htdht": "Mijntijd boost",
      "htrwd": "Mijnbouw beloning",
      "hbdhst": "Bekijk deze advertentie om meer te verdienen door uw mijnkracht te verhogen naar @power.",
      "htdhst": "Bekijk deze advertentie om meer te verdienen door uw mijntijd te verlengen naar @time.",
      "htdhat": "U heeft nog @attempt gratis poging(en) over.",
      "hbrwd": "Bekijk deze advertentie om een bonusbeloning te ontgrendelen en meer te verdienen.\n@reward",
      'hdqrhs':
      '${AppConfig.appDataSet?.dailyRewardHashRateTwo} GH/s Standaard Boost\nWordt elke 24 uur automatisch vernieuwd – mis geen dag! ⏳',
      "scat": "Super Coin",
      "scht": "Maak kennis met de SuperCoin! Onze speciale manier om u te bedanken dat u deel uitmaakt van onze app.",
      "scab": "Beschikbaar saldo",
      "scuscb": "SuperCoin gebruiken",
      "scone": "1 SuperCoin",
      "scn1":
      "De SuperCoin is een bonusbeloning van ons. Om deze naar BTC te converteren, moet u een opneembaar saldo van @cbtcb BTC hebben.",
      "sccer":"Helaas, uw saldo is onvoldoende om SuperCoins te converteren.",
      "htbar":"Actie vereist",
      "htbarst":"Mijnbouw is niet actief. Start mijnbouw om de tijd te verlengen.",

      // store page
      "srz": "Beloningszone! 🎉",
      "srzst": "Voltooi eenvoudige taken om waardevolle beloningen te ontgrendelen 🎁",
      'sspeed': 'Snelheid',
      'ssst': 'Verschuif de regelaar om uw mijnsnelheid in te stellen, of kies hieronder een kant-en-klaar plan.',
      "smuo": "Overzicht mijnbouweenheid",
      "sms": "Mijnbouwsnelheid",
      "sbms": "Bonus mijnsnelheid",
      "smp": "Mijnkracht",
      'smb': 'Mijnbouw boost',
      'sam': 'Toegewezen miners',
      "sbutton": "Details & Voordelen",
      'sob': 'Advertentie bekijken & Boosten',
      "est":"Veilige en moeiteloze BTC-mijnbouw — op elk moment beschikbaar.",
      "sssp": "Standaardprijs",
      "ssda": "Korting toegepast",
      "ssfp": "Eindprijs",
      "rwh": "Beloningen",
      "rzhw": "Hoe het werkt",
      "rzar": "Beschikbare beloningen",
      "rzrc": "Voltooid",
      "rwt": "Taak:",
      "rwr": "Beloning:",
      "rwcb": "Claimen",
      "rwcdb": "Geclaimd",
      "rwcloseb": "Sluiten",
      "rwcm":
      "➤ Eén beloning per keer — claim nu en ontvang de volgende na de timer.\n\n➤ Wacht tot de huidige belonings-timer is afgelopen. U kunt dit volgen op de Homepagina onder 'Actieve booster'.\n\n➤ Zodra de timer afloopt, worden de andere beloningen automatisch ontgrendeld.",
      "rhrsw": "Hoe het beloningssysteem werkt",
      "rsdt": "Verdien een gratis snelheidsboost om uw mijnkracht te verhogen!",
      "rsdst":
      "Met het beloningssysteem kunt u voor een beperkte tijd kleine gratis snelheidsboosts verdienen door eenvoudige taken uit te voeren, zoals advertenties bekijken of reviews achterlaten. Het is een leuke manier om te beginnen zonder geld uit te geven!",
      "rsdst1":
      "🔁 U kunt onbeperkt gratis mijnbouwtijd claimen met de taak “Gratis Beloning” — geen limieten!",
      "rsdst2":
      "⚠️ Gratis boosts zijn minder krachtig dan betaalde plannen — ze zijn bedoeld voor een kleine extra zet, niet voor volledige prestaties.",
      "rzst": "Min gratis Bitcoin door eenvoudige taken te voltooien",
      "rzst1":
      "Voltooi taken zoals advertenties kijken en reviews geven om punten te verdienen. Verhoog uw inkomsten zonder investering.",
      "rat":"Beschikbaar over @atime",

      'sh': 'Hashkracht',
      'smr': 'Mining Rig',
      'sv': 'Duur',
      'smc': 'Aantal miners',
      'sdp': 'Uw korting',
      'sbv': 'Benchmark waarde',
      'sa': 'Totale prijs',
      'sd': 'Besparing',
      'ss': 'Abonneren',
      'spd': 'Plan details',
      'sav': 'Bekijken',
      'suyh': 'Upgrade uw HashRate',
      'sas': 'Details & Voordelen',
      's1': 'Krijg 100% uptime — ondersteund door uw eigen miner, zelfs tijdens systeemuitval.',
      's2':
      'Door u te abonneren, gaat u akkoord met de kosten. Uw abonnement wordt automatisch verlengd tegen dezelfde prijs en duur, tenzij u opzegt. U gaat ook akkoord met onze ',
      'sspd':
      'Het abonnement wordt automatisch verlengd volgens uw plan totdat u opzegt. U kunt dit op elk moment beheren in Google Play.',
      "sslo": "Beperkte aanbieding",

      // wallet page
      'wwb': 'Opnemen',
      'wwc': 'Beloningen claimen',
      'wh': 'Geschiedenis',
      'wm': 'Mijnbouw',
      'wr': 'Referral',
      'whr': 'U heeft nog geen opnames gedaan.',
      'wmbc': 'Configuratie voltooien',
      'wmh': 'SALDO',
      'wmte': 'Totale inkomsten:',
      'wmw': 'OPNEMEN',
      'wrrb': 'REFERRAL SALDO',
      'wrse': 'Deel om te verdienen',
      'wrati': 'Totale inkomsten ooit:',
      'wmcyas': 'Voltooi uw accountconfiguratie',
      'wmprdcw':
      'Verstrek de vereiste gegevens om uw account af te ronden en opname van fondsen mogelijk te maken.',
      'wrgr':
      'Verhoog uw Referral-saldo telkens wanneer iemand zich aanmeldt met uw code en BTC verdient.',

      //setting page
      'ssgr': 'Referral beloningen',
      'sr': 'Mijnbouwverslag',
      'sru': 'Beoordeel ons',
      'sl': 'Miner statistieken',
      'sp': 'Profiel',
      'svam': 'Bekijk actieve miner',
      'svas': 'Bekijk actief abonnement',
      'scs': 'Klantenservice',
      'sShare': 'Delen',
      'srs': 'Abonnement herstellen',
      'spp': 'Privacybeleid',
      'sda': 'Account verwijderen',
      'slo': 'Uitloggen',
      'st': 'Thema-instellingen',
      'sth': 'Interface',
      'stas': 'Uiterlijk instellingen',
      'sla': 'Taal',
      'scss': 'Verzoek verzenden',
      'sf': 'Feedback',
      'sf1': 'Bedankt dat u bij ons bent! 🫶 Geniet u van de app? Een ⭐ beoordeling betekent veel voor ons.',
      'sttr': "Beoordeel ons",
      'smrht': "U heeft nog niets gemined.",
      'sadh': "Weet u zeker dat u uw account wilt verwijderen?",
      'sads': "Dit zal al uw gegevens permanent wissen. Deze actie kan niet ongedaan worden gemaakt.",
      'sadby': "Ja",
      'sadbn': "Nee",
      'salh': "Weet u zeker dat u wilt uitloggen?",
      'sallo': "Uitloggen",
      'salc': "Annuleren",
      'salcsd': "✅ Uw account is verwijderd en alle gegevens zijn gewist.",
      "sissm": "🎉 Gefeliciteerd! Uw @hashrate is succesvol geabonneerd voor @day",
      "srt":
      "Herstel eerder gekochte abonnementen die gekoppeld zijn aan uw Google-account. Er worden geen kosten in rekening gebracht tijdens het herstellen.",
      "srwt":
      "Sluit de app niet en druk niet op de terug-knop terwijl wij uw abonnement herstellen. Dit kan enkele seconden duren.",
      "srsm":
      "Uw abonnement is succesvol hersteld. Uw mijnkracht is verhoogd en u kunt zonder onderbreking blijven verdienen.",
      "snasfua": "Geen actief abonnement gevonden in uw account.",
      'srd': "Gereed",
      'rsb': "Herstellen",

      // active miner
      'amh': 'Actieve miner',
      'amyc': 'U bezit momenteel geen miner NFT\'s.',
      'amsc': 'Geen actief abonnement gevonden.',
      'ash': 'Actief abonnement',

      // profile page
      'ph': 'Profiel',
      'pub': 'BIJWERKEN',
      'pn': 'Naam',
      'pe': 'E-mail',
      'pwa': 'Portefeuille adres',
      'ppn': 'Telefoonnummer',
      'pne': 'Naam is verplicht.',
      'pee': 'E-mail is verplicht.',
      'ppne': 'Telefoonnummer is verplicht.',
      'pwae': 'Portefeuille adres is verplicht.',
      'pwh': 'Voer portefeuille adres in',
      'csm': 'Bericht',
      'csmh': 'Voer uw bericht in',

      // payout page
      'prbw': 'U moet minimaal @rbtc BTC hebben om op te nemen.',
      'pop': 'Lees dit aandachtig door voor opname',
      'pod1':
      'Het opnemen van Bitcoin (BTC) houdt in dat u uw fondsen overboekt naar een ander BTC-adres. Zorg ervoor dat het bedrag voldoet aan de minimale vereisten en dat uw saldo de netwerkkosten dekt.',
      'pod2':
      'De netwerkkosten (miner fee) zijn dynamisch. Deze worden van uw totaalbedrag afgetrokken. Controleer het adres dubbel — BTC-transacties zijn onomkeerbaar.',
      'pod3':
      'Als veiligheidsmaatregel kunnen verificatiestappen (2FA) vereist zijn. Wij blokkeren automatisch verdachte opnamepogingen.',
      'pomw': '* Minimale opname ',
      'pook': 'Oké',
      'poe1': 'Werk uw profiel bij voordat u een opname doet.',
      'pows': 'Uw opnameproces is gestart. U ontvangt uw fondsen spoedig.',

      // Look & UnLook
      "lh": "Vergrendelen",
      "lvl": "KLUIS VERGRENDELD",
      "lel": "VERGRENDELING INSCHAKELEN",
      "lclst":
      "Beveiligd kanaal actief. Ontgrendel de kluis om @lvbalance BTC te claimen. Uw Bitcoin blijft beschermd.",
      "lptl": "Bekijk deze advertentie om uw geminede @tolockbtc BTC te beveiligen via een versleuteld kanaal.",
      "lPbsm": "Uw geminede @lockedbtc BTC is veilig vergrendeld.",
      "ulh": "Ontgrendelen",
      "uvull": "KLUIS ONTGRENDELD",
      "uslst":
      "Beveiligd kanaal gekoppeld. Ontgrendel de kluis voor toegang tot uw @ulvbalance BTC. Veilige toegang.",
      'lUPtl':
      "Bekijk deze advertentie om uw kluis te ontgrendelen en direct toegang te krijgen tot uw @tounlockbtc BTC.",
      'lUPbsm': "Uw @unlockedbtc BTC is nu ontgrendeld en klaar om te claimen.",

      // record page
      'rh': 'Mijnbouwverslag',
      'rmb': 'Geminede BTC',
      'rrb': 'Referral BTC',
      'rkh': 'Top miners',

      //
      'ssc': 'Selecteer land',

      // FAQ
      // 🟢 ALGEMEEN
      'q1': 'Hoe start ik met mijnbouw?',
      'a1':
      'Ga naar het homescherm en tik op de knop "Start mijnbouw". Het proces begint onmiddellijk.',

      'q2': 'Is het mogelijk om meer USDT te verzamelen?',
      'a2': 'Ja, u kunt meer verdienen door de mijntijd te verlengen en de Gh/s te boosten.',

      'q3': 'Hoe verleng ik de mijntijd?',
      'a3':
      'Start de mijnbouw en tik op het zandloper-icoon om de tijd met maximaal 2 uur te verlengen.',

      'q4': 'Hoe boost ik de Gh/s snelheid?',
      'a4':
      'Tik tijdens het minen op het Boost-icoon om de snelheid te verhogen tot 100 Gh/s.',

      // 🟡 BELONING
      'q5': 'Wat is een SuperCoin?',
      'a5':
      'Een speciale munt om uw rig, tijd en snelheid te upgraden. U kunt deze ook converteren naar USDT.',

      'q6': 'Hoe verzamel ik SuperCoins?',
      'a6':
      'Verzamel ze dagelijks uit de mystery box of via het Flip & Win spel onder het tabblad Beloningen.',

      'q7': 'Hoe converteer ik SuperCoins naar USDT?',
      'a7': 'Ga naar Profiel > Converteer Super Coins om ze om te zetten naar Goud.',

      // 🔵 UPGRADE
      'q8': 'Waarom zou ik upgraden?',
      'a8': 'Upgrades verbeteren de prestaties en laten u sneller munten verdienen.',

      'q9': 'Hoe voer ik een upgrade uit?',
      'a9': 'U kunt USDT en SuperCoins gebruiken om uw mijnbouwprestaties te verbeteren.',

      'q10': 'Heeft upgraden invloed op dagelijkse inkomsten?',
      'a10': 'Ja, het verhoogt uw dagelijkse mijnbouwbeloningen aanzienlijk.',
    },
  };
}
