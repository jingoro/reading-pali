paliDict =
  "buddhaṃ": "Buddha"
  "saraṇaṃ": "refuge"
  "gacchāmi": "I go to"
  "dhammaṃ": "Dhamma"
  "saṃghaṃ": "Sangha"
  "dutiyaṃ": "second time"
  "pi": "again"
  "tatiyaṃ": "third time"
  "ti": '"'

  "cittaṃ": "mind"
  "bhikkhave": "o' monks"
  "adantaṃ": "untamed"
  "mahato": "great"
  "anatthāya": "for disadvantage"
  "saṃvattati": "leads to him"
  "saṃvattatī": "leads to him"
  "saṃvattantī": "leads to them"
  "dantaṃ": "tamed"
  "atthāya": "for advantage"
  "aguttaṃ": "unguarded"
  "guttaṃ": "guarded"
  "arakkhitaṃ": "unprotected"
  "rakkhitaṃ": "protected"
  "asaṃvutaṃ": "unrestrained"
  "saṃvutaṃ": "restrained"
  "nāhaṃ": "not I"
  "aññaṃ": "another"
  "ekadhammaṃ": "single thing"
  "samanupassāmi": "I see"
  "yaṃ": "that"
  "evaṃ": "thus"
  "yathayidaṃ": "that is to say"

  "sammādiṭṭhi": "right view"
  "sammādiṭṭhikassa": "one with right view"
  "micchādiṭṭhi": "wrong view"
  "micchādiṭṭhikassa": "one with wrong view"
  "anuppannā": "unarisen"
  "anuppannānaṃ": "of unarisen"
  "uppannānaṃ": "of arisen"
  "ca": "and"
  "eva": "indeed"
  "c'eva": "and indeed"
  "akusalā": "unwholesome"
  "kusalā": "wholesome"
  "dhammā": "things"
  "uppajjanti": "they arise"
  "n'uppajjanti": "they don't arise"
  "uppannā": "arisen"
  "vepullāya": "for fullness"
  "yena": "by which"
  "vā": "or"
  "parihāyanti": "they decrease"
  "parihāyantī": "they decrease"

  "bhikkhu": "monk"
  "pāpakānaṃ": "of evil"
  "akusalānaṃ": "of unwholesome"
  "kusalānaṃ": "of wholesome"
  "dhammānaṃ": "of things"
  "anuppādāya": "for nonarising"
  "uppādāya": "for arising"
  "chandaṃ": "desire"
  "janeti": "he generates"
  "vāyamati": "he endevours"
  "viriyaṃ": "energy"
  "ārabhati": "he arouses"
  "paggaṇhati": "he applies"
  "padahati": "he strives"
  "pahānāya": "for abandonding"
  "ṭhitiyā": "for continuation"
  "asammosāya": "for non-confusion"
  "bhiyyobhāvāya": "for increase"
  "vepullāya": "for expansion"
  "bhāvanāya": "for development"
  "pāripūriyā": "for fulfillment"

  "yo": "that"
  "saddhammassa": "of true Dhamma"
  "sammosāya": "for confusion"
  "antaradhānāya": "for disappearance"
  "pamādo": "negligence"
  "appamādo": "diligence"
  "anantaradhānāya": "for appearance"
  "kosajjaṃ": "idleness"
  "viriyārambho": "taking effort"
  "anuyogo": "practice"
  "ananuyogo": "not practicing"
  "purisassa": "of a man"
  "pariyādāya": "having overpowered"
  "tiṭṭhati": "remains"
  "itthiyā": "of a woman"
  "itthirūpaṃ": "the sight of a woman"
  "itthisaddo": "the sound of a woman"
  "itthigandho": "smell of a woman"
  "itthiraso": "taste of a woman"
  "itthiphoṭṭhabbaṃ": "touch of a woman"
  "ekasaddaṃ": "single sound"
  "ekagandhaṃ": "single smell"
  "ekarasaṃ": "single taste"
  "ekaphoṭṭhabbaṃ": "single touch"
  "ekarūpaṃ": "single form"
  "purisarūpaṃ": "form of a man"
  "purisasaddo": "sound of a man"
  "purisagandho": "smell of a man"
  "purisaraso": "taste of a man"
  "purisaphoṭṭhabbaṃ": "touch of a man"

# https://github.com/janl/mustache.js/blob/master/mustache.js#L49

entityMap =
  "&": "&amp;"
  "<": "&lt;"
  ">": "&gt;"
  '"': '&quot;'
  "'": '&#39;'
  "/": '&#x2F;'

escapeHtml = (string) ->
  String(string).replace /[&<>"'\/]/g, (s) -> entityMap[s]

$('p.p').each (_, li) ->
  li = $(li)
  html = li.html().split(/\s+/)
  result = []
  for word, i in html
    key = word.replace(/[,.;…\s]/g, '').toLowerCase()
    trans = paliDict[key]
    if trans
      result.push "<span class=\"p\" title=\"#{escapeHtml(trans)}\">#{word}</span>"
    else
      result.push "<span class=\"error\">#{word}</span>"
  li.html(result.join(' '))
