---
header: "**Argo CD** - GitOps continuous delivery tool"
theme: gaia
size: 4:3
marp: true
paginate: true
style: |
  section::after {
    font-size:0.68em;
    margin-bottom:-3px;
    font-family:calibri;
  }
---
<!--START style -->
<style>
  :root 
  {
    --color-background: #fff;
    --color-foreground: #333;
    --color-highlight: #f96;
    --color-dimmed: #888;
  }
  h1 {color: #ffba3a; padding-top:0.1em;}
  section {background-color: white; font-family:calibri; color:#005366;}
  p{font-size:0.7em; font-family:calibri; text-align:justify;}
  footer {margin:0; padding:0; height:5%;}
  header {color:#005366; padding:30px; margin-left:30px; font-size:0.8em;}
  pre {font-size: 0.6em;}
  ul li {font-size:0.7em; font-family:calibri; text-align:justify;}
</style>
<!--END style -->

<style scoped>
    header{display:none;}
    footer{display:none;}    
</style>
<!-- INTRO -->
![bg](1.svg)

---

<!-- SLIDE1 -->
<!-- header: '**DESCRIZIONE**  $\color{#ffba3a}{|}$  _italic_' -->
#
![bg](default/template.svg)
Argo CD è un **continuous delivery tool**, che triggera i cambiamenti effettuati su una repository remota (ad esempio GitHub, dove quest'ultima diviene un'unica fonte di verità per le configurazioni degli applicativi sul cluster). 
Inoltre, il tool monitora i cambiamenti su k8s, preservandone il suo stato di salute.

---
<!-- SLIDE2 -->
<!-- header: '**FLUSSO OPERATIVO**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](3.svg)
*Nota bene: Le configurazioni sono aggiornate con o senza automatismo.* 


---
<!-- SLIDE3 -->
<!-- header: '**INSTALLAZIONE**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](default/template.svg)
L'initialization avviene tramite l'**application.yaml**

```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: myapp-argo-application
  namespace: argocd
spec:
  project: default

  source:
    repoURL: https://github.com/dargentieri/test_argocd.git
    targetRevision: HEAD
    path: environments/dev
  destination:
    server: https://kubernetes.default.svc
    namespace: myapp
```
*Nota bene: Il primo lancio avverrà  con un **kubectl apply.***

---
<!-- SLIDE4 -->
<!-- header: '**POOLING**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](default/template.svg)

- La lettura della repository è schedulata ogni **3 minuti** (default). 
- È possibile predisporre l'attivazione di Argo CD e il conseguente cambio di configurazioni sul cluster, attraverso una **notifica di aggiornamento** (webhook), proveniente dal provider scelto per la gestione della repository remota (GitHub, Bitbucket, ecc). 

---
<!-- SLIDE5 -->
<!-- header: '**CREDENZIALI DI ACCESSO**  $\color{#ffba3a}{|}$  _italic_' -->
#
![bg](default/template.svg)

- La gestione delle credenziali di accesso è garantita direttamente da Argo CD attraverso la configurazione di una connect che può essere:
    * HTTPS 
    * SSH
    * GITHUB APP
- Le credenziali impostate verranno salvate all'interno di una secret così caratterizzata:
    * repo + uuid
---
<!-- SLIDE6 -->
<!-- header: '**SALVAGUARDIA**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](6.svg)

---
<!-- SLIDE7 -->
<!-- header: '**SALVAGUARDIA**  $\color{#ffba3a}{|}$  _italic_' -->
#
![bg](default/template.svg)
Qualsiasi modifica manuale effettuata direttamente su K8s verrà rilevata da Argo CD e la divergenza creata rispetto allo **stato desiderato** e lo **stato attuale** verrà colmata.

*NOTA BENE: L'unica fonte di verità è rappresentata dalla repository.*

La divergenza può essere gestita attraverso:
- Un riallineamento automatico;
- Una notifica di disallineamento.

---
<!-- SLIDE8 -->
<!-- header: '**GESTIONE DI AMBIENTI MULTIPLI**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](8.svg)
Per la gestione di differenti ambienti:
- Argo CD dovrà essere installato su ogni cluster;
- La sincronizzazione avverrà a partire dalla stessa repository remota ma i path afferiranno a configurazioni differenti.

---
<!-- SLIDE9 -->
<!-- header: '**KUSTOMIZE**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](default/template.svg)
- Kustomize è uno strumento, integrato in kubectl, che permette di personalizzare la creazione di oggetti Kubernetes tramite un file chiamato **“kustomization.yaml”**. 
- Il tool permette di personalizzare un'intera applicazione Kubernetes senza toccare i file YAML effettivi.
- Si integra perfettamente con Argo CD.

---
<!-- SLIDE10 -->
<!-- header: '**ARGO CD + KUSTOMIZE**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](10.svg)

---
<!-- SLIDE11 -->
<!-- header: '**CONFIGURAZIONI PER OGNI AMBIENTE**  $\color{#ffba3a}{|}$  _italic_' -->
# 
![bg](default/template.svg)
- Argo CD per ogni cluster avrà come path di configurazione quello relativo all'ambiente di riferimento:
    * Ad esempio → environments/sviluppo
- Ogni ambiente farà riferimento alle configurazioni di base con una personalizzazione (override) delle stesse a partire da quanto definito sul kustomization.yaml.

---
<!-- SLIDE12 -->
<!-- header: '**LAYOUT DI BASE**  $\color{#ffba3a}{|}$  _italic_' -->
#
![bg](default/template.svg)
La folder di **base** è suddivisa nella seguente maniera:
  - kustomizaziont.yaml
  - services
  - cronjobs
  - deployments
  - configmaps

Ogni sottofolder della folder di **base**, contiene al suo interno gli yaml di riferimento per ogni applicativo. Ad esempio per __deployments__ avremo:
  * mysql.yaml
  * webserver.yaml
  * dnginx.yaml