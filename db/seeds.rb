Member.destroy_all

members = [
  {
    name: 'Julie',
    presentation: "Fascinée par l’humain et amoureuse de la nature depuis toujours, je découvre et me familiarise avec la permaculture depuis 2015. Conceptrice-paysagiste depuis 2009, j’améliore notre milieu de vie un jardin à la fois. Organisatrice d’intérieur depuis 2019, j’apprends à revenir à notre essentiel un pas après l’autre. Je suis investie dans l’association depuis mon retour du Québec en 2017, pour transmettre comment prendre soin du Vivant et inventer un monde nouveau dans la joie et l’optimisme ! Cette implication nourrit mon besoin d’espérance en un monde meilleur et merveilleux. « L’utopie, c’est l’art de faire un pas de côté ! »."
  },
  {
    name: 'Marie',
    presentation: "En 2014, j'ai pris un tournant décisif dans ma vie, celui de rétablir l'harmonie entre moi et la Terre, me reconnecter de manière authentique au Vivant. J'ai alors emprunté une nouvelle voie, la voie du coeur, avec le besoin de créer plus de congruence dans ma façon d'habiter mon corps, mes relations, la société, la terre. Thérapeute holistique de métier, j'ai trouvé dans la permaculture tout ce qui me passionne réuni sous un même mot, le bon sens, le positivisme, le prendre soin du Vivant. C'est ce que je propose de partager et de transmettre au sein de l'association."
  },
  {
    name: 'Eric',
    presentation: "Arrivé là un peu par le hasard car intéressé par des démarches de société différentes de celle que je vis au quotidien, et poussé par ma compagne à participer à deux perm’apéros très instructifs mais éloignés de plusieurs mois, j’ai décidé d’essayer d’apporter mon petit grain de sel et me forcer à prendre un peu de  temps pour apprendre de nouvelles choses dans cet immense puits de connaissance qu’est la permaculture, et aussi m’enrichir de l’humanité des points de vues portés par les membres de l’association."
  },
  {
    name: 'Mathilde',
    presentation: "C'est en empruntant les chemins des éducations alternatives et d'une vie plus proche de la/ma nature que s'est tissée ma rencontre avec la permaculture. J'ai rejoint l'association pour explorer ce vaste champ d'apprentissage, d'expérimentation et de créativité ; pour partager et créer du lien, contribuer à un projet collectif, participer à la vie locale. Je suis animée par l'idée que prendre soin de soi, des autres et de l'environnement est une danse à trois temps vertueuse et fructueuse ; que la permaculture regorge de solutions vivifiantes pour construire un avenir plus sain, harmonieux, sobre et joyeux pour notre humanité, notre société et notre planète !"
  },
 {
   name: 'Kevin',
   presentation: "En 2015, j'ai eu la chance de pouvoir quitter la ville pour retrouver la nature. Cette reconnexion au vivant a pris toute son ampleur à la découverte de la permaculture. Le besoin d'équilibre entre mon moi retrouvé et mon rapport à la nature m'a donné la force de quitter un travail de bureau pour me consacrer à plein temps au jardinage et aménagements paysagers. Cette interconnexion si nécessaire de l'homme avec la nature et le vivant dans l'ensemble ; entre ce que l'on fait, pourquoi on le fait, comment, et dans quel but ; est ce que j'ai plaisir à partager au sein de l'association."
 }
]

members.each { |member| Member.create!(member) }
