---
description: Ma configuration Neovim avec Packer comme gestionnaire de plugins
---

# 🚀 Neovim / Packer configuration

IMPORTANT : C'est un exemple de configuration. Tu peux la cloner comme tu veux et la modifier. J'ai commencé par suivre le tuto de @josean-dev sur [Youtube](https://www.youtube.com/watch?v=vdn\_pKJUda8\&t=1878s), puis j'ai fais quelques modifications : je voulais notamment un support de complétion et de coloration syntaxique pour 🚀[Astro](https://astro.build). Si tu veux te faire une config similaire, je te conseille quand même d'aller voir la vidéo de Josean-dev (elle est longue, 1h et quelques je crois, mais c'est chapitré) pour comprendre comment personnaliser le truc.

### Pré-requis

Je travaille sous mac OS (Apple Silicon).&#x20;

* Xcode (installation via App Store)
* Hombrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

* git
* Un terminal true colors comme iTerm2

#### Xcode

Installer Xcode sur Mac te donnes accès à un certain nombre d'outils de développements pré-installés, même si tu ne te sers pas de Xcode pour développer, c'est toujours util d'avoir les outils qui viennent avec. Pour installer Xcode, ça se passe directement dans l'App Store du mac (le logiciel est gratuit).

#### Homebrew

J'ai installé beaucoup des outils avec [homebrew](https://brew.sh/), un gestionnaire de packages en ligne de commande sous mac. Pour installer _homebrew_ tu saisis dans un terminal (le terminal mac par défaut fait l'affaire):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Puis il faut ajouter la commande brew à ton path zsh (pour ne pas avoir à tapper le chemin complet de la commande à chaque fois que tu veux installer un package):

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/[username]/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### Git

Ensuite, avec brew, tu peux installer _Git_... Bon si t'es là, tu sais de quoi on parle, mais sait-on jamais: git est un programme de gestion de versions de ton code. _Git_ fait parti des outils fourni par défaut avec _Xcode_ sur Mac. Néanmoins, la version fournie n'est pas la dernière, donc si tu veux être à la pointe des mises à jours, tu peux installer _Git_ à l'aide de _homebrew_:

```bash
brew install git
```

#### Iterm2

Pour avoir un terminal plus sympa, j'ai fait comme @Josean-dev, j'ai installé un autre terminal que celui par défaut du mac, _iterm2_. Je t'invite à en faire autant (toujours avec _homebrew_):

```bash
brew install --cask iterm2
```

Pour info : l'option `--cask` permet de créer un raccourci dans le dossier Applications du Mac, et de ne pas avoir à appeler le programme systématiquement par la ligne de commande (ce qui est quand même mieux pour une app avec une interface graphique :smile:.&#x20;

Tu peux en profiter pour personnaliser _iterm2_, j'installe pour cela un utilitaire qui s'appelle _oh-my-zsh_ avec la ligne de commande suivante:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Cet utilitaire va te permettre d'installer (entre autre) un thème pour ton terminal, il en existe pas mal sur GitHub. Pour ma part, j'utilise le thème PowerLevel10K disponible sur Github:

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

Note qu'en visitant le profil de son développeur @romkatv, j'ai vu qu'il en existait une version _homebrew_. Puis tu peux relancer iterm2. Au premier lancement qui suis l'installation, tu vas arriver sur l'outil de configuration. Là, tu personnalise selon tes goûts, mais je te conseille vivement d'installer la police Meslo Nerd Font quand on te le demande. Meslo Nerd Font est une nerd font comme son nom l'indique, ce qui signifie qu'en plus des caractères typographiques habituels, elle contient tout un tas d'icônes qui vont nous servir plus tard. Si jamais l'outil de configuration ne se lance pas, ou si tu veux refaire ta configuration plus tard, il suffit de lancer dans ton terminal:

```bash
p10k configure
```

Avec _oh-my-zsh_ tu peux aussi installer tout un tas de plugins de ton choix dans ton terminal, je te laisse visiter le [site web](https://ohmyz.sh/) pour avoir un aperçu ou le [dépôt git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins) pour avoir accès à tous les plugins officiels. Pour info, j'ai les plugins [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git), [python](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python) (officiels) et [zsh-nvim-appname](https://github.com/mehalter/zsh-nvim-appname) mis à disposition par @mehalter sur Github.  Ce dernier est optionnel, j'y reviens plus bas.
