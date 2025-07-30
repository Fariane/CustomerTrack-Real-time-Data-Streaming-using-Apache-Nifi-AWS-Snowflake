# 👤 CustomerTrack : Streaming de données en temps réel avec Apache NiFi, AWS & Snowflake

## CustomerTrack est un pipeline de données en temps réel combinant AWS, Apache NiFi et Snowflake, conçu pour automatiser l’ingestion de données clients tout en gérant les SCD (Slowly Changing Dimensions) Type 1 et Type 2 . Ce projet illustre la manière de traiter des flux de données tout en conservant l’historique et l’état actuel de chaque client.

## Points techniques clés
- Pipeline de streaming en temps réel
- Architecture containerisée via Docker
- Infrastructure cloud basée sur AWS
- Ingestion et traitement automatisés des données
- Implémentation des modèles SCD1 et SCD2
- Gestion efficace des versions et suivi historique des données

## Architecture
![Architecture Diagram](Real-Time-Snowflake-dgram.png)

### Couche de génération des données
- Script Python personnalisé avec la librairie Faker
- Conteneurisation via Docker
- Montage de volumes pour le partage de données
- Intervalle de génération configurable

### Couche d’ingestion
- **Apache NiFi** pour l’orchestration des flux
- **Apache ZooKeeper** pour la coordination distribuée
- **AWS EC2** pour l’hébergement des services
- **Amazon S3** pour le stockage des données dans un data lake

### Couche de traitement
- **Snowflake** pour l’entreposage des données
- **Snowpipe** pour le chargement automatique des données
- **Streams** pour la capture des changements
- **Tasks** planifiées pour le traitement régulier


## Pipeline Workflow
1. **Générer des données à l'aide de Jupyter Notebook sur AWS EC2**  
  → Les données clients synthétiques sont créées à l'aide de la bibliothèque Faker.
2. **Transférer les données vers AWS S3 à l'aide d'Apache NiFi**  
  → NiFi gère le flux de données en temps réel vers un bucket S3.
3. **Chargement automatique dans Snowflake via Snowpipe**  
  → Snowpipe automatise le processus d'ingestion pour les mises à jour en temps réel.
4. **Mise à jour régulière avec des tâches planifiées**  
  → Les données dans Snowflake sont traitées afin de garantir leur cohérence et leur exactitude.
5. **Implémentation de SCD1 et SCD2** pour les mises à jour en temps réel et le suivi historique


## Décisions techniques
### Implémentation SCD1 & SCD2
- **Table principale SCD1** :
  - Conserve des données actuelles et précises
  - Optimisée pour les performances des requêtes
- **Table historique SCD2** :
  - Suit les modifications historiques
  - Prend en charge l'analyse ponctuelle

### Optimisation des performances
- La séparation des données actuelles et historiques réduit le temps de calcul.
- La capture des modifications basée sur les flux minimise la charge de traitement.

### Scalabilité
- L'architecture conteneurisée garantit une évolutivité aisée.
- L'infrastructure basée sur le cloud permet une allocation flexible des ressources.

## Conclusion
Ce projet montre comment gérer efficacement l'ingestion de données en temps réel et le suivi historique à l'aide d'AWS, d'Apache NiFi et de Snowflake. Il fournit une solution évolutive aux entreprises qui ont besoin d'informations en temps quasi réel tout en conservant les données historiques.
