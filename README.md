# SHARDEST

Bonjour,voici le repo final  ce projet final.

Succintement, le projet permets à des influenceurs instagrams d'importer leur feed, publier les posts sur notre homepage tout en taggant sur chacun de leur post jusqu'à 5 produits dont nous détenons les détails en bdd. Le buisiness model repose ainsi sur les programmes d'affiliations. Le site se veut être un "curated outfit provider" fournissant des liens pour l'achat des produits repérées. Le coeur de notre projet et ce sur quoi nous nous sommes principalements focus durant ceux deux semaines est le dashboard influencuer oué le tag des produits et la publication des posts s'effectue.

# LIEN DE PRODUCTION:

https://shardest.com/

=> Ceci est le site shopify, il nous permet de faire vitrine, entretenir base de données users et produits et s'intégre avec le dévellopement de notre app qui s'intègre dans le domaine shopify.

https://shardest.com/a/account

=> le lien vers le dashboard influenceur. Accessible seulement sur authentification. Après login l influenceur est redirigé vers son dashboard. Si un social-login via facebook a été effectué, ses infos sont rappatriés et displayed seamlessly dans la structure du dash (nom, photo de profil etc). 

=> Sur ce dashboard il y a un tab, celui de gauche "Lookboard" permet de display les posts que l'influenceur a publié sur notre site vitrine. Le tab de droite permet de voir l'ensemble des posts de l'utilisateurs (publié ou non) et de tagger ou untagger les differents produits sur chaque post.


# TECHNOLOGIES UTILISEES

Webpack = > Dashboard Front
Sopify = > Création site vitrine et permet l'accès à l'API
Custom shopify app => Accès à l'api shopify et intégration dans le site vitrine e.g shardest.com/notre/app
Auth0 => Authentification + Social Login (Facebook )

/Dans le futur/
Instagram / Facebook APIs => importer instgram feed (sous reserve d'acceptation pas Instagram, les règles d'accès sont de plus en plus dur)

# DIFFICULTÉS RENCONTREES

Pas  de vrai problème en termes de logique Rails/Ajax, etc.

En revanche gros problème rencontré en termes d'authentification/ conflit avec notre app shopify displayed en "proxy"  à l'intérieur du site vitrine:
  
  => le systeme dit d'app_proxy proposé par shopify permet d'intégrer un app web externe a l'interieur meme d un store.
     Ce systeme macrhe via a un échange de clé à chaque requete qui permet à l'app web de bien savoir que la requete a bien        été  effectuée par le site shopify vers l'app web et inversement.
  => Auth0 est un Saas pour l'authentification qui permet d'ajouter de nombreuses fonctionalité concernant le login très            rapidemment (notemment social login). Il dispose d'une custom strategie omniauth ruby disponible sous forme de gem.
     Cependant la stratégie repose sur une redirection vers un domaine externe auth0 qui par la suie callback sur une page de      notre app. Cependant la redirection vers le domaine externe ne permet plus l'échange de clé shopify et aisin le site          shopify ne reconnait plus la page callback comme faisant partie du site en question (pas tres clair je sais). 
  => Nous avons donc recrée à la main le flow auth0 pour une identification avec un page de login embed (pas de redirection        vers domaine externe) ce qui nous permettait de rester à l''intérieur' du site shopify. Cependant une des plus value de        d'auth0 et de la gem plus precisement était ainsi perdue car elle gerait l'authentification et la création de sessions        utilisateur associées. Nous sommes toujours à la recherche d'une solution pour ce problème. (peut etre créeer notre            propre strategie omniauth?) => le processus pour la recupération d'id_token manuellement se trouve dans le auth0              controller action callback.
