import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
    String? hiText = '',
  }) =>
      [enText, esText, deText, arText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Welcome!',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
      'hi': '',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
      'hi': '',
    },
    'a9j78va9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'hi': '',
    },
    'i7f18cve': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
      'hi': '',
    },
    'wztjmbn8': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
      'hi': '',
    },
    'lw1jpm1f': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
      'hi': '',
    },
    'm2xyjvuf': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
      'hi': '',
    },
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'hi': '',
    },
    'cjqb8ial': {
      'en': 'Don\'t have an account?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
      'hi': '',
    },
    'a0iimirx': {
      'en': 'Create',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
      'hi': '',
    },
    '1zqiw31h': {
      'en': 'Continue as Guest',
      'ar': 'تواصل كضيف',
      'de': 'Als Gast fortfahren',
      'es': 'Continua como invitado',
      'hi': '',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // registerAccount
  {
    'gpokmd81': {
      'en': 'Get Started',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
      'hi': '',
    },
    'gcwdqm4g': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'hi': '',
    },
    'iam0xgwx': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
      'hi': '',
    },
    'bqv15dcf': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
      'hi': '',
    },
    'joih97mn': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
      'hi': '',
    },
    'rzpiwq9p': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
      'hi': '',
    },
    'eyfkffka': {
      'en': 'Enter your password...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
      'hi': '',
    },
    'oqn15oir': {
      'en': 'Enter Referral Code',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '5kmjfwsk': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
      'hi': '',
    },
    '3twynvfz': {
      'en': 'Login',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
      'hi': '',
    },
    '9ssznj0g': {
      'en': 'Already have an account?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
      'hi': '',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
      'hi': '',
    },
    'r6npjsue': {
      'en': 'Upload a photo for us to easily identify you.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
      'hi': '',
    },
    'sdptn7dd': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
      'hi': '',
    },
    'n636qnrx': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
      'hi': '',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
      'hi': '',
    },
    '72ii0waq': {
      'en': 'Your City',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
      'hi': '',
    },
    'pf8glhkg': {
      'en': 'Raipur',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
      'hi': '',
    },
    'hbhd3bdt': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
      'hi': '',
    },
    'w75dikic': {
      'en': 'Skip for Now',
      'ar': 'تخطي في الوقت الراهن',
      'de': 'Für jetzt überspringen',
      'es': 'Saltar por ahora',
      'hi': '',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
      'hi': '',
    },
    'xaiad71o': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
      'hi': '',
    },
    'u4nuk910': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'hi': '',
    },
    '37kotxi0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
      'hi': '',
    },
    'hiwpaze1': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
      'hi': '',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // onboarding
  {
    'co7nhqsw': {
      'en': 'Larsen Panjwani Securities',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'p16b1e95': {
      'en': 'Redefining Returns',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'i8hl2uua': {
      'en': 'SIP KARO..MAST RAHO',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
      'hi': '',
    },
    'hxtwax0y': {
      'en': 'Get on board with us andstart your investing journey',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
      'hi': '',
    },
    'mjy3ljln': {
      'en': 'Earn Referral bonus of Rs. 500',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
      'hi': '',
    },
    'uf9k1spp': {
      'en': 'Refer our app and earn Rs 500 on every user who subscribes.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
      'hi': '',
    },
    '9c4outzf': {
      'en': 'SIP made easy!',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
      'hi': '',
    },
    'q30ina4f': {
      'en': 'now start investing with as low as Rs. 1,000',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
      'hi': '',
    },
    'ypt7b97g': {
      'en': 'Start Investing',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
      'hi': '',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'My Account',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
      'hi': '',
    },
    'i61y9ibx': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'hi': '',
    },
    '03k0vw86': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
      'hi': '',
    },
    '6w6wv95p': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
      'hi': '',
    },
    '9aogde79': {
      'en': 'Terms and Condition',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
      'hi': '',
    },
    'eojlfs66': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
      'hi': '',
    },
    '2ll42t1u': {
      'en': 'Dark Mode',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '8srr2k0j': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
      'hi': '',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
      'hi': '',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take upto 24 Hours  to reflect.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
      'hi': '',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
      'hi': '',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // Withdr
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
      'hi': '',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
      'hi': '',
    },
    'zq4ozx20': {
      'en': ' ₹7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
      'hi': '',
    },
    'y91eqdk1': {
      'en': 'IMPS/NEFT/RTGS',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'eo93ozrs': {
      'en': 'PAYMENT METHOD',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'u0r87fao': {
      'en': 'Enter Account Number',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'vgzm6xew': {
      'en': 'Enter IFSC Code',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'gx61chnh': {
      'en': 'Enter Benificiary\'s Name',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
      'hi': '',
    },
    'wngoi0v4': {
      'en': 'Your account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
      'hi': '',
    },
    'g6bfec2g': {
      'en': ' ₹7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
      'hi': '',
    },
    'xaw2jdst': {
      'en': 'Confirm Withdrawal',
      'ar': 'أرسل حوالة',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
      'hi': '',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'اضغط أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
      'hi': '',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // DEPOSIT
  {
    'qywon4k1': {
      'en': 'DEPOSIT',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
      'hi': '',
    },
    'bh9tad8e': {
      'en': 'Amount',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
      'hi': '',
    },
    '40qc6p2z': {
      'en': 'IMPS/NEFT/RTGS',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '05sp8r76': {
      'en': 'UPI',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'geym0enj': {
      'en': 'Cash Deposit',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'htxrrjuo': {
      'en': 'Select Payment Option',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'ohewrgsv': {
      'en': 'Time of transaction',
      'ar': 'أنفقت في',
      'de': 'Verbracht bei',
      'es': 'gastado en',
      'hi': '',
    },
    '0v6ogfir': {
      'en': '     UTR NO.',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'swxms7ln': {
      'en':
          'Account  Details\nA/C number - 50100460307710\nIfsc Code - HDFC0001454\nName - Larsen Panjwani',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
      'hi': '',
    },
    '46nf4mb4': {
      'en': 'UPI Details\n9630426938@paytm',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'uqfgu088': {
      'en': 'Confirm Deposit',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
      'hi': '',
    },
    '9stmpsf0': {
      'en': 'Tap above to confirm deposit',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
      'hi': '',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
      'hi': '',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
      'hi': '',
    },
    'zoxan2gi': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
      'hi': '',
    },
    '3p9y21e2': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
      'hi': '',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
      'hi': '',
    },
    'z4fstn5l': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'hi': '',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
      'hi': '',
    },
    '8h1cjk5a': {
      'en': 'Your Age',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
      'hi': '',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
      'hi': '',
    },
    'zvymbfia': {
      'en': 'Your Title',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
      'hi': '',
    },
    'i6edcl52': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'hi': '',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
      'hi': '',
    },
    '2b97u8y5': {
      'en':
          'Enter the email associated with your account and we will send you link to reset your password.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
      'hi': '',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
      'hi': '',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
      'hi': '',
    },
    'if4pz6lm': {
      'en': 'Send Reset Link',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
      'hi': '',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
      'hi': '',
    },
    'r72zvrv5': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
      'hi': '',
    },
    'gjygkr0n': {
      'en': 'Push Notifications',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
      'hi': '',
    },
    '3y3yhxbk': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
      'hi': '',
    },
    '1ytebj35': {
      'en': 'Email Notifications',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
      'hi': '',
    },
    '9lvh5nst': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
      'hi': '',
    },
    '69d2j74u': {
      'en': 'Location Services',
      'ar': 'خدمات الموقع',
      'de': 'Standortdienste',
      'es': 'Servicios de localización',
      'hi': '',
    },
    '3k8cuv0d': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'ar':
          'اسمح لنا بتتبع موقعك ، فهذا يساعد على تتبع الإنفاق ويحافظ على سلامتك.',
      'de':
          'Erlauben Sie uns, Ihren Standort zu verfolgen, dies hilft, die Ausgaben im Auge zu behalten und schützt Sie.',
      'es':
          'Permítanos rastrear su ubicación, esto ayuda a realizar un seguimiento de los gastos y lo mantiene seguro.',
      'hi': '',
    },
    'isgrgbfs': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
      'hi': '',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
      'hi': '',
    },
    'fvsfg5on': {
      'en': 'How we use your data',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
      'hi': '',
    },
    'nbiyrnzl': {
      'en':
          'Larsen  Panjwani Securities operates [LP Money] mobile application .\n\nThis page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.\n\nWe use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy.\n\nInformation Collection and Use\n\nWe collect several different types of information for various purposes to provide and improve our Service to you.\n\nTypes of Data Collected\n\nPersonal Data\n\nWhile using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (\"Personal Data\"). Personally identifiable information may include, but is not limited to:\n\nEmail address\nFirst name and last name\nPhone number\nAddress, State, Province, ZIP/Postal code, City\nCookies and Usage Data\nUsage Data\n\nWe may also collect information about how the Service is accessed and used (\"Usage Data\"). This Usage Data may include information such as your computer\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers, and other diagnostic data.\n\nTracking & Cookies Data\n\nWe use cookies and similar tracking technologies to track the activity on our Service and hold certain information.\n\nCookies are files with small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Tracking technologies also used are beacons, tags, and scripts to collect and track information and to improve and analyze our Service.\n\nYou can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.\n\nExamples of Cookies we use:\n\nSession Cookies. We use Session Cookies to operate our Service.\nPreference Cookies. We use Preference Cookies to remember your preferences and various settings.\nSecurity Cookies. We use Security Cookies for security purposes.\nUse of Data\n\n[Your Application Name] uses the collected data for various purposes:\n\nTo provide and maintain the Service\nTo notify you about changes to our Service\nTo allow you to participate in interactive features of our Service when you choose to do so\nTo provide customer care and support\nTo provide analysis or valuable information so that we can improve the Service\nTo monitor the usage of the Service\nTo detect, prevent and address technical issues\nTransfer Of Data\n\nYour information, including Personal Data, may be transferred to - and maintained on - computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction.\n\nIf you are located outside [insert country] and choose to provide information to us, please note that we transfer the data, including Personal Data, to [insert country] and process it there.\n\nYour consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.\n\n[Your Application Name] will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information.\n\nDisclosure Of Data\n\nLegal Requirements\n\nLarsen Panjwani Securities  may disclose your Personal Data in the good faith belief that such action is necessary to:\n\nTo comply with a legal obligation\nTo protect and defend the rights or property of Larsen Panjwani Securities Private Limited.',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'hi': '',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // Termsandcondition
  {
    '38wb3rix': {
      'en': 'About',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
      'hi': '',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // homePage_alt_1
  {
    '51kawpgz': {
      'en': 'Welcome!',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
      'hi': '',
    },
    'wuzsqa3n': {
      'en': 'Refer & Earn',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'wknu2tm4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
      'hi': '',
    },
    'syy689nt': {
      'en': '₹7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
      'hi': '',
    },
    'y7zomzzp': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
      'hi': '',
    },
    'rfozud9v': {
      'en': 'DEPOSIT',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
      'hi': '',
    },
    'pcrarg0a': {
      'en': 'SIP',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
      'hi': '',
    },
    'zmjsfzgg': {
      'en': 'WITHDRAWAL',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
      'hi': '',
    },
    'dfjtbkbo': {
      'en': 'Lock In & Rewards',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
      'hi': '',
    },
    'glpc8qfg': {
      'en': 'SIP',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'g7t9krj7': {
      'en': '24%',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
      'hi': '',
    },
    'bj5qnrj5': {
      'en': '1 Year',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
      'hi': '',
    },
    'd1n5mbq7': {
      'en': 'Invest',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'hi': '',
    },
    '2thn73jc': {
      'en': '28 %',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
      'hi': '',
    },
    'ld7s2fpn': {
      'en': '2 YEAR',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
      'hi': '',
    },
    'ft8bu1we': {
      'en': 'Invest',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'hi': '',
    },
    '8t6ddwco': {
      'en': '30 %',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
      'hi': '',
    },
    'qmjqp9a6': {
      'en': '3 YEAR',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
      'hi': '',
    },
    '9qc797et': {
      'en': 'Invest',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'hi': '',
    },
    '8pdmehj2': {
      'en': '31 %',
      'ar': 'احصل على مكافآت بعيدة',
      'de': 'Go-Far-Prämien',
      'es': 'Recompensas Ve Lejos',
      'hi': '',
    },
    '53m2u0s2': {
      'en': '5 YEAR',
      'ar': '50.00 دولارًا أمريكيًا',
      'de': '\$50,00',
      'es': '\$50.00',
      'hi': '',
    },
    'aks5zz4f': {
      'en': 'Invest',
      'ar': 'مرحبا بالعالم',
      'de': 'Hallo Welt',
      'es': 'Hola Mundo',
      'hi': '',
    },
    'f3hxl69y': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
      'hi': '',
    },
  },
  // userVerification
  {
    'vmi9zmph': {
      'en': '☝️ Just one more step.',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '0hzrvm7s': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '7rai6fx9': {
      'en': 'First Name',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'p9mpb106': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'knzx07py': {
      'en': 'Last Name',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'azryfpea': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '3m78c3bu': {
      'en': 'Document Number',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'ywaenr8e': {
      'en': 'Adhaar Card',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'urzgd4y9': {
      'en': 'Pan Card',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '473wxblk': {
      'en': 'Driving License',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'x87842qq': {
      'en': 'Voter ID',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '027cnibg': {
      'en': 'DOCUMENT TYPE',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'rzcqnaxx': {
      'en': 'National ID - Front',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'yks5swcp': {
      'en': 'National ID - Back',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'q8c0r026': {
      'en': 'Send 🚀',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'ie2vfjfd': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'tsduj3r3': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'r07wvp5j': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'hpu9yydq': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
      'hi': '',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
      'hi': '',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
      'hi': '',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': 'Allow Camera',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '27sy3hol': {
      'en': 'Allow Contacts',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'wsgc84e1': {
      'en': 'Allow Location',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '0380o720': {
      'en': 'Allow Microphone',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '2v8g05yr': {
      'en': 'Allow Notifications',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'gpku187e': {
      'en': 'Scan ID',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'xrlimvda': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'qqic7s7r': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'mf3pjmqv': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '0ijoljr8': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'vy6g0sqn': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '2zz57r4q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
