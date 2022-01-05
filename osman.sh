#!/bin/bash

# finish
function addItem () {
    eklenecekUrun=$(zenity --entry --text="Eklemek istediginiz urunun adini giriniz...")

    echo $eklenecekUrun >> veritabani.txt
    zenity --info --text="Eklenen urun $eklenecekUrun"
}

# finish
function listItem () {
    File='veritabani.txt'
    if [ -s "$File" ]; then
        zenity --list \
            --column "Urunler" $(cat $File) \
                --text "Urunler Listesine Goz Atin!" \
                --title "%10 indirimle sahip olabilirsiniz!!" \
                --multiple \
                --width=300 \
                --height=300 \
                --separator="/ "
    else
        zenity --warning --text="Listelencek urun bulunmuyor. Urun ekleme sayfasina yonlendiriliyorsunuz..."
        addItem
    fi
}

# finish
function searchItem () {
    File="veritabani.txt"

    aranan=$(zenity --entry --title="Urun Arama" --text="Aramak istediginiz urununun adini yaziniz")

    if [ -s $File ]; then
        sonuc=""
        sonuc=`cat $File  | grep "$aranan"`
        tekrar=`cat $File  | grep -c "$aranan"`
        satirNumarasi=`cat $File  | grep -n "$aranan"`
        if [ "$sonuc" != "" ]; then
            zenity --list \
                   --column="Sonuc" $sonuc \ 
                   --title="Bulunanlar"\
                   --text="Bulunan sonuc sayisi => $tekrar"\
                   --width=300 \
                   --height=300 \
                   --separator="/ "
            else
            zenity --warning --text="Aradiginiz urun bulunmamaktadir..."
            searchItem
                
        fi
    else
        zenity --warning --text="Listelencek urun bulunmuyor. Urun ekleme sayfasina yonlendiriliyorsunuz..."
        addItem
    fi
}

function removeItem () {
    File="veritabani.txt"

    silinecek=$(zenity --entry --title="Urun Arama" --text="Silmek istediginiz urununun adini yaziniz")
    if [ -s $File ]; then
        sonuc=""
        sonuc=`cat $File | grep -w $silinecek`

        if [ "$sonuc" != "" ]; then
            `grep -v -w $silinecek  $File > tmpfile && mv tmpfile $File`
            zenity --info --title="Islem Basarili" --text="$silinecek olan urun basariyla Silindi. Urunler sayfasina yonlendiriliyorsunuz..."
        else
            if (zenity --warning --title "Silme Sonucu" "Girilen deger veritabanında bulunmuyor." 15 50) then
            removeItem
            fi
        fi
    fi
}

function quit () {
    echo "  "
    echo "  "
    echo "******************************************"
    echo "         Magazadan ayrildiniz.            "
    echo "Trendyol tercih ettiginiz icin tesekkurler"
    echo "******************************************"
    echo "  "
    echo "  "
    exit
}

function menu () {
  choice="$(zenity --width=400 --height=250 --list --column "" --title="MENU" \
  "Urun Ekle" \
  "Urun Listele" \
  "Urun Arama" \
  "Urun Sil" \
  "Magazadan ayril!"
  )"


while true; do
    choice="$(zenity --width=400 --height=250 --list --column "" --title="MENU" \
        "Urun ekle" \
        "Urun Listele" \
        "Urun Arama" \
        "Urun Sil" \
        "Magazadan Ayril"
    )"

    case $choice in
      "Urun ekle")
       addItem
        ;;
       "Urun Listele")
       listItem
        ;;
       "Urun Arama")
       searchItem
        ;;
       "Urun Sil")
       removeItem
        ;;
       "Magazadan Ayril")
        quit
        ;;
       *)
        echo "Hatali Seçim"
        ;;
    esac

done
}

menu

# function anaMenu () {
# SECIM=$( --fb --menu --nocancel --title "Anamenü" "Hoşgeldin $isim, ne yapmak istiyorsun?" 15 50 5 \
# "1:" "Veri Girişi Yap" \
# "2:" "Veri Ara" \
# "3:" "Tüm Verileri Listele" \
# "4:" "Veri Sil" \
# "5:" "Programı Sonlandır" 3>&1 1>&2 2>&3)
# case $SECIM in
#   "1:")
#    veriGirisi
#     ;;
#    "2:")
#    veriArama
#     ;;
#    "3:")
#    verileriListele
#     ;;
#    "4:")
#    veriSil
#     ;;
#    "5:")
#     cikisYap
#     ;;
#    *)
#     echo "Hatali Seçim"
#     ;;
# esac
# }
#
# menu
