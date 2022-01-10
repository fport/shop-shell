#!/bin/bash

function progress () {
    (
    # =================================================================
    echo "# Islem devam ediyor => %0." ; sleep 0.1
    # Command for first task goes on this line.

    echo "25"
    echo "# Islem devam ediyor => %25." ; sleep 0.2

    # =================================================================
    echo "50"
    echo "# Islem devam ediyor => %50." ; sleep 0.2
    # Command for third task goes on this line.

    # =================================================================
    echo "75"
    echo "# Islem devam ediyor => %75." ; sleep 0.1

    # Command for third task goes on this line.
    # =================================================================
    echo "# Yonlendirme bitti!!!" ; sleep 0.5
    echo "100"

    ) |
    zenity --progress \
      --title="Yonlendiriliyorsunuz" \
      --text="Bitmek uzere..." \
      --percentage=0 \
      --auto-close \
      --auto-kill

    (( $? != 0 )) && zenity --error --text="HATALI ISLEM." && menu

    menu
}

# add item to database
function addItem () {
    data=$(zenity --entry --title="Urun Ekleme" --text="Eklemek istediginiz urunun adini giriniz...")

    if [[ "$?" != "0" ]]
    then
        progress
    fi
    
    if [ "$data" != "" ]
    then 
        echo $data >> database.txt
        zenity  --info \
                --title="Ekleme basarili" \
                --text="Eklenen Urun $data" \
                --width=200 \
                --height=100 
    else
        zenity  --warning\
                --title="Ekleme Basarisiz"\
                --text="Bos birakmamalisiniz! Menuye yonlendiriliyorsunuz..."\
                --width=200 \
                --height=100 
        menu

    fi
}

# list item on database 
function listItem () {
    DB='database.txt'
    if [ -s "$DB" ] 
    then
        select=$(zenity  --list \
                --column "Urunler" $(cat $DB) \
                --text "Urunler Listesine Goz Atin!" \
                --title "%10 indirimle sahip olabilirsiniz!!" \
                --multiple \
                --width=350 \
                --height=350 \
                --separator="/ " )

        if [[ "$?" != "0" ]]
        then
            progress
        fi

        if [ "$select" != "" ]
        then
            karar=$(zenity  --question \
                            --text="Urunu almaya emin misiniz ?")
            if [[ "$?" != "1" ]]
            then
                zenity  --info \
                        --title="Islem Basarili" \
                        --text="$select urunu basariyla satin alinmistir." \
                        --width=300 \
                        --height=200 
                menu
            else
                zenity  --warning \
                        --title="Islemden Vazgecildi" \
                        --text="$select urunu satin alinmaktan vazgecildi." \
                        --width=300 \
                        --height=200 
                menu
            fi
        fi
    else
        zenity  --warning \ 
                --title="Urun Listeleme Basarisiz" \
                --text="Listelencek urun bulunmuyor. Urun ekleme sayfasina yonlendiriliyorsunuz..." \
                --width=200 \
                --height=100 
        addItem
    fi
}

# search item on database 
function searchItem () {
    DB="database.txt"

    search=$(zenity --entry \
                    --title="Urun Arama" \
                    --text="Aramak istediginiz urununun adini yaziniz" \
                    --width=200 \
                    --height=100 ) 

    if [[ "$?" != "0" ]]
    then
        progress
    fi

    if [ -s $DB ] 
    then
        result=""
        result=`cat $DB  | grep "$search"`
        repeat=`cat $DB  | grep -c "$search"`

        if [ "$result" != "" ]
        then
            zenity --list \
                   --column="Sonuc" $result \ 
                   --title="Bulunanlar"\
                   --text="Bulunan sonuc sayisi => $repeat"\
                   --width=300 \
                   --height=300 \
                   --separator="/ "
        else
            zenity --warning\
                   --width=300 \
                   --height=300 \
                   --text="Aradiginiz urun bulunmamaktadir..."\
            searchItem
                
        fi
    else
        zenity --warning --text="Listelencek urun bulunmuyor. Urun ekleme sayfasina yonlendiriliyorsunuz..."
        addItem
    fi
}

# remove item on database 
function removeItem () {
    DB="database.txt"

    silinecek=$(zenity  --entry \
                        --title="Urun Arama" \
                        --text="Silmek istediginiz urununun adini yaziniz" \
                        --width=200 \
                        --height=100 
                )
    if [[ "$?" != "0" ]]
    then
        progress
    fi

    if [ -s $DB ] 
    then
        sonuc=""
        sonuc=`cat $DB | grep -w $silinecek`

        if [ "$sonuc" != "" ] 
        then
            `grep -v -w $silinecek $DB > tmpfile && mv tmpfile $DB`
            (zenity  --info \
                    --text="$silinecek urunu veritabanından basarili sekilde silinmistir." \ 
                    --width=200 \
                    --height=100 )
            progress
        else
            (zenity  --warning \
                    --text="Girilen deger veritabanında bulunmuyor." \
                    --width=200 \
                    --height=100 )
            progress
        fi
    fi
}

# Program is quit here.
function quit () {
    karar=$(zenity  --question \
                    --title="Cikma Islemi"\
                    --text="Magazadan ayrilmaya emin misiniz ?" \
                    --width=200 \
                    --height=100 )

    if [[ "$?" != "1" ]]
    then
        echo "  "
        echo "  "
        echo "____________________________________________"
        echo "|                                          |"
        echo "|         Magazadan ayrildiniz.            |"
        echo "|  Bizi tercih ettiginiz icin tesekkurler  |"
        echo "|__________________________________________|"
        echo "  "
        echo "  "
        exit 1
    else
        progress
    fi
}

function menu () {
    while true 
    do
        choice="$(zenity --width=400 --height=250 --list --column "" --title="MENU"  --text="Yapmak istediginiz islemi tiklayiniz"\
            "Urun ekle" \
            "Urun Listele" \
            "Urun Arama" \
            "Urun Sil" \
            "Magazadan Ayril"
        )"

        # handle cancel button
        if [[ "$?" != "0" ]] ; then
            exit 1
        fi

        # Routing according to options is done here
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

# Program is launched here.
menu
