# Projet d'édition numérique - *Les fils de famille*, Eugène SUE (1856), édité par la librairie Michel Lévy Frères (1862)

## Encodage XML-TEI

Ce projet d'édition numérique résulte de l'encodage en XML-TEI d'un passage du roman-feuilleton *Les Fils de famille*, écrit par Eugène Sue, à l'aide d'une ODD et d'une RNG personnalisée. L'encodage a été réalisé à partir de l'édition numérisée, disponible sur [Gallica](https://gallica.bnf.fr/ark:/12148/bpt6k58180814/).

Ces règles spécifiques ont été appliquées dans le but de :
* Mettre en relation *Les Fils de famille* avec un corpus plus important de romans-feuilletons.
* Présenter l'histoire de la librairie Michel Lévy Frères par rapport aux oeuvres qu'elle a édité.
* Mettre en relief la structure littéraire de l'oeuvre textuelle encodée. Se faisant, cet encodage est propice à la création d'un outil de recherche scientifique, facilitant la navigation dans l'oeuvre.
* Etudier les rapports entre les personnages, les espaces de parole qui leurs sont dédiés, ainsi que leur fréquence d'apparition et de mention respective dans l'oeuvre, selon les contextes, dans le but de produire des données statistiques. Cet encodage pourrait permettre, à terme, une analyse poussée des différentes dynamiques propres aux relations entre les personnages.

## Transformations XSL

Les transformations XSL ont pour but de réaliser une sortie HTML depuis l'encodage en XML. L'édition numérique se présente ainsi sous la forme de plusieurs pages HTML :

* Une page d'accueil
* Les informations bibliographiques de l'édition d'origine
* La transcription du passage encodé
* L'index des personnages
* L'index des noms de lieux
* Une page détaillant les relations entre les personnages
* Une page dédiée aux analyses statistiques des relations entre les personnages, à partir de l'encodage des dialogues entre ceux-ci
* Une page à propos donnant des informations sur le projet

# Evaluation

Ce projet a été réalisé par [Hugo Scheithauer](https://github.com/HugoSchtr) dans le cadre de l'évaluation du module d'XML-TEI et d'XSLT du [Master 2 "Technologies appliquées à l'histoire"](http://www.chartes.psl.eu/fr/cursus/master-technologies-numeriques-appliquees-histoire) de l'Ecole nationale des chartes.

La feuille de transformation XSL doit répondre aux critères suivants :

* Mettre en place une structure d'accueil HTML
* Rédiger des règles simples avec un Xpath valide pour insérer des informations du document source dans le document de sortie
* Créer une ou des règles avec des conditions
* Utiliser une ou des règles for-each uniquement si cela est nécessaire
* Proposer un code facile à lire et commenté
* Simplifier le plus possible ses règles XSL
