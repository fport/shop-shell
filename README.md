# 🐼 Shop-Sell 🐼
    Zenity ve bash script ile kodlanmis, crud islemlerini yapabildiginiz bir programdir.
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149015766-f93e03dd-0e73-428b-b0f7-49ad1982663c.png" />
 </div>

## Özet Başlıklar
- Başlıklara tıklayarak öğrenmek isteğiniz özelliğe erişebilirsiniz.
<ol>
        <li><a href="#Ürün-Ekleme">Ürün ekleme </a></li>
        <li><a href="#Ürün-Silme">Ürün silme</a></li>
        <li><a href="#Ürün-Arama">Ürün arama</a></li>
        <li><a href="#Ürün-Listeleme">Databasede bulunan ürün listeleme</a></li>
        <li><a href="#Yonlendirme-Islemleri">Yönlendirme İşlemleri</a></li>
        <li><a href="#Uygulamadan-Cikis">Uygulamadan çıkış yapma</a></li>
</ol>

## Kurulum ve Çalıştırılması
- Uygulaman çalıştırılması için Linux tabanlı bir işletim sistemine sahip olmalısınız.
- Linux makinenizin içerisinde *zenity* kurulumu için aşağıdaki adımları takip ediniz. 

| Adımlar|            Komutlar            | 
|:------:|:------------------------------:| 
| Adım 1 |     sudo apt-get update -y     | 
| Adım 2 | sudo apt-get install -y zenity | 

- ```shell 
  git clone https://github.com/fport/shop-shell.git
  ``` 
  komutu ile projeyi lokalimize klonlayalım.
- ```shell
  cd shop-shell
  ```
- ```shell
  bash shop-shell
  ```
- Uygulamamızı çalıştırmış olduk ve özelliklerini Readme'nin devamından öğrenebilirsiniz.

# Uygulamanın Özellikleri 
- Ana menüden istediğimiz seçeneğe çift tıklayarak ya da seçtikten sonra OK butonunu kullanabilirsiniz.

## Ürün Ekleme
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149020134-4237dde0-2bcc-465a-b9fe-9e94e2567d28.png" />
 </div> 

- Ana menüden ürün ekleme kısmına tıkladığımızda bizi bir veri girişi yapabilceğimiz zenity entry ekranı karşılıyor.
- Boş bırakılıp bırakılmadığı kontrol edilip boş değilse database'e eklenir. 
- Boş bırakılmılmiş ise bir hata mesajı ve ardından ana menüye yönlendirilceksiniz. CANCEL butonu ile ana menüye dönüş yapabilirsiniz. 


## Ürün Silme 
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149022165-42c342f3-a8db-43db-b64b-45065049e1ec.png" />
 </div>  

- Ana menüden ürün silme kısmına tıkladığımızda bizi bir veri girişi yapabilceğimiz zenity entry ekranı karşılıyor.
- Boş bırakılıp bırakılmadığı kontrol edilir. Sonrasında girilen değerin database de bulunma durumu kontrol edilir. Datebasede mevcut ise silinir. Bilgilendirme ekranı ile silinen ürün belirtilir. 
- Databasede mevcut değil ise bir hata mesajı ve ardından ana menüye yönlendirilceksiniz. CANCEL butonu ile ana menüye dönüş yapabilirsiniz. 


## Ürün Listeleme
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149020664-f570967f-b53a-4035-82a5-d444e1857080.png" />
 </div> 

- Ana menüden ürün ekleme kısmına tıkladığımızda bizi databasede bulunan ürünlerin listelendiği zenity list ekranı karşılıyor.
- Bu kısımda farklılık olması için ürünü satıl alma opsiyonu eklenmiştir.
- Ürüne çift tıklayarak veya ürünü seçip OK butonunu tıklayarak ürünü alma ekranı karşılar.
- Eğer YES butonuna tıklarsanız ürün satın alınmış olur.
- NO butonuna tıklarsanız almaktan vazgeçildiğnii bildiren bir Zenity warning ekranı  ve ardından ana menüye yönlendirilceksiniz. 

## Ürün Arama
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149021104-73d73f03-6c52-4a0f-804a-8086fd67971c.png" />
 </div> 

- Ana menüden ürün arama kısmına tıkladığımızda bizi bir veri girişi yapabilceğimiz zenity entry ekranı karşılıyor.
- Boş bırakılıp bırakılmadığı kontrol edilir. Sonrasında girilen değerin database de bulunma durumu kontrol edilir. Datebasede mevcut ise liste şeklinde o datalar listelenir. 
- Databasede aranan ürün mevcut değil ise bir hata mesajı ve ardından ana menüye yönlendirilceksiniz. OK butonu ile ana menüye dönüş yapabilirsiniz.


## Yonlendirme Islemleri
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149022511-ab280f04-430c-4598-baae-0005cb455a61.png" />
 </div> 

- Bu kısımda yazdığım fonksiyon ile ekranlardan diğer ekranlara geçiş esnasında hızlı bir geçiş yerine güzel bir etki bırakmak için bu kısmı ile geçiş sağlanıyor.

## Uygulamadan Cikis
 <div align="center">
    <img src="https://user-images.githubusercontent.com/56169582/149022771-c0a56691-d7fa-4839-925a-5a940f263fb9.png" />
 </div> 

- Uygulamadan çıkmaya karar verdiğinizde menüden seçerek uygulamadan ayrılabilirsiniz.
- Son bir kez emin misiniz kısmı ile yanlış tıklamaların önüne geçilmiştir.
- Sonrasında uygulamayı çalıştırdığımız ekrana bilgilendirme mesajı basılır.


## YouTube Linki
[Linke](https://www.youtube.com/channel/UCmD3SkjDIu-5sZ-bEe8UkSw) tıklayarak projenin anlatımını izleyebilirsiniz.

## Geliştirme ve Kullanılan Toollar
- Arch Linux üzerinde Tilix terminalı kullanıldı. 
- Zenity ve Bash Script ile kodlandı. 
- Vim Text editoru kullanıldı.
- Bir döngüye alınarak uygulama görüntüsü elde edildi.
- Grep, cat, sleep, echo, bash functions, if while donguleri gibi komutlar kullanildi.
- Furkan Portakal ( @fport ) tarafından *Linux Araçları ve Kabuk Programlama Donem Projesi* icin kodlanmıştır.
